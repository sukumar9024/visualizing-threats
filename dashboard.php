<?php
require 'config.php';

// Ensure user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$error_message = "";
$success_message = "";

// Fetch total threats count
$stmt = $conn->prepare("SELECT COUNT(*) AS total_threats FROM threats WHERE user_id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$threats_result = $stmt->get_result()->fetch_assoc();
$stmt->close();
$total_threats = $threats_result['total_threats'];

// Handle file upload
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["logfile"])) {
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["logfile"]["name"]);

    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    if (move_uploaded_file($_FILES["logfile"]["tmp_name"], $target_file)) {
        // Store uploaded file in the database
        $stmt = $conn->prepare("INSERT INTO uploaded_files (user_id, file_path) VALUES (?, ?)");
        $stmt->bind_param("is", $user_id, $target_file);
        $stmt->execute();
        $file_id = $stmt->insert_id; // Get inserted file ID
        $stmt->close();

        // Execute Python script with the uploaded file, user ID, and file ID
        $command = escapeshellcmd("python3 analyze_logs.py " . escapeshellarg($target_file) . " " . escapeshellarg($user_id) . " " . escapeshellarg($file_id));
        $json_output = shell_exec($command);

        // Debugging Printing Raw JSON Fromat
        echo "<h3>Raw JSON Output from Python:</h3>";
        echo "<pre>" . htmlspecialchars($json_output) . "</pre>";

        $analysis_data = json_decode($json_output, true);

        // Store data in variables
        $threat_count = $analysis_data["threat_count"] ?? "N/A";
        $report_json = $analysis_data["report_json"] ?? "N/A";
        $threats = $analysis_data["threats"] ?? [];


        if ($analysis_data) {
            // Extract details from JSON response
            $report_filename = $analysis_data["report_filename"];
            $visualization = $analysis_data["visualization"];
            $threat_count = $analysis_data["threat_count"];
            $threats = $analysis_data["threats"];
        
            // Store the report metadata in the 'reports' table
            $stmt = $conn->prepare("INSERT INTO reports (user_id, file_id, report_json, threat_count, created_at) VALUES (?, ?, ?, ?, NOW())");
            $stmt->bind_param("iisi", $user_id, $file_id, $report_filename, $threat_count);
            $stmt->execute();            
            $report_id = $stmt->insert_id; // Get the generated report ID
            $stmt->close();
        
            // Insert each detected threat into the 'threats' table
            $stmt = $conn->prepare("INSERT INTO threats (user_id, file_id, threat_type, threat_description, detected_at) VALUES (?, ?, ?, ?, ?)");

            foreach ($threats as $threat) {
                $attack_type = $threat["attack_type"];
                $log_entry = $threat["log_entry"];
                $detected_at = $threat["detected_at"];

                $stmt->bind_param("iisss", $user_id, $file_id, $attack_type, $log_entry, $detected_at);
                $stmt->execute();
            }

            $stmt->close();
        
            $success_message = "File uploaded and analyzed successfully!";
        } else {
            $error_message = "Error analyzing the log file.";
        }
    } else {
        $error_message = "Error uploading the file.";
    }
}

// Fetch threats for the current user
$stmt = $conn->prepare("SELECT * FROM threats WHERE user_id = ? ORDER BY detected_at DESC");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$threats = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
$stmt->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CyberLens</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>CyberLens</h1>
        </div>
        <nav>
            <ul>
                <li><a href="profile.php">Profile</a></li>
                <li><a href="analysis.php">Analysis</a></li>
                <li><a href="uploads.php">File Uploads</a></li>
                <li><a href="reports.php">Reports</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="overview">
            <h2>System Overview</h2>
            <div class="status">
                <div class="status-item">
                    <h3>Total Threats Found</h3>
                    <p><?php echo $total_threats; ?></p>
                </div>
            </div>
        </section>

        <section class="upload-section">
            <h2>Upload Log File for Analysis</h2>
            
            <?php if ($error_message): ?>
                <p class="error"><?php echo $error_message; ?></p>
            <?php endif; ?>

            <?php if ($success_message): ?>
                <p class="success"><?php echo $success_message; ?></p>
                <p><a href="threat_report.json" download>Download Report</a></p>
                <img src="threat_visualization.png" alt="Threat Analysis Graph" style="width:100%;max-width:600px;">
            <?php endif; ?>
            <form action="dashboard.php" method="POST" enctype="multipart/form-data">
                <input type="file" name="logfile" required>
                <button type="submit">Upload & Analyze</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer>
</body>
</html>

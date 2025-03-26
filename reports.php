<?php
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch reports for the user
$stmt = $conn->prepare("SELECT id, file_id, report_json, created_at FROM reports WHERE user_id = ? ORDER BY created_at DESC");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$reports = $result->fetch_all(MYSQLI_ASSOC);
$stmt->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - CyberLens</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>CyberLens</h1>
        </div>
        <nav>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="profile.php">Profile</a></li>
                <li><a href="analysis.php">Analysis</a></li>
                <li><a href="uploads.php">File Uploads</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Your Reports</h2>

        <?php if (count($reports) > 0): ?>
            <table>
                <thead>
                    <tr>
                        <th>Report ID</th>
                        <th>File ID</th>
                        <th>Report Name</th>
                        <th>Created At</th>
                        <th>Download</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($reports as $report): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($report['id']); ?></td>
                            <td><?php echo htmlspecialchars($report['file_id']); ?></td>
                            <td><?php echo htmlspecialchars(basename($report['report_json'])); ?></td>
                            <td><?php echo htmlspecialchars($report['created_at']); ?></td>
                            <td>
                                <a href="reports/<?php echo urlencode(basename($report['report_json'])); ?>" download>
                                    Download
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No reports available.</p>
        <?php endif; ?>
    </main>

    <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer>
</body>
</html>

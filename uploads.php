<?php
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT id, file_path FROM uploaded_files WHERE user_id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$files_result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploads - CyberLens</title>
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
                <li><a href="reports.php">Reports</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Uploaded Files</h2>
        <table>
            <thead>
                <tr>
                    <th>File ID</th>
                    <th>File Name</th>
                    <th>Download</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($file = $files_result->fetch_assoc()) { ?>
                    <tr>
                        <td><?php echo $file['id']; ?></td>
                        <td><?php echo basename($file['file_path']); ?></td>
                        <td><a href="<?php echo $file['file_path']; ?>" download>Download</a></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </main>

    <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer>
</body>
</html>

<?php
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

$stmt = $conn->prepare("SELECT username FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user_data = $stmt->get_result()->fetch_assoc();
$stmt->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - CyberLens</title>
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
                <li><a href="analysis.php">Analysis</a></li>
                <li><a href="uploads.php">File Uploads</a></li>
                <li><a href="reports.php">Reports</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>User Profile</h2>
        <p><strong>Username:</strong> <?php echo htmlspecialchars($user_data['username']); ?></p>
    </main>

    <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer>
</body>
</html>

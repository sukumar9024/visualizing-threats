<?php
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch threat data grouped by type
$stmt = $conn->prepare("SELECT threat_type, COUNT(*) as count FROM threats WHERE user_id = ? GROUP BY threat_type");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$threat_types = [];
$threat_counts = [];

while ($row = $result->fetch_assoc()) {
    $threat_types[] = $row['threat_type'];
    $threat_counts[] = $row['count'];
}

$stmt->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analysis - CyberLens</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <li><a href="uploads.php">File Uploads</a></li>
                <li><a href="reports.php">Reports</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Threat Analysis</h2>
        <canvas id="threatChart"></canvas>
    </main>

    <script>
        var ctx = document.getElementById('threatChart').getContext('2d');
        var threatChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: <?php echo json_encode($threat_types); ?>,
                datasets: [{
                    label: 'Threat Count',
                    data: <?php echo json_encode($threat_counts); ?>,
                    backgroundColor: ['red', 'orange', 'purple', 'blue', 'green']
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

    <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer>
</body>
</html>

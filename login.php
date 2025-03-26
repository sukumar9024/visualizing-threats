<?php
require 'config.php'; // Includes the database connection and session_start()

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Prepare statement to prevent SQL Injection
    $stmt = $conn->prepare("SELECT id, username, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();
        
        // Verify password
        if (password_verify($password, $row['password'])) {
            $_SESSION['username'] = $row['username'];
            $_SESSION['user_id'] = $row['id'];
            header("Location: dashboard.php"); // Redirect to dashboard
            exit;
        } else {
            $error_message = "Incorrect Username or Password";
        }
    } else {
        $error_message = "Incorrect Username or Password";
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CyberLens</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="wrapper">
        <header>
            <h1>CyberLens - <span>Visualizing Intelligence Analysis</span></h1>
        </header>
        <main class="form-container">
            <h2>Login</h2>
            <p>Enter your credentials to access the dashboard</p>
            
            <?php
            if (!empty($error_message)) {
                echo "<p class='error'>$error_message</p>";
            }
            ?>

            <form action="login.php" method="POST">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                
                <button type="submit" class="cta-button">Login</button>
            </form>

            <p class="register-link">Don't have an account? <a href="register.php">Register here</a></p>
        </main>
    </div>
    <!-- <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer> -->
</body>
</html>

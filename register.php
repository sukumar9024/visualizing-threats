<?php
require 'config.php';

$error_message = "";

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    $confirm_password = trim($_POST['confirm_password']);

    // Check if all fields are filled
    if (!empty($username) && !empty($password) && !empty($confirm_password)) {
        // Check if passwords match
        if ($password !== $confirm_password) {
            $error_message = "Passwords do not match!";
        } else {
            // Check if username already exists
            $stmt = $conn->prepare("SELECT id FROM users WHERE username = ?");
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $stmt->store_result();

            if ($stmt->num_rows > 0) {
                $error_message = "Username already exists. Choose another.";
            } else {
                // Hash the password for security
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);

                // Insert new user into database
                $stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
                $stmt->bind_param("ss", $username, $hashed_password);

                if ($stmt->execute()) {
                    header("Location: login.php"); // Redirect to login after success
                    exit;
                } else {
                    $error_message = "Something went wrong. Please try again!";
                }
            }
            $stmt->close();
        }
    } else {
        $error_message = "All fields are required!";
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - CyberLens</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <div class="wrapper">
        <header>
            <h1>CyberLens - <span>Visualizing Intelligence Analysis</span></h1>
        </header>
        <main class="form-container">
            <h2>Create an Account</h2>
            <p>Fill in the details below to register</p>

            <?php if (!empty($error_message)) { ?>
                <p class="error-message"><?php echo $error_message; ?></p>
            <?php } ?>

            <form action="register.php" method="POST">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter a username" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter a password" required>

                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Re-enter password" required>

                <button type="submit" class="cta-button">Register</button>
            </form>

            <a href="login.php" class="register-link">Already have an account? Login here</a>
        </main>
    </div>
    <!-- <footer>
        <p>&copy; 2024 CyberLens. All rights reserved.</p>
    </footer> -->
</body>
</html>

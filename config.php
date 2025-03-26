<?php
// Start session
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Database configuration
$host = "localhost";      // Change if using a different host
$db_user = "root";        // Change if using a different username
$db_pass = "";            // Change if using a password
$db_name = "cyberlens";   // Your database name

// Error reporting (for debugging, disable in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

try {
    $conn = new mysqli($host, $db_user, $db_pass, $db_name);
    
    if ($conn->connect_error) {
        throw new Exception("Database connection failed: " . $conn->connect_error);
    }
} catch (Exception $e) {
    die("Database error: " . $e->getMessage());
}
?>

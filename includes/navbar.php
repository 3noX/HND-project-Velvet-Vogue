<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/navbar.css?v=<?php echo time(); ?>">
    <script defer src="js/navbar.js"></script> <!-- JavaScript for Toggle -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> <!-- Font Awesome -->
</head>
<body>

<nav class="navbar">
    <div class="logo">
        <a href="index.php">VELVET VOGUE</a>
    </div>

    <!-- Toggle Button for Mobile -->
    <div class="menu-toggle" onclick="toggleMenu()">
        <i class="fa fa-bars"></i> <!-- Hamburger Icon -->
    </div>

    <ul class="nav-links" id="navLinks">
        <li><a href="index.php">HOME</a></li>
        <li><a href="cart.php">CART</a></li>
        <li><a href="dashboard.php">ACCOUNT</a></li>
        <li><a href="contact.php">CONTACT US</a></li>

        <?php if (isset($_SESSION['customer_id'])): ?>
            <li class="auth-links"><a href="logout.php" class="logout-btn">LOGOUT</a></li>
        <?php else: ?>
            <li class="auth-links"><a href="login.php">LOGIN</a></li>
        <?php endif; ?>
    </ul>
</nav>

</body>
</html>
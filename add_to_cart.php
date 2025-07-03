<?php
session_start();
include 'includes/db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["product_id"], $_POST["quantity"], $_POST["size"])) {
    $product_id = intval($_POST["product_id"]);
    $size = trim($_POST["size"]);
    $quantity = intval($_POST["quantity"]);

    // Ensure valid quantity
    if ($quantity < 1) {
        $quantity = 1;
    }

    // Initialize cart session if not set
    if (!isset($_SESSION["cart"])) {
        $_SESSION["cart"] = [];
    }

    // Create a unique key for product ID + size combination
    $cart_key = $product_id . "_" . $size;

    // Save product details in session
    $_SESSION["cart"][$cart_key] = [
        "product_id" => $product_id,
        "size" => $size,
        "quantity" => $quantity
    ];

    // ✅ Debugging: Print session data (REMOVE AFTER TESTING)
    echo "<pre>";
    print_r($_SESSION["cart"]);
    echo "</pre>";

    // Redirect to cart page
    header("Location: cart.php");
    exit();
} else {
    // Redirect if accessed incorrectly
    header("Location: index.php");
    exit();
}
?>

<?php 
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include 'includes/db.php';

$cart_items = $_SESSION['cart'] ?? [];
$total_price = 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart | Velvet Vogue</title>
    <link rel="stylesheet" href="css/cart.css?v=<?php echo time(); ?>">
</head>
<body>

<div class="cart-container">
    <?php include 'includes/navbar.php'; ?>
    <br>
    <br>
    <h1>Your Shopping Cart</h1>

    <?php if (empty($cart_items)): ?>
        <p class="empty-cart">Your cart is empty. <a href="index.php">Continue Shopping</a></p>
    <?php else: ?>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Size</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($cart_items as $cart_key => $cart_data): ?>
            <?php 
            // Ensure $cart_data is an array before accessing elements
            if (!is_array($cart_data) || !isset($cart_data["product_id"], $cart_data["size"], $cart_data["quantity"])) {
                continue; // Skip invalid entries
            }

            $product_id = $cart_data["product_id"];
            $size = $cart_data["size"];
            $quantity = $cart_data["quantity"];

            // Fetch product details from the database
            $stmt = $conn->prepare("SELECT * FROM products WHERE id = ?");
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $product = $stmt->get_result()->fetch_assoc();

            if (!$product) {
                echo "<tr><td colspan='7' class='error'>⚠️ Product not found (ID: $product_id). It may have been removed.</td></tr>";
                continue;
            }

            $subtotal = $product['price'] * $quantity;
            $total_price += $subtotal;
            ?>
            <tr>
                <td><img src="images/<?php echo htmlspecialchars($product['image']); ?>" alt="<?php echo htmlspecialchars($product['name']); ?>" class="cart-img"></td>
                <td><?php echo htmlspecialchars($product['name']); ?></td>
                <td><?php echo htmlspecialchars($size); ?></td>
                <td>Rs. <?php echo number_format($product['price'], 2); ?></td>
                <td>
                    <form method="POST" action="update_cart.php" class="cart-form">
                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>">
                        <input type="hidden" name="size" value="<?php echo $size; ?>">
                        <input type="number" name="quantity" value="<?php echo $quantity; ?>" min="1" class="cart-qty">
                        <button type="submit" class="update-btn">Update</button>
                    </form>
                </td>

                <td>Rs. <?php echo number_format($subtotal, 2); ?></td>
                <td><a href="remove_from_cart.php?id=<?php echo $cart_key; ?>" class="remove-btn">X</a></td>
            </tr>
    <?php endforeach; ?>
</tbody>

        </table>

        <div class="cart-summary">
            <h2>Total: Rs. <?php echo number_format($total_price, 2); ?></h2>
            <a href="checkout.php" class="checkout-btn">Proceed to Checkout</a>
        </div>
    <?php endif; ?>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<?php include 'includes/footer.php'; ?>

</body>
</html>

<?php include 'includes/navbar.php'; ?>
<br>
<br>
<br>
<br>

<?php include 'includes/db.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Velvet Vogue - Home</title>
    <link rel="stylesheet" href="css/styles.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/filters.css?v=<?php echo time(); ?>">
</head>

<body>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let preloader = document.getElementById("preloader");

        // Ensure preloader stays visible for at least 2 seconds
        let minimumTime = 4000; // 2 seconds
        let startTime = Date.now();

        window.addEventListener("load", function () {
            let elapsedTime = Date.now() - startTime;
            let delayTime = Math.max(0, minimumTime - elapsedTime);

            setTimeout(() => {
                preloader.classList.add("hidden"); // Apply fade-out effect
                setTimeout(() => {
                    preloader.style.display = "none"; // Remove preloader after fading out
                }, 500);
            }, delayTime);
        });
    });
</script>

<!-- ✅ Hero Section -->
<div class="hero">
    <img src="images/banner.png" alt="Hero Banner" style="width:100%;">
</div>

<!-- ✅ Category & Filter Section -->
<div class="category-container">
    <div class="categories">
        <a href="category.php?category=Men's Clothing" class="category-card">
            <p>MENS</p>
        </a>
        <a href="category.php?category=Women's Clothing" class="category-card">
            <p>WOMENS</p>
        </a>
        <a href="category.php?category=Kid's Clothing" class="category-card">
            <p>KIDS</p>
        </a>
        <a href="category.php?category=Promotions" class="category-card">
            <p>PROMOTIONS</p>
        </a>
        <a href="category.php?category=New Arrivals" class="category-card">
            <p>NEW ARRIVALS</p>
        </a>
    </div>
</div>

<!-- ✅ Filter Sidebar -->
<div id="filterSidebar" class="filter-sidebar">
    <span id="closeSidebar" class="close-btn">&times;</span>
    <h2>Filter Products FILTER</h2>

    <div class="filter-section">
        <h3>Gender</h3>
        <label><input type="checkbox" class="filter-checkbox" name="gender" value="Male"> Male</label>
        <label><input type="checkbox" class="filter-checkbox" name="gender" value="Female"> Female</label>
    </div>

    <div class="filter-section">
        <h3>Clothing Type</h3>
        <?php
        $clothingTypes = ["T-shirt", "Jeans", "Sweater", "Hoodie", "Jacket", "Shorts", "Sneakers", "Tank Top",
                          "Pajama Set", "Leggings", "Dress", "Button-Down Shirt", "Cardigan", "Sweatpants",
                          "Chinos", "Boots", "Blazer", "Scarf", "Cap", "Socks"];
        foreach ($clothingTypes as $type) {
            echo '<label><input type="checkbox" class="filter-checkbox" name="clothing_type" value="'.$type.'"> '.$type.'</label>';
        }
        ?>
    </div>

    <div class="filter-section">
        <h3>Size</h3>
        <?php
        $sizes = ["XS", "S", "M", "L", "XL", "XXL"];
        foreach ($sizes as $size) {
            echo '<label><input type="checkbox" class="filter-checkbox" name="size" value="'.$size.'"> '.$size.'</label>';
        }
        ?>
    </div>

    <div class="filter-section">
        <h3>Price Range</h3>
        <input type="range" id="priceRange" min="100" max="20000" step="100" value="20000">
        <p>Max Price: Rs. <span id="priceValue">20000</span></p>
    </div>

    <button id="clearFilters" class="clear-filters-btn">Clear Filters</button>
    <br>
    <br>
    <br>
    <break>
</div>

<div class="all-products">
<h2>ALL PRODUCTS</h2>
<button id="filterToggle" class="filter-toggle-btn">Filters</button>
</div>
<!-- ✅ Product Listings -->
<div id="product-container" class="product-grid">
    <?php
    $query = "SELECT * FROM products ORDER BY id DESC";
    $result = $conn->query($query);
    while ($product = $result->fetch_assoc()) { ?>
        <div class="product">
            <img src="images/<?php echo $product['image']; ?>" alt="<?php echo htmlspecialchars($product['name']); ?>">
            <h3><?php echo htmlspecialchars($product['name']); ?></h3>
            <p>Rs. <?php echo number_format($product['price'], 2); ?></p>
            <a href="product.php?id=<?php echo $product['id']; ?>" class="btn">View</a>
        </div>
    <?php } ?>
</div>

<script src="js/filters.js"></script>
<div class="main-content">
    <!-- Page content goes here -->
</div>

<?php include 'includes/footer.php'; ?>

</body>
</html>
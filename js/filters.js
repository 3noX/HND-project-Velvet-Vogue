document.addEventListener("DOMContentLoaded", function () {
    const sidebar = document.getElementById("filterSidebar");
    const filterToggle = document.getElementById("filterToggle");
    const closeSidebar = document.getElementById("closeSidebar");

    filterToggle.addEventListener("click", function () {
        sidebar.classList.add("open");
        document.body.classList.add("sidebar-open");
    });

    closeSidebar.addEventListener("click", function () {
        sidebar.classList.remove("open");
        document.body.classList.remove("sidebar-open");
    });

    function applyFilters() {
        let gender = [], clothingType = [], size = [];
        let maxPrice = document.getElementById("priceRange").value;

        document.querySelectorAll("input[name='gender']:checked").forEach(el => gender.push(el.value));
        document.querySelectorAll("input[name='clothing_type']:checked").forEach(el => clothingType.push(el.value));
        document.querySelectorAll("input[name='size']:checked").forEach(el => size.push(el.value));

        let filterData = new FormData();
        filterData.append("gender", JSON.stringify(gender));
        filterData.append("clothing_type", JSON.stringify(clothingType));
        filterData.append("size", JSON.stringify(size));
        filterData.append("max_price", maxPrice);

        fetch("filter_products.php", { method: "POST", body: filterData })
            .then(response => response.text())
            .then(data => {
                document.getElementById("product-container").innerHTML = data;
            })
            .catch(error => console.error("Error:", error));
    }

    document.querySelectorAll(".filter-checkbox").forEach(checkbox => {
        checkbox.addEventListener("change", applyFilters);
    });

    document.getElementById("priceRange").addEventListener("input", function () {
        document.getElementById("priceValue").textContent = this.value;
        applyFilters();
    });

    document.getElementById("clearFilters").addEventListener("click", function () {
        document.querySelectorAll(".filter-checkbox").forEach(checkbox => checkbox.checked = false);
        document.getElementById("priceRange").value = 20000;
        document.getElementById("priceValue").textContent = "20000";
        applyFilters();
    });


    document.addEventListener("DOMContentLoaded", function () {
        const sidebar = document.getElementById("filterSidebar");
        const filterToggle = document.getElementById("filterToggle");
        const closeSidebar = document.getElementById("closeSidebar");
    
        // ✅ Toggle Sidebar
        filterToggle.addEventListener("click", function () {
            sidebar.classList.toggle("open");
        });
    
        closeSidebar.addEventListener("click", function () {
            sidebar.classList.remove("open");
        });
    });
});
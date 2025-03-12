-- Seed Categories
IF NOT EXISTS (SELECT TOP 1 1 FROM Categories)
BEGIN
    INSERT INTO Categories (Name, Description)
    VALUES 
        ('Electronics', 'Electronic devices and accessories'),
        ('Clothing', 'Apparel and fashion items'),
        ('Home & Kitchen', 'Home appliances and kitchen essentials'),
        ('Sports & Outdoors', 'Sports equipment and outdoor gear');
    
    PRINT 'Categories seeded successfully.';
END
GO

-- Seed Verticals
IF NOT EXISTS (SELECT TOP 1 1 FROM Verticals)
BEGIN
    INSERT INTO Verticals (CategoryId, Name, Description)
    VALUES 
        -- Electronics verticals
        (1, 'Smartphones', 'Mobile phones and accessories'),
        (1, 'Laptops', 'Notebook computers and accessories'),
        (1, 'Audio', 'Headphones, speakers, and audio equipment'),
        
        -- Clothing verticals
        (2, 'T-shirts', 'Casual and formal t-shirts'),
        (2, 'Jeans', 'Denim pants and shorts'),
        (2, 'Footwear', 'Shoes, sandals, and boots'),
        
        -- Home & Kitchen verticals
        (3, 'Cookware', 'Pots, pans, and cooking utensils'),
        (3, 'Small Appliances', 'Blenders, toasters, and coffee makers'),
        
        -- Sports & Outdoors verticals
        (4, 'Fitness Equipment', 'Gym equipment and fitness accessories'),
        (4, 'Outdoor Gear', 'Camping, hiking, and outdoor equipment');
    
    PRINT 'Verticals seeded successfully.';
END
GO

-- Seed Products
IF NOT EXISTS (SELECT TOP 1 1 FROM Products)
BEGIN
    INSERT INTO Products (VerticalId, Name, Description, Brand, Price, IsActive)
    VALUES 
        -- Smartphones
        (1, 'Galaxy S23', 'Latest Samsung flagship smartphone', 'Samsung', 999.99, 1),
        (1, 'iPhone 14', 'Apple''s premium smartphone', 'Apple', 1099.99, 1),
        (1, 'Pixel 7', 'Google''s flagship with advanced camera', 'Google', 899.99, 1),
        
        -- Laptops
        (2, 'MacBook Pro', '16-inch laptop with M2 chip', 'Apple', 2499.99, 1),
        (2, 'XPS 13', 'Compact and powerful ultrabook', 'Dell', 1299.99, 1),
        
        -- Audio
        (3, 'QuietComfort Earbuds', 'Noise-cancelling wireless earbuds', 'Bose', 279.99, 1),
        (3, 'WH-1000XM5', 'Premium noise-cancelling headphones', 'Sony', 349.99, 1),
        
        -- T-shirts
        (4, 'Classic Cotton Tee', 'Comfortable cotton t-shirt', 'Gap', 24.99, 1),
        (4, 'Polo Shirt', 'Classic polo shirt with logo', 'Ralph Lauren', 89.99, 1),
        
        -- Jeans
        (5, 'Slim Fit Jeans', 'Modern slim fit denim jeans', 'Levi''s', 69.99, 1),
        (5, 'Straight Leg Jeans', 'Classic straight leg jeans', 'Wrangler', 59.99, 1),
        
        -- Footwear
        (6, 'Running Shoes', 'Lightweight running shoes', 'Nike', 129.99, 1),
        (6, 'Casual Sneakers', 'Everyday casual sneakers', 'Adidas', 89.99, 1),
        
        -- Cookware
        (7, 'Non-stick Pan Set', '3-piece non-stick pan set', 'T-fal', 79.99, 1),
        (7, 'Cast Iron Skillet', 'Pre-seasoned cast iron skillet', 'Lodge', 39.99, 1),
        
        -- Small Appliances
        (8, 'Stand Mixer', 'Professional stand mixer', 'KitchenAid', 399.99, 1),
        (8, 'Coffee Maker', 'Programmable coffee maker', 'Cuisinart', 99.99, 1),
        
        -- Fitness Equipment
        (9, 'Adjustable Dumbbells', 'Space-saving adjustable dumbbells', 'Bowflex', 349.99, 1),
        (9, 'Yoga Mat', 'Non-slip yoga mat', 'Lululemon', 78.99, 1),
        
        -- Outdoor Gear
        (10, 'Hiking Backpack', 'Durable hiking backpack', 'The North Face', 129.99, 1),
        (10, 'Camping Tent', '4-person camping tent', 'Coleman', 199.99, 1);
    
    PRINT 'Products seeded successfully.';
END
GO

-- Seed Variants
IF NOT EXISTS (SELECT TOP 1 1 FROM Variants)
BEGIN
    INSERT INTO Variants (ProductId, SKU, Color, Size, Weight, Price, ImageUrl, IsActive)
    VALUES 
        -- Galaxy S23 variants
        (1, 'GS23-BLK-128', 'Black', '128GB', 0.17, 999.99, 'https://example.com/images/galaxy-s23-black.jpg', 1),
        (1, 'GS23-WHT-128', 'White', '128GB', 0.17, 999.99, 'https://example.com/images/galaxy-s23-white.jpg', 1),
        (1, 'GS23-BLK-256', 'Black', '256GB', 0.17, 1099.99, 'https://example.com/images/galaxy-s23-black.jpg', 1),
        
        -- iPhone 14 variants
        (2, 'IP14-BLK-128', 'Black', '128GB', 0.17, 1099.99, 'https://example.com/images/iphone-14-black.jpg', 1),
        (2, 'IP14-WHT-128', 'White', '128GB', 0.17, 1099.99, 'https://example.com/images/iphone-14-white.jpg', 1),
        (2, 'IP14-BLK-256', 'Black', '256GB', 0.17, 1199.99, 'https://example.com/images/iphone-14-black.jpg', 1),
        
        -- Pixel 7 variants
        (3, 'PX7-BLK-128', 'Black', '128GB', 0.18, 899.99, 'https://example.com/images/pixel-7-black.jpg', 1),
        (3, 'PX7-WHT-128', 'White', '128GB', 0.18, 899.99, 'https://example.com/images/pixel-7-white.jpg', 1),
        
        -- MacBook Pro variants
        (4, 'MBP-16-512-SG', 'Space Gray', '512GB', 2.1, 2499.99, 'https://example.com/images/macbook-pro-sg.jpg', 1),
        (4, 'MBP-16-1TB-SG', 'Space Gray', '1TB', 2.1, 2699.99, 'https://example.com/images/macbook-pro-sg.jpg', 1),
        
        -- XPS 13 variants
        (5, 'XPS13-512-SLV', 'Silver', '512GB', 1.2, 1299.99, 'https://example.com/images/xps-13-silver.jpg', 1),
        (5, 'XPS13-1TB-SLV', 'Silver', '1TB', 1.2, 1499.99, 'https://example.com/images/xps-13-silver.jpg', 1),
        
        -- QuietComfort Earbuds variants
        (6, 'QCE-BLK', 'Black', NULL, 0.02, 279.99, 'https://example.com/images/qc-earbuds-black.jpg', 1),
        (6, 'QCE-WHT', 'White', NULL, 0.02, 279.99, 'https://example.com/images/qc-earbuds-white.jpg', 1),
        
        -- WH-1000XM5 variants
        (7, 'WH1000XM5-BLK', 'Black', NULL, 0.25, 349.99, 'https://example.com/images/wh1000xm5-black.jpg', 1),
        (7, 'WH1000XM5-SLV', 'Silver', NULL, 0.25, 349.99, 'https://example.com/images/wh1000xm5-silver.jpg', 1),
        
        -- Classic Cotton Tee variants
        (8, 'CCT-BLK-S', 'Black', 'S', NULL, 24.99, 'https://example.com/images/cotton-tee-black.jpg', 1),
        (8, 'CCT-BLK-M', 'Black', 'M', NULL, 24.99, 'https://example.com/images/cotton-tee-black.jpg', 1),
        (8, 'CCT-BLK-L', 'Black', 'L', NULL, 24.99, 'https://example.com/images/cotton-tee-black.jpg', 1),
        (8, 'CCT-WHT-S', 'White', 'S', NULL, 24.99, 'https://example.com/images/cotton-tee-white.jpg', 1),
        (8, 'CCT-WHT-M', 'White', 'M', NULL, 24.99, 'https://example.com/images/cotton-tee-white.jpg', 1),
        (8, 'CCT-WHT-L', 'White', 'L', NULL, 24.99, 'https://example.com/images/cotton-tee-white.jpg', 1),
        
        -- Polo Shirt variants
        (9, 'PS-NVY-S', 'Navy', 'S', NULL, 89.99, 'https://example.com/images/polo-navy.jpg', 1),
        (9, 'PS-NVY-M', 'Navy', 'M', NULL, 89.99, 'https://example.com/images/polo-navy.jpg', 1),
        (9, 'PS-NVY-L', 'Navy', 'L', NULL, 89.99, 'https://example.com/images/polo-navy.jpg', 1),
        
        -- Slim Fit Jeans variants
        (10, 'SFJ-BLU-30', 'Blue', '30', NULL, 69.99, 'https://example.com/images/slim-jeans-blue.jpg', 1),
        (10, 'SFJ-BLU-32', 'Blue', '32', NULL, 69.99, 'https://example.com/images/slim-jeans-blue.jpg', 1),
        (10, 'SFJ-BLU-34', 'Blue', '34', NULL, 69.99, 'https://example.com/images/slim-jeans-blue.jpg', 1),
        
        -- Straight Leg Jeans variants
        (11, 'SLJ-BLU-30', 'Blue', '30', NULL, 59.99, 'https://example.com/images/straight-jeans-blue.jpg', 1),
        (11, 'SLJ-BLU-32', 'Blue', '32', NULL, 59.99, 'https://example.com/images/straight-jeans-blue.jpg', 1),
        (11, 'SLJ-BLU-34', 'Blue', '34', NULL, 59.99, 'https://example.com/images/straight-jeans-blue.jpg', 1);
    
    PRINT 'Variants seeded successfully.';
END
GO

-- Seed Shops
IF NOT EXISTS (SELECT TOP 1 1 FROM Shops)
BEGIN
    INSERT INTO Shops (Name, Address, City, State, Country, PostalCode, Phone, Email, IsActive)
    VALUES 
        ('Downtown Store', '123 Main St', 'New York', 'NY', 'USA', '10001', '212-555-1234', 'downtown@example.com', 1),
        ('Westside Mall', '456 West Ave', 'Los Angeles', 'CA', 'USA', '90001', '310-555-5678', 'westside@example.com', 1),
        ('Eastside Outlet', '789 East Blvd', 'Chicago', 'IL', 'USA', '60007', '312-555-9012', 'eastside@example.com', 1),
        ('Online Store', 'N/A', 'N/A', 'N/A', 'USA', 'N/A', '800-555-3456', 'online@example.com', 1);
    
    PRINT 'Shops seeded successfully.';
END
GO

-- Seed Stock
IF NOT EXISTS (SELECT TOP 1 1 FROM Stock)
BEGIN
    -- Downtown Store stock
    INSERT INTO Stock (VariantId, ShopId, Quantity)
    VALUES 
        (1, 1, 10),  -- Galaxy S23 Black 128GB
        (2, 1, 8),   -- Galaxy S23 White 128GB
        (3, 1, 5),   -- Galaxy S23 Black 256GB
        (4, 1, 12),  -- iPhone 14 Black 128GB
        (5, 1, 7),   -- iPhone 14 White 128GB
        (9, 1, 3),   -- MacBook Pro Space Gray 512GB
        (13, 1, 15), -- QuietComfort Earbuds Black
        (14, 1, 12), -- QuietComfort Earbuds White
        (17, 1, 20), -- Classic Cotton Tee Black S
        (18, 1, 18), -- Classic Cotton Tee Black M
        (19, 1, 15), -- Classic Cotton Tee Black L
        (26, 1, 8),  -- Slim Fit Jeans Blue 30
        (27, 1, 10), -- Slim Fit Jeans Blue 32
        (28, 1, 6);  -- Slim Fit Jeans Blue 34
    
    -- Westside Mall stock
    INSERT INTO Stock (VariantId, ShopId, Quantity)
    VALUES 
        (1, 2, 8),   -- Galaxy S23 Black 128GB
        (2, 2, 6),   -- Galaxy S23 White 128GB
        (4, 2, 10),  -- iPhone 14 Black 128GB
        (5, 2, 5),   -- iPhone 14 White 128GB
        (7, 2, 7),   -- Pixel 7 Black 128GB
        (8, 2, 4),   -- Pixel 7 White 128GB
        (11, 2, 3),  -- XPS 13 Silver 512GB
        (15, 2, 10), -- WH-1000XM5 Black
        (16, 2, 8),  -- WH-1000XM5 Silver
        (20, 2, 12), -- Classic Cotton Tee White S
        (21, 2, 10), -- Classic Cotton Tee White M
        (22, 2, 8),  -- Classic Cotton Tee White L
        (23, 2, 6),  -- Polo Shirt Navy S
        (24, 2, 5),  -- Polo Shirt Navy M
        (25, 2, 4);  -- Polo Shirt Navy L
    
    -- Eastside Outlet stock
    INSERT INTO Stock (VariantId, ShopId, Quantity)
    VALUES 
        (3, 3, 4),   -- Galaxy S23 Black 256GB
        (6, 3, 6),   -- iPhone 14 Black 256GB
        (10, 3, 2),  -- MacBook Pro Space Gray 1TB
        (12, 3, 3),  -- XPS 13 Silver 1TB
        (17, 3, 15), -- Classic Cotton Tee Black S
        (18, 3, 12), -- Classic Cotton Tee Black M
        (19, 3, 10), -- Classic Cotton Tee Black L
        (20, 3, 8),  -- Classic Cotton Tee White S
        (21, 3, 6),  -- Classic Cotton Tee White M
        (22, 3, 4),  -- Classic Cotton Tee White L
        (29, 3, 7),  -- Straight Leg Jeans Blue 30
        (30, 3, 9),  -- Straight Leg Jeans Blue 32
        (31, 3, 5);  -- Straight Leg Jeans Blue 34
    
    -- Online Store stock
    INSERT INTO Stock (VariantId, ShopId, Quantity)
    VALUES 
        (1, 4, 25),  -- Galaxy S23 Black 128GB
        (2, 4, 20),  -- Galaxy S23 White 128GB
        (3, 4, 15),  -- Galaxy S23 Black 256GB
        (4, 4, 30),  -- iPhone 14 Black 128GB
        (5, 4, 25),  -- iPhone 14 White 128GB
        (6, 4, 20),  -- iPhone 14 Black 256GB
        (7, 4, 18),  -- Pixel 7 Black 128GB
        (8, 4, 15),  -- Pixel 7 White 128GB
        (9, 4, 10),  -- MacBook Pro Space Gray 512GB
        (10, 4, 8),  -- MacBook Pro Space Gray 1TB
        (11, 4, 12), -- XPS 13 Silver 512GB
        (12, 4, 10), -- XPS 13 Silver 1TB
        (13, 4, 30), -- QuietComfort Earbuds Black
        (14, 4, 25), -- QuietComfort Earbuds White
        (15, 4, 20), -- WH-1000XM5 Black
        (16, 4, 18), -- WH-1000XM5 Silver
        (17, 4, 50), -- Classic Cotton Tee Black S
        (18, 4, 45), -- Classic Cotton Tee Black M
        (19, 4, 40), -- Classic Cotton Tee Black L
        (20, 4, 50), -- Classic Cotton Tee White S
        (21, 4, 45), -- Classic Cotton Tee White M
        (22, 4, 40), -- Classic Cotton Tee White L
        (23, 4, 30), -- Polo Shirt Navy S
        (24, 4, 25), -- Polo Shirt Navy M
        (25, 4, 20), -- Polo Shirt Navy L
        (26, 4, 35), -- Slim Fit Jeans Blue 30
        (27, 4, 30), -- Slim Fit Jeans Blue 32
        (28, 4, 25), -- Slim Fit Jeans Blue 34
        (29, 4, 35), -- Straight Leg Jeans Blue 30
        (30, 4, 30), -- Straight Leg Jeans Blue 32
        (31, 4, 25); -- Straight Leg Jeans Blue 34
    
    PRINT 'Stock seeded successfully.';
END
GO

PRINT 'All data seeded successfully.';
GO 
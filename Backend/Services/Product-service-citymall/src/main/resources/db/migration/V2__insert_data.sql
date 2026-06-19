
INSERT INTO category (id, name, description) VALUES
                                                 (nextval('category_seq'),'Smartphones','Mobile phones and accessories'),
                                                 (nextval('category_seq'),'Laptops','Personal and business laptops'),
                                                 (nextval('category_seq'),'Tablets','Android and iOS tablets'),
                                                 (nextval('category_seq'),'Monitors','Computer displays'),
                                                 (nextval('category_seq'),'Keyboards','Mechanical and membrane keyboards'),
                                                 (nextval('category_seq'),'Mice','Gaming and office mice'),
                                                 (nextval('category_seq'),'Printers','Inkjet and laser printers'),
                                                 (nextval('category_seq'),'Cameras','DSLR and mirrorless cameras'),
                                                 (nextval('category_seq'),'Headphones','Wireless and wired headphones'),
                                                 (nextval('category_seq'),'Smartwatches','Wearable smart devices'),
                                                 (nextval('category_seq'),'Speakers','Bluetooth and home speakers'),
                                                 (nextval('category_seq'),'Gaming Consoles','Gaming systems'),
                                                 (nextval('category_seq'),'Computer Components','PC hardware'),
                                                 (nextval('category_seq'),'Networking Devices','Routers and switches'),
                                                 (nextval('category_seq'),'Storage Devices','SSDs and HDDs'),
                                                 (nextval('category_seq'),'Home Appliances','Home electronics'),
                                                 (nextval('category_seq'),'Kitchen Appliances','Kitchen equipment'),
                                                 (nextval('category_seq'),'Furniture','Home and office furniture'),
                                                 (nextval('category_seq'),'Office Supplies','Office essentials'),
                                                 (nextval('category_seq'),'Books','Educational and leisure books'),
                                                 (nextval('category_seq'),'Fashion Men','Mens clothing'),
                                                 (nextval('category_seq'),'Fashion Women','Womens clothing'),
                                                 (nextval('category_seq'),'Shoes','Footwear'),
                                                 (nextval('category_seq'),'Beauty & Personal Care','Beauty products'),
                                                 (nextval('category_seq'),'Sports & Fitness','Sports equipment');

-- Assuming you already have a sequence named 'product_seq'

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'),50,'128GB flagship smartphone','Galaxy S24',799.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),35,'256GB flagship smartphone','iPhone 15',999.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),40,'Android smartphone with OLED display','Pixel 9',899.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),30,'Gaming smartphone with cooling system','ROG Phone 8',1099.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),45,'Mid-range Android phone','OnePlus 13',649.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),38,'Budget smartphone','Redmi Note 15',249.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),42,'5G smartphone','Realme GT 8',399.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),36,'Premium Android device','Xiaomi 15 Pro',749.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),33,'Camera-centric smartphone','Vivo X300',699.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),40,'Performance-focused smartphone','iQOO Neo 12',449.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),30,'Compact smartphone','Zenfone 12',599.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),25,'Foldable smartphone','Galaxy Z Fold 7',1799.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),27,'Flip smartphone','Galaxy Z Flip 7',999.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),32,'AI-powered smartphone','Honor Magic 8',699.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),41,'Affordable Android device','Moto G95',299.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),22,'Enterprise smartphone','Samsung XCover 8',549.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),35,'Flagship killer smartphone','Nothing Phone 4',649.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),28,'Photography smartphone','Oppo Find X9',899.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),44,'Budget 5G smartphone','Poco X8',299.99,(SELECT id FROM category WHERE name='Smartphones')),
    (nextval('product_seq'),20,'Luxury smartphone','Vertu Quantum',2999.99,(SELECT id FROM category WHERE name='Smartphones'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 25, '14-inch ultrabook with Intel Core Ultra 7 processor', 'Dell XPS 14', 1499.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 20, 'Premium business laptop with excellent battery life', 'Lenovo ThinkPad X1 Carbon', 1699.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 18, 'Apple laptop with M4 chip and Retina display', 'MacBook Air M4', 1299.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 15, 'High-performance laptop for professionals', 'MacBook Pro 14', 1999.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 22, 'Gaming laptop with RTX 4070 graphics', 'ASUS ROG Strix G18', 1899.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 17, 'Slim gaming laptop with high refresh display', 'MSI Stealth 16', 1799.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 28, 'Affordable laptop for students and office work', 'HP Pavilion 15', 749.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 24, 'Business laptop with enterprise-grade security', 'HP EliteBook 840', 1399.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 19, 'Creator-focused laptop with OLED display', 'ASUS Vivobook Pro 16', 1299.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 21, 'Lightweight laptop with AMD Ryzen processor', 'Acer Swift Go 14', 899.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 23, 'Convertible 2-in-1 touchscreen laptop', 'Lenovo Yoga 7i', 1099.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 16, 'Premium 2-in-1 productivity laptop', 'HP Spectre x360', 1599.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 27, 'Thin and light everyday laptop', 'Dell Inspiron 15', 699.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 18, 'Gaming laptop with RTX 4060 GPU', 'Acer Predator Helios Neo 16', 1499.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 14, 'Professional workstation laptop', 'Dell Precision 5680', 2499.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 20, 'High-end engineering workstation', 'Lenovo ThinkPad P1 Gen 7', 2799.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 32, 'Budget-friendly laptop for daily tasks', 'Acer Aspire 5', 599.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 30, 'Mid-range laptop with Ryzen 7 processor', 'ASUS Zenbook 14', 999.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 26, 'Gaming laptop with advanced cooling system', 'Lenovo Legion Pro 5', 1699.99, (SELECT id FROM category WHERE name='Laptops')),
    (nextval('product_seq'), 18, 'Premium OLED laptop for creators', 'Samsung Galaxy Book4 Ultra', 1899.99, (SELECT id FROM category WHERE name='Laptops'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, '10-inch Android tablet with HD display', 'Tab Lite X1', 199.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 25, '11-inch tablet for entertainment and productivity', 'Tab Plus X2', 299.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 20, 'Premium tablet with stylus support', 'Tab Pro X3', 499.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 18, 'Lightweight tablet for students', 'Student Tab X4', 249.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 22, 'Large-screen tablet with quad speakers', 'Media Tab X5', 399.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 15, 'Business tablet with keyboard compatibility', 'Business Tab X6', 549.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 24, 'Compact tablet with long battery life', 'Travel Tab X7', 279.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 19, 'Gaming tablet with high refresh rate display', 'Gaming Tab X8', 649.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 28, 'Affordable Android tablet for daily use', 'Tab Essential X9', 179.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 16, 'Professional tablet for designers', 'Creative Tab X10', 799.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 21, 'Tablet with OLED display and fast charging', 'OLED Tab X11', 699.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 20, '2-in-1 tablet with detachable keyboard', 'Flex Tab X12', 599.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 26, 'Kid-friendly tablet with parental controls', 'Kids Tab X13', 149.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 17, 'Premium productivity tablet', 'Work Tab X14', 849.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 29, 'Budget tablet with expandable storage', 'Value Tab X15', 169.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 18, 'Tablet optimized for online learning', 'Edu Tab X16', 229.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 23, 'Entertainment tablet with immersive audio', 'Cinema Tab X17', 349.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 20, 'Professional tablet with pen support', 'Studio Tab X18', 749.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 25, 'Mid-range tablet with high-performance chipset', 'Performance Tab X19', 449.99, (SELECT id FROM category WHERE name='Tablets')),
    (nextval('product_seq'), 14, 'Flagship tablet with premium build quality', 'Ultra Tab X20', 999.99, (SELECT id FROM category WHERE name='Tablets'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 20, '24-inch Full HD office monitor', 'Office Monitor X1', 149.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 18, '27-inch QHD productivity monitor', 'Office Monitor X2', 249.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 15, '32-inch 4K professional display', 'Pro Monitor X3', 499.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 16, '27-inch gaming monitor with 165Hz refresh rate', 'Gaming Monitor X4', 349.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 14, '32-inch curved gaming monitor', 'Gaming Monitor X5', 429.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 22, '24-inch IPS monitor for home use', 'Home Monitor X6', 179.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 19, 'Ultra-wide monitor for multitasking', 'UltraWide Monitor X7', 599.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 12, 'Professional color-accurate monitor', 'Creator Monitor X8', 699.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 24, 'Budget-friendly Full HD monitor', 'Budget Monitor X9', 129.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 13, '4K HDR entertainment monitor', 'HDR Monitor X10', 549.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 18, 'Gaming monitor with 240Hz refresh rate', 'Esports Monitor X11', 479.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 15, 'USB-C monitor for professionals', 'Business Monitor X12', 399.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 20, 'Compact monitor for office desks', 'Desk Monitor X13', 159.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 14, 'Curved QHD monitor with immersive viewing', 'Curved Monitor X14', 379.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 10, 'Premium OLED monitor for creators', 'OLED Monitor X15', 999.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 21, 'Affordable monitor for students', 'Student Monitor X16', 139.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 17, 'High-performance monitor for developers', 'Developer Monitor X17', 319.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 12, 'Large 34-inch ultra-wide display', 'UltraWide Monitor X18', 749.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 15, 'Professional business display', 'Executive Monitor X19', 449.99, (SELECT id FROM category WHERE name='Monitors')),
    (nextval('product_seq'), 11, 'Flagship 4K OLED monitor', 'Ultra Monitor X20', 1199.99, (SELECT id FROM category WHERE name='Monitors'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, 'Mechanical keyboard with RGB lighting', 'Mechanical Keyboard X1', 89.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 25, 'Wireless compact keyboard', 'Wireless Keyboard X2', 59.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 20, 'Gaming keyboard with macro keys', 'Gaming Keyboard X3', 129.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 22, 'Ergonomic office keyboard', 'Office Keyboard X4', 49.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 18, 'Low-profile mechanical keyboard', 'Slim Keyboard X5', 99.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 24, 'Bluetooth keyboard for tablets', 'Bluetooth Keyboard X6', 44.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 15, 'Premium mechanical keyboard', 'Pro Keyboard X7', 149.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 20, 'Compact gaming keyboard', 'Gaming Keyboard X8', 79.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 28, 'Budget office keyboard', 'Budget Keyboard X9', 19.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 16, 'Wireless mechanical keyboard', 'Mechanical Keyboard X10', 119.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 22, 'RGB gaming keyboard', 'Gaming Keyboard X11', 99.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 19, 'Silent office keyboard', 'Silent Keyboard X12', 39.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 21, 'Professional workstation keyboard', 'Business Keyboard X13', 69.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 14, 'Premium wireless keyboard', 'Executive Keyboard X14', 129.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 17, 'Mechanical keyboard with hot-swappable switches', 'Mechanical Keyboard X15', 139.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 23, 'Compact travel keyboard', 'Travel Keyboard X16', 34.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 15, 'Creator keyboard with programmable keys', 'Creator Keyboard X17', 109.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 20, 'Multi-device Bluetooth keyboard', 'Smart Keyboard X18', 59.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 18, 'Gaming keyboard with wrist rest', 'Gaming Keyboard X19', 119.99, (SELECT id FROM category WHERE name='Keyboards')),
    (nextval('product_seq'), 12, 'Flagship mechanical keyboard', 'Ultra Keyboard X20', 179.99, (SELECT id FROM category WHERE name='Keyboards'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 40, 'Wireless optical mouse', 'Wireless Mouse X1', 24.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 30, 'Gaming mouse with RGB lighting', 'Gaming Mouse X2', 59.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 25, 'Ergonomic office mouse', 'Office Mouse X3', 29.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 20, 'High DPI gaming mouse', 'Gaming Mouse X4', 79.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 35, 'Compact travel mouse', 'Travel Mouse X5', 19.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 18, 'Professional wireless mouse', 'Business Mouse X6', 49.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 15, 'Ultra-light gaming mouse', 'Gaming Mouse X7', 89.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 28, 'Bluetooth mouse', 'Bluetooth Mouse X8', 34.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 22, 'Silent click mouse', 'Silent Mouse X9', 24.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 16, 'Premium productivity mouse', 'Productivity Mouse X10', 69.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 24, 'Rechargeable wireless mouse', 'Wireless Mouse X11', 39.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 14, 'Vertical ergonomic mouse', 'Ergonomic Mouse X12', 54.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 21, 'RGB gaming mouse with macro buttons', 'Gaming Mouse X13', 64.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 17, 'Precision design mouse', 'Creator Mouse X14', 74.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 19, 'Wireless office mouse', 'Office Mouse X15', 29.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 20, 'Portable Bluetooth mouse', 'Travel Mouse X16', 22.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 13, 'Esports gaming mouse', 'Gaming Mouse X17', 99.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 18, 'Multi-device wireless mouse', 'Smart Mouse X18', 44.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 15, 'Premium ergonomic mouse', 'Executive Mouse X19', 79.99, (SELECT id FROM category WHERE name='Mice')),
    (nextval('product_seq'), 10, 'Flagship gaming mouse', 'Ultra Mouse X20', 129.99, (SELECT id FROM category WHERE name='Mice'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 12, 'All-in-one inkjet printer', 'Inkjet Printer X1', 149.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 10, 'Wireless color printer', 'Wireless Printer X2', 179.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 8, 'Laser printer for office use', 'Laser Printer X3', 299.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 9, 'Compact home printer', 'Home Printer X4', 99.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 7, 'High-volume office printer', 'Office Printer X5', 449.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 11, 'Photo printing device', 'Photo Printer X6', 249.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 6, 'Duplex laser printer', 'Business Printer X7', 399.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 10, 'Wireless monochrome printer', 'Printer X8', 159.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 8, 'Portable mobile printer', 'Travel Printer X9', 129.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 5, 'Professional office printer', 'Pro Printer X10', 599.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 9, 'Color laser printer', 'Laser Printer X11', 349.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 7, 'Small business printer', 'Business Printer X12', 279.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 10, 'Entry-level inkjet printer', 'Printer X13', 89.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 6, 'High-speed office printer', 'Office Printer X14', 499.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 8, 'Photo-quality printer', 'Photo Printer X15', 229.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 9, 'Wireless multifunction printer', 'Printer X16', 189.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 5, 'Enterprise printing solution', 'Enterprise Printer X17', 799.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 7, 'Compact office printer', 'Office Printer X18', 259.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 4, 'Premium laser printer', 'Laser Printer X19', 699.99, (SELECT id FROM category WHERE name='Printers')),
    (nextval('product_seq'), 3, 'Flagship office printer', 'Ultra Printer X20', 999.99, (SELECT id FROM category WHERE name='Printers'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 10, 'Entry-level mirrorless camera', 'Mirrorless Camera X1', 699.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 8, 'Professional DSLR camera', 'DSLR Camera X2', 1199.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 12, 'Compact travel camera', 'Travel Camera X3', 399.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 7, 'Professional photography camera', 'Pro Camera X4', 1799.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 9, '4K video recording camera', 'Video Camera X5', 999.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 11, 'Beginner photography camera', 'Camera X6', 549.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 6, 'Full-frame mirrorless camera', 'Mirrorless Camera X7', 2299.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 8, 'Action camera', 'Action Camera X8', 299.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 10, 'Content creator camera', 'Creator Camera X9', 849.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 5, 'Professional video camera', 'Cinema Camera X10', 3499.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 7, 'Wildlife photography camera', 'Camera X11', 1499.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 9, 'Compact vlogging camera', 'Vlog Camera X12', 749.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 6, 'Advanced mirrorless camera', 'Mirrorless Camera X13', 1899.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 8, 'Photography starter kit camera', 'Camera X14', 649.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 5, 'Professional hybrid camera', 'Hybrid Camera X15', 2599.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 10, 'Travel photography camera', 'Travel Camera X16', 499.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 7, 'Premium content creator camera', 'Creator Camera X17', 1299.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 6, 'High-resolution camera', 'Camera X18', 2099.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 4, 'Professional studio camera', 'Studio Camera X19', 3999.99, (SELECT id FROM category WHERE name='Cameras')),
    (nextval('product_seq'), 3, 'Flagship mirrorless camera', 'Ultra Camera X20', 4499.99, (SELECT id FROM category WHERE name='Cameras'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 35, 'Wireless over-ear headphones', 'Wireless Headphones X1', 99.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 30, 'Noise-cancelling headphones', 'ANC Headphones X2', 249.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 40, 'Budget wireless headphones', 'Headphones X3', 49.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 22, 'Gaming headset with surround sound', 'Gaming Headset X4', 129.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 18, 'Premium audiophile headphones', 'Audiophile Headphones X5', 399.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 28, 'Bluetooth headphones for daily use', 'Bluetooth Headphones X6', 79.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 16, 'Studio monitoring headphones', 'Studio Headphones X7', 199.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 25, 'Wireless sports headphones', 'Sports Headphones X8', 89.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 20, 'Premium ANC headphones', 'Premium Headphones X9', 299.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 30, 'Foldable travel headphones', 'Travel Headphones X10', 69.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 24, 'RGB gaming headset', 'Gaming Headset X11', 149.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 15, 'Professional audio headphones', 'Pro Headphones X12', 249.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 26, 'Lightweight wireless headphones', 'Wireless Headphones X13', 119.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 18, 'Creator headphones for editing', 'Creator Headphones X14', 179.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 22, 'Comfort-focused headphones', 'Comfort Headphones X15', 89.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 14, 'High-fidelity headphones', 'HiFi Headphones X16', 349.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 21, 'Business wireless headset', 'Business Headphones X17', 159.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 17, 'Premium gaming headset', 'Gaming Headset X18', 199.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 12, 'Luxury wireless headphones', 'Luxury Headphones X19', 449.99, (SELECT id FROM category WHERE name='Headphones')),
    (nextval('product_seq'), 10, 'Flagship noise-cancelling headphones', 'Ultra Headphones X20', 599.99, (SELECT id FROM category WHERE name='Headphones'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, 'Fitness smartwatch with heart rate tracking', 'FitWatch X1', 149.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 25, 'Premium smartwatch with AMOLED display', 'SmartWatch Pro X2', 299.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 28, 'Budget fitness smartwatch', 'FitWatch Lite X3', 99.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 20, 'Smartwatch with GPS tracking', 'GPS Watch X4', 199.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 18, 'Luxury smartwatch with metal body', 'Luxury Watch X5', 499.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 24, 'Waterproof fitness smartwatch', 'SportWatch X6', 129.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 22, 'Smartwatch with sleep tracking', 'HealthWatch X7', 179.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 19, 'Kids smartwatch with calling feature', 'Kids Watch X8', 89.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 21, 'Android-compatible smartwatch', 'Android Watch X9', 159.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 17, 'Apple-style premium smartwatch', 'UltraWatch X10', 399.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 23, 'Fitness + notification smartwatch', 'ActiveWatch X11', 139.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 26, 'Lightweight sports smartwatch', 'Sport Lite X12', 119.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 20, 'Smartwatch with ECG monitoring', 'Health Pro X13', 249.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 15, 'Premium titanium smartwatch', 'Titan Watch X14', 549.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 18, 'Smartwatch with voice assistant', 'VoiceWatch X15', 199.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 22, 'Fashion smartwatch for women', 'StyleWatch X16', 149.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 25, 'Long battery life smartwatch', 'BatteryWatch X17', 129.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 16, 'Outdoor adventure smartwatch', 'AdventureWatch X18', 279.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 14, 'Premium sports smartwatch', 'Sport Pro X19', 349.99, (SELECT id FROM category WHERE name='Smartwatches')),
    (nextval('product_seq'), 12, 'Flagship smartwatch', 'Ultra Smart X20', 599.99, (SELECT id FROM category WHERE name='Smartwatches'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 35, 'Bluetooth portable speaker', 'SoundBox X1', 49.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 30, 'Premium bass speaker', 'BassBoom X2', 129.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 28, 'Mini portable speaker', 'MiniSound X3', 29.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 25, 'Wireless home speaker', 'HomeSound X4', 199.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 20, 'Gaming speaker system', 'GameSound X5', 149.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 18, 'Smart speaker with voice assistant', 'SmartSpeaker X6', 179.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 22, 'Soundbar for TV', 'CinemaBar X7', 249.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 19, 'Outdoor waterproof speaker', 'OutdoorSound X8', 89.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 21, 'Party bass speaker', 'PartyBoom X9', 299.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 17, 'Compact Bluetooth speaker', 'CompactSound X10', 39.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 23, 'Premium surround speaker', 'Surround X11', 399.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 26, 'Wireless speaker for home use', 'HomeBeat X12', 159.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 20, 'Portable bass speaker', 'BassMini X13', 69.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 15, 'HiFi speaker system', 'HiFiSound X14', 499.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 18, 'Studio monitor speaker', 'StudioSound X15', 349.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 22, 'RGB gaming speaker', 'GameBeat X16', 129.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 25, 'Portable mini speaker', 'PocketSound X17', 24.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 16, 'Premium wireless speaker', 'UltraSound X18', 279.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 14, 'Smart home speaker', 'Home AI X19', 199.99, (SELECT id FROM category WHERE name='Speakers')),
    (nextval('product_seq'), 12, 'Flagship sound system', 'MegaSound X20', 699.99, (SELECT id FROM category WHERE name='Speakers'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 15, 'Next-gen gaming console', 'GameBox X1', 499.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 12, 'Compact gaming console', 'GameBox Mini X2', 299.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 10, 'Premium 4K gaming console', 'UltraPlay X3', 599.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 18, 'Portable gaming console', 'Handheld X4', 249.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 14, 'VR gaming console', 'VR Play X5', 699.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 16, 'Family gaming console', 'FunBox X6', 399.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 11, 'Pro gaming console edition', 'GameBox Pro X7', 699.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 9, 'Next-gen handheld console', 'Handheld Pro X8', 449.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 13, 'Cloud gaming console', 'CloudPlay X9', 299.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 10, 'Retro gaming console', 'RetroBox X10', 199.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 12, 'High-performance console', 'PowerPlay X11', 549.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 8, 'Gaming console with VR support', 'VRBox X12', 749.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 14, 'Budget gaming console', 'GameLite X13', 249.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 15, 'Streaming gaming console', 'StreamPlay X14', 399.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 13, 'Hybrid console handheld', 'Hybrid X15', 349.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 11, 'Elite gaming console', 'EliteBox X16', 799.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 10, 'Portable cloud console', 'Cloud Mini X17', 279.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 9, 'Family entertainment console', 'FamilyBox X18', 329.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 7, 'Ultra premium console', 'UltraPlay Pro X19', 899.99, (SELECT id FROM category WHERE name='Gaming Consoles')),
    (nextval('product_seq'), 6, 'Flagship gaming system', 'TitanPlay X20', 999.99, (SELECT id FROM category WHERE name='Gaming Consoles'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, 'DDR5 RAM 16GB module', 'RAM 16GB X1', 79.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 25, 'DDR5 RAM 32GB module', 'RAM 32GB X2', 149.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 20, 'Gaming GPU mid-range', 'GPU X1', 499.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 15, 'High-end GPU', 'GPU X2', 999.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 18, 'Intel Core i7 processor', 'CPU X1', 349.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 12, 'AMD Ryzen 9 processor', 'CPU X2', 499.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 22, '1TB SSD storage', 'SSD X1', 99.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 25, '2TB SSD storage', 'SSD X2', 179.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 20, 'Gaming motherboard', 'Motherboard X1', 199.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 18, 'High-end motherboard', 'Motherboard X2', 299.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 24, '750W power supply', 'PSU X1', 89.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 20, '1000W PSU', 'PSU X2', 129.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 22, 'Gaming cabinet case', 'Case X1', 79.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 18, 'RGB gaming cabinet', 'Case X2', 119.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 16, 'Liquid cooling system', 'Cooling X1', 149.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 14, 'Air cooling system', 'Cooling X2', 69.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 20, 'Gaming fan kit', 'Fans X1', 39.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 17, 'RGB RAM kit', 'RAM RGB X3', 129.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 15, 'Workstation GPU', 'GPU Pro X3', 1499.99, (SELECT id FROM category WHERE name='Computer Components')),
    (nextval('product_seq'), 10, 'Flagship CPU', 'CPU Ultra X3', 699.99, (SELECT id FROM category WHERE name='Computer Components'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, 'Dual-band WiFi router', 'Router X1', 59.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 25, 'High-speed gigabit router', 'Router X2', 89.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 20, 'Mesh WiFi system', 'Mesh System X3', 199.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 18, 'WiFi 6 router for home', 'Router X4', 129.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 22, 'Portable travel router', 'Travel Router X5', 49.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 16, '8-port network switch', 'Switch X6', 79.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 14, '16-port gigabit switch', 'Switch X7', 129.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 19, 'WiFi extender device', 'Extender X8', 39.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 21, 'High-range WiFi extender', 'Extender X9', 59.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 18, 'Fiber optic modem', 'Modem X10', 99.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 20, 'Business router', 'Business Router X11', 149.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 17, 'Smart home hub router', 'Smart Router X12', 119.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 15, 'Cloud-managed switch', 'Cloud Switch X13', 199.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 22, 'USB WiFi adapter', 'WiFi Adapter X14', 19.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 24, 'Bluetooth network adapter', 'BT Adapter X15', 24.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 18, 'High-performance router', 'Router X16', 179.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 20, 'Gaming router', 'Gaming Router X17', 199.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 16, 'Outdoor WiFi system', 'Outdoor WiFi X18', 249.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 14, 'Enterprise network switch', 'Enterprise Switch X19', 299.99, (SELECT id FROM category WHERE name='Networking Devices')),
    (nextval('product_seq'), 12, 'Flagship mesh system', 'Mesh Pro X20', 349.99, (SELECT id FROM category WHERE name='Networking Devices'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 40, '1TB external HDD', 'External HDD X1', 59.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 35, '2TB external HDD', 'External HDD X2', 89.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 30, '512GB SSD drive', 'SSD X1', 49.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 25, '1TB NVMe SSD', 'NVMe SSD X2', 99.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 20, '2TB NVMe SSD', 'NVMe SSD X3', 179.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 18, 'USB 3.0 flash drive 64GB', 'Flash Drive X1', 19.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 22, 'USB 3.0 flash drive 128GB', 'Flash Drive X2', 29.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 16, 'Portable SSD 1TB', 'Portable SSD X1', 129.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 14, 'Portable SSD 2TB', 'Portable SSD X2', 199.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 18, 'Internal HDD 1TB', 'Internal HDD X1', 49.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 20, 'Internal HDD 2TB', 'Internal HDD X2', 69.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 15, 'Enterprise storage drive', 'Enterprise HDD X1', 149.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 12, 'High-speed NVMe SSD', 'NVMe Pro X1', 249.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 18, 'External SSD 512GB', 'External SSD X1', 89.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 20, 'External SSD 1TB', 'External SSD X2', 149.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 22, 'Budget USB drive 32GB', 'USB Drive X1', 9.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 25, 'High durability flash drive', 'USB Drive X2', 14.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 19, 'Gaming SSD 1TB', 'Gaming SSD X1', 119.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 17, 'Professional storage SSD', 'Pro SSD X1', 179.99, (SELECT id FROM category WHERE name='Storage Devices')),
    (nextval('product_seq'), 10, 'Flagship NVMe SSD', 'Ultra SSD X1', 299.99, (SELECT id FROM category WHERE name='Storage Devices'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 20, 'Automatic washing machine', 'WashMaster X1', 399.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 18, 'Front-load washing machine', 'WashPro X2', 499.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 22, 'Energy-efficient refrigerator', 'CoolFridge X3', 599.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 25, 'Double-door fridge', 'Fridge X4', 699.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 15, 'Smart air conditioner', 'CoolAir X5', 799.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 19, 'Portable air cooler', 'Cooler X6', 199.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 17, 'Microwave oven', 'HeatWave X7', 149.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 20, 'Smart TV 55 inch', 'Vision TV X8', 699.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 14, 'LED smart TV 43 inch', 'Vision TV X9', 399.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 18, 'Vacuum cleaner robot', 'CleanBot X10', 299.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 16, 'Handheld vacuum cleaner', 'CleanPro X11', 129.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 21, 'Water purifier RO system', 'PureWater X12', 249.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 23, 'Electric geyser heater', 'HeatMax X13', 179.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 19, 'Smart washing machine', 'WashSmart X14', 549.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 20, 'Air purifier for home', 'AirPure X15', 199.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 18, 'Dishwasher machine', 'CleanDish X16', 449.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 22, 'Induction cooktop', 'CookTop X17', 89.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 25, 'Smart refrigerator with display', 'SmartFridge X18', 999.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 12, 'Premium AC inverter split', 'CoolPro X19', 1199.99, (SELECT id FROM category WHERE name='Home Appliances')),
    (nextval('product_seq'), 10, 'Flagship home appliance suite', 'Home Elite X20', 1499.99, (SELECT id FROM category WHERE name='Home Appliances'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, 'Mixer grinder set', 'MixPro X1', 49.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 28, 'Electric kettle', 'BoilFast X2', 29.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 25, 'Air fryer machine', 'AirCook X3', 99.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 22, 'Microwave oven compact', 'HeatMini X4', 119.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 20, 'Toaster machine', 'ToastPro X5', 39.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 18, 'Coffee maker machine', 'BrewMaster X6', 79.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 15, 'Food processor', 'ChopPro X7', 129.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 24, 'Induction cooktop', 'CookTop X8', 69.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 26, 'Rice cooker', 'RiceMaster X9', 59.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 21, 'Blender machine', 'BlendPro X10', 49.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 18, 'Electric juicer', 'JuiceMax X11', 89.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 20, 'Sandwich maker', 'SnackPro X12', 34.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 23, 'Gas stove burner set', 'FlameCook X13', 149.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 19, 'Dish sterilizer', 'CleanDish X14', 119.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 16, 'Electric oven', 'BakePro X15', 199.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 14, 'Smart kitchen scale', 'SmartScale X16', 29.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 22, 'Hand blender', 'BlendMini X17', 39.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 25, 'Pressure cooker electric', 'CookFast X18', 89.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 18, 'Premium coffee machine', 'CafePro X19', 249.99, (SELECT id FROM category WHERE name='Kitchen Appliances')),
    (nextval('product_seq'), 12, 'Flagship kitchen appliance set', 'Kitchen Elite X20', 399.99, (SELECT id FROM category WHERE name='Kitchen Appliances'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 18, 'Office ergonomic chair', 'ErgoChair X1', 149.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 15, 'Gaming chair with lumbar support', 'GameChair X2', 199.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 12, 'Wooden office desk', 'WorkDesk X3', 249.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 14, 'Computer study table', 'StudyDesk X4', 129.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 20, 'Bookshelf wooden rack', 'BookShelf X5', 99.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 22, 'Sofa 3-seater', 'ComfortSofa X6', 399.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 10, 'Luxury recliner chair', 'RelaxChair X7', 599.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 16, 'Dining table set', 'DiningSet X8', 699.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 18, 'Bed frame king size', 'SleepBed X9', 799.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 25, 'Plastic chair set', 'PlasticChair X10', 49.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 20, 'Office storage cabinet', 'StorageCab X11', 199.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 17, 'Coffee table glass', 'CoffeeTable X12', 149.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 14, 'Wall mounted shelf', 'WallShelf X13', 79.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 19, 'Shoe rack organizer', 'ShoeRack X14', 69.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 13, 'L-shaped office desk', 'OfficeDesk X15', 299.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 15, 'Foldable study table', 'FoldDesk X16', 109.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 18, 'Wardrobe wooden', 'Wardrobe X17', 499.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 12, 'Luxury sofa set', 'LuxurySofa X18', 999.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 10, 'Outdoor garden chair set', 'GardenSet X19', 299.99, (SELECT id FROM category WHERE name='Furniture')),
    (nextval('product_seq'), 8, 'Premium office furniture set', 'Office Elite X20', 1299.99, (SELECT id FROM category WHERE name='Furniture'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 40, 'Premium A4 printing paper pack', 'A4 Paper Pack X1', 4.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 35, 'Blue ball pen set', 'Ball Pen Set X2', 2.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 30, 'Stapler heavy duty', 'Stapler X3', 9.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 28, 'Office notebook set', 'Notebook Set X4', 6.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 25, 'Highlighter pack', 'Highlighter X5', 3.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 22, 'Desk organizer tray', 'Desk Organizer X6', 12.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 20, 'Sticky notes pack', 'Sticky Notes X7', 2.49, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 18, 'Paper clip set', 'Paper Clips X8', 1.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 24, 'Whiteboard marker set', 'Marker Set X9', 5.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 19, 'Office file folders', 'File Folder X10', 7.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 21, 'Desk calendar', 'Calendar X11', 4.49, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 23, 'Scissors set', 'Scissors X12', 3.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 17, 'Punch machine', 'Puncher X13', 11.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 26, 'Binder clips pack', 'Binder Clips X14', 2.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 20, 'Correction tape pack', 'Correction Tape X15', 3.49, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 18, 'Desk lamp LED', 'Desk Lamp X16', 14.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 15, 'Office calculator', 'Calculator X17', 19.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 22, 'Tape dispenser', 'Tape Dispenser X18', 6.49, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 16, 'Clipboard board', 'Clipboard X19', 5.99, (SELECT id FROM category WHERE name='Office Supplies')),
    (nextval('product_seq'), 14, 'Premium office stationery kit', 'Office Kit X20', 29.99, (SELECT id FROM category WHERE name='Office Supplies'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 50, 'Java programming guide', 'Java Mastery X1', 14.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 45, 'Spring Boot in depth', 'Spring Boot Guide X2', 19.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 40, 'Data structures book', 'DSA Book X3', 12.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 35, 'System design basics', 'System Design X4', 24.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 38, 'Clean code principles', 'Clean Code X5', 18.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 32, 'JavaScript handbook', 'JS Handbook X6', 16.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 30, 'React complete guide', 'React Book X7', 21.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 28, 'Python for beginners', 'Python X8', 11.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 26, 'SQL mastery guide', 'SQL Book X9', 13.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 24, 'Microservices architecture', 'Microservices X10', 29.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 22, 'Docker & Kubernetes guide', 'DevOps Book X11', 27.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 20, 'Linux fundamentals', 'Linux Book X12', 15.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 18, 'Cloud computing basics', 'Cloud Book X13', 19.49, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 16, 'AI introduction book', 'AI Basics X14', 22.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 14, 'Machine learning guide', 'ML Book X15', 25.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 12, 'Database systems book', 'DBMS X16', 17.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 15, 'C++ programming book', 'C++ Master X17', 14.49, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 13, 'Operating systems book', 'OS Book X18', 19.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 11, 'Networking fundamentals', 'Networking X19', 16.99, (SELECT id FROM category WHERE name='Books')),
    (nextval('product_seq'), 10, 'Full stack development guide', 'Full Stack X20', 34.99, (SELECT id FROM category WHERE name='Books'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 60, 'Cotton casual shirt', 'Men Shirt X1', 19.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 55, 'Formal office shirt', 'Formal Shirt X2', 24.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 50, 'Denim jeans slim fit', 'Jeans X3', 29.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 45, 'Cotton t-shirt pack', 'T-Shirt Pack X4', 14.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 40, 'Hoodie winter wear', 'Hoodie X5', 34.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 38, 'Casual jacket', 'Jacket X6', 49.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 35, 'Track pants sports wear', 'Track Pants X7', 22.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 30, 'Formal trousers', 'Trousers X8', 27.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 28, 'Winter sweater', 'Sweater X9', 32.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 26, 'Sports t-shirt', 'Sports Tee X10', 18.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 24, 'Leather belt', 'Belt X11', 12.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 22, 'Sneakers shoes', 'Sneakers X12', 39.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 20, 'Formal shoes', 'Formal Shoes X13', 44.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 18, 'Cap stylish wear', 'Cap X14', 9.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 16, 'Gym wear set', 'Gym Set X15', 29.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 14, 'Rain jacket', 'Rain Jacket X16', 39.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 12, 'Winter coat premium', 'Winter Coat X17', 59.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 10, 'Luxury suit set', 'Suit X18', 149.99, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 15, 'Casual shorts', 'Shorts X19', 14.49, (SELECT id FROM category WHERE name='Fashion Men')),
    (nextval('product_seq'), 13, 'Sports hoodie', 'Sports Hoodie X20', 34.99, (SELECT id FROM category WHERE name='Fashion Men'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 60, 'Cotton kurti stylish wear', 'Kurti X1', 24.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 55, 'Designer saree', 'Saree X2', 49.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 50, 'Western dress floral', 'Dress X3', 39.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 45, 'Casual top wear', 'Top X4', 19.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 40, 'Jeans women slim fit', 'Women Jeans X5', 29.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 38, 'Leggings pack', 'Leggings X6', 14.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 35, 'Winter jacket women', 'Jacket X7', 44.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 30, 'Party gown dress', 'Gown X8', 79.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 28, 'Ethnic wear set', 'Ethnic Set X9', 59.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 26, 'T-shirt casual wear', 'Women Tee X10', 16.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 24, 'Heels stylish footwear', 'Heels X11', 34.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 22, 'Flats sandals', 'Sandals X12', 19.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 20, 'Handbag fashion', 'Handbag X13', 29.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 18, 'Winter sweater women', 'Sweater X14', 32.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 16, 'Sports wear set', 'Sports Set X15', 27.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 14, 'Luxury dress wear', 'Luxury Dress X16', 99.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 12, 'Bridal wear dress', 'Bridal Dress X17', 199.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 10, 'Premium saree silk', 'Silk Saree X18', 149.99, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 15, 'Casual shorts women', 'Shorts X19', 14.49, (SELECT id FROM category WHERE name='Fashion Women')),
    (nextval('product_seq'), 13, 'Ethnic kurta set premium', 'Kurta Set X20', 59.99, (SELECT id FROM category WHERE name='Fashion Women'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 50, 'Running shoes lightweight', 'RunFast X1', 39.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 45, 'Casual sneakers everyday wear', 'StreetSneak X2', 29.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 40, 'Premium leather formal shoes', 'Formal Leather X3', 59.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 38, 'Sports training shoes', 'TrainPro X4', 44.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 35, 'Basketball shoes grip sole', 'CourtGrip X5', 69.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 32, 'Walking shoes comfort fit', 'WalkComfort X6', 34.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 30, 'Hiking boots waterproof', 'TrailBoot X7', 79.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 28, 'Slip-on casual shoes', 'EasySlip X8', 24.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 26, 'Gym shoes flexible design', 'GymFlex X9', 39.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 24, 'Running shoes pro edition', 'RunPro X10', 89.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 22, 'Canvas shoes lightweight', 'Canvas X11', 19.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 20, 'Office formal shoes black', 'Office Black X12', 54.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 18, 'Winter boots insulated', 'WinterBoot X13', 99.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 16, 'Sports sneakers breathable', 'AirSneak X14', 49.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 14, 'Premium sneakers fashion', 'StyleSneak X15', 59.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 12, 'Football studs shoes', 'StudPro X16', 74.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 10, 'Luxury leather boots', 'LeatherBoot X17', 129.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 15, 'Kids sports shoes', 'KidsRun X18', 29.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 13, 'Slippers comfort wear', 'SoftSlippers X19', 14.99, (SELECT id FROM category WHERE name='Shoes')),
    (nextval('product_seq'), 11, 'Premium running shoes elite', 'EliteRun X20', 149.99, (SELECT id FROM category WHERE name='Shoes'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 60, 'Herbal face wash', 'GlowFace X1', 9.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 55, 'Moisturizing body lotion', 'SoftSkin X2', 12.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 50, 'Hair shampoo anti-dandruff', 'HairCare X3', 11.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 45, 'Hair conditioner smooth', 'SilkyHair X4', 10.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 40, 'Vitamin C serum', 'GlowSerum X5', 19.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 38, 'Perfume long lasting', 'Perfume X6', 24.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 35, 'Beard grooming kit', 'BeardPro X7', 17.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 32, 'Electric hair trimmer', 'TrimMaster X8', 29.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 30, 'Face scrub exfoliator', 'ScrubX X9', 14.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 28, 'Lip balm moisturizing', 'LipCare X10', 4.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 26, 'Hair oil natural', 'HairOil X11', 8.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 24, 'Face mask sheet pack', 'MaskGlow X12', 9.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 22, 'Makeup kit starter', 'MakeupKit X13', 39.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 20, 'Foundation cream premium', 'SkinTone X14', 22.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 18, 'Eyeliner waterproof', 'EyeLine X15', 12.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 16, 'Shaving foam men', 'ShaveFoam X16', 6.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 14, 'Sunscreen SPF 50', 'SunProtect X17', 15.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 12, 'Luxury skincare kit', 'SkinElite X18', 59.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 10, 'Premium perfume set', 'PerfumeElite X19', 89.99, (SELECT id FROM category WHERE name='Beauty & Personal Care')),
    (nextval('product_seq'), 8, 'Salon hair care kit', 'SalonPro X20', 79.99, (SELECT id FROM category WHERE name='Beauty & Personal Care'));

INSERT INTO product
(id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 40, 'Yoga mat non-slip', 'YogaPro X1', 14.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 35, 'Dumbbell set 10kg', 'FitDumbbell X2', 39.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 30, 'Resistance bands kit', 'BandFit X3', 12.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 28, 'Treadmill home use', 'RunMachine X4', 399.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 25, 'Cycling bike gear', 'CycleGear X5', 59.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 22, 'Skipping rope smart counter', 'JumpFit X6', 9.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 20, 'Gym gloves grip', 'GripGloves X7', 8.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 18, 'Punching bag heavy', 'BoxingPro X8', 49.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 24, 'Fitness smartwatch band', 'FitBand X9', 29.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 21, 'Pull-up bar home gym', 'PullBar X10', 34.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 19, 'Ab roller wheel', 'CoreFit X11', 14.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 17, 'Kettlebell set', 'KettleFit X12', 44.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 15, 'Yoga blocks set', 'YogaBlock X13', 9.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 13, 'Smart body scale', 'BodyScale X14', 24.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 18, 'Football training kit', 'FootTrain X15', 29.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 20, 'Basketball training cone set', 'BasketTrain X16', 19.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 22, 'Swimming goggles pro', 'SwimPro X17', 12.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 16, 'Outdoor hiking backpack', 'HikePack X18', 49.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 14, 'Tennis racket professional', 'TennisPro X19', 59.99, (SELECT id FROM category WHERE name='Sports & Fitness')),
    (nextval('product_seq'), 12, 'Gym full equipment set', 'GymElite X20', 999.99, (SELECT id FROM category WHERE name='Sports & Fitness'));


-- Comments in SQL Start with dash-dash --

-- Adding new product, 'chair' to the table with price of 44.00 and can_be_returned with false boolean --
INSERT INTO products (name, price, can_be_returned)
VALUES ('chair', 44.00, false);

-- Adding new product, 'stool' to the table with price of 25.99 and can_be_returned with false true --
INSERT INTO products (name, price, can_be_returned)
VALUES ('stool', 25.99, true);

-- Adding new product, 'table' to the table with price of 124.00 and can_be_returned with false boolean --
INSERT INTO products (name, price, can_be_returned)
VALUES ('table', 124.00, false);

-- Display all rows and columns in 'products' table --
SELECT * FROM products;

-- Display only 'names' comlumn in 'products' table --
SELECT name FROM products;

-- Display 'names' and 'price' columns of 'products' table --
SELECT name, price FROM products;

-- Added a new made-up product 'stool' into 'product' table --
INSERT INTO products (name, price, can_be_returned)
VALUES ('stool', 25.99, true);

-- Display only products with 'can_be_returned' column marked true from 'products' table --
SELECT * FROM products
WHERE can_be_returned = true;

-- Display only products that have less than 44.00 in the 'price' column --
SELECT * FROM products
WHERE price < 44.00;

-- Display only products whose price is in between 22.50 and 99.99 --
SELECT * FROM products
WHERE price BETWEEN 22.50 AND 99.99;

-- Reduce product prices through UPDATE to by 20 --
UPDATE products
SET price = price - 20;

-- Remove all products whose price is now less than 25 due to the UPDATE --
DELETE FROM products
WHERE price < 25;

-- Reverse the first UPDATE and increase product prices back up by $20 --
UPDATE products
SET price = price + 20;

-- UPDATE all products of 'products' table 'can_be_returned' column boolean value to be true --
UPDATE products
SET can_be_returned = true;














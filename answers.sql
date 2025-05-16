Question 1
CREATE TEMPORARY TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

--  each product becomes its own row
CREATE TEMPORARY TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Display normalized result
SELECT * FROM ProductDetail_1NF;

Question 2
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Product table: holds products for each order
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(OrderID)
);

INSERT INTO product (product_id, productName, quantity, order_id) VALUES
(1, 'Laptop', 2, 101),
(2, 'Mouse', 1, 101),
(3, 'Tablet', 3, 102),
(4, 'Keyboard', 1, 102),
(5, 'Mouse', 2, 102),
(6, 'Phone', 1, 103);

-- Display normalized tables
SELECT * FROM orders;
SELECT * FROM product;


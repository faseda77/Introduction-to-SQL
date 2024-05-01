-- We created schema for the customers table 
..We created schema for the customers table
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(7) NOT NULL
);

Select * from customers

--We created the schema for the categories
CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

select * from table
public.customers
--We created the schema for the Table
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

--We created schema for the table orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
--we created schema for table order dteails
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (Name, Email, Address, City, Province, PostalCode) VALUES
('John Doe', 'johndoe@example.com', '123 Elm St', 'Toronto', 'Ontario', 'M4B 1B3'),
('Jane Smith', 'janesmith@example.com', '456 Maple Ave', 'Vancouver', 'British Columbia', 'V5K 0A1'),
('Ahmed Khan', 'ahmedkhan@example.com', '789 Pine Rd', 'Calgary', 'Alberta', 'T2P 2M2'),
('Maria Garcia', 'mariagarcia@example.com', '321 Oak Ln', 'Montreal', 'Quebec', 'H3Z 2Y7'),
('Chen Wei', 'chenwei@example.com', '654 Spruce Ct', 'Ottawa', 'Ontario', 'K1A 0B1'),
('Emily Johnson', 'emilyjohnson@example.com', '987 Cedar Pl', 'Mississauga', 'Ontario', 'L5G 2T6'),
('Carlos Hernandez', 'carloshernandez@example.com', '123 Birch St', 'Winnipeg', 'Manitoba', 'R3J 0X9'),
('Aisha Patel', 'aishapatel@example.com', '456 Alder Rd', 'Saskatoon', 'Saskatchewan', 'S7N 1K4'),
('Alexander Smith', 'alexandersmith@example.com', '789 Willow Ave', 'Halifax', 'Nova Scotia', 'B3H 2Z6'),
('Sophia Brown', 'sophiabrown@example.com', '321 Elm Pl', 'Quebec City', 'Quebec', 'G1V 3V4');

select * from customers

INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Books'),
('Home & Garden'),
('Toys & Games'),
('Clothing'),
('Health & Beauty'),
('Sports & Outdoors'),
('Pet Supplies'),
('Food & Grocery'),
('Automotive');

select * from categories

INSERT INTO Products (Name, Description, Price, CategoryID) VALUES
('Laptop', 'A high-performance laptop.', 1200.00, 1),
('Database Management Book', 'A comprehensive guide to database management.', 45.00, 2),
('Garden Shovel', 'Durable shovel for gardening.', 22.95, 3),
('Board Game', 'Fun for the whole family.', 35.00, 4),
('Men\"s T-shirt', '100% cotton, size medium.', 19.99, 5),
('Shampoo', 'Organic and natural hair care.', 12.50, 6),
('Camping Tent', 'Two-person tent, waterproof.', 89.99, 7),
('Dog Leash', 'Strong and durable leash for dogs.', 9.99, 8),
('Organic Almonds', 'Raw organic almonds, 1lb.', 15.99, 9),
('Car Wax', 'High-quality wax for car care.', 23.99, 10);

select * from products

-- Assuming a simple pattern for OrderDate for illustration; in practice, these would vary more.
INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2024-02-20', 'Shipped'),
(2, '2024-02-21', 'Processing'),
(3, '2024-02-22', 'Delivered'),
(4, '2024-02-23', 'Shipped'),
(5, '2024-02-24', 'Processing'),
(6, '2024-02-25', 'Delivered'),
(7, '2024-02-26', 'Shipped'),
(8, '2024-02-27', 'Processing'),
(9, '2024-02-28', 'Delivered'),
(10, '2024-02-29', 'Shipped');

select * from orders

-- Sample data with some arbitrary quantities and prices for simplicity.
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1200.00),
(2, 2, 2, 90.00),
(3, 3, 1, 22.95),
(4, 4, 3, 105.00),
(5, 5, 2, 39.98),
(6, 6, 4, 50.00),
(7, 7, 1, 89.99),
(8, 8, 2, 19.98),
(9, 9, 3, 47.97),
(10, 10, 1, 23.99);

select * from orderdetails
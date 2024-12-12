-- Create and use the FoodDelivery database
CREATE DATABASE FoodDelivery;
USE FoodDelivery;

-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    AdminName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

-- Create the Menu table
CREATE TABLE Menu (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL
);

-- Create the Customer table
CREATE TABLE Customer (
    CusID INT AUTO_INCREMENT PRIMARY KEY,
    CusName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15),
    Address TEXT
);

-- Create the Orders table (renamed from Order to avoid conflicts with reserved keywords)
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    CusID INT NOT NULL,
    MenuID INT NOT NULL,
    FOREIGN KEY (CusID) REFERENCES Customer(CusID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

-- Insert data into Admin
INSERT INTO Admin (AdminName, Email, Password) 
VALUES 
    ('Areej', 'areej@gmail.com', '123'),
    ('Hafsa', 'hafsa@gmail.com', '456');

-- Insert data into Customer
INSERT INTO Customer (CusName, Email, PhoneNumber, Address) 
VALUES 
    ('Ali', 'ali@gmail.com', '1234567890', 'Airport Society, Islamabad'),
    ('Sara', 'sara@gmail.com', '0987654321', 'Chaklala Cantt, Rawalpindi');

-- Insert data into Menu
INSERT INTO Menu (ItemName, Price, Quantity) 
VALUES 
    ('Japanese Noodles', 900, 50),
    ('Spaghetti', 750, 20),
    ('Spaghetti Meat', 1560, 30),
    ('Noodles', 630, 25),
    ('Kids Noodles', 820, 35),
    ('Chicken Rice', 1950, 27),
    ('Salad', 250, 40),
    ('Thai Food', 2530, 15),
    ('Western Food', 3300, 20),
    ('Raspberry', 700, 50),
    ('Chocolate Pudding', 1850, 30),
    ('Blue Hawaiian', 1320, 26),
    ('Lemon Ice', 650, 20),
    ('Chocolate Cake', 4500, 22),
    ('Strawberry Cake', 5230, 36);

-- Insert data into Orders
INSERT INTO Orders (Quantity, TotalPrice, CusID, MenuID)
VALUES 
    (2, 1800, 1, 1), 
    (1, 750, 2, 2),  
    (3, 4680, 1, 3);

-- Display all data
SELECT * FROM Admin;
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Menu;

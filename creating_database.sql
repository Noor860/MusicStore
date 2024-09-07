-- Create the database
CREATE DATABASE MusicStore;
USE MusicStore;

-- Create Artists table
CREATE TABLE Artists (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Genre VARCHAR(50)
);

-- Create Albums table
CREATE TABLE Albums (
    AlbumID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ReleaseDate DATE,
    ArtistID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    AlbumID INT,
    SaleDate DATE,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumID INT,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- Inserting Data
-- Insert data into Artists table
INSERT INTO Artists (Name, Genre) VALUES
('The Beatles', 'Rock'),
('Miles Davis', 'Jazz'),
('Taylor Swift', 'Pop');

-- Insert data into Albums table
INSERT INTO Albums (Title, ReleaseDate, ArtistID, Price) VALUES
('Abbey Road', '1969-09-26', 1, 19.99),
('Kind of Blue', '1959-08-17', 2, 14.99),
('1989', '2014-10-27', 3, 13.99);

-- Insert data into Customers table
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('John Doe', 'johndoe@example.com', '123-456-7890', '123 Main St'),
('Jane Smith', 'janesmith@example.com', '234-567-8901', '456 Elm St');

-- Insert data into Sales table
INSERT INTO Sales (CustomerID, AlbumID, SaleDate, Quantity, TotalAmount) VALUES
(1, 1, '2024-09-01', 1, 19.99),
(2, 2, '2024-09-02', 2, 29.98);

-- Insert data into Inventory table
INSERT INTO Inventory (AlbumID, StockQuantity) VALUES
(1, 50),
(2, 100),
(3, 75);

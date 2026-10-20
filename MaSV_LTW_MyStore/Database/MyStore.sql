IF DB_ID(N'MyStore') IS NULL CREATE DATABASE MyStore;
GO
USE MyStore;
GO
IF OBJECT_ID('dbo.OrderDetail','U') IS NOT NULL DROP TABLE dbo.OrderDetail;
IF OBJECT_ID('dbo.[Order]','U') IS NOT NULL DROP TABLE dbo.[Order];
IF OBJECT_ID('dbo.Product','U') IS NOT NULL DROP TABLE dbo.Product;
IF OBJECT_ID('dbo.Category','U') IS NOT NULL DROP TABLE dbo.Category;
IF OBJECT_ID('dbo.Customer','U') IS NOT NULL DROP TABLE dbo.Customer;
IF OBJECT_ID('dbo.[User]','U') IS NOT NULL DROP TABLE dbo.[User];
GO
CREATE TABLE dbo.[User](Username NVARCHAR(255) NOT NULL PRIMARY KEY, Password NCHAR(50) NOT NULL, UserRole NCHAR(1) NOT NULL);
CREATE TABLE dbo.Customer(CustomerID INT IDENTITY(1,1) PRIMARY KEY, CustomerName NVARCHAR(MAX) NOT NULL, CustomerPhone NVARCHAR(15) NOT NULL, CustomerEmail NVARCHAR(MAX) NULL, CustomerAddress NVARCHAR(MAX) NULL, Username NVARCHAR(255) NOT NULL UNIQUE, CONSTRAINT FK_User_Customer FOREIGN KEY(Username) REFERENCES dbo.[User](Username));
CREATE TABLE dbo.Category(CategoryID INT IDENTITY(1,1) PRIMARY KEY, CategoryName NVARCHAR(MAX) NOT NULL);
CREATE TABLE dbo.Product(ProductID INT IDENTITY(1,1) PRIMARY KEY, CategoryID INT NOT NULL, ProductName NVARCHAR(MAX) NOT NULL, ProductDecription NVARCHAR(MAX) NOT NULL, ProductPrice DECIMAL(18,2) NOT NULL, ProductImage NVARCHAR(MAX) NULL, CONSTRAINT FK_Pro_Category FOREIGN KEY(CategoryID) REFERENCES dbo.Category(CategoryID));
CREATE TABLE dbo.[Order](OrderID INT IDENTITY(1,1) PRIMARY KEY, CustomerID INT NOT NULL, OrderDate DATE NOT NULL, TotalAmount DECIMAL(18,2) NOT NULL, PaymentStatus NVARCHAR(MAX) NULL, AddressDelivery NVARCHAR(MAX) NOT NULL, FOREIGN KEY(CustomerID) REFERENCES dbo.Customer(CustomerID));
CREATE TABLE dbo.OrderDetail(ID INT IDENTITY(1,1) PRIMARY KEY, ProductID INT NOT NULL, OrderID INT NOT NULL, Quantity INT NOT NULL, UnitPrice DECIMAL(18,2) NOT NULL, FOREIGN KEY(ProductID) REFERENCES dbo.Product(ProductID), FOREIGN KEY(OrderID) REFERENCES dbo.[Order](OrderID));
INSERT INTO dbo.[User](Username,Password,UserRole) VALUES(N'admin',N'admin123','A');
INSERT INTO dbo.Category(CategoryName) VALUES(N'Điện thoại'),(N'Laptop'),(N'Phụ kiện'),(N'Gia dụng');
INSERT INTO dbo.Product(CategoryID,ProductName,ProductDecription,ProductPrice,ProductImage) VALUES
(1,N'Điện thoại mẫu A',N'Điện thoại thông minh, thiết kế hiện đại.',5990000,NULL),
(1,N'Điện thoại mẫu B',N'Màn hình đẹp, pin dung lượng cao.',7490000,NULL),
(2,N'Laptop mẫu A',N'Laptop phục vụ học tập và làm việc.',15990000,NULL),
(3,N'Tai nghe không dây',N'Tai nghe gọn nhẹ, kết nối Bluetooth.',790000,NULL),
(3,N'Chuột máy tính',N'Chuột có dây dùng cho học tập và văn phòng.',180000,NULL),
(4,N'Bình đun siêu tốc',N'Bình đun nước tiện lợi cho gia đình.',350000,NULL);

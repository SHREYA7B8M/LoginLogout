create database Gro

use Gro


create table UserRegistration
(
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
ContactNumber nvarchar(10) not null unique,
EmailID nvarchar(50) not null,
DateOfBirth datetime not null,
UserId nvarchar(10) primary key,
Password nvarchar(20) not null,
ConfirmPassword nvarchar(20) not null,
)

create  table UserLogin
(UserLoginId int primary key identity(10,1),
UserId nvarchar(10) foreign key references UserRegistration,
Password nvarchar(20) not null,
UserName nvarchar(50));

--Create a trigger for UserRegistration table
CREATE TRIGGER trg_UserRegistration
ON UserRegistration
AFTER INSERT
AS
BEGIN
    -- Insert a corresponding record into UserLogin table when a new user registers
    INSERT INTO UserLogin (UserId, Password,UserName)
    SELECT i.UserId,i.Password,i.FirstName
    FROM inserted i;
END;


select * from UserRegistration
select * from UserLogin

create table AdminInfo
(AdminId int primary key identity(1,1),
UserName nvarchar(10) not null,
Password nvarchar(20) not null)

insert into AdminInfo values ('admin123', 'admin@123')

select * from AdminInfo

 ----------------Products---------

 CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50)
);



 CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Price DECIMAL(18, 2),
    CategoryId INT,
    ProductImage NVARCHAR(MAX),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

INSERT INTO Categories (CategoryName)
VALUES 
  ('Fruits'),
  ('Vegetables'),
  ('Dairy'),
  ('Bakery'),
  ('Meat'),
  ('Pantry');


INSERT INTO Products (ProductName, Price, CategoryId, ProductImage)
VALUES 
  ('Apple', 40, 1,'https://cdn.pixabay.com/photo/2015/06/10/19/56/apples-805124_640.jpg'),
  ('Banana', 30, 1,'https://th.bing.com/th/id/OIP.O8lKDwWSZP_Cfm8eeyw3wAHaFu?pid=ImgDet&rs=1'),
  ('Carrot', 10, 2,'https://thetimeposts.com/wp-content/uploads/2021/03/Carrots.jpg'),
  ('Tomato', 60, 2,'https://cdn.shopify.com/s/files/1/1380/2059/products/Cherry-Tomato.jpg?v=1480318422'),
  ('Milk', 50, 3, 'https://thecare.com.sg/wp-content/uploads/2021/01/13085415_RXL1_20210122-1536x1536.jpg'),
  ('Bread', 30, 4,'https://th.bing.com/th/id/OIP.82YclUH_boUrJDx_urArNwHaE7?pid=ImgDet&rs=1'),
  ('Chicken', 200, 5,'https://pluspng.com/img-png/png-hd-of-chickens-chicken-png-image-2699.png'),
  ('Rice', 1000, 6,'https://th.bing.com/th/id/OIP.aXqMlyxFRTaKWqIEB7M0SwHaHZ?w=189&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7');

  -------------------------------
  CREATE TABLE Cart (
    CartId INT IDENTITY(1,1) PRIMARY KEY,
    ProductId INT, -- Foreign key to link with Product table
    Quantity INT,
    TotalCost DECIMAL(10, 2),
    UserName NVARCHAR(50) -- To store the user's name or ID
);
  ALTER TABLE Cart
ADD UserId NVARCHAR(50);

 ALTER TABLE Cart
DROP COLUMN UserName;
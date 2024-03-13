drop database HaeiShop
create database HaeiShop
use HaeiShop
drop table Account
drop table [Role]
drop table ShopOrder
drop table Product_Category
drop table ShoppingCartItem
drop table Product


CREATE TABLE [Role] (
    roid INT IDENTITY(1,1) PRIMARY KEY,
	roname nvarchar(50) not null,
)

CREATE TABLE Account (
    accid INT IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) not null,
	email NVARCHAR(100),
	[address] nvarchar(50),
	phone nvarchar(10),
    userName NVARCHAR(100) NOT NULL,
    [password] NVARCHAR(100) NOT NULL,
	roid int,
	foreign key(roid) references [Role](roid)
)

-- Set email column to allow NULL
ALTER TABLE Account
ALTER COLUMN email NVARCHAR(100) NULL;

-- Set address column to allow NULL
ALTER TABLE Account
ALTER COLUMN [address] nvarchar(50) NULL;

-- Set phone column to allow NULL
ALTER TABLE Account
ALTER COLUMN phone nvarchar(10) NULL;


CREATE TABLE ShopOrder (
    shopid int IDENTITY(1,1) PRIMARY KEY,
    date_order DATE NOT NULL,
    total_price float,  
    accid INT,
    FOREIGN KEY (accid) REFERENCES Account(accid)
)

CREATE TABLE Product_Category(
	cid int identity(1,1) primary key,
	categoryname nvarchar(100),
)

ALTER TABLE Product
ADD quantity INT;

CREATE TABLE Product(
	pid int identity(1,1) primary key,
	[description] nvarchar(max) not null,
	title nvarchar(500) not null,
	price float not null,
	[image] nvarchar(500) not null,
	accid int,
	cid int,
	FOREIGN KEY (cid) REFERENCES Product_Category(cid),
	FOREIGN KEY (accid) REFERENCES Account(accid)
)

CREATE TABLE ShoppingCartItem(
	id int identity(1,1) primary key,
	quantity float not null,
	price float not null,
	pid int,
	shopid int,
	FOREIGN KEY (pid) REFERENCES Product(pid),
	FOREIGN KEY (shopid) REFERENCES ShopOrder(shopid)
) 






select * from [Role]
select * from Account
-- Thêm vai trò
INSERT INTO [Role] (roname)
VALUES ('admin'),
	   ('manager'),
	   ('user')


-- Thêm người dùng
INSERT INTO Account (name, email, [address], phone, userName, [password], roid)
VALUES (N'Nguyễn Văn Tiến Hải', 'nvthai061105@gmail.com', N'Hải Dương', '0386828929', 'Haideptrai', 'hai123', 1);

-- Thêm đơn đặt hàng
INSERT INTO ShopOrder (date_order, total_price, accid) VALUES ('2023-02-28', 100.50, 1);

-- Thêm danh mục sản phẩm với tên sang trọng
INSERT INTO Product_Category (categoryname)
VALUES (N'Thời Trang Nam Nữ'),
       (N'Giày Dép Chất Lượng Cao'),
       (N'Sắc Đẹp'),
       (N'Nước Hoa Thượng Hạng');


-- Thêm sản phẩm vào tất cả các danh mục sản phẩm
-- Thêm sản phẩm vào tất cả các danh mục sản phẩm
select * from Account
select * from Role
select * from Product_Category
UPDATE Product SET price = 49.000 WHERE pid = 12

INSERT INTO Product ([description], title, price, [image], accid, cid)
VALUES 
    (N'Giày Thể Thao Sneaker Nam Nữ Unisex Second Sunday Chunky Big Lace Đế Tăng Chiều Cao 4cm SK03
	Với lối thiết kế đặc biệt, đế cao đến 4cm, các gam màu pastel.
	', N'Giày Thể Thao Sneaker Nam Nữ Unisex Second Sunday Chunky Big Lace Đế Tăng Chiều Cao 4cm SK03', 319.000, N'./asset/img/giay_secondsunday.jpg', 3, 2),


    (N'Son Dior Rouge Dior Limited Edition mang đến phong cách quyến rũ và sang trọng khiến người đối diện bị hạ gục chỉ trong một ánh nhìn.
	Màu đỏ tươi phiên bản giới hạn này của hãng rất được lòng các chị em bởi màu son đỏ tươi quá là xuất sắc.
	', N'Son Dior Rouge Matte Velvet 999 720 888 chính hãng fullbox căng bónng mềm mướt môi LIPIT HIGHT END', 899.000, N'./asset/img/son_lipit.jpg', 4, 3),


    (N'Dòng sản phẩm nước hoa BAD BOY PLUS - A:MOUR muốn hướng đến các chàng trai cá tính, có một chút ngông trong tính cách, 
	trong tình yêu, ngoài lạnh trong nóng - cái đầu lạnh nhưng sở hữu một trái tim ấm áp yêu thương.', N'Nước Hoa Nam Amour Bad Boy Plus',
	15.00, N'./asset/img/nuochoa_badboy.jpg', 5, 4),


    (N'Quần jean nam trắng baggy ống suông rộng là một mẫu quần nam rất đáng có mặt trong tủ đồ của bạn; 
	bởi chúng vừa đẹp, vừa thoải mái lại còn vô cùng dễ phối đồ nữa.', N'Quần jean trắng nam baggy ống suông rộng', 
	115.000, N'./asset/img/quan_jean.jpg', 6, 1),


    (N'Giày mlb thể thao nam nữ,giày mlb chunky ny bản cao cấp,chất liệu da in 3D, full box bill hót 2022', N'Giày mlb thể thao nam nữ',
	435.000, N'./asset/img/giay_mlb.jpg', 3, 2),


    (N'Kem nền Catrice HD Liquid Coverage Foundation che phủ tự nhiên tạo độ mịn màng cho da 30ml', N'Kem nền Catrice HD Liquid Coverage Foundation', 
	269.000, N'./asset/img/kemnen.jpg', 4, 3),


    (N'Dưỡng Thể Nước Hoa - Hương Vanilla - Cực kì sang trọng và quý phái', N'Nước hoa ACQUADI', 79.99, 
	N'./asset/img/nuochoa_aquadi.jpg', 5, 4),


    (N'Áo Jacket Thời Trang cao cấp cực kì sang trọng và đẳng cấp', N'Áo Jacket Phong Cách', 300.000, N'./asset/img/ao_khoac.jpg', 6, 1),


    (N'Bộ Suit Nam Thời Trang - đẳng cấp và sành điệu', N'Bộ Suit Nam Cao Cấp', 99.99, N'./asset/img/bo_suit.jpg', 3, 2),
    (N'Giày Sneakers Spit đế êm, form rộng, đưa chiều cao của bạn lên 1 đẳng cấp khác', N'Giày Sneakers Cho Mọi Ngày', 788.000, N'./asset/img/giay_spit.jpg', 4, 3),
    (N'Bảng Màu Mắt Rose Gold - sang trọng , quý phái , giúp các quý cô tự tin ', N'Bảng Màu Mắt Rose Gold', 100.000, N'./asset/img/bang_mat.jpg', 5, 4),
    (N'Đai lưng Nam Sang Trọng - giá rẻ , làm bằng da bò cao cấp', N'Đai lưng Nam Cao Cấp', 49.99, N'./asset/img/dailung.jpg', 6, 1);

    

-- Thêm mục giỏ hàng
INSERT INTO ShoppingCartItem (quantity, price, pid, shopid) 
VALUES 
    (1, 29.99, 1, 1),
    (2, 79.99, 2, 1)




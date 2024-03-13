/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Category;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    // lấy ra toàn bộ product
    public List<Product> getAllProduct() {
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        List<Product> listP = new ArrayList<>();
        String sql = "SELECT [pid]\n"
                + "      ,[description]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[accid]\n"
                + "      ,[cid]\n"
                + "    ,[quantity]\n"
                + "  FROM [dbo].[Product]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImg(rs.getString("image"));
                Account acc = udao.getAccountByID(rs.getInt("accid"));
                Category cate = cadao.getCategoryByID(rs.getInt("cid"));
                p.setAccount(acc);
                p.setCategory(cate);
                p.setQuantity(rs.getInt("quantity"));
                listP.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listP;
    }

    public List<Product> getAllProductOrderByPrice(String order) {
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        List<Product> listP = new ArrayList<>();
        String sql = "SELECT * FROM Product ORDER BY price " + order;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImg(rs.getString("image"));
                Account acc = udao.getAccountByID(rs.getInt("accid"));
                Category cate = cadao.getCategoryByID(rs.getInt("cid"));
                p.setAccount(acc);
                p.setCategory(cate);
                p.setQuantity(rs.getInt("quantity"));
                listP.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listP;
    }

    public List<Product> SearchProductByName(String key_search) {
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        List<Product> listP = new ArrayList<>();
        String sql = "SELECT [pid]\n"
                + "      ,[description]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[accid]\n"
                + "      ,[cid]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where  title like ?";
        String check = "%" + key_search + "%";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, check);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImg(rs.getString("image"));
                Account acc = udao.getAccountByID(rs.getInt("accid"));
                Category cate = cadao.getCategoryByID(rs.getInt("cid"));
                p.setAccount(acc);
                p.setCategory(cate);
                p.setQuantity(rs.getInt("quantity"));
                listP.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listP;
    }

    public List<Product> getAllProductByCateID(String id) {
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        List<Product> listP = new ArrayList<>();
        String sql = "SELECT [pid]\n"
                + "      ,[description]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[accid]\n"
                + "      ,[cid]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where cid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImg(rs.getString("image"));
                Account acc = udao.getAccountByID(rs.getInt("accid"));
                Category cate = cadao.getCategoryByID(rs.getInt("cid"));
                p.setAccount(acc);
                p.setCategory(cate);
                p.setQuantity(rs.getInt("quantity"));
                listP.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listP;
    }

    public List<Product> PagingProduct(int num) {
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        List<Product> listP = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by pid \n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            int offset = (num - 1)* 10;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImg(rs.getString("image"));
                Account acc = udao.getAccountByID(rs.getInt("accid"));
                Category cate = cadao.getCategoryByID(rs.getInt("cid"));
                p.setAccount(acc);
                p.setCategory(cate);
                p.setQuantity(rs.getInt("quantity"));
                listP.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listP;
    }

    public Product getProductByID(String id) {
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        String sql = "select * from Product where pid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImg(rs.getString("image"));
                Account acc = udao.getAccountByID(rs.getInt("accid"));
                Category cate = cadao.getCategoryByID(rs.getInt("cid"));
                p.setAccount(acc);
                p.setCategory(cate);
                p.setQuantity(rs.getInt("quantity"));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void UpdateProduct(Product p, String id) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [description] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[accid] = ?\n"
                + "      ,[cid] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE pid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getDescription());
            ps.setString(2, p.getTitle());
            ps.setFloat(3, p.getPrice());
            ps.setString(4, p.getImg());
            ps.setInt(5, p.getAccount().getId());
            ps.setInt(6, p.getCategory().getId());
            ps.setInt(7, p.getQuantity());
            ps.setString(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void InsertProduct(String des, String title, String img, float price, Account acc, Category ca, int quantity) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([description]\n"
                + "           ,[title]\n"
                + "           ,[price]\n"
                + "           ,[image]\n"
                + "           ,[accid]\n"
                + "           ,[cid]\n"
                + "           ,[quantity])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, des);
            ps.setString(2, title);
            ps.setFloat(3, price);
            ps.setString(4, img);
            ps.setInt(5, acc.getId());
            ps.setInt(6, ca.getId());
            ps.setInt(7, quantity);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void DeleteProductByID(int pid) {
        String sql = "delete from Product where pid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public int NumberOfProducts() {
        String sql = "select count(*) from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
//        Product p = dao.getProductByID("1");
//        System.out.println(p);
        List<Product> list = dao.SearchProductByName("Giày mlb");
        for (Product product : list) {
            System.out.println(product);
        }
    }
}

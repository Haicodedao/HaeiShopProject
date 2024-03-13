/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> listCate = new ArrayList<>();
        String sql = "SELECT [cid]\n"
                + "      ,[categoryname]\n"
                + "  FROM [dbo].[Product_Category]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listCate.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listCate;
    }

    public Category getCategoryByID(int id) {
        String sql = "SELECT [cid]\n"
                + "      ,[categoryname]\n"
                + "  FROM [dbo].[Product_Category]\n"
                + "  where cid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int NumberOfCategory() {
        String sql = "select count(*) from Product_Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
//        List<Category> listCate = dao.getAllCategory();
//        for (Category category : listCate) {
//            System.out.println(category);
//        }
        Category ca = dao.getCategoryByID(1);
        System.out.println(ca);
        int x = dao.NumberOfCategory();
        System.out.println(x);
    }
}

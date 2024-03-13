/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import model.Account;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public void addOrder(Account a, Cart c) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add bảng ShopOrder trước
            String sql = "INSERT INTO [dbo].[ShopOrder]\n"
                    + "           ([date_order]\n"
                    + "           ,[total_price]\n"
                    + "           ,[accid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, date);
            ps.setFloat(2, c.getTotalMoney());
            ps.setInt(3, a.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}

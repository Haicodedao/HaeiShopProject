/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.ArrayList;
import java.util.List;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.RoleAccount;

public class UserDAO extends DBContext {

    public List<Account> getAllAccount() {
        List<Account> listA = new ArrayList<>();
        String sql = "select * from account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("accid"));
                acc.setName(rs.getString("name"));
                acc.setEmail(rs.getString("email"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUser(rs.getString("userName"));
                acc.setPass(rs.getString("password"));
                RoleAccount roacc = getRoleAccountByID(rs.getInt("roid"));
                acc.setRole(roacc);
                listA.add(acc);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listA;
    }

    // lay ra account
    public Account getAccount(String user, String pass) {
        String sql = "select * from Account a join [Role] r\n"
                + "on a.roid = r.roid where userName= ? and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("accid"));
                acc.setName(rs.getString("name"));
                acc.setEmail(rs.getString("email"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUser(user);
                acc.setPass(pass);
                RoleAccount roacc = getRoleAccountByID(rs.getInt("roid"));
                acc.setRole(roacc);
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public RoleAccount getRoleAccountByID(int id) {
        String sql = "select * from [Role]\n"
                + "where roid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RoleAccount ra = new RoleAccount(rs.getInt(1), rs.getString(2));
                return ra;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Account getAccountByID(int id) {
        String sql = "select * from Account a join [Role] r\n"
                + "on a.roid = r.roid where accid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("accid"));
                acc.setName(rs.getString("name"));
                acc.setEmail(rs.getString("email"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUser(rs.getString("username"));
                acc.setPass(rs.getString("password"));
                RoleAccount roacc = getRoleAccountByID(rs.getInt("roid"));
                acc.setRole(roacc);
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Account getAccountByUser(String user) {
        String sql = "select * from Account a join [Role] r\n"
                + "on a.roid = r.roid where userName= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("accid"));
                acc.setName(rs.getString("name"));
                acc.setEmail(rs.getString("email"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUser(user);
                acc.setPass(rs.getString("password"));
                RoleAccount roacc = getRoleAccountByID(rs.getInt("roid"));
                acc.setRole(roacc);
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void InsertUser(String user, String pass) {
        String sql = "insert into Account ([name], userName, password, roid)\n"
                + "values (?,?,?,3)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void AdminInsertUser(String fullname, String email, String address, String phone, String user, String pass, RoleAccount role) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[userName]\n"
                + "           ,[password]\n"
                + "           ,[roid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, user);
            ps.setString(6, pass);
            ps.setInt(7, role.getRoid());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void InsertUserManager(String user, String pass) {
        String sql = "insert into Account ([name], userName, password, roid)\n"
                + "values (?,?,?,2)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void AdminInsertManager(String fullname, String email, String address, String phone, String user, String pass) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[userName]\n"
                + "           ,[password]\n"
                + "           ,[roid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,2)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, user);
            ps.setString(6, pass);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void UpdateInfoCus(String user, String funame, String address, String email, String phone) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE userName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, funame);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, user);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void UpdatePass(String user, String newpass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET  [password] = ?     \n"
                + " WHERE userName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setString(2, user);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public int NumberOfUser() {
        String sql = "select count(*) from Account";
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

    public void DeleteAccByID(int id) {
        String sql = "DELETE FROM [dbo].[Account]\n"
                + "      WHERE accid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public int NumberOfSupplier() {
        String sql = "select count(*) from Account\n"
                + "where roid = 2";
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

    public List<Account> searchAccountByUserName(String txtSearch) {
        List<Account> listA = new ArrayList<>();
        String sql = "select * from Account\n"
                + "where [userName] like ?";
        String sqlImport = "%" + txtSearch + "%";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, sqlImport);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("accid"));
                acc.setName(rs.getString("name"));
                acc.setEmail(rs.getString("email"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUser(rs.getString("userName"));
                acc.setPass(rs.getString("password"));
                RoleAccount roacc = getRoleAccountByID(rs.getInt("roid"));
                acc.setRole(roacc);
                listA.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listA;
    }

    public List<Account> getAllManagerAcc() {
        List<Account> listA = new ArrayList<>();
        String sql = "select * from Account\n"
                + "where roid = 2";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("accid"));
                acc.setName(rs.getString("name"));
                acc.setEmail(rs.getString("email"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUser(rs.getString("userName"));
                acc.setPass(rs.getString("password"));
                RoleAccount roacc = getRoleAccountByID(rs.getInt("roid"));
                acc.setRole(roacc);
                listA.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listA;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<Account> acc = dao.getAllManagerAcc();
        for (Account account : acc) {
            System.out.println(account);
        }
        
        Account check = dao.getAccountByID(2);
        System.out.println(check);

    }
}

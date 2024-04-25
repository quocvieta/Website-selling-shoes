/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Admins;
import model.Cart;
import model.Categories;
import model.Customers;
import model.Item;
import model.Orders;
import model.ProductImage;
import model.ProductSizes;
import model.Products;
import model.Users;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    public List<Products> getAllProducts() {
        List<Products> products = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6));

                products.add(p);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return products;
    }

    public List<Categories> getAllCategories() {
        List<Categories> categories = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getInt(1),
                        rs.getString(2));

                categories.add(c);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return categories;
    }

    public List<ProductSizes> getAllSizes() {
        List<ProductSizes> prosize = new ArrayList<>();
        String sql = "select * from ProductSizes";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductSizes ps = new ProductSizes(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4));

                prosize.add(ps);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return prosize;
    }

    public List<Products> getProductByCateID(String cateID) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cateID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6));

                list.add(p);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public Products getProductByID(String proID) {
        String sql = "select * from Products\n"
                + "where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products p = new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6));

                return p;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public int getQuantityByDetail(String product_id, String size) {
        String sql = "select *\n"
                + "from ProductSizes\n"
                + "where product_id = ? \n"
                + "and size = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            st.setString(2, size);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ProductSizes ps = new ProductSizes(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4));

                return ps.getQuantity();
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return 0;
    }

    public Users getUserByUsername(String username) {
        String sql = "select * from Users\n"
                + "where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));

                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public List<ProductSizes> getSizeByProductId(String proID) {
        List<ProductSizes> list = new ArrayList<>();
        String sql = "select * from ProductSizes\n"
                + "where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductSizes ps = new ProductSizes(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4));

                list.add(ps);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<ProductImage> getImageByProductId(String proID) {
        List<ProductImage> list = new ArrayList<>();
        String sql = "select * from ProductImageDetail \n"
                + "where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductImage pi = new ProductImage(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3));

                list.add(pi);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Admins> getAllAdmin() {
        List<Admins> admins = new ArrayList<>();
        String sql = "select * from Admins";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admins a = new Admins(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));

                admins.add(a);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return admins;
    }

    public List<Users> getAllUser() {
        List<Users> users = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));

                users.add(u);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return users;
    }

    public int[] getImageIdByProductId(String proID) {
        List<Integer> list = new ArrayList<>();
        String sql = "select image_id from ProductImageDetail \n"
                + "where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int image_id = rs.getInt(1);

                list.add(image_id);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        int[] arrImageId = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            arrImageId[i] = list.get(i);
        }
        return arrImageId;
    }

    public List<Products> searchByName(String txtsearch) {
        List<Products> list = new ArrayList<>();
        String sql = "select *\n"
                + "from Products\n"
                + "where [name] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtsearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6));

                list.add(p);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public Account login(String user, String pass) {
        String sql = "select * from Account\n"
                + "where (username_admin = ? or username_user = ?)\n"
                + "and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, user);
            st.setString(3, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));

                return acc;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "select * from Account\n"
                + "where (username_admin = ? or username_user = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));

                return acc;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void register(String username, String password, String firstname, String lastname,
            boolean gender, String email, String address, String phone_number) {
        String sql = """
                     insert into Users values 
                     (?, ?, ?, ?, ?, ?, ?, ?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, firstname);
            st.setString(4, lastname);
            st.setBoolean(5, gender);
            st.setString(6, email);
            st.setString(7, address);
            st.setString(8, phone_number);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertToAccount(String username, String password) {
        String sql = """
                     INSERT INTO Account (username_user, [password], isUser, isAdmin) values
                     (?, ?, 1, 0)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(String proID) {
        String sql = "delete from Products\n"
                + "where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proID);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAdmin(String adminID) {
        String sql = "delete from Admins\n"
                + "where admin_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, adminID);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(String userID) {
        String sql = "delete from Users\n"
                + "where user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userID);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertNewProduct(String name, String brand, String color, float price, String image_url, int category_id) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([name]\n"
                + "           ,[brand]\n"
                + "           ,[color]\n"
                + "           ,[price]\n"
                + "           ,[image_url]\n"
                + "           ,[category_id])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, brand);
            st.setString(3, color);
            st.setFloat(4, price);
            st.setString(5, image_url);
            st.setInt(6, category_id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertToProductSize(String size, String quantity) {
        String sql = "INSERT INTO ProductSizes (product_id, size, quantity)\n"
                + "SELECT MAX(product_id), ?, ? FROM Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, size);
            st.setString(2, quantity);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertToProductImage(String image_url) {
        String sql = "insert into ProductImageDetail(product_id, image_url)\n"
                + "SELECT MAX(product_id), ? FROM Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, image_url);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertToOrder(int customer_id, float totalMoney) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "insert into [Orders](date, customer_id, totalMoney)"
                + "values(?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, customer_id);
            st.setFloat(3, totalMoney);

            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Orders getOrderNewest() {
        String sql = "select top 1 * from [Orders] order by order_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders order = new Orders(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getFloat(4));

                return order;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public Customers getCustomerNewest() {
        String sql = "select top 1 * from [Customers] order by customer_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customers cus = new Customers(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));

                return cus;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void updateProductSizeAfterOrder(String product_id, String size, String quantity) {
        String sql = "UPDATE [dbo].[ProductSizes]\n"
                + "   SET [quantity] = [quantity] - ?\n"
                + "   WHERE product_id = ?\n"
                + "   AND size = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quantity);
            st.setString(2, product_id);
            st.setString(3, size);

            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void insertOrderDetail(String order_id, String product_id, String size, String quantity, float price) {

        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([order_id]\n"
                + "           ,[product_id]\n"
                + "           ,[size]\n"
                + "           ,[quantity]\n"
                + "           ,[price])\n"
                + "     VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, order_id);
            statement.setString(2, product_id);
            statement.setString(3, size);
            statement.setString(4, quantity);
            statement.setFloat(5, price);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertToCustomer(String firstname, String lastname, String email, String address, String phonenumber) {
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([firstname]\n"
                + "           ,[lastname]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[phone_number])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setString(3, email);
            st.setString(4, address);
            st.setString(5, phonenumber);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(String name, String brand, String color, float price,
            String image_url, int category_id, String product_id) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [name] = ?\n"
                + "       ,[brand] = ?\n"
                + "       ,[color] = ?\n"
                + "       ,[price] = ?\n"
                + "       ,[image_url] = ?\n"
                + "       ,[category_id] = ?\n"
                + "   WHERE product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, brand);
            st.setString(3, color);
            st.setFloat(4, price);
            st.setString(5, image_url);
            st.setInt(6, category_id);
            st.setString(7, product_id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProductSize(String product_id, String size, String quantity) {
        String sql = "UPDATE [dbo].[ProductSizes]\n"
                + "   SET [quantity] = ?\n"
                + "   WHERE product_id = ?\n"
                + "   AND size = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quantity);
            st.setString(2, product_id);
            st.setString(3, size);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProductImage(int image_id, String image_url) {
        String sql = "UPDATE ProductImageDetail"
                + "SET image_url = ?"
                + "WHERE image_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, image_url);
            st.setInt(2, image_id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Products> listP = dao.getAllProducts();
//        int quantity = dao.getQuantityByDetail(3, 42);
//        System.out.println(quantity);
        
//        List<Categories> listC = dao.getAllCategories();
//        List<Products> list = dao.getProductByCateID("3");
//        Products p = dao.getProductByID("2");
//        List<ProductSizes> ps = dao.getSizeByProductId("3");
//        List<ProductSizes> ps1 = dao.getAllSizes();
//        dao.register("viet", "viet", "tran", "viet", true, "viet@g", "hanoi", "0123456789");
//        List<ProductImage> pi = dao.getImageByProductId("3");
//        int[] arr = dao.getImageIdByProductId("3");
//        for (int piid : arr) {
//            System.out.println(piid);
//        }
    }
}

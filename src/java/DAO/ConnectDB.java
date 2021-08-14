/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.DBContext;
import Entity.Category;
import Entity.Order;
import Entity.OrderDetail;
import Entity.OrderInfo;
import Entity.Product;
import Entity.Question;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author drako
 */
public class ConnectDB {

    private Connection con;
    public String status;
    HashMap<String, User> hmUser;
    HashMap<String, Product> hmProduct;
    HashMap<String, Category> hmCategory;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public HashMap<String, Category> getHmCategory() {
        return hmCategory;
    }

    public void setHmCategory(HashMap<String, Category> hmCategory) {
        this.hmCategory = hmCategory;
    }

    public HashMap<String, Product> getHmProduct() {
        return hmProduct;
    }

    public void setHmProduct(HashMap<String, Product> hmProduct) {
        this.hmProduct = hmProduct;
    }
    HashSet<String> backUpId = new HashSet<String>();
    HashSet<String> backUpIdProduct = new HashSet<String>();

    public HashSet<String> getBackUpIdProduct() {
        return backUpIdProduct;
    }

    public void setBackUpIdProduct(HashSet<String> backUpIdProduct) {
        this.backUpIdProduct = backUpIdProduct;
    }

    public HashSet<String> getBackUpId() {
        return backUpId;
    }

    public void setBackUpId(HashSet<String> backUpId) {
        this.backUpId = backUpId;
    }

    public HashMap<String, User> getHmUser() {
        return hmUser;
    }

    public void setHmUser(HashMap<String, User> hmUser) {
        this.hmUser = hmUser;
    }

    public void initConnection() {
        try {
            con = new DBContext().getConnection();
            status = "Thanh Cong";
        } catch (Exception e) {
            status = "That bai " + e.getMessage();
        }
    }

    public ConnectDB() {
        initConnection();
    }

    public void getAllProduct() {
        hmProduct = new HashMap<>();
        String sql = "select p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s where p.ProductId = s.ProductId";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                backUpIdProduct.add(id);
                hmProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
    }

    public void getAllCategory() {
        hmCategory = new HashMap<>();
        String sql = "select * from HE140102_DUYNK_Category";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmCategory.put(id, new Category(id, rs.getString(2)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
    }

    public HashMap<String, Product> getAllProductByCateId(String cateId) {
        HashMap<String, Product> hmProduct = new HashMap<>();
        String sql = "select p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s where p.ProductId = s.ProductId and CategoryId= ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return hmProduct;
    }

    public HashMap<String, Product> getAllProductBySort(String s, String b) {
        HashMap<String, Product> hmProduct = new HashMap<>();
        String sql = "select p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s \n"
                + "where p.ProductId = s.ProductId \n"
                + "order by " + s + " " + b + "";
        System.out.println(sql);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return hmProduct;
    }

    public HashMap<String, Product> getAllProductByArtist(String artist) {
        HashMap<String, Product> hmProduct = new HashMap<>();
        String sql = "select top 6 p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s\n"
                + "where p.ProductId = s.ProductId and p.Artist = ?\n"
                + "order by p.ProductId desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, artist);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
                System.out.println(hmProduct);
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return hmProduct;
    }

    public HashMap<String, Product> getAllProductBySearch(String searchText) {
        HashMap<String, Product> hmProduct = new HashMap<>();
        String sql = "SELECT p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s\n"
                + "WHERE p.ProductId = s.ProductId and ProductName LIKE ? OR Artist LIKE ? OR Year LIKE ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + searchText + "%");
            ps.setString(2, "%" + searchText + "%");
            ps.setString(3, "%" + searchText + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
                System.out.println(hmProduct);
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return hmProduct;
    }

    public Product getProductById(String productId) {
        String sql = "select top 6 p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s\n"
                + "where p.ProductId = s.ProductId and p.ProductId = ? \n"
                + "order by p.ProductId desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1) + "", rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return null;
    }

    public HashMap<String, Product> getLastestProduct() {
        HashMap<String, Product> hmLatestProduct = new HashMap<>();
        String sql = "select top 6 p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s\n"
                + "where p.ProductId = s.ProductId\n"
                + "order by p.ProductId desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmLatestProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return hmLatestProduct;
    }

    public HashMap<String, Product> getLastestProductByCateId(String cateId) {
        HashMap<String, Product> hmLatestProduct = new HashMap<>();
        String sql = "select top 6 p.ProductId,p.CategoryId,p.ProductName,p.Price,p.ImgUrl,p.Discount,p.ProductDetail,p.Artist,p.Year,s.Quantity from HE140102_DUYNK_Product as p, HE140102_DUYNK_Stock as s\n"
                + "where p.ProductId = s.ProductId and p.CategoryId = " + cateId + "\n"
                + "order by p.ProductId desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getInt(1) + "";
                hmLatestProduct.put(id, new Product(id, rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(2),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return hmLatestProduct;
    }

    public User getUser(String user, String pass) {
        String sql = "select * from HE140102_DUYNK_Users where UserId = ? and Pass = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
        return null;
    }

    public void getAllUser() {
        hmUser = new HashMap<>();
        String sql = "select * from HE140102_DUYNK_Users";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                backUpId.add(userId);
                hmUser.put(userId, new User(userId,
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11)));
            }
        } catch (Exception e) {
            status = "getDB that bai " + e.getMessage();
        }
    }

    public void putDBProduct() {
        for (Map.Entry<String, Product> entry : hmProduct.entrySet()) {
            String key = entry.getKey();
            Product value = entry.getValue();
            if (backUpIdProduct.contains(key)) {
                //co the can update
                if (value.isUpdateProduct()) {
                    //update
                    String sql = "Update HE140102_DUYNK_Product set CategoryId ='"
                            + value.getCateId() + "', ProductName = '"
                            + value.getName() + "', Price = "
                            + value.getPrice() + ", ImgUrl = '"
                            + value.getImgUrl() + "', Discount = '"
                            + value.getDiscount() + "', ProductDetail = '"
                            + value.getDetail() + "', Artist = '"
                            + value.getArtist() + ", Year = "
                            + value.getYear() + " where ProductId = '"
                            + value.getId() + "'";
                    System.out.println(sql);
                    myQueue(sql);
                    value.setUpdateProduct(false);
                    backUpIdProduct.remove(key);
                }
            } else {
                //insert
                String sql = "INSERT INTO HE140102_DUYNK_Product values ('"
                        + value.getCateId() + "','"
                        + value.getName() + "','"
                        + value.getPrice() + "','"
                        + value.getImgUrl() + "','"
                        + value.getDiscount() + "','"
                        + value.getDetail() + "','"
                        + value.getArtist() + "','"
                        + value.getYear() + "')";
                myQueue(sql);
                int productId = getIdProduct(value);
                String s = "INSERT INTO HE140102_DUYNK_Stock VALUES(" + productId + "," + value.getQuantity() + ")";
                myQueue(s);
            }
        }
        for (Iterator<String> iterator = backUpIdProduct.iterator(); iterator.hasNext();) {
            String next = iterator.next();
            if (hmProduct.containsKey(next)) {
            } else {
                //delete toan bo hmStudent voi key next
                String sql = "delete from HE140102_DUYNK_Product where ProductId='" + next + "'";
                System.out.println(sql);
                myQueue(sql);
            }

        }
        backUpIdProduct = new HashSet<>(); //remove toan bo
        for (Map.Entry<String, Product> entry : hmProduct.entrySet()) {
            String key = entry.getKey();
            Product value = entry.getValue();
            //dong bo
            backUpIdProduct.add(key);
        }
    }

    public void putDBUser() {
        for (Map.Entry<String, User> entry : hmUser.entrySet()) {
            String key = entry.getKey();
            User value = entry.getValue();
            if (backUpId.contains(key)) {
                //co the can update
                if (value.isUpdate()) {
                    //update
                    String sql = "Update HE140102_DUYNK_Users set UserId ='"
                            + value.getUserId() + "', Pass = '"
                            + value.getPass() + "', Name = '"
                            + value.getName() + "',Gender = "
                            + (value.isGender() ? 1 : 0) + ", Dob = '"
                            + value.getDob() + "', Address = '"
                            + value.getAddress() + "', Email = '"
                            + value.getEmail() + "', PhoneNumber = '"
                            + value.getPhoneNumber() + "', UserRole = "
                            + value.getUserRole() + " where UserId = '"
                            + value.getUserId() + "'";
                    System.out.println(sql);
                    myQueue(sql);
                    value.setUpdate(false);
                    backUpId.remove(key);
                }
            } else {
                //insert
                String sql = "INSERT INTO HE140102_DUYNK_Users values ('"
                        + value.getUserId() + "','"
                        + value.getPass() + "','"
                        + value.getName() + "','"
                        + (value.isGender() ? 1 : 0) + "','"
                        + value.getDob() + "','"
                        + value.getAddress() + "','"
                        + value.getEmail() + "','"
                        + value.getPhoneNumber() + "','"
                        + value.getUserRole() + "','"
                        + value.getQuestionId() + "','"
                        + value.getAnswer()
                        + "')";
                myQueue(sql);
            }
        }
        for (Iterator<String> iterator = backUpId.iterator(); iterator.hasNext();) {
            String next = iterator.next();
            if (hmUser.containsKey(next)) {
            } else {
                //delete toan bo hmStudent voi key next
                String sql = "delete from HE140102_DUYNK_Users where UserId='" + next + "'";
                System.out.println(sql);
                myQueue(sql);
            }

        }
        backUpId = new HashSet<>(); //remove toan bo
        for (Map.Entry<String, User> entry : hmUser.entrySet()) {
            String key = entry.getKey();
            User value = entry.getValue();
            //dong bo
            backUpId.add(key);
        }
    }

    public void myQueue(String sql) {
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.getGeneratedKeys();
            ps.execute();
        } catch (Exception e) {
        }
    }

    public void createOrder(Order order) {
        insertOrderTable(order);
        insertOrderDetailTable(order, getIdOrder(order));
    }

    public void insertOrderTable(Order order) {
        String sql = "insert into HE140102_DUYNK_Order values (?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, order.getBuyDate());
            System.out.println(order.getBuyDate());
            ps.setString(2, order.getCustomer().getUserId());
            System.out.println(order.getCustomer().getUserId());
            ps.setFloat(3, order.getTotalPrice());
            System.out.println(order.getTotalPrice());
            ps.execute();
            System.out.println(sql);
        } catch (SQLException e) {
            status = "loi o insertOrderTable" + e.getMessage();
        }
    }

    public void insertOrderDetailTable(Order order, int orderId) {
        for (Map.Entry<Integer, OrderDetail> entry : order.getItems().entrySet()) {
            Integer key = entry.getKey();
            OrderDetail value = entry.getValue();
            String sql = "insert into HE140102_DUYNK_OrderDetail values (?,?,?,?)";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.setInt(2, Integer.parseInt(value.getProduct().getId()));
                ps.setInt(3, value.getQuantity());
                ps.setFloat(4, value.getPrice() * value.getQuantity());
                ps.execute();
            } catch (NumberFormatException | SQLException e) {
                status = "loi o insertOrderDetailTable" + e.getMessage();
            }
        }

    }

    public int getIdProduct(Product product) {
        int id = 0;
        String sql = "select ProductId from HE140102_DUYNK_Product ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public int getIdOrder(Order order) {
        int id = 0;
        String sql = "select OrderId from HE140102_DUYNK_Order ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public void updateProductQuantity(Product product) {
        String sql = "Update HE140102_DUYNK_Stock set Quantity="
                + product.getQuantity() + " where StockId = '"
                + getStockId(Integer.parseInt(product.getId())) + "'";
        myQueue(sql);
    }

    public HashMap<String, OrderInfo> getAllOrder(String userId) {
        HashMap<String, OrderInfo> hm = new HashMap<>();
        String sql = "select od.OrderDetailId, OrderDate,ProductName,ImgUrl,Artist, od.Quantity, od.Price \n"
                + "from HE140102_DUYNK_Order as o, HE140102_DUYNK_OrderDetail as od, HE140102_DUYNK_Product as p \n"
                + "where o.OrderId = od.OrderId and od.ProductId = p.ProductId and UserId = '" + userId + "'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String idOrderDetail = rs.getString(1);
                hm.put(idOrderDetail, new OrderInfo(rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getFloat(7)));
            }
            System.out.println(hm);
        } catch (SQLException e) {
            status = "loi o get all order" + e.getMessage();
        }
        return hm;
    }

    public void updateStockTable(int productId, int quantity) {
        String sql = "Update HE140102_DUYNK_Stock set ProductId = " + productId + ", Quantity = " + quantity + ""
                + "Where StockId = " + getStockId(productId);
        myQueue(sql);
    }

    public int getStockId(int productId) {
        String sql = "select * from HE140102_DUYNK_Stock Where ProductId = " + productId + " ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            status = "co loi o getStockId " + e.getMessage();
        }
        return -1;
    }

    public HashMap<Integer, Question> getAllQues() {
        HashMap<Integer, Question> hmQues = new HashMap<>();
        String sql = "select * from HE140102_DUYNK_SecurityQues";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                hmQues.put(id, new Question(id, rs.getString(2)));
            }
            return hmQues;
        } catch (Exception e) {
            status = "loi o getAllQues " + e.getMessage();
        }
        return null;
    }

    public static void main(String[] args) {
        ConnectDB c = new ConnectDB();
        c.getAllProduct();
        for (Map.Entry<String, Product> entry : c.hmProduct.entrySet()) {
            Object key = entry.getKey();
            Object value = entry.getValue();
            System.out.println(value.toString());
        }
    }

}

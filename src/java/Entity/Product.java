/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;


/**
 *
 * @author drako
 */
public class Product {
    private String id;
    private String name;
    private float price;
    private String imgUrl;
    private String discount;
    private String detail;
    private String artist;
    private String year;
    private String cateId;
    private int quantity;
    private boolean updateProduct = false;

    public boolean isUpdateProduct() {
        return updateProduct;
    }

    public void setUpdateProduct(boolean updateProduct) {
        this.updateProduct = updateProduct;
    }

    public Product(String id, String name, float price, String imgUrl, String discount, String detail, String artist, String year, String cateId, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgUrl = imgUrl;
        this.discount = discount;
        this.detail = detail;
        this.artist = artist;
        this.year = year;
        this.cateId = cateId;
        this.quantity = quantity;
    }
    
    
    
    public Product() {
    }

    public String getCateId() {
        return cateId;
    }

    public void setCateId(String cateId) {
        this.cateId = cateId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", imgUrl=" + imgUrl + ", discount=" + discount + ", detail=" + detail + ", artist=" + artist + ", year=" + year + ", cateId=" + cateId + ", quantity=" + quantity + ", updateProduct=" + updateProduct + '}';
    }

    
    
    
    public String outProductTable(String s) {
        return "<td>" + id + "</td>"
                + "<td>" + name + "</td>"
                + "<td>" + price + "</td>"
                + "<td><img src='images/" + imgUrl + "'></td>"
                + "<td>" + discount + "</td>"
                + "<td>" + detail + "</td>"
                + "<td>" + artist + "</td>"
                + "<td>" + year + "</td>"
                + "<td>" + quantity + "</td>"
                + "<td>" + s + "</td>";
    }

    
    
    
    
}

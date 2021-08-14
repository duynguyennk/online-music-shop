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
public class Category {
    private String cateId;
    private String cateName;

    public Category() {
    }

    public Category(String cateId, String cateName) {
        this.cateId = cateId;
        this.cateName = cateName;
    }

    public String getCateId() {
        return cateId;
    }

    public void setCateId(String cateId) {
        this.cateId = cateId;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    @Override
    public String toString() {
        return "Category{" + "cateId=" + cateId + ", cateName=" + cateName + '}';
    }
    
    
}

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
public class User {
    private String userId;
    private String pass;
    private String name;
    private boolean gender;
    private String dob;
    private String address;
    private String email;
    private String phoneNumber;
    private int userRole;
    private boolean update = false;
    private int questionId;
    private String answer;

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    

    public boolean isUpdate() {
        return update;
    }

    public void setUpdate(boolean update) {
        this.update = update;
    }
    public User() {
    }

    public User(String userId, String pass, String name, boolean gender, String dob, String address, String email, String phoneNumber, int userRole, int questionId, String answer) {
        this.userId = userId;
        this.pass = pass;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.userRole = userRole;
        this.questionId = questionId;
        this.answer = answer;
    }

    
    
    

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getUserRole() {
        return userRole;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", pass=" + pass + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", address=" + address + ", email=" + email + ", phoneNumber=" + phoneNumber + ", userRole=" + userRole + '}';
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }
    
}

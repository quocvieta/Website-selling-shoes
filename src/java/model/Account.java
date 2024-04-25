/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Account {
    private int account_id;
    private String username_user, username_admin, password;
    private int isUser, isAdmin;

    public Account() {
    }

    public Account(int account_id, String username_user, String username_admin, String password, int isUser, int isAdmin) {
        this.account_id = account_id;
        this.username_user = username_user;
        this.username_admin = username_admin;
        this.password = password;
        this.isUser = isUser;
        this.isAdmin = isAdmin;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUsername_user() {
        return username_user;
    }

    public void setUsername_user(String username_user) {
        this.username_user = username_user;
    }

    public String getUsername_admin() {
        return username_admin;
    }

    public void setUsername_admin(String username_admin) {
        this.username_admin = username_admin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsUser() {
        return isUser;
    }

    public void setIsUser(int isUser) {
        this.isUser = isUser;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "account_id=" + account_id + ", username_user=" + username_user + ", username_admin=" + username_admin + ", password=" + password + ", isUser=" + isUser + ", isAdmin=" + isAdmin + '}';
    }
}

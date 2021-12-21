package com.lren.pojo;

/**
 * @ClassName: Users
 * @Description: //TODO
 * @Author: Riove
 * @Date: 2021/12/19 16:26
 * @Version: 1.0
 */
public class Users {

    //用户编号（id）
    private  Integer id;
    //用户名称（username）
    private  String username;
    //密码（password）
    private String password;
    //电话号码（telephone）
    private String telephone;
    //电子邮箱（email）
    private String email;

    public Users() {
    }

    public Users(Integer id, String username, String password, String telephone, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}

package com.systechblog.model;

import javax.persistence.*;

@Entity
@Table(name = "tbl_user")
@NamedQueries({
        @NamedQuery(name = "NQ_SELECT_USER", query = "select u from User u"),
        @NamedQuery(name = "NQ_SELECT_USERNAME", query = "select u from User u where u.userName=:userName"),
        @NamedQuery(name = "NQ_SELECT_BY_ID", query = "select u from User u where u.id=:userId"),


})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String userName;
    private String password;

    public User() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

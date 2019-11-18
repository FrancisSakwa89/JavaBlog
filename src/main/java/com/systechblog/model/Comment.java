package com.systechblog.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tbl_comments")
@NamedQueries({
        @NamedQuery(name = "NQ_ALL_COMMENTS", query = "select c from Comment c"),
        @NamedQuery(name = "NQ_SELECT_ONE_COMMENT", query = "select c from Comment c where comment=:comment"),
        @NamedQuery(name = "NQ_SELECT_COMMENT_FOR_POST", query = "select c from Comment c where post=:post"),


})
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private User user;
    private String comment;
    @ManyToOne
    private Post post;
    private Date date;

    public Comment() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "user=" + user +
                ", comment='" + comment + '\'' +
                ", post='" + post + '\'' +
                ", date=" + date +
                '}';
    }
}

package com.systechblog.model;

import org.eclipse.persistence.annotations.CascadeOnDelete;

import javax.json.bind.annotation.JsonbDateFormat;
import javax.persistence.*;
import java.sql.Time;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tbl_post")
@NamedQueries({
        @NamedQuery(name = "NQ_ADD_POST", query = "select p from Post p"),
        @NamedQuery(name = "NQ_SELECT_POST_BY_USER_ID", query = "select p from Post p where p.user=:user"),
        @NamedQuery(name = "NQ_SELECT_POST_BY_TITLE", query = "select p from Post p where p.title=:title"),


})
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title
            ;
    private String PostDetails;
    private String category;
    @ManyToOne
    private User user;
    @CascadeOnDelete
    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Comment> comments;
    @Temporal(TemporalType.DATE)
    @JsonbDateFormat
    private Date date;
//    @Transient
    private Time time;

    public Post() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPostDetails() {
        return PostDetails;
    }

    public void setPostDetails(String postDetails) {
        PostDetails = postDetails;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", PostDetails='" + PostDetails + '\'' +
                ", category='" + category + '\'' +
                ", user=" + user +
                ", comments=" + comments +
                ", date=" + date +
                '}';
    }
}

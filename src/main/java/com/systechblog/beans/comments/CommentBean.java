package com.systechblog.beans.comments;

import com.systechblog.beans.Bean;
import com.systechblog.model.Comment;
import com.systechblog.model.Post;
import com.systechblog.model.User;

import javax.ejb.Local;
import javax.ejb.Stateless;
import java.util.Date;
import java.util.List;

@Local
@Stateless
public class CommentBean extends Bean<Comment> implements CommentBeanI {
//    @Inject
//    private transient Logger logger;
    @Override
    public Comment getCommentDetails(String comment) {
        List<Comment> commentList = this
                .entityManager
                .createNamedQuery("NQ_SELECT_ONE_COMMENT")
                .setParameter("comment", comment)
                .getResultList();
        System.out.println("Successfully queried the comments..");
        return commentList.size() > 0 ? commentList.get(0) : null;
    }

    @Override
    public List<Comment> getAllComments() {
        List<Comment> commentList = this
                .entityManager
                .createNamedQuery("NQ_ALL_COMMENTS")
                .getResultList();
        System.out.println("Successfully queried the comments..");
        return commentList;
    }

    @Override
    public List<Comment> readAll(Post post) {
        List<Comment> commentList = this
                .entityManager
                .createNamedQuery("NQ_SELECT_COMMENT_FOR_POST")
                .setParameter("post", post)
                .getResultList();
        return commentList;

    }

    @Override
    public Comment selectCommentBasedOnPost(Post post, User user) {
        List<Comment> commentList = this
                .entityManager
                .createNamedQuery("NQ_ALL_COMMENTS")
                .getResultList();
        System.out.println("Successfully queried the comments..");
        return commentList.size() > 0 ? commentList.get(0) : null;
    }
}

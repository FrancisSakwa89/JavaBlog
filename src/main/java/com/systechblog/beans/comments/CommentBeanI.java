package com.systechblog.beans.comments;

import com.systechblog.beans.BeanI;
import com.systechblog.model.Comment;
import com.systechblog.model.Post;
import com.systechblog.model.User;


import javax.ejb.Local;
import java.util.List;

@Local
public interface CommentBeanI extends BeanI<Comment> {
    Comment getCommentDetails(String comment);
    List<Comment> getAllComments();
    List<Comment> readAll(Post  post);
    Comment selectCommentBasedOnPost(Post post, User user);
}

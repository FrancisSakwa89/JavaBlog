package com.systechblog.beans.blog;

import com.systechblog.beans.BeanI;
import com.systechblog.model.Post;
import com.systechblog.model.User;

import javax.ejb.Local;
import java.util.List;

@Local
public interface BlogBeanI extends BeanI<Post> {
    List<Post> selectPostByCategory(long categoryId);
    Post selectPostByUser(User user);
    List<Post> readAll();
    Post deletePost(User user, Post post);
    Post deletePostForUser(Post post, User user);
}

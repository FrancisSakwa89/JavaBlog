package com.systechblog.beans.blog;

import com.google.gson.Gson;
import com.systechblog.beans.Bean;
import com.systechblog.beans.user.UserBeanI;
import com.systechblog.model.Post;
import com.systechblog.model.User;
import org.jboss.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.util.List;


@Local
@Stateless
@SuppressWarnings("all")
public class BlogBean extends Bean<Post> implements BlogBeanI {
    @EJB
    UserBeanI userBeanI;

    @Inject
    private transient Logger logger;

    @PostConstruct
    public void init() {
        this.entityClass = Post.class;
    }

    @Override
    public List<Post> selectPostByCategory(long categoryId) {
        List<Post> posts = this
                .entityManager
                .createNamedQuery("NQ_ADD_POST")
                .getResultList();
        logger.info("Got the posts.." + new Gson().toJson(posts));
        return posts;
    }

    @Override
    public Post selectPostByUser(User user) {
        List<Post> postList = this
                .entityManager
                .createNamedQuery("NQ_SELECT_POST_BY_USER_ID")
                .setParameter("user", user)
                .getResultList();
        logger.info("Successfully queried the user's posts..");
        return postList.size() > 0 ? postList.get(0) : null;
    }

    @Override
    public List<Post> readAll() {
        List<Post> postList = this
                .entityManager
                .createNamedQuery("NQ_ADD_POST")
                .getResultList();
        logger.info("Successfully queried the all the posts..");
//        for(Post post: postList){
//            long userId = post.getUserId();
//
//            User user = userBeanI.getUserById(userId);
//            System.out.println(user);
//        }
        return postList;
    }

    @Override
    public Post deletePost(User user, Post post) {
        List<Post> postList = this
                .entityManager
                .createNamedQuery("NQ_SELECT_POST_BY_USER_ID")
                .setParameter("user", user)
                .getResultList();
        logger.info("Successfully queried the user's posts..");
        try {
            if (entityManager.contains(post)) {
                entityManager.remove(post);
                delete(post);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return postList.size() > 0 ? postList.get(0) : null;
    }

    @Override
    public Post deletePostForUser(Post post, User user) {
        this
                .entityManager
                .createNamedQuery("NQ_SELECT_POST_BY_USER_ID")
                .setParameter("user", user)
                .getResultList();
//        logger.info("Successfully queried the user's posts..");
        try {
//            if (entityManager.contains(post)) {
//                entityManager.remove(post);
//                entityManager.refresh(post);
//                entityManager.merge(post);
                delete(post);
        }
        catch (Exception e){
            e.printStackTrace();
        }
//        return postList.size() > 0 ? postList.get(0) : null;
        return post;
    }
}




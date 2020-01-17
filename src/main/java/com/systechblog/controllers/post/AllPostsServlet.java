package com.systechblog.controllers.post;

import com.systechblog.beans.blog.BlogBeanI;
import com.systechblog.beans.comments.CommentBeanI;
import com.systechblog.beans.user.UserBeanI;
import com.systechblog.model.Comment;
import com.systechblog.model.Post;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "allPosts", urlPatterns = "/allPosts")
public class AllPostsServlet extends HttpServlet {
    @EJB
    BlogBeanI blogBeanI;

    @EJB
    UserBeanI userBeanI;

    @EJB
    CommentBeanI commentBeanI;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Post> posts = blogBeanI.readAll();
            for (Post post:posts){
                List<Comment> comments = commentBeanI.readAll(post);
                int count = comments.size();
//                System.out.println(count);
                req.setAttribute("count", count);
            }
            req.setAttribute("posts", posts);
            req.getRequestDispatcher("/views/posts/allPosts.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println("got an error ..");
            e.printStackTrace();
        }
    }
}

package com.systechblog.controllers.post;

import com.systechblog.beans.blog.BlogBeanI;
import com.systechblog.beans.comments.CommentBeanI;
import com.systechblog.model.Comment;
import com.systechblog.model.Post;
import com.systechblog.model.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;


@WebServlet(name = "details", urlPatterns = "/details")
public class OnePostServlet extends HttpServlet {
    @EJB
    CommentBeanI commentBeanI;

    @EJB
    BlogBeanI blogBeanI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String com = req.getParameter("com");
        long postId = Long.parseLong(req.getParameter("post_id"));
        Date date = new Date();
        try {
            Post post = blogBeanI.read(postId);
            System.out.println(post);
            User user = post.getUser();
            Comment comment = new Comment();
            comment.setComment(com);
            comment.setPost(post);
            comment.setDate(date);
            comment.setUser(user);
            System.out.println(comment);
            commentBeanI.add(comment);
            resp.sendRedirect("allPosts");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        try {
            Post post = blogBeanI.read(id);
            req.setAttribute("post", post);
            List<Comment> comments = commentBeanI.readAll(post);
            req.setAttribute("comments", comments);
            System.out.println(comments);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/views/posts/singlePost.jsp").forward(req, resp);
    }
}

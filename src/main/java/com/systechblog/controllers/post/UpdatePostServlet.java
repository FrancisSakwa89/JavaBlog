package com.systechblog.controllers.post;

import com.systechblog.beans.blog.BlogBeanI;
import com.systechblog.model.Post;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "update", urlPatterns = "/update")
public class UpdatePostServlet extends HttpServlet {
    @EJB
    BlogBeanI blogBeanI;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postTitle = req.getParameter("title");
        String postContent = req.getParameter("content");
        String postCategory = req.getParameter("category");
        HttpSession session = req.getSession();
        long id = Long.parseLong(req.getParameter("post_id"));

        
        try{
            Post post = blogBeanI.read(id);
            post.setTitle(postTitle);
            post.setPostDetails(postContent);
            post.setCategory(postCategory);
            req.setAttribute("post", post);
            blogBeanI.update(post);
            resp.sendRedirect("allPosts");
        }
        catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect("errorUpdate");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/posts/updatePost.jsp").forward(req,resp);
        
    }
}

package com.systechblog.controllers.post;

import com.systechblog.beans.blog.BlogBeanI;
import com.systechblog.beans.category.CategoryBeanI;
import com.systechblog.beans.user.UserBeanI;
import com.systechblog.model.Category;
import com.systechblog.model.Post;
import com.systechblog.model.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Time;
import java.util.Date;

@WebServlet(name = "addPost", urlPatterns = "/addPost")
public class AddPostServlet extends HttpServlet {
    @EJB
    BlogBeanI blogBeanI;

    @EJB
    UserBeanI userBeanI;

    @EJB
    CategoryBeanI categoryBeanI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postTitle = req.getParameter("postTitle");
        String content = req.getParameter("content");
        String cat = req.getParameter("category");
        Date date = new Date();
        HttpSession session = req.getSession();

        String username = String.valueOf(session.getAttribute("userName"));
        try {
            User user = userBeanI.selectUserByName(username);
            long userId = user.getId();
            if (user != null) {
                req.setAttribute("title", postTitle);
                Time time = new Time(date.getTime());
                Post post = new Post();
                post.setTitle(postTitle);
                post.setPostDetails(content);
                post.setCategory(cat);
                post.setDate(date);
                post.setUser(user);
                post.setTime(time);


                try{
                    blogBeanI.add(post);
                    session.setAttribute("title", postTitle);
                    session.setAttribute("userId", userId);
                    resp.sendRedirect("allPosts");
                }catch (Exception e){
                    System.out.println("error..");
                    e.printStackTrace();
                }

            } else {
                System.out.println("user is null");
                resp.sendRedirect("login");
            }
        } catch (Exception e) {
            System.out.println("got sql error..");
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("/views/posts/addPost.jsp").forward(req, resp);
        req.getRequestDispatcher("/views/posts/allPosts.jsp").forward(req, resp);

    }
}

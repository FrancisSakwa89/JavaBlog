package com.systechblog.controllers.post;

import com.systechblog.beans.blog.BlogBeanI;
import com.systechblog.beans.user.UserBeanI;
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
import java.util.List;


@WebServlet(name = "delete", urlPatterns = "/delete")
public class DeletePostServlet extends HttpServlet {
    @EJB
    BlogBeanI blogBeanI;

    @EJB
    UserBeanI userBeanI;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/posts/allPosts.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long postId = Long.parseLong(req.getParameter("post_id"));
        System.out.println("This is the post id: "+ postId);
        HttpSession session = req.getSession();
        String uname = String.valueOf(session.getAttribute("userName"));
//        System.out.println(uname);
        try{
            User user = userBeanI.selectUserByName(uname);
            String username = user.getUserName();
            Post post = blogBeanI.read(postId);
            System.out.println("The post is: "+ post);
            String postUserName = post.getUser().getUserName();

            if (username.equals(uname) && uname.equals(postUserName)) {

//                blogBeanI.deletePost(user, post);
                blogBeanI.deletePostForUser(post, user);
//                blogBeanI.delete(post);
//                blogBeanI.update(post);
//                blogBeanI.update(post);
                req.setAttribute("dltMsg", "Deleted Message Successfully.");
                System.out.println("Deleted Post Successfully..");
                resp.sendRedirect("index.jsp");
                blogBeanI.update(post);

            }
            else {
                req.setAttribute("notDltMsg", "You are not authenticated user to delete this post !!");
                System.out.println("You are not authenticated user to delete this post !!");
                resp.sendRedirect("addPost");
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}

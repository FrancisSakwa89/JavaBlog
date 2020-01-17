package com.systechblog.controllers.user;

import com.systechblog.beans.user.UserBeanI;
import com.systechblog.model.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addUser", urlPatterns = "/addUser")
public class RegisterUserServlet extends HttpServlet {
    @EJB
    UserBeanI userBeanI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("pass");
        String pass2 = req.getParameter("pass2");
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        if (password.equals(pass2)) {
            try {
                userBeanI.signup(userName,password);
                userBeanI.add(user);
                System.out.println(" added user good.");
                resp.sendRedirect("login");
            } catch (Exception e) {
                System.out.println("Error adding User..");
                e.printStackTrace();
            }
            req.getRequestDispatcher("login").forward(req,resp);

        }else {
            System.out.println("wrong pass");
            resp.sendRedirect("addUser");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/user/addUser.jsp").forward(req,resp);
    }
}

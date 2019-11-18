package com.systechblog.controllers.user;

import com.systechblog.beans.user.UserBeanI;
import com.systechblog.model.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "login", urlPatterns = "/login")
public class UserLoginServlet extends HttpServlet {
    @EJB
    UserBeanI userBeanI;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("userName");
        String password = req.getParameter("pass");
        HttpSession session = req.getSession();
        try {
            User user = userBeanI.selectUserByName(uname);
            if (user != null && user.getUserName().equals(uname) && user.getPassword().equals(password)){
                session.setAttribute("userName", uname);
                req.setAttribute("userName", uname);
                System.out.println(user);
                resp.sendRedirect("index.jsp");
            }
            else {
                resp.sendRedirect("login");
                req.setAttribute("errorMsg", "Invalid credentials");
            }
        }catch (Exception e){
            System.out.println("Error occurred..");
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/user/Login.jsp").forward(req,resp);

    }
}

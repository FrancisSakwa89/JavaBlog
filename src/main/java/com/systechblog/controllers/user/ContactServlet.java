package com.systechblog.controllers.user;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.systechInterns.library.EmailFormat;

@WebServlet(name = "contact", urlPatterns = "/contact")
public class ContactServlet extends HttpServlet {
    @EJB
    EmailFormat emailFormat;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String name = req.getParameter("name");
        String subject = req.getParameter("subject");
        String msg = req.getParameter("msg");

        String content = msg + " "+ "from"+ " "+ name;
        try{
            emailFormat.sendEmail(subject,content,email);
            resp.sendRedirect("index.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        resp.sendRedirect("index.jsp");

    }
}

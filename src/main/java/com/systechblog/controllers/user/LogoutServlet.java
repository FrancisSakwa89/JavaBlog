package com.systechblog.controllers.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "logout", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        HttpSession session = request.getSession(false); //Fetch session object

        if(session!=null) //If session is not null
        {
            session.invalidate(); //removes all session attributes bound to the session
            request.setAttribute("errMessage", "You have logged out successfully..Kindly login again");
//            response.setContentType("text/html");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/user/Login.jsp");
            requestDispatcher.forward(request, response);
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store, must-revalidate" );
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);


            request.getSession().invalidate();

            System.out.println("Logged out");
            System.out.println(request.getSession(false));
//            response.sendRedirect("login");
        }
    }
}

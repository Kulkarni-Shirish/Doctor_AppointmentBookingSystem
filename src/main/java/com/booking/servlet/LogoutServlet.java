package com.booking.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Don't create new session
        if (session != null) {
            session.invalidate(); // End the session
        }

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
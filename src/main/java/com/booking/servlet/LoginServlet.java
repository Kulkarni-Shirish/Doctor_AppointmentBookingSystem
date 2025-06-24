package com.booking.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("LoginServlet Triggered");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/appointment_db", "root", "tiger");

            // Step 1: Check if user exists by email
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                // ❌ User doesn't exist
                request.setAttribute("error", "❌ You don’t have an account. Please register and try again.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                return;
            }

            // Step 2: User exists – check password
            String storedPassword = rs.getString("password");

            if (!storedPassword.equals(password)) {
                request.setAttribute("error", "❌ Incorrect password. Please try again.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                return;
            }

            // Step 3: Successful login
            String role = rs.getString("role");
            String name = rs.getString("name");

            // Optional role check (if you plan to pass role from form in future)
            if ("doctor".equalsIgnoreCase(request.getParameter("role")) && !"doctor".equalsIgnoreCase(role)) {
                request.setAttribute("error", "You are not authorized to log in as Doctor.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("userName", name);
            session.setAttribute("userRole", role);

            // Step 4: Fetch appointments
            List<String> appointments = new ArrayList<>();
            String sql;
            if ("doctor".equalsIgnoreCase(role)) {
                sql = "SELECT user_email, appointment_date, appointment_time, status FROM appointments WHERE doctor_email = ?";
            } else {
                sql = "SELECT doctor_email, appointment_date, appointment_time, status FROM appointments WHERE user_email = ?";
            }

            PreparedStatement apptStmt = conn.prepareStatement(sql);
            apptStmt.setString(1, email);
            ResultSet apptRs = apptStmt.executeQuery();

            while (apptRs.next()) {
                String appt = (role.equals("doctor") ?
                    "Patient: " + apptRs.getString("user_email") :
                    "Doctor: " + apptRs.getString("doctor_email"))
                    + " | Date: " + apptRs.getString("appointment_date")
                    + " | Time: " + apptRs.getString("appointment_time")
                    + " | Status: " + apptRs.getString("status");
                appointments.add(appt);
            }

            request.setAttribute("appointments", appointments);
            conn.close();

            // Step 5: Forward to correct dashboard
            if ("doctor".equalsIgnoreCase(role)) {
                RequestDispatcher rd = request.getRequestDispatcher("doctorDashboard.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("patientDashboard.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Internal error occurred. Try again.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
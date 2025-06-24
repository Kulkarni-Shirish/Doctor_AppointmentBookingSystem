package com.booking.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String doctorEmail = (String) session.getAttribute("userEmail");
        List<String> appointments = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/appointment_db", "root", "tiger");

            // Fetch appointments for this doctor
            PreparedStatement ps = conn.prepareStatement(
                "SELECT user_email, appointment_date, appointment_time, status FROM appointments WHERE doctor_email = ?");
            ps.setString(1, doctorEmail);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String patientEmail = rs.getString("user_email");
                Date date = rs.getDate("appointment_date");
                Time time = rs.getTime("appointment_time");
                String status = rs.getString("status");

                appointments.add("Patient: " + patientEmail +
                                 ", Date: " + date +
                                 ", Time: " + time +
                                 ", Status: " + status);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("appointments", appointments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("doctorDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
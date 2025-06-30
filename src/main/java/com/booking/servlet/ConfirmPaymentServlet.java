package com.booking.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/confirmPayment")
public class ConfirmPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        
        String userEmail = (String) session.getAttribute("pendingUserEmail");
        String doctorEmail = (String) session.getAttribute("pendingDoctorEmail");
        String appointmentDate = (String) session.getAttribute("pendingDate");
        String appointmentTime = (String) session.getAttribute("pendingTime");

        if (userEmail == null || doctorEmail == null || appointmentDate == null || appointmentTime == null) {
            request.setAttribute("error", "Session expired. Please book appointment again.");
            RequestDispatcher rd = request.getRequestDispatcher("bookAppointment.jsp");
            rd.forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/appointment_db", "root", "tiger");

            
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE appointments SET status = 'confirmed' WHERE doctor_email = ? AND user_email = ? AND appointment_date = ? AND appointment_time = ?"
            );
            stmt.setString(1, doctorEmail);
            stmt.setString(2, userEmail);
            stmt.setString(3, appointmentDate);
            stmt.setString(4, appointmentTime);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                request.setAttribute("success", "✅ Appointment booked successfully!");
                // Clear session so payment isn't repeated
                session.removeAttribute("pendingUserEmail");
                session.removeAttribute("pendingDoctorEmail");
                session.removeAttribute("pendingDate");
                session.removeAttribute("pendingTime");
            } else {
                request.setAttribute("error", "⚠ Appointment not found or already confirmed.");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Something went wrong while confirming payment.");
        }

        
        RequestDispatcher rd = request.getRequestDispatcher("patientDashboard.jsp");
        rd.forward(request, response);
    }
}

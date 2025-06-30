package com.booking.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/bookAppointment")
public class AppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String doctorEmail = request.getParameter("doctorEmail");
        String date = request.getParameter("appointmentDate");
        String time = request.getParameter("appointmentTime");

        
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            request.setAttribute("error", "⚠ You must be logged in to book an appointment.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/appointment_db", "root", "tiger");

            
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT * FROM appointments WHERE doctor_email = ? AND appointment_date = ? AND appointment_time = ?");
            checkStmt.setString(1, doctorEmail);
            checkStmt.setString(2, date);
            checkStmt.setString(3, time);

            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // ❌ Slot is already taken
                request.setAttribute("error", "❌ This appointment slot is already booked. Please choose another.");
                RequestDispatcher rd = request.getRequestDispatcher("bookAppointment.jsp");
                rd.forward(request, response);
            } else {
                
                PreparedStatement insertStmt = conn.prepareStatement(
                    "INSERT INTO appointments (doctor_email, user_email, appointment_date, appointment_time, status) VALUES (?, ?, ?, ?, 'pending')");
                insertStmt.setString(1, doctorEmail);
                insertStmt.setString(2, userEmail);
                insertStmt.setString(3, date);
                insertStmt.setString(4, time);
                insertStmt.executeUpdate();

                
                session.setAttribute("pendingUserEmail", userEmail);
                session.setAttribute("pendingDoctorEmail", doctorEmail);
                session.setAttribute("pendingDate", date);
                session.setAttribute("pendingTime", time);

               
                response.sendRedirect("payment.jsp");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Failed to book appointment. Please try again.");
            RequestDispatcher rd = request.getRequestDispatcher("bookAppointment.jsp");
            rd.forward(request, response);
        }
    }
}

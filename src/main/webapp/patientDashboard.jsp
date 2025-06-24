<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Patient Dashboard</title>
  <style>
    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      padding: 50px 20px;
      color: #222;
      overflow-x: hidden;
      background: linear-gradient(270deg,
        #1f2937,
        #3b4252,
        #4c566a,
        #5e81ac,
        #88c0d0,
        #81a1c1,
        #b48ead);
      background-size: 1400% 1400%;
      animation: gradientShift 20s ease infinite;
    }

    .wave-bg {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 300px;
      z-index: -1;
    }

    .box {
      background: white;
      max-width: 600px;
      width: 100%;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      color: #0d47a1;
      z-index: 1;
    }

    h2 {
      margin-bottom: 15px;
      font-weight: 700;
      font-size: 28px;
    }

    p {
      color: #555;
      margin-bottom: 30px;
      font-size: 16px;
    }

    h3 {
      text-align: left;
      color: #0d47a1;
      border-bottom: 2px solid #e0e0e0;
      padding-bottom: 8px;
      margin-bottom: 20px;
      font-weight: 600;
      font-size: 20px;
    }

    ul {
      list-style: none;
      padding: 0;
      text-align: left;
      max-height: 250px;
      overflow-y: auto;
      margin-bottom: 30px;
    }

    li {
      background-color: #bbdefb;
      padding: 12px 15px;
      margin-bottom: 12px;
      border-radius: 8px;
      font-size: 15px;
      color: #222;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    .book-appointment,
    .logout {
      display: inline-block;
      margin: 10px 10px 0 10px;
      padding: 12px 30px;
      font-weight: 700;
      font-size: 16px;
      border-radius: 8px;
      text-decoration: none;
      cursor: pointer;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .book-appointment {
      background-color: #0d47a1;
      color: white;
    }

    .book-appointment:hover {
      background-color: #08306b;
    }

    .logout {
      background-color: #d32f2f;
      color: white;
    }

    .logout:hover {
      background-color: #9a2323;
    }

    .message {
      margin-bottom: 20px;
      font-size: 16px;
      font-weight: bold;
    }

    .message.success {
      color: green;
    }

    .message.error {
      color: red;
    }
  </style>
</head>
<body>

  <div class="box">
    <h2>Welcome, <%= session.getAttribute("userName") %>!</h2>
    <p>You have successfully logged in as a patient.</p>

    <!-- ✅ SUCCESS / ERROR MESSAGES -->
    <%
      String success = (String) request.getAttribute("success");
      if (success != null) {
    %>
        <div class="message success"><%= success %></div>
    <%
      }
      String error = (String) request.getAttribute("error");
      if (error != null) {
    %>
        <div class="message error"><%= error %></div>
    <%
      }
    %>

    <h3>Your Appointments</h3>
    <ul>
      <%
        List<String> appointments = (List<String>) request.getAttribute("appointments");
        if (appointments != null && !appointments.isEmpty()) {
          for (String appt : appointments) {
      %>
        <li><%= appt %></li>
      <%
          }
        } else {
      %>
        <li>No appointments found.</li>
      <%
        }
      %>
    </ul>

    <a href="bookAppointment.jsp" class="book-appointment">➕ Book a New Appointment</a>
    <a href="logout" class="logout">Logout</a>
  </div>

  <!-- Wave SVG Background -->
  <svg class="wave-bg" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C149.99,150.00 349.67,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" 
          style="stroke: none; fill: #375a7f;"></path>
  </svg>

</body>
</html>
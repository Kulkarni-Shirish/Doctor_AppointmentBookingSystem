<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Doctor Dashboard</title>
  <style>
    /* Animated multi-color gradient background */
    @keyframes gradientShift {
      0% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
      100% {
        background-position: 0% 50%;
      }
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
        #b48ead
      );
      background-size: 1400% 1400%;
      animation: gradientShift 20s ease infinite;
    }

    /* Wave Background */
    .wave-bg {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 300px;
      z-index: -1;
    }

    /* White box to stand out */
    .dashboard-container {
      background: #ffffff; /* White background */
      max-width: 700px;
      width: 100%;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      color: #0d47a1; /* Dark blue text */
      z-index: 1;
    }

    h2 {
      margin-bottom: 15px;
      font-weight: 700;
      font-size: 28px;
    }

    p {
      margin-bottom: 30px;
      font-size: 16px;
      color: #555;
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
      max-height: 300px;
      overflow-y: auto;
      margin-bottom: 30px;
      color: #333;
    }

    li {
      background-color: #e8f0fe;
      padding: 12px 15px;
      margin-bottom: 12px;
      border-radius: 8px;
      font-size: 15px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }

    .empty-msg {
      font-style: italic;
      color: #888;
    }

    .logout-link {
      display: inline-block;
      margin-top: 10px;
      padding: 12px 40px;
      font-weight: 700;
      font-size: 16px;
      border-radius: 8px;
      background-color: #ef5350; /* subtle red */
      color: white;
      text-decoration: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
      text-align: center;
    }

    .logout-link:hover {
      background-color: #b71c1c;
    }
  </style>
</head>
<body>

  <div class="dashboard-container">
    <h2>Welcome Dr. <%= session.getAttribute("userName") %>!</h2>
    <p>You have successfully logged in as a doctor.</p>

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
        <li class="empty-msg">No appointments found.</li>
      <%
        }
      %>
    </ul>

    <a href="logout" class="logout-link">Logout</a>
  </div>

  <!-- Wave SVG Background with darker fill -->
  <svg class="wave-bg" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C149.99,150.00 349.67,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" 
          style="stroke: none; fill: #4c566a;"></path>
  </svg>

</body>
</html>
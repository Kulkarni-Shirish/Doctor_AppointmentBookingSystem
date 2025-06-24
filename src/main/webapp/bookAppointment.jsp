<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Book Appointment</title>
  <style>
    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    body {
      margin: 0;
      font-family: Arial, sans-serif;
      min-height: 100vh;
      padding: 50px;
      text-align: center;
      background: linear-gradient(270deg,
        #1f2937, #3b4252, #4c566a, #5e81ac,
        #88c0d0, #81a1c1, #b48ead);
      background-size: 1400% 1400%;
      animation: gradientShift 20s ease infinite;
      position: relative;
      overflow-x: hidden;
      color: #222;
    }

    .form-box {
      background: white;
      display: inline-block;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      position: relative;
      z-index: 1;
      max-width: 400px;
      width: 100%;
      box-sizing: border-box;
    }

    input, select {
      margin: 10px 0;
      padding: 10px;
      width: 100%;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
    }

    button {
      padding: 10px 20px;
      background-color: #0d47a1;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #08306b;
    }

    .fee-info {
      margin-top: 20px;
      font-weight: bold;
      font-size: 16px;
      color: #0d47a1;
    }

    .message {
      margin-top: 15px;
      font-size: 14px;
    }

    .message.success {
      color: green;
    }

    .message.error {
      color: red;
    }

    .wave-bg {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 300px;
      z-index: 0;
    }
  </style>
</head>
<body>

  <div class="form-box">
    <h2>Book an Appointment</h2>

    <form action="bookAppointment" method="post">
      <input type="email" name="doctorEmail" placeholder="Doctor's Email" required>
      <input type="date" name="appointmentDate" required>
      <input type="time" name="appointmentTime" required>
      <button type="submit">Book Appointment</button>
    </form>

    <p class="fee-info">Appointment Fee: ₹500 (Pay via UPI after booking)</p>

    <div class="message">
      <% 
         String error = (String) request.getAttribute("error");
         if (error != null) { 
      %>
        <p class="message error"><%= error %></p>
      <% 
         }

         String success = (String) request.getAttribute("success");
         if (success != null) { 
      %>
        <p class="message success"><%= success %></p>
      <% } %>
    </div>
  </div>

  <!-- Wave SVG Background -->
  <svg class="wave-bg" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C149.99,150.00 349.67,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
          style="stroke: none; fill: #dcefff;"></path>
  </svg>

</body>
</html>
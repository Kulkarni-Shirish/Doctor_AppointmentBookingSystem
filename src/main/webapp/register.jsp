<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Register</title>
  <style>
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
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      overflow: hidden;
    }

    .wave-bg {
      position: absolute;
      left: 0;
      bottom: 0;
      z-index: -1;
      width: 100%;
      height: 320px;
    }

    .register-box {
      width: 370px;
      background: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      z-index: 1;
    }

    .register-box h2 {
      margin-bottom: 25px;
      font-size: 24px;
      font-weight: bold;
      color: #222;
    }

    .register-box input,
    .register-box select {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
    }

    .register-box button {
      width: 100%;
      padding: 12px;
      background-color: #0d47a1;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
    }

    .register-box button:hover {
      background-color: #08306b;
    }

    .register-box p {
      margin-top: 16px;
      font-size: 14px;
    }

    .register-box a {
      color: #0d47a1;
      text-decoration: none;
    }

    .register-box a:hover {
      text-decoration: underline;
    }

    .message {
      color: red;
      margin-top: 10px;
      font-size: 14px;
    }
  </style>
</head>
<body>

  <div class="register-box">
    <h2>Register</h2>
    <form action="register" method="post">
      <input type="text" name="name" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email Address" required />
      <input type="password" name="password" placeholder="Password" required />

      <!-- ✅ Only allow Patient role -->
      <select name="role" required>
        <option value="" disabled selected>Select Role</option>
        <option value="patient">Patient</option>
        <!-- <option value="doctor">Doctor</option> --> <!-- Removed -->
      </select>

      <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>

    <%
      String msg = (String) request.getAttribute("msg");
      if (msg != null) {
    %>
      <p class="message"><%= msg %></p>
    <% } %>
  </div>

  <svg class="wave-bg" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C149.99,150.00 349.67,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
          style="stroke: none; fill: #dcefff;"></path>
  </svg>

</body>
</html>
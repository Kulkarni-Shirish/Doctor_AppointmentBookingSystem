<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login</title>
  <style>
    @keyframes rainbowBackground {
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
        #5a52a1,
        #ff6b6b,
        #fbc531,
        #12cbc4,
        #1f2937);
      background-size: 1400% 1400%;
      animation: rainbowBackground 20s ease infinite;
    }

    .wave-bg {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 300px;
      z-index: -1;
    }

    .login-box {
      width: 350px;
      background: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      color: #222;
    }

    .login-box h2 {
      margin-bottom: 25px;
      font-size: 24px;
      font-weight: bold;
      color: #0d47a1;
    }

    .login-box input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
    }

    .login-box button {
      width: 100%;
      padding: 12px;
      background-color: #0d47a1;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .login-box button:hover {
      background-color: #08306b;
    }

    .login-box p {
      margin-top: 16px;
      font-size: 14px;
    }

    .login-box a {
      color: #0d47a1;
      text-decoration: none;
    }

    .login-box a:hover {
      text-decoration: underline;
    }

    .error-message {
      color: red;
      margin-top: 12px;
      font-size: 14px;
    }
  </style>
</head>
<body>

  <div class="login-box">
    <h2>Login</h2>
    <form action="login" method="post">
      <input type="email" name="email" placeholder="Email Address" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Login</button>
    </form>

    <% 
      String error = (String) request.getAttribute("error");
      if (error != null) { 
    %>
      <p class="error-message"><%= error %></p>
    <% } %>

    <p>Don't have an account? <a href="register.jsp">Register</a></p>
  </div>

  <svg class="wave-bg" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C149.99,150.00 349.67,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" 
          style="stroke: none; fill: #dcefff;"></path>
  </svg>

</body>
</html>
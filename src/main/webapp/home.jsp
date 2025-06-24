<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome to EasyClinic</title>
  <style>
    /* Animated Gradient Background */
    @keyframes auroraBackground {
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
      background: linear-gradient(-45deg,
        #ff6ec4,
        #7873f5,
        #12c2e9,
        #f64f59,
        #c471ed,
        #48c6ef);
      background-size: 400% 400%;
      animation: auroraBackground 20s ease infinite;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
      position: relative;
    }

    .container {
      background: rgba(255, 255, 255, 0.6);
      padding: 40px 50px;
      border-radius: 20px;
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
      text-align: center;
      max-width: 600px;
      z-index: 1;
    }

    h1 {
      font-size: 32px;
      font-weight: bold;
      color: #0d1b2a;
      margin-bottom: 10px;
    }

    h3 {
      font-size: 20px;
      font-weight: 600;
      color: #222;
      margin-bottom: 20px;
    }

    p {
      font-size: 16px;
      color: #333;
      line-height: 1.6;
      margin-bottom: 30px;
    }

    .buttons a {
      text-decoration: none;
      padding: 12px 28px;
      margin: 10px;
      background-color: #0d47a1;
      color: white;
      border-radius: 999px;
      font-size: 16px;
      transition: background 0.3s ease;
      display: inline-block;
    }

    .buttons a:hover {
      background-color: #093272;
    }

    .contact {
      margin-top: 25px;
      font-size: 14px;
      color: #0d47a1;
    }

    /* Wave SVG */
    .wave {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 150px;
      z-index: 0;
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>Welcome to EasyClinic</h1>
    <h3>Your Health, Our Priority</h3>
    <p>
      At EasyClinic, we bring expert healthcare to your fingertips.
      Book appointments, consult with top doctors, and experience world-class service —
      all from the comfort of your home. We care about your well-being and convenience.
    </p>

    <div class="buttons">
      <a href="login.jsp">Login</a>
      <a href="register.jsp">Register</a>
    </div>

    <div class="contact">
      Contact us: info@easyclinic.com | +91 9876543210
    </div>
  </div>

  <!-- Wave SVG at bottom -->
  <svg class="wave" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C150.00,150.00 350.00,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
          style="stroke: none; fill: rgba(255, 255, 255, 0.6);"></path>
  </svg>

</body>
</html>
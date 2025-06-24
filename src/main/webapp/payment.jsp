<%@ page language="java" contentType="text/html; charset=UTF-8" session="true" %>
<%
    String upiPayeeVPA = "kulkarnishirish35-1@okaxis";  // Your UPI ID
    String upiPayeeName = "K Shirish Kumar";
    String transactionNote = "Appointment Fee";
    String amount = "500";

    String upiUrl = "upi://pay?pa=" + upiPayeeVPA
            + "&pn=" + java.net.URLEncoder.encode(upiPayeeName, "UTF-8")
            + "&tn=" + java.net.URLEncoder.encode(transactionNote, "UTF-8")
            + "&am=" + amount
            + "&cu=INR";
%>

<!DOCTYPE html>
<html>
<head>
  <title>Payment - Appointment Fee</title>
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
      display: flex;
      justify-content: center;
      align-items: center;
      background: linear-gradient(270deg, #1f2937, #3b4252, #4c566a, #5e81ac, #88c0d0, #81a1c1, #b48ead);
      background-size: 1400% 1400%;
      animation: gradientShift 20s ease infinite;
      position: relative;
      overflow-x: hidden;
      color: #222;
      padding: 40px 20px;
    }

    .form-box {
      background: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.15);
      max-width: 400px;
      width: 100%;
      text-align: center;
      z-index: 1;
      position: relative;
    }

    h2 {
      margin-bottom: 15px;
      color: #0d47a1;
    }

    p {
      font-size: 16px;
      margin-bottom: 20px;
      color: #444;
    }

    .scanner-img {
      width: 250px;
      height: 250px;
      object-fit: contain;
      border: 1px solid #ccc;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      margin-bottom: 20px;
      transition: transform 0.3s ease;
    }

    .scanner-img:hover {
      transform: scale(1.05);
    }

    form {
      margin-top: 20px;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
    }

    button {
      padding: 12px 25px;
      font-size: 16px;
      cursor: pointer;
      background-color: #0d47a1;
      color: white;
      border: none;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(13, 71, 161, 0.4);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    button:hover {
      background-color: #08306b;
      box-shadow: 0 6px 16px rgba(8, 48, 107, 0.6);
    }

    .error-msg {
      color: red;
      font-weight: bold;
      margin-top: 10px;
    }

    .wave-bg {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 200px;
      z-index: 0;
      opacity: 0.25;
      pointer-events: none;
    }

  </style>
</head>
<body>

  <div class="form-box">
    <h2>Pay Appointment Fee ₹500</h2>
    <p>Scan QR with GPay, PhonePe, Paytm, etc. Then enter the Payment ID to confirm.</p>

    <img src="images/scanner.jpg" alt="Scan to Pay" class="scanner-img">

    <form action="confirmPayment" method="post">
      <label>Enter Payment ID:</label>
      <input type="text" name="paymentId" required placeholder="e.g. TXN123456" />

      <button type="submit">I Have Paid</button>
    </form>

    <% 
      String error = (String) request.getAttribute("error");
      if (error != null) {
    %>
      <p class="error-msg"><%= error %></p>
    <%
      }
    %>
  </div>

  <svg class="wave-bg" viewBox="0 0 500 150" preserveAspectRatio="none">
    <path d="M0.00,49.98 C149.99,150.00 349.67,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" 
          style="stroke: none; fill: #dcefff;"></path>
  </svg>

</body>
</html>
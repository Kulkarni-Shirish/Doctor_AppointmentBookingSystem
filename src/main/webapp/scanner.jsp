<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Scan to Pay</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f0f8ff;
        }

        h2 {
            color: #0d47a1;
        }

        .qr-box {
            margin-top: 30px;
        }

        img {
            width: 300px;
            height: auto;
            border: 2px solid #ccc;
            border-radius: 8px;
        }

        button {
            margin-top: 40px;
            padding: 12px 24px;
            font-size: 16px;
            color: white;
            background-color: #0d47a1;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #08306b;
        }
    </style>
</head>
<body>

    <h2>Scan the QR Code to Pay ₹500</h2>

    <!-- QR Code Image -->
    <div class="qr-box">
        <img src="images/scanner.jpg" alt="Scan QR to Pay">
    </div>

    <!-- Confirm Payment Button -->
    <form action="confirmPayment" method="post">
        <button type="submit">I Have Paid</button>
    </form>

</body>
</html>
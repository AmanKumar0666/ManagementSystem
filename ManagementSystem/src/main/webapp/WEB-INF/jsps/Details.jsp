<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-size: 18px;
        }
        td {
            font-weight: bold;
        }
        .countdown {
            font-size: 36px;
            color: #333;
            position: absolute;
            top: 140px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="countdown">00:10</div>
<div class="container">
    <h1>Your Details</h1>
    <table>
        <tr>
            <th>Email:</th>
            <td>${user.email}</td>
        </tr>
        <tr>
            <th>Password:</th>
            <td>${user.password}</td>
        </tr>
    </table>
</div>
<script>
    var countdown = 10;
    var countdownDisplay = document.querySelector('.countdown');

    function updateCountdown() {
        countdown--;
        var minutes = Math.floor(countdown / 60);
        var seconds = countdown % 60;
        countdownDisplay.innerText = minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
        if (countdown <= 0) {
            window.location.href = '/login';
        }
    }

    var countdownInterval = setInterval(updateCountdown, 1000);
</script>
</body>
</html>


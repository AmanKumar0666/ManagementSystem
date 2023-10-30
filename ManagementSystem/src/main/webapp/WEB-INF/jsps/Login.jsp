<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login and Signup</title>
  <style>
    body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            background-color: rgba(255, 255, 255, 0.2);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .signup-heading {
                  background-color: rgba(255, 255, 255, 0.4);
                  color: black; /* Text color on the strip */
                  padding: 10px 0; /* Adjust padding as needed */
                  text-align: center;
                  margin: 0;
                  border: 1px solid red;
                  margin-bottom: 25px;
                  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
                }

    .card {
      max-width: 400px;
      margin: 0 auto;
      padding: 10px;
      background-color: rgba(255, 0, 0, 0.2);
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
      border-bottom: 10px solid red;

    }

    h2 {
      text-align: center;
      color: #333;
      font-weight: bold;
    }
    .error-message {
        text-align: center;
        color: red;
        margin: 10px 0;
       margin-bottom: 20px;
       font-weight: bold;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: center;
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
      margin-right: 40px;


    }

    label {
      font-weight: bold;
      font-size: 20px;
      width: 150px;
      margin-right: 10px;
      text-align: right;
      color: #333;
    }

    input[type="text"],
    input[type="password"] {
      flex: 1;
      padding: 10px;
      margin-bottom: 10px;
      border: none;
      border-bottom: 4px solid red;
      font-size: 16px;
      border-radius: 5px;
      background-color: rgba(255, 255, 255, 0.9);
      font-weight: bold;
      transition: border-bottom 0.3s ease;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
      border: 3px solid red;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      outline: none;
      border-bottom: 5px solid limegreen;

    }

    .btn-container {
      text-align: center;
      display: flex;
      flex-direction: column;
      margin-top: 0;
    }

    .btn, .generate-otp-button, .verify-otp-button {
      font-weight: bold;
      font-size: 18px;
      background-color: red;
      color: black;
      border: 4px solid black;
      border-radius: 3px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
      padding: 14px 30px;
      margin: 10px auto;
      margin-top: 5px;
    }

    .btn:hover, .generate-otp-button:hover, .verify-otp-button:hover {
      background-color: limeGreen;
      margin-top: 5px;
    }

    .links {
      text-align: center;
      margin-top: 20px;
    }

    .signup-link {
      margin: 20px 0;
      font-weight: bold;
    }

    .forget-link a {
      color: #007BFF;
      text-decoration: none;
      font-weight: bold;
    }

    .forget-box {
      display: none;
      width: 100%;
    }

    .forget-box.visible {
      display: block;
    }

  </style>
</head>
<body>

  <div class="card">
      <h2 class="signup-heading">Login Here</h2>
      <p class="error-message">${errorMessage}</p>
      <form action="LogIn" method="post">
          <div class="form-group">
              <label for="email">Email:-</label>
              <input type="text" id="email" name="email" required>
          </div>
          <div class="form-group">
              <label for="password">Password:-</label>
              <input type="password" id="password" name="password" required>
          </div>
          <div class="form-group">
              <input type="checkbox" id="remember-me" name="remember-me" value="true">
              <label for="remember-me">Remember Me</label>
          </div>
          <div class="btn-container">
              <button type="submit" class="btn">Login</button>
          </div>
      </form>

  <div class="links">
    <div class="forget-link">
      <a href="#" onclick="showForgetBox();">Forget Username/Password</a>
    </div>
    <div class="forget-box" id="forget-box">
      <p>Enter your registered email:-</p>
      <div id="error-message" style="color: red; font-weight: bold; font-size: 16px; margin-bottom: 10px;"></div>
      <input type="text" id="forget-input" name="forget-input">
      <div class="btn-container">
        <button class="generate-otp-button" onclick="generateOTP();">Generate OTP</button>
      </div>
    </div>
    <div class="otp-box" id="otp-box" style="display: none;">
      <p>Enter the OTP received on your email:-</p>
      <div id="errormessage" style="color: red; font-weight: bold; font-size: 16px; margin-bottom: 10px;"></div>
      <div id="error" style="color: red; font-weight: bold; font-size: 16px; margin-bottom: 10px;"></div>
      <input type="text" id="otp-input" name="otp-input">
      <div class="btn-container">
        <button class="verify-otp-button" onclick="verifyOTP();">Verify OTP</button>
      </div>
      <div id="otp-countdown">OTP will expire in <span id="otp-timer">60</span> seconds</div>
    </div>
    <div class="signup-link">
      Don't have an account? <a href="/signup">Sign up</a>
    </div>
  </div>

<script>
  function showForgetBox() {
    const forgetBox = document.getElementById('forget-box');
    forgetBox.style.display = 'block';
  }


  function startOTPTimer() {
      let countdown = 60;
      const timerElement = document.getElementById('otp-timer');

      function updateTimer() {
          if (countdown > 0) {
              timerElement.textContent = countdown;
              countdown--;
              setTimeout(updateTimer, 1000);
          } else {

          }
      }

      updateTimer();
  }


</script>

<script>
  function generateOTP() {
    const forgetInput = document.getElementById('forget-input').value;

    const errorMessage = document.getElementById('error-message');
    errorMessage.innerText = '';

    if (forgetInput.trim() === '' || !(/^\S+@\S+\.\S+$/.test(forgetInput))) {
      errorMessage.innerText = 'Please enter a valid email address.';
      return;
    }

    fetch("/OTP/checkEmailAvailability?email=" + forgetInput)
      .then(response => {
        if (response.status === 200) {
        sessionStorage.setItem('userEmail', forgetInput);
          return response.json();
        } else if (response.status === 404) {
          errorMessage.innerText = 'Email is not registered.';
        }
      })
      .then(data => {
        if (data) {
          const forgetBox = document.getElementById('forget-box');
          forgetBox.style.display = 'none';

          const otpBox = document.getElementById('otp-box');
          otpBox.style.display = 'block';
          startOTPTimer();
        }
      })
      .catch(error => {
        console.error('API request error:', error);
      });
  }
</script>
<script>
 function verifyOTP() {
     const enteredOTP = document.getElementById('otp-input').value;
     const forgetInput = document.getElementById('forget-input').value;

     fetch("/OTP/verifyOTP?email=" + forgetInput + "&enteredOTP=" + enteredOTP, {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
          },
      })
     .then(response => {
         if (response.status === 200) { // Correct OTP
             console.log("OTP matched successfully");
             showUserDetails();
         } else if (response.status === 400) { // Incorrect OTP
             errormessage.innerText = 'Incorrect OTP or OTP expired';
         } else {
             error.innerText = 'OTP expired. Please Try again';
         }
     })
     .catch(error => {
         console.error('API request error:', error);
     });
 }

  function showUserDetails() {
    window.location.href = '/details';

  }
</script>
</body>
</html>



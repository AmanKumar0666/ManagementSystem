<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup</title>
  <style>
    body {
       font-family: Arial, sans-serif;

            margin: 0;
            padding: 0;

            align-items: center;
        }
         .container {
                      max-width: 600px;
                      margin: 0 auto;
                      padding: 20px;
                      background-color: rgba(173, 216, 230, 0.8);
                      border-radius: 10px;
                      box-shadow: 0px 0px 10px rgba(0, 0, 0, 50);
                      border: 10px solid blue;
                  }
        .signup-heading {
          background-color: rgba(135, 206, 250, 0.9);
          color: black;
          padding: 10px 0;
          text-align: center;
          margin: 0;
          border: 3px solid blue;
          box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
          margin-bottom: 20px;
        }

    .card {
      max-width: 500px;
      margin: 0 auto;
      padding: 10px;
      background-color: rgba(135, 206, 250, 0.5);
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      border: 7px solid skyblue;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
    }

    h2 {
      text-align: center;
      color: #333;
      font-weight: bold;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: center;
      align-items: center;
      justify-content: center;
      margin-right: 30px;
    }


    label {
      font-weight: bold;
      font-size: 20px;
      width: 150px;
      margin-right: 10px;
      text-align: right;
      color: #333;
      display: inline-block;
    }

    input[type="text"],
    input[type="password"] {
      flex: 1;
      padding: 10px;
      margin-bottom: 10px;
      border: none;
      border-bottom: 3px solid blue;
      font-size: 16px;
      border: 3px solid Blue;
      border-radius: 5px;
      background-color: rgba(255, 255, 255, 0.9);
      font-weight: bold;
      transition: border-bottom 0.3s ease; /* Smooth transition for border color */
      width: 250px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      outline: none;
      border-bottom: 5px solid skyblue; /* Change border color to light green when focused */
    }

    .btn-container {
      text-align: center;
      display: flex;
      flex-direction: column;
    }

    .btn {
      font-weight: bold;
      font-size: 18px;
      background-color: #007BFF;
      color: black;
      border: 4px solid black;
      border-radius: 3px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
      padding: 14px 30px;
      margin: 10px auto;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
    }

    .btn:hover {
    margin-top: 15px;
      background-color: #0056b3;
    }

   select {
     flex: 1;
     width: 270px; /* Set a fixed width for the select element */
     padding: 10px;
     margin-bottom: 10px;
     border: none;
     border-bottom: 2px solid blue;
     border: 3px solid Blue;
     font-size: 16px;
     border-radius: 5px;
     background-color: rgba(255, 255, 255, 0.9);
     font-weight: bold;
     transition: border-bottom 0.3s ease;
     box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
   }


select:focus {
  outline: none;
  border-bottom: 3px solid skyblue;
}
.error-message {
  color: red;
  text-align: center;
  margin-top: 5px;
}
ul {
    list-style: disc;
    margin-top: 20px;
    margin-bottom: 20px;
}


  </style>


</head>
<body>
<div class="container">

   <h2 class="signup-heading">Signup Here</h2>
<div class="card">
 <form id="signup-form" action="saveUser" method="post">

<c:if test="${not empty errors}">
    <div class="error-message" id="error-message">
      <ul>
        <c:forEach items="${errors}" var="error">
         ${error}
        </c:forEach>
      </ul>
    </div>
  </c:if>

    <div class="form-group">
      <label for="fullName">Full Name:-</label>
      <input type="text" id="fullName" name="fullName" value="${user.fullName}" required>

    </div>

    <div class="form-group">
      <label for="gender">Gender:-</label>
      <select id="gender" name="gender">
        <option value="male">Male</option>
        <option value="female">Female</option>
      </select>
    </div>

    <div class="form-group">
      <label for="address">Address:-</label>
      <input type="text" id="address" name="address" value="${user.address}" required >
    </div>

    <div class="form-group">
      <label for="email">Email:-</label>
      <input type="text" id="email" name="email" required value="${user.email}" onblur="checkEmail()" oninput="checkEmail()">
      <div id="email-error" class="error-message"></div>
    </div>

    <div class="form-group">
      <label for="mobile">Mobile:-</label>
      <input type="text" id="mobile" name="mobile" required value="${user.mobile}" onblur="checkMobile()" oninput="checkMobile()">
      <div id="mobile-error" class="error-message"></div>
    </div>

    <div class="form-group">
      <label for="password">Password:-</label>
      <input type="password" id="password" name="password" required>
    </div>

    <div class="form-group">
      <label for="confirmPassword">Confirm Password:-</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required oninput="validatePassword()">
      <div id="password-error" class="error-message"></div>
    </div>
</div>
    <div class="btn-container">
       <button type="submit" id="submit-button" class="btn" disabled>Register</button>
    </div>

  </form>
</div>

<script>

        document.getElementById('fullName').addEventListener('input', function() {
            var fullName = this.value;
            if (!/^[A-Za-z\s]{1,20}$/.test(fullName)) {
                alert('Full Name should be alphabets only and up to 20 characters.');
                this.value = fullName.replace(/[^A-Za-z\s]/g, '');
                if (this.value.length > 20) {
                    this.value = this.value.slice(0, 20);
                }
            }
        });

        document.getElementById('address').addEventListener('input', function() {
            var address = this.value;
            if (!/^[A-Za-z\s]{1,20}$/.test(address)) {
                alert('Address should be alphabets only and up to 20 characters.');
                this.value = address.replace(/[^A-Za-z\s]/g, '');
                if (this.value.length > 20) {
                    this.value = this.value.slice(0, 20);
                }
            }
        });

        document.getElementById('email').addEventListener('input', function() {
            var email = this.value;
            if (email.length > 30) {
                alert('Email should be up to 30 characters long.');
                this.value = email.slice(0, 30);
            }
        });

        document.getElementById('myForm').addEventListener('submit', function(event) {
            var email = document.getElementById('email').value;
            if (email.trim() === '') {
                alert('Email cannot be empty.');
                event.preventDefault();
            } else if (!/^[\w.-]+@[A-Za-z]+\.[A-Za-z]+$/.test(email)) {
                alert('Invalid email format.');
                event.preventDefault();
            }
        });
</script>
<script>

    var mobileInput = document.getElementById('mobile');

    mobileInput.addEventListener('input', function() {
        var mobile = this.value;

        if (!/^\d+$/.test(mobile)) {
            alert('Mobile should contain only numbers.');
            this.value = mobile.replace(/\D/g, '');
        }

        if (mobile.length > 10) {
            alert('Mobile should be at most 10 digits.');
            this.value = mobile.slice(0, 10);
        }
    });

    document.getElementById('myForm').addEventListener('submit', function(event) {
        var mobile = mobileInput.value;
        if (!/^\d+$/.test(mobile) || mobile.length < 10) {
            alert('Please enter a valid mobile number.');
            event.preventDefault(); // Prevent form submission
        }
    });

</script>
<script>
        function validatePassword() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const passwordError = document.getElementById("password-error");

            if (password !== confirmPassword) {
                passwordError.innerText = "Password and Confirm Password do not match.";
                return false;
            } else {
                passwordError.innerText = "";
                return true;
            }
        }

        function isValidEmail(email) {
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailPattern.test(email);
        }

        function isValidMobile(mobile) {
            const mobilePattern = /^[0-9]{10}$/;
            return mobilePattern.test(mobile);
        }

        function checkEmail() {
            const emailInput = document.getElementById("email");
            const email = emailInput.value.trim();
            const emailError = document.getElementById("email-error");

            if (!isValidEmail(email)) {
                emailError.innerText = "Invalid email address.";
                emailError.style.color = "red";
                enableSubmitButton(false);
            } else {

                fetch("/checkEmailAvailability?email=" + email)
                 .then(response => response.json())
                 .then(data => {
                     if (data.available) {
                         emailError.style.color = "green";
                         emailError.innerText = "Email is available.";
                         enableSubmitButton(true);
                     } else {
                         emailError.style.color = "red";
                         emailError.innerText = "Email is not available.";
                         enableSubmitButton(false);
                     }
                 })
                 .catch(error => {
                     console.error("Error checking email availability:", error);
                     enableSubmitButton(false);
                 });
                emailError.style.color = "green";
                emailError.innerText = "Email is available.";
                enableSubmitButton(true);
            }
        }

        function checkMobile() {
            const mobileInput = document.getElementById("mobile");
            const mobile = mobileInput.value.trim();
            const mobileError = document.getElementById("mobile-error");

            if (!isValidMobile(mobile)) {
                mobileError.innerText = "Invalid mobile number.";
                mobileError.style.color = "red";
                enableSubmitButton(false);
            } else {

               fetch("/checkMobileAvailability?mobile=" + mobile)
                 .then(response => response.json())
                 .then(data => {
                     if (data.available) {
                        mobileError.style.color = "green";
                         mobileError.innerText = "Mobile is available.";
                         enableSubmitButton(true);
                     } else {
                         mobileError.style.color = "red";
                         mobileError.innerText = "Mobile is not available.";
                         enableSubmitButton(false);
                     }
                 })
                 .catch(error => {
                    console.error("Error checking mobile availability:", error);
                     enableSubmitButton(false);
                 });
                mobileError.style.color = "green";
                mobileError.innerText = "Mobile is available.";
                enableSubmitButton(true);
            }
        }

        function enableSubmitButton(enable) {
            const submitButton = document.getElementById("submit-button");
            submitButton.disabled = !enable;
        }
    </script>
</body>
</html>

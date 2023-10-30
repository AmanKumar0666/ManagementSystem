<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Page</title>
     <style>
             body {
                 font-family: 'Arial', sans-serif;
                 margin: 0;
                 padding: 0;
                 background: linear-gradient(to bottom, #3498db, #2980b9);
                 background-repeat: no-repeat;
                 background-attachment: fixed;
                 background-size: cover;
             }

             .container {
                 max-width: 600px;
                 margin: 0 auto;
                 padding: 20px;
                 background-color: rgba(255, 255, 255, 0.8);
                 border-radius: 10px;
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 50);
                 border: 10px solid red;
             }

             h1 {
                 text-align: center;
                 color: #333;
             }

             .section {
                 border: 1px solid #ddd;
                 padding: 20px;
                 margin-bottom: 20px;
                 border-radius: 5px;
                 background-color: rgba(255, 255, 255, 0.9);
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
                 border: 5px solid pink;
             }

             .section h2 {
                 font-size: 20px;
                 margin-bottom: 10px;
                 color: green;
             }

             .section label {
                 font-weight: bold;
                 display: inline-block;
                 width: 150px;
                 margin-right: 10px;
                 text-align: right;
                 color: #333;
             }

             .section input[type="text"],
             .section input[type="email"],
             .section input[type="tel"],
             .section select,
             .section input[type="date"] {
                 width: 60%;
                 padding: 10px;
                 margin-bottom: 10px;
                 border: none;
                 border: 3px solid red;
                 border-bottom: 2px solid #3498db;
                 font-size: 16px;
                 border-radius: 5px;
                 background-color: rgba(255, 255, 255, 0.9);
                 border-bottom: 3px solid red;
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 10);
                 font-weight: bold;
             }

             .section input[type="text"]:focus,
             .section input[type="email"]:focus,
             .section input[type="tel"]:focus,
             .section select:focus,
             .section input[type="date"]:focus {
                 outline: none;
                 border-bottom: 2px solid #2980b9;
                 border-bottom: 5px solid pink;
             }

             .saveChanges-button {
                 font-weight: bold;
                 display: block;
                 margin: 20px auto;
                 padding: 15px 30px;
                 background-color: red;
                 color: black;
                 border: none;
                 border-radius: 5px;
                 cursor: pointer;
                 font-size: 18px;
                 transition: background-color 0.3s ease;
                 border: 4px solid black;
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
             }

             .saveChanges-button:hover {
                 background-color: pink;
             }

             .box {
                 border: 1px solid #ddd;
                 padding: 10px;
                 background-color: rgba(255, 255, 255, 0.9);
                 margin-top: 10px;
                 border-radius: 5px;
                 border: 3px solid red;
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 15);
                 font-weight: bold;
             }

             .box input[type="number"] {
                 width: 100%;
                 padding: 10px;
                 margin-bottom: 10px;
                 border: none;
                 border-radius: 5px;
                 background-color: rgba(255, 255, 255, 0.9);
                 font-weight: bold;
             }

             .box input[type="number"]::-webkit-inner-spin-button,
             .box input[type="number"]::-webkit-outer-spin-button {
                 -webkit-appearance: none;
                 margin: 0;
                 font-weight: bold;
             }

             .box .room-count {
                 display: flex;
                 justify-content: space-between;
                 align-items: center;
                 font-weight: bold;
             }

             .box .room-count button {
                 background-color: red;
                 color: #fff;
                 border: none;
                 border-radius: 50%;
                 width: 50px;
                 height: 30px;
                 font-size: 20px;
                 cursor: pointer;
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 15);
             }

             .box .room-count button:hover {
                 background-color: pink;
             }
             .room-input {
                 padding: 5px 10px;
                 width: 30px;
                 text-align: center;
             }
          </style>
</head>
<body>
<div class="container">
<h1>Edit Your Details</h1>

<form action="/confirm" method="POST">
<div class="section">

                        <div class="box">
                             <label for="fullName">Full Name:-</label>
                             <span><input type="text" id="fullName" name="fullName" value="<%= request.getParameter("fullName") %>"><span>
                        </div>

                        <div class="box">
                            <label for="genderSelect">Gender:</label>
                            <span>
                                <select id="genderSelect" name="genderSelect">
                                    <option value="male" <%= "male".equals(request.getParameter("genderSelect")) ? "selected" : "" %>>Male</option>
                                    <option value="female" <%= "female".equals(request.getParameter("genderSelect")) ? "selected" : "" %>>Female</option>
                                </select>
                            </span>
                        </div>

                        <div class="box">
                           <label for="address">Address:-</label>
                           <span> <input type="text" id="address" name="address" value="<%= request.getParameter("address") %>"><span>
                        </div>

                        <div class="box">
                            <label for="email">Email:-</label>
                            <span><input type="text" id="email" name="email" value="<%= request.getParameter("email") %>"></span>
                        </div>

                        <div class="box">
                            <label for="mobile">Mobile:-</label>
                            <span><input type="text" id="mobile" name="mobile" value="<%= request.getParameter("mobile") %>"></span>
                        </div>

                        <div class="box">
                          <label for="noOfRooms" style="display: inline-block; width: 150px;">Number of Rooms:-</label>
                          <div class="room-count" style="display: inline-block; vertical-align: middle;">
                          <button type="button" id="decrementRooms" onclick="decrementRooms()" style="padding: 5px 10px;">&larr;</button>
                          <span id="roomCount" style="width: 30px; text-align: center; display: inline-block; margin: 0 5px;"><%= request.getParameter("noOfRooms") %></span>
                          <button type="button" id="incrementRooms" onclick="incrementRooms()" style="padding: 5px 10px;">&rarr;</button>
                          <input type="hidden" id="noOfRooms" name="noOfRooms" value="">
                         </div>
                       </div>

                        <div class="box">
                            <label for="checkInDate">Check-In Date:-</label>
                            <span><input type="date" id="checkInDate" name="checkInDate" value="<%= request.getParameter("checkInDate") %>"></span>
                        </div>


                        <div class="box">
                            <label for="checkOutDate">Check-out Date:-</label>
                           <span> <input type="date" id="checkOutDateInput" name="checkOutDate" value="<%= request.getParameter("checkOutDate") %>" required pattern="\d{4}-\d{2}-\d{2}"></span>
                        </div>


                        <div class="box">
                           <label for="numberOfDays">Number of Days:-</label>
                           <span id="numberOfDays"><%= request.getParameter("noOfDays") %></span>
                           <input type="hidden" id="noOfDays" name="noOfDays" value="">
                        </div>

                        <div class="box">
                          <label for="hotelName">Hotel Name:-</label>
                          <span><%= request.getParameter("hotel-name") %></span><br>
                          <input type="hidden" id="hotel-name" name="hotel-name" value="<%= request.getParameter("hotel-name") %>">
                        </div>

                        <div class="box">
                          <label for="location">Location:-</label>
                          <span><%= request.getParameter("hotel-location") %></span><br>
                          <input type="hidden" id="hotel-location" name="hotel-location" value="<%= request.getParameter("hotel-location") %>">
                        </div>

                        <div class="box">
                           <label for="price">Price:-</label>
                           <span id="actualPrice">₹<%= request.getParameter("hotel-price") %></span><br>
                           <input type="hidden" id="hotel-price" name="hotel-price" value="<%= request.getParameter("hotel-price") %>">
                        </div>

                        <div class="box">
                           <label for="totalPrice">Total Price:-</label>
                           <span id="totalPrice"><%= request.getParameter("total-Price") %></span>
                           <input type="hidden" id="total-Price" name="total-Price" value="">
                           </div>

    <button type="submit" class="saveChanges-button">Save Changes</button>
    </form>
</div>
<script>
    const checkInDateInput = document.getElementById('checkInDate');
    const checkOutDateInput = document.getElementById('checkOutDateInput'); // Corrected the ID
    const hotelPriceSpan = document.getElementById('actualPrice');
    const numberOfDaysSpan = document.getElementById('numberOfDays');
    const totalPriceSpan = document.getElementById('totalPrice');
    const roomCountSpan = document.getElementById('roomCount');

    function calculateTotalPrice() {
        const selectedRooms = parseInt(roomCountSpan.textContent, 10);
        const checkInDate = new Date(checkInDateInput.value);
        const checkOutDate = new Date(checkOutDateInput.value); // Corrected the input ID
        const roomPrice = parseFloat(hotelPriceSpan.textContent.replace(/[^\d.]/g, ''));

        if (!isNaN(checkInDate) && !isNaN(checkOutDate) && checkInDate <= checkOutDate) { // Corrected the date comparison
            const oneDay = 24 * 60 * 60 * 1000;
            const numberOfDays = Math.round(Math.abs((checkOutDate - checkInDate) / oneDay));

            const totalPrice = selectedRooms * roomPrice * numberOfDays;
            const formattedPrice = new Intl.NumberFormat('en-IN', {
                style: 'currency',
                currency: 'INR',
                minimumFractionDigits: 2
            }).format(totalPrice);

            numberOfDaysSpan.textContent = numberOfDays;
            totalPriceSpan.textContent = formattedPrice;
            document.getElementById('noOfRooms').value = selectedRooms;
            document.getElementById('noOfDays').value = numberOfDays;
            document.getElementById('total-Price').value = formattedPrice;
        } else {
            alert('Check-out date must be later than the check-in date.');
            checkOutDateInput.value = ''; // Clear the checkout date
        }
    }

    checkInDateInput.addEventListener('input', calculateTotalPrice);
    checkOutDateInput.addEventListener('input', calculateTotalPrice);

    calculateTotalPrice();
</script>
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
            if (email.length > 20) {
                alert('Email should be up to 20 characters long.');
                this.value = email.slice(0, 20);
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

document.getElementById('myForm').addEventListener('submit', function(event) {
    var roomCount = parseInt(document.getElementById('roomCount').textContent);
    if (roomCount === 0) {
        alert('Number of rooms cannot be 0.');
        event.preventDefault();
    }
});

</script>

<script>

const decrementRoomsButton = document.getElementById('decrementRooms');
const incrementRoomsButton = document.getElementById('incrementRooms');

function decrementRooms() {
    let roomCount = parseInt(roomCountSpan.textContent, 10);
    if (roomCount > 0) {
        roomCount--;
        roomCountSpan.textContent = roomCount;
        calculateTotalPrice();
    }
}

function incrementRooms() {
    let roomCount = parseInt(roomCountSpan.textContent, 10);
    roomCount++;
    roomCountSpan.textContent = roomCount;
    calculateTotalPrice();
}

decrementRoomsButton.addEventListener('click', decrementRooms);
incrementRoomsButton.addEventListener('click', incrementRooms);

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
</body>
</html>

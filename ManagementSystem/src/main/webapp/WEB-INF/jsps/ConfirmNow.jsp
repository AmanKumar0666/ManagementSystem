<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Booking</title>
    <style>
         body {
             font-family: 'Arial', sans-serif;
             margin: 0;
             padding: 0;
             background: lightgreen;
             color: green;
             background-repeat: no-repeat;
             background-attachment: fixed;
             background-size: cover;
         }

         .container {
             max-width: 500px;
             margin: 0 auto;
             padding: 20px;
             background-color: #c0f4c0;
             border-radius: 10px;
             box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
             border: 10px solid green;
         }

         h1 {
             text-align: center;
             color: #333;
         }
         h2 {
                      text-align: center;
                      color: #333;
                  }

         .record {
             border: 1px solid #ddd;
             padding: 20px;
             margin-bottom: 20px;
             border-radius: 5px;
             background-color: rgba(255, 255, 255, 0.9);
             border: 4px solid lightgreen;
             box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
         }
         .box {
             border: 1px solid #ddd;
             padding: 10px;
             background-color: #f5f5f5;
             margin-top: 10px;
             border-radius: 5px;
             border: 4px solid green;
             box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
         }

         .box p {
             margin: 5px 0;
             color: #333;
             font-weight: bold;
         }

         .box p strong {
             font-size: 18px;
             font-weight: bold;
         }

         .box:hover {
             transform: scale(1.05); /* Scale the box on hover for a subtle effect */
             transition: transform 0.2s ease-in-out;
         }

         .button-container {
                     display: flex;
                     justify-content: space-between;
                     margin-top: 20px;
                 }

                 .edit-button, .proceed-button {
                     font-weight: bold;
                     display: inline-block;
                     padding: 10px 20px;
                     text-decoration: none;
                     color: black;
                     border: none;
                     border-radius: 5px;
                     cursor: pointer;
                     font-size: 16px;
                     transition: background-color 0.3s ease;
                    border: 4px solid black;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 25);
                 }

                 .edit-button {
                     font-weight: bold;
                     background-color: green;
                     color: black;
                 }

                 .proceed-button {
                     background-color: #3498db;
                 }

                 .edit-button:hover {
                     background-color: limegreen;
                 }

                 .proceed-button:hover {
                     background-color: #2980b9;
                 }
     </style>
</head>
<body>
    <div class="container">
        <h1>Booking Confirmation</h1>
        <div class="confirmation">
           <h2>Booking Details</h2>
                       <div class="record">
                      <form  action="EditDetails" method="post">
                       <div class="box"><p><strong>Full Name:-</strong> <%= request.getParameter("fullName") %></p>
                       <input type="hidden" name="fullName" value="<%= request.getParameter("fullName") %>" required>
                       </div>

                       <div class="box"><p><strong>Gender:-</strong> <%= request.getParameter("gender") %></p>
                       <input type="hidden" name="gender" value="<%= request.getParameter("gender") %>" required>
                       </div>

                       <div class="box"><p><strong>Address:-</strong> <%= request.getParameter("address") %></p>
                       <input type="hidden" name="address" value="<%= request.getParameter("address") %>" required>
                       </div>

                       <div class="box"><p><strong>Email:-</strong> <%= request.getParameter("email") %></p>
                       <input type="hidden" name="email" value="<%= request.getParameter("email") %>" required>
                       </div>

                       <div class="box"><p><strong>Mobile:-</strong> <%= request.getParameter("mobile") %></p>
                       <input type="hidden" name="mobile" value="<%= request.getParameter("mobile") %>" required>
                       </div>

                       <div class="box"><p><strong>Number of Rooms:-</strong> <%= request.getParameter("noOfRooms") %></p>
                       <input type="hidden" id="noOfRooms" name="noOfRooms" value="<%= request.getParameter("noOfRooms") %>"required>
                       </div>

                       <div class="box"><p><strong>Check-in Date:-</strong> <%= request.getParameter("checkInDate") %></p>
                       <input type="hidden" id="checkInDate" name="checkInDate" value="<%= request.getParameter("checkInDate") %>"   required pattern="\d{4}-\d{2}-\d{2}">
                       </div>

                       <div class="box"><p><strong>Check-out Date:-</strong> <%= request.getParameter("checkOutDate") %></p>
                       <input type="hidden" id="checkOutDate" name="checkOutDate" value="<%= request.getParameter("checkOutDate") %>"   required pattern="\d{4}-\d{2}-\d{2}">
                       </div>

                       <div class="box"><p><strong>Number of Days:-</strong> <%= request.getParameter("noOfDays") %></p>
                       <input type="hidden" id="noOfDays" name="noOfDays" value="<%= request.getParameter("noOfDays") %>"required>
                       </div>

                       <div class="box"><p><strong>Hotel Name:-</strong> <%= request.getParameter("hotel-name") %></p>
                       <input type="hidden" id="hotel-name" name="hotel-name" value="<%= request.getParameter("hotel-name") %>">
                       </div>

                       <div class="box"><p><strong>Location:-</strong> <%= request.getParameter("hotel-location") %></p>
                       <input type="hidden" id="hotel-location" name="hotel-location" value="<%= request.getParameter("hotel-location") %>">
                       </div>

                       <div class="box"><p><strong>Price:-</strong> ₹<%= request.getParameter("hotel-price") %></p>
                       <input type="hidden" id="hotel-price" name="hotel-price" value="<%= request.getParameter("hotel-price") %>">
                       </div>

                       <div class="box"><p><strong>Total Price:-</strong> <%= request.getParameter("total-Price") %></p>
                       <input type="hidden" id="total-Price" name="total-Price" value="<%= request.getParameter("total-Price") %>" required>
                       </div>
                       </div>
               </div>
                       <div class="button-container">
                        <button type="submit" class="edit-button" > Edit Your Details</button >
                        <a class="proceed-button" id="proceedToPayment">Proceed to Payment</a>
                       </div>
                       </form>
               </div>

<script>
    document.getElementById('proceedToPayment').addEventListener('click', function () {
        // Collect the data you want to send to the payment service
        const fullName = "<%= request.getParameter("fullName") %>";
        const gender = "<%= request.getParameter("gender") %>";
        const address = "<%= request.getParameter("address") %>";
        const email = "<%= request.getParameter("email") %>";
        const mobile = "<%= request.getParameter("mobile") %>";
        const noOfRooms = "<%= request.getParameter("noOfRooms") %>";
        const checkInDate = "<%= request.getParameter("checkInDate") %>";
        const checkOutDate = "<%= request.getParameter("checkOutDate") %>";
        const numberOfDays = "<%= request.getParameter("noOfDays") %>";
        const hotelName = "<%= request.getParameter("hotel-name") %>";
        const location = "<%= request.getParameter("hotel-location") %>";
        const price = "<%= request.getParameter("hotel-price") %>";
        const totalPrice = "<%= request.getParameter("total-Price") %>";

        // Create a JavaScript object with the data
        const bookingData = {
            fullName,
            gender,
            address,
            email,
            mobile,
            noOfRooms,
            checkInDate,
            checkOutDate,
            numberOfDays,
            hotelName,
            location,
            price,
            totalPrice
        };

        // Send the data to the payment service (replace 'payment-service-url' with the actual URL)
        fetch('payment-service-url', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(bookingData)
        })
        .then(response => {
            if (response.ok) {
                // Handle success, e.g., redirect to the payment page
                window.location.href = 'payment-page-url'; // Replace with your payment page URL
            } else {
                console.error('Failed to send data to the payment service.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
    </script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hotel Management</title>
  <style>
         body {
                        font-family: Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                        background: url('<%= request.getContextPath() %>/Image/Background/Hotel.jpg');
                        background-size: cover;
                        background-color: rgba(255, 255, 255, 0.1);
                        background-position: center center;
                        background-attachment: fixed;
                        background-repeat: no-repeat;

                    }
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            border: 2px solid black;
        }

        h1 {
            margin: 0;
        }

        .container {
              background-color: rgba(255, 255, 255, 0.1);
              box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
              max-width: 1200px;
              margin: 20px auto;
              padding: 20px;
              display: grid;
              grid-template-columns: repeat(3, 1fr);
              grid-gap: 20px;
              border: 10px solid blue;
              box-shadow: 0px 0px 10px rgba(0, 0, 0, 20);
      }

        .hotel-card {
           background-color: rgba(255, 255, 255, 0.4);
            position: relative;
            width: 300px;
            height: 100%;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 0;
            justify-content: space-between;
            border: 5px solid skyblue;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 20);
        }

          .hotel-card-content {
              display: flex;
              flex-grow: 1;
              flex-direction: column;
              height: 50%;
              margin-bottom: 0;
             box-shadow: 0px 0px 10px rgba(0, 0, 0, 20);


          }

        .hotel-images {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            overflow: hidden;
            height: 200px;
            border: 2px solid blue;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 15);

        }

        .hotel-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: opacity 0.3s ease;
            display: none;
        }

        .active {
            display: block;
            opacity: 1;
        }

        .prev-image-button,
        .next-image-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 24px;
        }

        .prev-image-button {
            left: 10px;

        }

        .next-image-button {
            right: 10px;
        }


        .hotel-card-info {
            padding: 10px;
            font-weight: bold;
            color: black;
            flex-grow: 1;
            margin-bottom: auto;
        }

        .hotel-name {
            font-size: 24px;
            color: blue;
            margin: 0 0 10px;

        }

        .hotel-rating {
            font-size: 18px;
            color: #f39c12;
        }

        .hotel-price {
            font-size: 20px;
            color: red;
            margin-top: 10px;
        }

        .hotel-location {
            font-size: 16px;
            color: #333;
            margin-top: 10px;
        }

        .book-button {
            font-weight: bold;
            background-color: Blue;
            color: black;
            display: block;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 0;
            width: 100%;
            transition: background-color 0.3s ease;
            margin-bottom: 5px;
            border: 4px solid black;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 20);

        }
        .book-button:hover {
                      background-color: skyblue;

                  }

        .book-button-wrapper {
              margin-top: 0;
              background-color: skyblue;
            }

    </style>
</head>
<body>
<header>
  <h1>Hotel Management</h1>
</header>
<div class="container">

 <div class="hotel-card">
   <div class="hotel-images">
            <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
            <img src="Image/Background/HotelA.jpg" alt="Hotel Image 1" class="hotel-image active">
            <img src="Image/Background/HotelA 1.jpg" alt="Hotel Image 2" class="hotel-image">
            <img src="Image/Background/HotelA 2.jpg" alt="Hotel Image 3" class="hotel-image">
            <img src="Image/Background/HotelA 3.jpeg" alt="Hotel Image 4" class="hotel-image">
            <img src="Image/Background/HotelA 4.jpeg" alt="Hotel Image 5" class="hotel-image">
            <img src="Image/Background/HotelA 5.jpg" alt="Hotel Image 5" class="hotel-image">
            <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
        </div>
    <div class="hotel-card-content">
     <div class="hotel-card-info">
         <div class="hotel-name">Blue Bells Resort</div>
         <div class="hotel-rating">Rating:- 4.2</div>
         <div class="hotel-price">Price:- ₹ 2,500/night</div>
         <div class="hotel-location">Location:- Goa</div>
         <div class="hotel-description">Description:- A luxurious beachfront hotel with stunning view of Arabian Sea .</div>
         <div class="hotel-amenities">Amenities:- Free Wi-Fi, Gym, Restaurant, Swimming Pool</div>
      <div class="hotel-contact">Contact:- contact@bluebells.com</div>
      </div>
       <div class="book-button-wrapper">
        <form action="Booking" method="post">
                <input type="hidden" name="hotel-name" value="Blue Bells Resort">
                <input type="hidden" name="hotel-location" value="Goa">
                <input type="hidden" name="hotel-price" value="2,500/night">
                <button class="book-button">Book Now</button>
         </form>
       </div>
    </div>
 </div>

 <div class="hotel-card">
         <div class="hotel-images">
             <button class="prev-image-button" onclick="prevImage()">&#10094;</button>
             <button class="next-image-button" onclick="nextImage()">&#10095;</button>
             <img src="Image/Background/HotelB.jpg" alt="Hotel Image 1" class="hotel-image active">
             <img src="Image/Background/HotelB 1.jpg" alt="Hotel Image 2" class="hotel-image">
             <img src="Image/Background/HotelB 2.jpeg" alt="Hotel Image 3" class="hotel-image">
             <img src="Image/Background/HotelB 3.jpeg" alt="Hotel Image 4" class="hotel-image">
             <img src="Image/Background/HotelB 4.jpg" alt="Hotel Image 4" class="hotel-image">
         </div>
         <div class="hotel-card-content">
         <div class="hotel-card-info">
           <div class="hotel-name">Tha Lazy Stay</div>
           <div class="hotel-rating">Rating:- 4.5</div>
           <div class="hotel-price">Price:- ₹ 3,500/night</div>
           <div class="hotel-location">Location:- Mumbai</div>
           <div class="hotel-description">Description:- A luxurious hotel in the heart of the city.</div>
           <div class="hotel-amenities">Amenities:- Free Wi-Fi, Gym, Restaurant, Swimming Pool, Parking</div>
           <div class="hotel-contact">Contact:- contact@thelazystay.com</div>
           </div>
           <div class="book-button-wrapper">
            <form action="Booking" method="post">
                 <input type="hidden" name="hotel-name" value="Tha Lazy Stay">
                 <input type="hidden" name="hotel-location" value="Mumbai">
                 <input type="hidden" name="hotel-price" value="3,500/night">
                 <button class="book-button">Book Now</button>
             </form>
           </div>
         </div>
   </div>

   <div class="hotel-card">
       <div class="hotel-images">
           <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
           <img src="Image/Background/HotelC.jpg" alt="Hotel Image 1" class="hotel-image active">
           <img src="Image/Background/HotelC 1.jpg" alt="Hotel Image 2" class="hotel-image">
           <img src="Image/Background/HotelC 2.jpg" alt="Hotel Image 3" class="hotel-image">
           <img src="Image/Background/HotelC 3.jpg" alt="Hotel Image 4" class="hotel-image">
           <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
       </div>
       <div class="hotel-card-content">
           <div class="hotel-card-info">
               <div class="hotel-name">Deluxe Hotel</div>
               <div class="hotel-rating">Rating:- 3.8</div>
               <div class="hotel-price">Price:- ₹ 1,800/night</div>
               <div class="hotel-location">Location:- Delhi</div>
               <div class="hotel-description">Description:- A comfortable hotel in the heart of Delhi.</div>
               <div class="hotel-amenities">Amenities:- Free Wi-Fi, Restaurant, Parking</div>
               <div class="hotel-contact">Contact:- contact@deluxehotel.com</div>
           </div>
           <div class="book-button-wrapper">
              <form action="Booking" method="post">
                   <input type="hidden" name="hotel-name" value="Tha Lazy Stay">
                   <input type="hidden" name="hotel-location" value="Mumbai">
                   <input type="hidden" name="hotel-price" value="3,500/night">
                   <button class="book-button">Book Now</button>
               </form>
           </div>
       </div>
   </div>

   <div class="hotel-card">
       <div class="hotel-images">
           <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
           <img src="Image/Background/HotelD.jpg" alt="Hotel Image 1" class="hotel-image active">
           <img src="Image/Background/HotelD 1.jpg" alt="Hotel Image 2" class="hotel-image">
           <img src="Image/Background/HotelD 2.jpg" alt="Hotel Image 3" class="hotel-image">
           <img src="Image/Background/HotelD 3.jpeg" alt="Hotel Image 4" class="hotel-image">
           <img src="Image/Background/HotelD 4.jpg" alt="Hotel Image 5" class="hotel-image">
           <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
       </div>
       <div class="hotel-card-content">
           <div class="hotel-card-info">
               <div class="hotel-name">Mumbai Heights</div>
               <div class="hotel-rating">Rating:- 4.0</div>
               <div class="hotel-price">Price:- ₹ 2,000/night</div>
               <div class="hotel-location">Location:- Mumbai</div>
               <div class="hotel-description">Description:- Enjoy your stay with stunning views of Mumbai.</div>
               <div class="hotel-amenities">Amenities:- Free Wi-Fi, Gym, Restaurant</div>
               <div class="hotel-contact">Contact:- contact@mumbaiheights.com</div>
           </div>
          <div class="book-button-wrapper">
            <form action="Booking" method="post">
                 <input type="hidden" name="hotel-name" value="Mumbai Heights">
                 <input type="hidden" name="hotel-location" value="Mumbai">
                 <input type="hidden" name="hotel-price" value="2,000/night">
                 <button class="book-button">Book Now</button>
            </form>
          </div>
       </div>
   </div>

   <div class="hotel-card">
       <div class="hotel-images">
           <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
           <img src="Image/Background/HotelE.jpg" alt="Hotel Image 1" class="hotel-image active">
           <img src="Image/Background/HotelE 1.jpg" alt="Hotel Image 2" class="hotel-image">
           <img src="Image/Background/HotelE 2.jpeg" alt="Hotel Image 3" class="hotel-image">
           <img src="Image/Background/HotelE 3.jpg" alt="Hotel Image 4" class="hotel-image">
           <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
       </div>
       <div class="hotel-card-content">
           <div class="hotel-card-info">
               <div class="hotel-name">Golden Sands Resort</div>
               <div class="hotel-rating">Rating:- 3.5</div>
               <div class="hotel-price">Price:- ₹ 1,500/night</div>
               <div class="hotel-location">Location:- Goa</div>
               <div class="hotel-description">Description:- A peaceful resort on the shores of Goa.</div>
               <div class="hotel-amenities">Amenities:- Free Wi-Fi, Swimming Pool, Restaurant</div>
               <div class="hotel-contact">Contact:- contact@goldensandsresort.com</div>
           </div>
         <div class="book-button-wrapper">
             <form action="Booking" method="post">
                  <input type="hidden" name="hotel-name" value="Golden Sands Resort">
                  <input type="hidden" name="hotel-location" value="Goa">
                  <input type="hidden" name="hotel-price" value="1,500/night">
                  <button class="book-button">Book Now</button>
             </form>
         </div>
       </div>
   </div>

   <div class="hotel-card">
     <div class="hotel-images">
         <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
           <img src="Image/Background/HotelF.jpg" alt="Hotel Image 1" class="hotel-image active">
           <img src="Image/Background/HotelF 1.jpg" alt="Hotel Image 2" class="hotel-image">
           <img src="Image/Background/HotelF 2.jpg" alt="Hotel Image 3" class="hotel-image">
           <img src="Image/Background/HotelF 3.jpeg" alt="Hotel Image 4" class="hotel-image">
           <img src="Image/Background/HotelF 4.jpg" alt="Hotel Image 5" class="hotel-image">
           <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
         </div>
      <div class="hotel-card-content">
           <div class="hotel-card-info">
           <div class="hotel-name">Hotel Y</div>
           <div class="hotel-rating">Rating:- 4.2</div>
           <div class="hotel-price">Price:- ₹ 2,300/night</div>
           <div class="hotel-location">Location:- Mumbai</div>
           <div class="hotel-description">Description:- A stylish hotel with a view of the city skyline.</div>
           <div class="hotel-amenities">Amenities:- Free Wi-Fi, Spa, Restaurant</div>
           <div class="hotel-contact">Contact:- contact@hotely.com</div>
         </div>
        <div class="book-button-wrapper">
           <form action="Booking" method="post">
              <input type="hidden" name="hotel-name" value="Hotel Y">
              <input type="hidden" name="hotel-location" value="Mumbai">
              <input type="hidden" name="hotel-price" value="2,300/night">
              <button class="book-button">Book Now</button>
            </form>
        </div>
      </div>
     </div>

       <!-- Hotel 11 -->
       <div class="hotel-card">
           <div class="hotel-images">
               <button class="prev-image-button" onclick="prevImage(11)">&#10094;</button>
               <img src="Image/Background/HotelG.jpeg" alt="Hotel Image 1" class="hotel-image active">
               <img src="Image/Background/HotelG 1.jpeg" alt="Hotel Image 2" class="hotel-image">
               <img src="Image/Background/HotelG 2.jpg" alt="Hotel Image 3" class="hotel-image">
               <img src="Image/Background/HotelG 3.jpg" alt="Hotel Image 4" class="hotel-image">
               <img src="Image/Background/HotelG 4.jpeg" alt="Hotel Image 5" class="hotel-image">
               <img src="Image/Background/HotelG 5.jpg" alt="Hotel Image 6" class="hotel-image">
               <button class="next-image-button" onclick="nextImage(11)">&#10095;</button>
           </div>
           <div class="hotel-card-content">
               <div class="hotel-card-info">
                   <div class="hotel-name">Garden Paradise</div>
                   <div class="hotel-rating">Rating:- 4.4</div>
                   <div class="hotel-price">Price:- ₹ 2,300/night</div>
                   <div class="hotel-location">Location:- Goa</div>
                   <div class="hotel-description">Description:- A peaceful retreat amidst lush greenery in Goa.</div>
                   <div class="hotel-amenities">Amenities:- Pool, Spa, Beach Access</div>
                   <div class="hotel-contact">Contact:- contact@gardenparadise.com</div>
               </div>
               <div class="book-button-wrapper">
                 <form action="Booking" method="post">
                     <input type="hidden" name="hotel-name" value="Garden Paradise">
                     <input type="hidden" name="hotel-location" value="Goa">
                     <input type="hidden" name="hotel-price" value="2,300/night">
                     <button class="book-button">Book Now</button>
                 </form>
           </div>
         </div>
     </div>

       <!-- Hotel 12 -->
       <div class="hotel-card">
           <div class="hotel-images">
               <button class="prev-image-button" onclick="prevImage(12)">&#10094;</button>
               <img src="Image/Background/HotelH.jpg" alt="Hotel Image 1" class="hotel-image active">
               <img src="Image/Background/HotelH 1.jpg" alt="Hotel Image 2" class="hotel-image">
               <img src="Image/Background/HotelH 2.jpg" alt="Hotel Image 3" class="hotel-image">
               <img src="Image/Background/HotelH 3.jpg" alt="Hotel Image 4" class="hotel-image">
               <img src="Image/Background/HotelH 4.jpg" alt="Hotel Image 5" class="hotel-image">
               <button class="next-image-button" onclick="nextImage(12)">&#10095;</button>
           </div>
           <div class="hotel-card-content">
              <div class="hotel-card-info">
              <div class="hotel-name">Nautical Inn</div>
              <div class="hotel-rating">Rating:- 4.3</div>
              <div class="hotel-price">Price:- ₹ 2,200/night</div>
              <div class="hotel-location">Location:- Mumbai</div>
              <div class="hotel-description">Description:- A seaside hotel with stunning ocean views in Mumbai.</div>
              <div class="hotel-amenities">Amenities:- Beach Access, Restaurant, Water Sports</div>
              <div class="hotel-contact">Contact:- contact@nauticalinn.com</div>
          </div>
        <div class="book-button-wrapper">
           <form action="Booking" method="post">
               <input type="hidden" name="hotel-name" value="Nautical Inn">
               <input type="hidden" name="hotel-location" value="Mumbai">
               <input type="hidden" name="hotel-price" value="2,200/night">
               <button class="book-button">Book Now</button>
           </form>
         </div>
       </div>
   </div>

   <div class="hotel-card">
        <div class="hotel-images">
            <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
            <img src="Image/Background/HotelI.jpg" alt="Hotel Image 1" class="hotel-image active">
            <img src="Image/Background/HotelI 1.jpg" alt="Hotel Image 2" class="hotel-image">
            <img src="Image/Background/HotelI 2.jpg" alt="Hotel Image 3" class="hotel-image">
            <img src="Image/Background/HotelI 3.jpg" alt="Hotel Image 4" class="hotel-image">
            <img src="Image/Background/HotelI 4.jpg" alt="Hotel Image 5" class="hotel-image">
            <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                </div>
            <div class="hotel-card-content">
            <div class="hotel-card-info">
              <div class="hotel-name">Snowy Peaks Chalet</div>
              <div class="hotel-rating">Rating:- 4.6</div>
              <div class="hotel-price">Price:- ₹ 3,500/night</div>
              <div class="hotel-location">Location:- Manali</div>
              <div class="hotel-description">Description:- Experience the magic of snow-covered mountains in a chalet.</div>
              <div class="hotel-amenities">Amenities:- Free Wi-Fi, Skiing, Fireplace, Mountain View Dining</div>
              <div class="hotel-contact">Contact:- contact@snowypeakschalet.com</div>
              </div>
              <div class="book-button-wrapper">
                <form action="Booking" method="post">
                  <input type="hidden" name="hotel-name" value="Snowy Peaks Chalet">
                  <input type="hidden" name="hotel-location" value="Manali">
                  <input type="hidden" name="hotel-price" value="3,500/night">
                  <button class="book-button">Book Now</button>
               </form>
             </div>
            </div>
         </div>

         <div class="hotel-card">
             <div class="hotel-images">
                     <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                     <img src="Image/Background/HotelJ.jpeg" alt="Hotel Image 1" class="hotel-image active">
                     <img src="Image/Background/HotelJ 1.jpg" alt="Hotel Image 2" class="hotel-image">
                     <img src="Image/Background/HotelJ 2.jpg" alt="Hotel Image 3" class="hotel-image">
                     <img src="Image/Background/HotelJ 3.jpg" alt="Hotel Image 3" class="hotel-image">
                     <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                 </div>
            <div class="hotel-card-content">
             <div class="hotel-card-info">
               <div class="hotel-name">Cityscape Hotel</div>
               <div class="hotel-rating">Rating:- 4.0</div>
               <div class="hotel-price">Price:- ₹ 2,300/night</div>
               <div class="hotel-location">Location:- Delhi</div>
               <div class="hotel-description">Description:- Explore the vibrant culture and history of India's capital.</div>
               <div class="hotel-amenities">Amenities:- Free Wi-Fi, City Tours, Multi-Cuisine Restaurant</div>
               <div class="hotel-contact">Contact:- contact@cityscapehotel.com</div>
             </div>
           <div class="book-button-wrapper">
             <form action="Booking" method="post">
               <input type="hidden" name="hotel-name" value="Cityscape Hotel">
               <input type="hidden" name="hotel-location" value="Delhi">
               <input type="hidden" name="hotel-price" value="2,300/night">
               <button class="book-button">Book Now</button>
             </form>
         </div>
        </div>
      </div>

   <div class="hotel-card">
        <div class="hotel-images">
           <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
            <img src="Image/Background/HotelK.jpg" alt="Hotel Image 1" class="hotel-image active">
            <img src="Image/Background/HotelK 1.jpg" alt="Hotel Image 2" class="hotel-image">
            <img src="Image/Background/HotelK 2.jpg" alt="Hotel Image 3" class="hotel-image">
            <img src="Image/Background/HotelK 3.jpg" alt="Hotel Image 4" class="hotel-image">
            <img src="Image/Background/HotelK 4.jpg" alt="Hotel Image 5" class="hotel-image">
            <img src="Image/Background/HotelK 5.jpg" alt="Hotel Image 6" class="hotel-image">
            <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
            </div>
          <div class="hotel-card-content">
           <div class="hotel-card-info">
            <div class="hotel-name">Forest Retreat Cottages</div>
            <div class="hotel-rating">Rating:- 4.4</div>
            <div class="hotel-price">Price:- ₹ 2,700/night</div>
            <div class="hotel-location">Location:- Goa</div>
            <div class="hotel-description">Description:- Experience the tranquility of the Western Ghats in cozy cottages.</div>
            <div class="hotel-amenities">Amenities:- Free Wi-Fi, Nature Trails, Bonfire, Coorg Cuisine</div>
            <div class="hotel-contact">Contact:-  contact@forestretreat.com</div>
            </div>
          <div class="book-button-wrapper">
             <form action="Booking" method="post">
                <input type="hidden" name="hotel-name" value="Forest Retreat Cottages">
                <input type="hidden" name="hotel-location" value="Goa">
                <input type="hidden" name="hotel-price" value="2,700/night">
                <button class="book-button">Book Now</button>
             </form>
           </div>
        </div>
     </div>

           <div class="hotel-card">
               <div class="hotel-images">
                       <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                       <img src="Image/Background/HotelL.jpg" alt="Hotel Image 1" class="hotel-image active">
                       <img src="Image/Background/HotelL 1.jpeg" alt="Hotel Image 2" class="hotel-image">
                       <img src="Image/Background/HotelL 2.jpg" alt="Hotel Image 3" class="hotel-image">
                       <img src="Image/Background/HotelL 3.jpg" alt="Hotel Image 4" class="hotel-image">
                       <img src="Image/Background/HotelL 4.jpg" alt="Hotel Image 5" class="hotel-image">
                       <img src="Image/Background/HotelL 5.jpg" alt="Hotel Image 6" class="hotel-image">
                       <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                   </div>
             <div class="hotel-card-content">
               <div class="hotel-card-info">
                 <div class="hotel-name">Ocean View Resort</div>
                 <div class="hotel-rating">Rating:- 4.1</div>
                 <div class="hotel-price">Price:- ₹ 2,900/night</div>
                 <div class="hotel-location">Location:- Mumbai</div>
                 <div class="hotel-description">Description:-  Enjoy breathtaking views of the ocean from this cozy beachfront resort.</div>
                 <div class="hotel-amenities">Amenities:- Free Wi-Fi, Beach Access, Spa, Restaurant</div>
                 <div class="hotel-contact">Contact:-  contact@oceanviewresort.com</div>
                 </div>
            <div class="book-button-wrapper">
                    <form action="Booking" method="post">
                      <input type="hidden" name="hotel-name" value="Ocean View Resort">
                      <input type="hidden" name="hotel-location" value="Mumbai">
                      <input type="hidden" name="hotel-price" value="2,900/night">
                      <button class="book-button">Book Now</button>
                    </form>
              </div>
           </div>
       </div>

            <div class="hotel-card">
                <div class="hotel-images">
                        <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                        <img src="Image/Background/HotelM.jpg" alt="Hotel Image 1" class="hotel-image active">
                        <img src="Image/Background/HotelM 1.jpg" alt="Hotel Image 2" class="hotel-image">
                        <img src="Image/Background/HotelM 2.jpg" alt="Hotel Image 3" class="hotel-image">
                        <img src="Image/Background/HotelM 3.jpg" alt="Hotel Image 4" class="hotel-image">
                        <img src="Image/Background/HotelM 4.jpg" alt="Hotel Image 5" class="hotel-image">
                        <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                    </div>
              <div class="hotel-card-content">
                <div class="hotel-card-info">
                  <div class="hotel-name">Desert Oasis Resort</div>
                  <div class="hotel-rating">Rating:- 4.5</div>
                  <div class="hotel-price">Price:- ₹ 2,500/night</div>
                  <div class="hotel-location">Location:- Jaisalmer</div>
                  <div class="hotel-description">Description:- Stay in luxurious tents in the heart of the Thar Desert.</div>
                  <div class="hotel-amenities">Amenities:-  Free Wi-Fi, Camel Safari, Cultural Evening, Desert Dining</div>
                  <div class="hotel-contact">Contact:-  contact@desertoasis.com</div>
                  </div>
                  <div class="book-button-wrapper">
                     <form action="Booking" method="post">
                               <input type="hidden" name="hotel-name" value="Desert Oasis Resort">
                               <input type="hidden" name="hotel-location" value="Jaisalmer">
                               <input type="hidden" name="hotel-price" value="2,500/night">
                               <button class="book-button">Book Now</button>
                          </form>
                   </div>
                </div>
             </div>

             <div class="hotel-card">
                 <div class="hotel-images">
                         <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                         <img src="Image/Background/HotelN.jpg" alt="Hotel Image 1" class="hotel-image active">
                         <img src="Image/Background/HotelN 1.jpg" alt="Hotel Image 2" class="hotel-image">
                         <img src="Image/Background/HotelN 2.jpg" alt="Hotel Image 3" class="hotel-image">
                         <img src="Image/Background/HotelN 3.jpeg" alt="Hotel Image 4" class="hotel-image">
                         <img src="Image/Background/HotelN 4.jpg" alt="Hotel Image 5" class="hotel-image">
                         <img src="Image/Background/HotelN 5.jpg" alt="Hotel Image 6" class="hotel-image">
                         <img src="Image/Background/HotelN 6.jpg" alt="Hotel Image 7" class="hotel-image">
                         <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                     </div>
               <div class="hotel-card-content">
                 <div class="hotel-card-info">
                   <div class="hotel-name">Hillside Haven Hotel</div>
                   <div class="hotel-rating">Rating:- 4.4</div>
                   <div class="hotel-price">Price:- ₹ 3,500/night</div>
                   <div class="hotel-location">Location:- Ooty</div>
                   <div class="hotel-description">Description:- Enjoy the cool climate and lush greenery of the Nilgiri Hills.</div>
                   <div class="hotel-amenities">Amenities:- Free Wi-Fi, Trekking, Spa, Hilltop Restaurant</div>
                   <div class="hotel-contact">Contact:-  contact@hillsidehaven.com</div>
                   </div>
                   <div class="book-button-wrapper">
                      <form action="Booking" method="post">
                            <input type="hidden" name="hotel-name" value="Hillside Haven Hotel">
                            <input type="hidden" name="hotel-location" value="Ooty">
                            <input type="hidden" name="hotel-price" value="3,500/night">
                            <button class="book-button">Book Now</button>
                      </form>
                   </div>
                 </div>
              </div>

              <div class="hotel-card">
                  <div class="hotel-images">
                          <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                          <img src="Image/Background/HotelO.jpg" alt="Hotel Image 1" class="hotel-image active">
                          <img src="Image/Background/HotelO 1.jpg" alt="Hotel Image 2" class="hotel-image">
                          <img src="Image/Background/HotelO 2.jpg" alt="Hotel Image 3" class="hotel-image">
                          <img src="Image/Background/HotelO 3.jpg" alt="Hotel Image 4" class="hotel-image">
                          <img src="Image/Background/HotelO 4.jpg" alt="Hotel Image 5" class="hotel-image">
                          <img src="Image/Background/HotelO 5.jpg" alt="Hotel Image 6" class="hotel-image">
                          <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                      </div>
                 <div class="hotel-card-content">
                  <div class="hotel-card-info">
                    <div class="hotel-name">Paradise Beach Resort</div>
                    <div class="hotel-rating">Rating:- 4.5</div>
                    <div class="hotel-price">Price:- ₹ 2,800/night</div>
                    <div class="hotel-location">Location:- Goa</div>
                    <div class="hotel-description">Description:- Relax in overwater bungalows on a pristine tropical island.</div>
                    <div class="hotel-amenities">Amenities:- Water Sports, Spa, Beachfront Dining, Sunset Views</div>
                    <div class="hotel-contact">Contact:-  contact@paradisebeachresort.com</div>
                    </div>
                    <div class="book-button-wrapper">
                           <form action="Booking" method="post">
                                <input type="hidden" name="hotel-name" value="Paradise Beach Resort">
                                <input type="hidden" name="hotel-location" value="Goa">
                                <input type="hidden" name="hotel-price" value="2,800/night">
                                <button class="book-button">Book Now</button>
                           </form>
                       </div>
                  </div>
               </div>

               <div class="hotel-card">
                                <div class="hotel-images">
                                        <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                                        <img src="Image/Background/HotelP.jpg" alt="Hotel Image 1" class="hotel-image active">
                                        <img src="Image/Background/HotelP 1.jpg" alt="Hotel Image 2" class="hotel-image">
                                        <img src="Image/Background/HotelP 2.jpg" alt="Hotel Image 3" class="hotel-image">
                                        <img src="Image/Background/HotelP 3.jpg" alt="Hotel Image 4" class="hotel-image">
                                        <img src="Image/Background/HotelP 4.jpg" alt="Hotel Image 5" class="hotel-image">
                                        <img src="Image/Background/HotelP 5.jpeg" alt="Hotel Image 5" class="hotel-image">
                                        <img src="Image/Background/HotelP 6.jpeg" alt="Hotel Image 5" class="hotel-image">
                                        <img src="Image/Background/HotelP 7.jpg" alt="Hotel Image 5" class="hotel-image">
                                        <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                                    </div>
                               <div class="hotel-card-content">
                                <div class="hotel-card-info">
                                  <div class="hotel-name">Lakeside Tranquility Lodge</div>
                                  <div class="hotel-rating">Rating:- 4.5</div>
                                  <div class="hotel-price">Price:- ₹ 2,600/night</div>
                                  <div class="hotel-location">Location:- Hyderabad</div>
                                  <div class="hotel-description">Description:- Stay by the lake for a peaceful and nature-filled retreat.</div>
                                  <div class="hotel-amenities">Amenities:- Spa, Lake View Rooms, Garden, Boating</div>
                                  <div class="hotel-contact">Contact:-  contact@lakesidetranquility.com</div>
                                  </div>
                                  <div class="book-button-wrapper">
                                      <form action="Booking" method="post">
                                           <input type="hidden" name="hotel-name" value="Lakeside Tranquility Lodge">
                                           <input type="hidden" name="hotel-location" value="Hyderabad">
                                           <input type="hidden" name="hotel-price" value="2,600/night">
                                          <button class="book-button">Book Now</button>
                                        </form>
                                    </div>
                                </div>
                             </div>

         <div class="hotel-card">
            <div class="hotel-images">
               <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                <img src="Image/Background/HotelQ.jpg" alt="Hotel Image 1" class="hotel-image active">
                 <img src="Image/Background/HotelQ 1.jpeg" alt="Hotel Image 2" class="hotel-image">
                  <img src="Image/Background/HotelQ 2.jpg" alt="Hotel Image 3" class="hotel-image">
                   <img src="Image/Background/HotelQ 3.jpg" alt="Hotel Image 4" class="hotel-image">
                   <img src="Image/Background/HotelQ 4.jpg" alt="Hotel Image 5" class="hotel-image">
                   <img src="Image/Background/HotelQ 6.jpg" alt="Hotel Image 5" class="hotel-image">
                   <img src="Image/Background/HotelQ 7.jpg" alt="Hotel Image 5" class="hotel-image">
                    <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                    </div>
                         <div class="hotel-card-content">
                          <div class="hotel-card-info">
                            <div class="hotel-name">Palm Grove Retreat</div>
                            <div class="hotel-rating">Rating:- 4.5</div>
                            <div class="hotel-price">Price:- ₹ 3,000/night</div>
                            <div class="hotel-location">Location:- Goa</div>
                            <div class="hotel-description">Description:- Palm Grove Retreat is a serene oasis in Goa, surrounded by palm trees and a tropical garden. </div>
                            <div class="hotel-amenities">Amenities:- Free Wi-Fi, Swimming Pool, Poolside Bar</div>
                            <div class="hotel-contact">Contact:-  contact@palmgroveretreat.com</div>
                            </div>
                            <div class="book-button-wrapper">
                                            <form action="Booking" method="post">
                                               <input type="hidden" name="hotel-name" value="Palm Grove Retreat">
                                               <input type="hidden" name="hotel-location" value="Goa">
                                               <input type="hidden" name="hotel-price" value="3,000/night">
                                              <button class="book-button">Book Now</button>
                                            </form>
                                  </div>
                          </div>
                       </div>

            <div class="hotel-card">
              <div class="hotel-images">
               <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                <img src="Image/Background/HotelR.jpg" alt="Hotel Image 1" class="hotel-image active">
                <img src="Image/Background/HotelR 1.jpg" alt="Hotel Image 2" class="hotel-image">
                <img src="Image/Background/HotelR 2.jpg" alt="Hotel Image 3" class="hotel-image">
                <img src="Image/Background/HotelR 3.jpg" alt="Hotel Image 4" class="hotel-image">
                <img src="Image/Background/HotelR 4.jpg" alt="Hotel Image 5" class="hotel-image">
                 <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                                            </div>
                                       <div class="hotel-card-content">
                                        <div class="hotel-card-info">
                                          <div class="hotel-name">Gardenia Grand Hotel</div>
                                          <div class="hotel-rating">Rating:- 4.1</div>
                                          <div class="hotel-price">Price:- ₹ 3,200/night</div>
                                          <div class="hotel-location">Location:- Bengaluru</div>
                                          <div class="hotel-description">Description:- Gardenia Grand Hotel in Bengaluru offers a perfect blend of modern luxury and convenience.</div>
                                          <div class="hotel-amenities">Amenities:- Free Wi-Fi, Swimming Pool, Poolside Bar</div>
                                          <div class="hotel-contact">Contact:-  contact@gardeniagrandhotel.com</div>
                                          </div>
                                          <div class="book-button-wrapper">
                                                  <form action="Booking" method="post">
                                                     <input type="hidden" name="hotel-name" value="Gardenia Grand Hotel">
                                                     <input type="hidden" name="hotel-location" value="Bengaluru">
                                                     <input type="hidden" name="hotel-price" value="3,200/night">
                                                    <button class="book-button">Book Now</button>
                                                  </form>
                                               </div>
                                        </div>
                                     </div>

                                     <div class="hotel-card">
                                       <div class="hotel-images">
                                      <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                                      <img src="Image/Background/HotelS.jpg" alt="Hotel Image 1" class="hotel-image active">
                                      <img src="Image/Background/HotelS 1.jpg" alt="Hotel Image 2" class="hotel-image">
                                       <img src="Image/Background/HotelS 2.jpg" alt="Hotel Image 3" class="hotel-image">
                                       <img src="Image/Background/HotelS 3.jpg" alt="Hotel Image 4" class="hotel-image">
                                       <img src="Image/Background/HotelS 4.jpg" alt="Hotel Image 5" class="hotel-image">
                                       <img src="Image/Background/HotelS 5.jpg" alt="Hotel Image 5" class="hotel-image">
                                    <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
            </div>
       <div class="hotel-card-content">
               <div class="hotel-card-info">
                <div class="hotel-name">Beachside Bungalow</div>
                <div class="hotel-rating">Rating:- 4.3</div>
                <div class="hotel-price">Price:- ₹ 3,300/night</div>
                <div class="hotel-location">Location:- Goa</div>
                <div class="hotel-description">Description:- Quaint bungalows near the beach for a relaxed vacation</div>
                <div class="hotel-amenities">Amenities:- Beachfront Location, Hammocks, Seafood Dining, Spa, Beachfront Dining, Sunset Views</div>
                <div class="hotel-contact">Contact:-  contact@beachsideretreat.com</div>
          </div>
          <div class="book-button-wrapper">
                  <form action="Booking" method="post">
                       <input type="hidden" name="hotel-name" value="Beachside Bungalow">
                       <input type="hidden" name="hotel-location" value="Goa">
                       <input type="hidden" name="hotel-price" value="3,300/night">
                       <button class="book-button">Book Now</button>
                  </form>
          </div>
        </div>
      </div>

                  <div class="hotel-card">
                   <div class="hotel-images">
                     <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
                      <img src="Image/Background/HotelT.jpeg" alt="Hotel Image 1" class="hotel-image active">
                       <img src="Image/Background/HotelT 1.jpg" alt="Hotel Image 2" class="hotel-image">
                       <img src="Image/Background/HotelT 2.jpg" alt="Hotel Image 3" class="hotel-image">
                       <img src="Image/Background/HotelT 3.jpg" alt="Hotel Image 4" class="hotel-image">
                       <img src="Image/Background/HotelT 4.jpg" alt="Hotel Image 5" class="hotel-image">
                       <img src="Image/Background/HotelT 5.jpeg" alt="Hotel Image 5" class="hotel-image">
                       <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
                       </div>
              <div class="hotel-card-content">
                <div class="hotel-card-info">
                <div class="hotel-name">Boutique Bliss</div>
                <div class="hotel-rating">Rating:- 4.5</div>
                <div class="hotel-price">Price:- ₹ 2,800/night</div>
                <div class="hotel-location">Location:- Mumbai</div>
                <div class="hotel-description">Description:- Experience luxury and personalized service at this boutique hotel.</div>
                <div class="hotel-amenities">Amenities:- Spa, Fine Dining Restaurant, Butler Service</div>
                <div class="hotel-contact">Contact:- contact@boutiquebliss.com</div>
                </div>
               <div class="book-button-wrapper">
                  <form action="Booking" method="post">
                       <input type="hidden" name="hotel-name" value="Boutique Bliss">
                       <input type="hidden" name="hotel-location" value="Mumbai">
                       <input type="hidden" name="hotel-price" value="2,800/night">
                       <button class="book-button">Book Now</button>
                  </form>
           </div>
       </div>
    </div>

     <div class="hotel-card">
          <div class="hotel-images">
          <button class="prev-image-button" onclick="prevImage(1)">&#10094;</button>
          <img src="Image/Background/HotelU.jpg" alt="Hotel Image 1" class="hotel-image active">
          <img src="Image/Background/HotelU 1.jpg" alt="Hotel Image 2" class="hotel-image">
          <img src="Image/Background/HotelU 2.jpg" alt="Hotel Image 3" class="hotel-image">
          <img src="Image/Background/HotelU 3.jpg" alt="Hotel Image 4" class="hotel-image">
          <img src="Image/Background/HotelU 4.jpg" alt="Hotel Image 5" class="hotel-image">
          <img src="Image/Background/HotelU 5.jpg" alt="Hotel Image 5" class="hotel-image">
          <button class="next-image-button" onclick="nextImage(1)">&#10095;</button>
         </div>
           <div class="hotel-card-content">
           <div class="hotel-card-info">
           <div class="hotel-name">Metro Heights Lodge</div>
           <div class="hotel-rating">Rating:- 4.5</div>
           <div class="hotel-price">Price:- ₹ 4,800/night</div>
           <div class="hotel-location">Location:- Mumbai</div>
           <div class="hotel-description">Description:- Metro Heights Lodge is your home away from home in Mumbai</div>
           <div class="hotel-amenities">Amenities:- Spa, Beautiful SwimmingPool, Gym, Restaurant</div>
           <div class="hotel-contact">Contact:-  contact@metroheights.com</div>
          </div>
             <div class="book-button-wrapper">
               <form action="Booking" method="post">
                   <input type="hidden" name="hotel-name" value="Metro Heights Lodge">
                   <input type="hidden" name="hotel-location" value="Mumbai">
                   <input type="hidden" name="hotel-price" value="4,800/night">
                  <button class="book-button">Book Now</button>
                </form>
       </div>
     </div>
  </div>
</div>
<script>
    const hotelCards = document.querySelectorAll(".hotel-card");
    let currentCardIndex = 0;

    initializeCardNavigation(0);

    function initializeCardNavigation(cardIndex) {
        const cardImages = hotelCards[cardIndex].querySelectorAll(".hotel-image");
        let currentImageIndex = 0;

        function showImage(index) {
            if (index < 0) {
                index = cardImages.length - 1;
            } else if (index >= cardImages.length) {
                index = 0;
            }

            for (let i = 0; i < cardImages.length; i++) {
                cardImages[i].classList.remove("active");
            }

            cardImages[index].classList.add("active");
            currentImageIndex = index;
        }

        function prevImage() {
            showImage(currentImageIndex - 1);
        }

        function nextImage() {
            showImage(currentImageIndex + 1);
        }

        const prevButton = hotelCards[cardIndex].querySelector(".prev-image-button");
        const nextButton = hotelCards[cardIndex].querySelector(".next-image-button");

        prevButton.addEventListener("click", () => {
            prevImage();
        });

        nextButton.addEventListener("click", () => {
            nextImage();
        });
    }

    hotelCards.forEach((card, index) => {
        initializeCardNavigation(index);
    });
</script>
</body>
</html>



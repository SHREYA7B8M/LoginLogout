<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LoginGrocery.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        body {
            background-image: url('data:image/jpeg;base64,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');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="body">
        <div class="cards1">
            <div class="card1">
            </div>
        </div>
        
        <h2>Must-Try This Week</h2>
        <div class="cards">
            <div class="card" style="background-image: url('https://img.freepik.com/free-photo/colorful-fruits-tasty-fresh-ripe-juicy-white-desk_179666-169.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1697328000&semt=ais');">
                <h2>Exotic delights for you</h2>
                <p>Up to 25% off</p>
            </div>
            <div class="card" style="background-image: url('https://cdn.shopaccino.com/refresh/articles/asre-906919_l.jpg');">
                <p1><h2>Whole spices</h2></p1>
                <p1>Up to 25% off</p1>
            </div>
            <div class="card" style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpmS5IAS6i9BrMMh3UW-u8YW-Um05BXuqL-Q&usqp=CAU');">
                <h2>Make-up must-haves</h2>
                <p>Up to 25% off</p>
            </div>
            <div class="card" style="background-image: url('https://thumbs.dreamstime.com/z/toothpaste-brush-stand-blue-background-tilt-rest-toothbrush-tube-tooth-paste-hygiene-oral-clean-dental-product-white-144508042.jpg');">
                <p1><h2>Confident smiles start here</h2></p1>
                <p1>Up to 35% off</p1>
            </div>
            <div class="card"style="background-image: url('https://cdn.shopify.com/s/files/1/2598/1404/files/WhatsApp_Image_2023-05-10_at_1-compressed_4_480x480.jpg?v=1683705810');">
                <p1><h2>Healthy oil & ghee</h2></p1>
                <p1>Up to 20% off</p1>
            </div>
            <div class="card"style="background-image: url('https://gumlet.assettype.com/homegrown%2Fimport%2Fbook%2F12657-mfleomcxnw-1605165754.jpeg?format=auto');">
                <p1><h2>Home grown brands</h2></p1>
                <p1>Up to 25% off</p1>
            </div>
        </div>
    </div>
    <style>
    /* Header Styles */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #3e4a61;
    padding: 20px;
    color: #fff;
}

.logo img {
    width: 150px; /* Adjust the size as needed */
}

.login button {
    background-color: #ff6600;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

.login button:hover {
    background-color: #e65500; /* Darker shade on hover */
}

/* Body Styles */
.body {
    padding: 20px;
}

.cards1 {
    display: flex;
    justify-content: center;
    align-items: center;
  }

.cards {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .card1 {
    background-image: url(https://quotefancy.com/media/wallpaper/3840x2160/7699702-Bill-Parcells-Quote-If-they-want-you-to-cook-the-dinner-at-least.jpg);
    background-position: 0%;
    background-size:cover;
    height: 250px;
    width: 1000px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    padding: 10px;
    margin: 20px;
    text-align: center;
    box-shadow: 2px 2px 7px gray;
    cursor: pointer;
}
 
.card {
    background-position: 0%;
    background-size:cover;
    height: 250px;
    width: 200px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    padding: 20px;
    margin: 10px;
    text-align: center;
    transition: transform 0.3s;
    box-shadow: 2px 2px 7px gray;
    cursor: pointer;
}


.card:hover {
    transform: scale(1.05); /* Slightly scale up on hover */
}

.card h2 {
    font-size: 20px;
    margin: 10px 0;
}

.card p {
    color: #666;
}

.card p1 {
    color: #ffffff;
}

/* Card Styles for Categories */
.categories {
    width: 100%; /* Full width for category cards */
    margin: 0;
}

.categories .card {
    width: calc(25% - 20px); /* Adjust the width for category cards */
}

/* Footer Styles */
footer {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    background-color: #333;
    color: #fff;
    flex-wrap: wrap;
}

.useful-links, .categories {
    flex: 1;
}

.column {
    font-size: 15px;
    width: 30%; /* Adjust the width for three columns */
    display: inline-block;
    vertical-align: top;
    padding: 0 20px;
    box-sizing: border-box;
}

.ccolumn {
    font-size: 15px;
    width: 45%; /* Adjust the width for three columns */
    display: inline-block;
    vertical-align: top;
    padding: 0 20px;
    box-sizing: border-box;
}

.useful-links ul,.categories ul {
    list-style: none;
  }

.useful-links h3, .categories h3 {
    font-size: 20px;
    margin: 10px 0;
    font-weight: bold;
    text-transform: uppercase;
}

.foot p{
    text-align: center;
}
        </style>

    <footer>
        <div class="useful-links">
            <h3>Useful Links</h3>
            <div class="column">
                <ul>
                    <li>About</li>
                    <li>Careers</li>
                    <li>Blog</li>
                    <li>Press</li>
                    <li>Lead</li>
                    <li>Value</li>
                </ul>
            </div>
            <div class="column">
                <ul>
                    <li>Terms</li>
                    <li>Privacy</li>
                    <li>FAQs</li>
                    <li>Security</li>
                    <li>Mobile</li>
                    <li>Contact</li>
                </ul>
            </div>
            <div class="column">
                <ul>
                    <li>Partner</li>
                    <li>Express</li>
                    <li>Seller</li>
                    <li>Spotlight</li>
                    <li>Warehouse</li>
                    <li>Deliver</li>
                </ul>
            </div>
        </div>
        <div class="categories">
            <h3>Categories</h3>
            <div class="ccolumn">
                <ul>
                    <li>Vegetables & Fruits</li>
                    <li>Dairy & Breakfast</li>
                    <li>Munchies</li>
                    <li>Cold Drinks & Juices</li>
                    <li>Instant & Frozen Food</li>
                    <li>Tea, Coffee & Health Drinks</li>
                    <li>Bakery & Biscuits</li>
                    <li>Sweet Tooth</li>
                    <li>Atta, Rice & Dal</li>
                    <li>Dry Fruits, Masala & Oil</li>
                </ul>
            </div>
            <div class="ccolumn">
                <ul>
                    <li>Sauces & Spreads</li>
                    <li>Chicken, Meat & Fish</li>
                    <li>Organic & Premium</li>
                    <li>Cleaning Essentials</li>
                    <li>Beauty & Cosmetics</li>
                    <li>Personal Care</li>
                    <li>Ice Creams & Frozen Desserts</li>
                    <li>Toys & Games</li>
                </ul>
            </div>
        </div>
        <div class="foot">
            <p>Thank you for choosing ToZepy for your grocery shopping needs! We're committed to making your life easier and your kitchen better stocked. If you have any questions, suggestions, or feedback, please don't hesitate to reach out. Happy shopping!</p>
            <p>&copy; 2023 ToZepy. All rights reserved.</p>
        </div>
        </footer>
    </asp:Content>

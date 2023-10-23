<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LoginGrocery.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        
       <style>

 
    main {
        background-image:url('https://cdn5.vectorstock.com/i/1000x1000/40/44/shopping-pattern-vector-974044.jpg');
        background-size:cover;
        background-repeat: no-repeat;
        padding: 250px;
        color: #fff;
        border-radius: 10px;
    }

     

 #aspnetTitle {
    color: darkorange;
    font-size: 30px;
    font-weight: bold;
    text-align: left;
    text-transform: uppercase;
}


.about-section h1 {
    text-align: left; 
}

.about-section p {
    text-align: left; 
    font-size: 18px; 
    margin: 10px 0;
    color: black ;
    font-weight: bold;


}
.dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            border: 1px solid darkorange; /* Green border */
            min-width: 160px;
            box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-item {
            padding: 10px 20px;
            text-decoration: none;
            display: block;
            color: #333; 
        }

        .dropdown-item:hover {
            background-color: #ff6a00; 
            color: floralwhite; 
        }
   
   
</style>

    <main>
   <section class="row about-section" aria-labelledby="aspnetTitle">
    <h1 id="aspnetTitle">Hola </h1>
    <p class="lead">Welcome to your one stop of Grocery and Everyday Items List</p>
    <p>&nbsp;</p>
</section>


    </main>   
    
</asp:Content>


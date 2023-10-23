<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutAdmin.aspx.cs" Inherits="LoginGrocery.AboutAdmin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>

 
    main {
        background-image:url('https://img.freepik.com/premium-vector/seamless-pattern-grocery-department-store-with-different-food-icons-bright-background_642878-413.jpg?w=2000');
        background-size:cover;
        background-repeat: no-repeat;
        padding: 250px;
        color: #fff;
        border-radius: 10px;
    }

     

 #aspnetTitle {
    color: forestgreen;
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
   
   
</style>

    <main>
   <section class="row about-section" aria-labelledby="aspnetTitle">
    <h1 id="aspnetTitle">Hello Admin </h1>
    <p class="lead">Welcome to your one stop of Grocery and Everyday Items List</p>
    <p>&nbsp;</p>
</section>

    </main>   
    
</asp:Content>

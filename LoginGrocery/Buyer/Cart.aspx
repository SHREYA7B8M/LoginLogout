 <%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="LoginGrocery.Buyer.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Shopping Cart</h2>
        <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="CartGridView_RowCommand" DataKeyNames="CartId" OnSelectedIndexChanged="CartGridView_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Product">

                    <ItemTemplate>
                        <div class="row no-gutters">
                            <div class="col-md-8">

                                <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("ProductImage") %>' CssClass="card-img-top" Width="100" Height="100" />
                            </div>
                            <div class="col-md-12">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ProductName") %></h5>
                                    <%--<p class="card-text"><%# Eval("ProductDescription") %></p>--%>
                                    <p class="card-text"><b>Rs.<%# Eval("Price") %>/-</b></p>
                                    <div class="form-group">
                                        <label for="quantity">Quantity:</label>
                                        <asp:TextBox ID="QuantityTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Quantity") %>' Width="40" ReadOnly="true"></asp:TextBox>
                                       <asp:LinkButton ID="IncreaseButton" runat="server" Text="+" CommandName="AdjustQuantity" CommandArgument='<%# Container.DataItemIndex + ",Increase" %>' CssClass="btn btn-outline-secondary"></asp:LinkButton>
                                       <asp:LinkButton ID="DecreaseButton" runat="server" Text="-" CommandName="AdjustQuantity" CommandArgument='<%# Container.DataItemIndex + ",Decrease" %>' CssClass="btn btn-outline-secondary"></asp:LinkButton>


                                    </div>
                                    <br />
                                    <div class="text-center">
                                        <p class="card-text"><b>Price : Rs.<%# Eval("Price", "{0:C}") %>* <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>' ReadOnly="true" /> = Rs.<%# Eval("TotalCost", "{0:C}") %></b></p>
                                    </div>
                                    <asp:LinkButton ID="RemoveButton" runat="server" Text="Remove From Cart" CommandName="RemoveFromCart" CommandArgument='<%# Eval("CartId") %>' CssClass="btn btn-outline-danger"></asp:LinkButton>
                                   <asp:LinkButton ID="LinkButton1" runat="server" Text="Place Order" CommandName="PlaceOrder" CommandArgument='<%# Eval("CartId") %>' CssClass="btn btn-outline-danger" ></asp:LinkButton>
<%--                                           <asp:LinkButton ID="PlaceOrderButton" runat="server" Text="Place Order"  CssClass="btn btn-primary" OnClick="Place_Order" />--%>

                                </div>

                            </div>
                        </div>

  

                        <div>
     
                            
   

                    </ItemTemplate>
     
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />


    <style>
    .center-box {
        text-align: center;
        border: 1px solid #ccc; /* Add a border around the box */
        padding: 20px; /* Add some padding for spacing */
    }
</style>

<div class="container">
    
        <div class="col-md-8">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="CartGridView_RowCommand" DataKeyNames="CartId" OnSelectedIndexChanged="CartGridView_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                            <!-- Your existing product item template -->
                            <!-- ... (your existing product details) -->
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
<%--        <div class="col-md-4">

            <div class="center-box">
                

                <!-- Address Textbox -->
                <h2>Delivery Address</h2>
                <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" placeholder="Enter Address"></asp:TextBox>

               <!-- Place Order Button -->
         <div class="form-group">
                    <asp:Button class="btn btn-login w-100" ID="Button1" runat="server" Text="Place Order" CssClass="btn btn-primary"    />
                </div>

            </div>
        </div>
    </div>
</div>--%>
    





<div class="container mt-4">
    <h2>Cancellation Policy</h2>
    <p>
        We understand that plans can change, and you may need to cancel an order. For your convenience, we offer a flexible cancellation policy. You can cancel your order up to 03 hours before the scheduled delivery or pickup time without incurring any charges otherwise cancellation charges will be applicable.
    </p>
    <p>
    Orders cannot be cancelled once packed for delivery. In case of expected delays, a reund will be provided, if found applicable.
        </p>
    <p>
        We strive to provide the best service to our customers, and your satisfaction is our priority.
    </p>
</div>
 

     

         

    </div>
</div>
 </asp:Content>
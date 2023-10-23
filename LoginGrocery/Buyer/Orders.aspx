<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="LoginGrocery.Buyer.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container">
        <h2>Order List</h2>
        <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="OrderGridView_SelectedIndexChanged">
            <AlternatingRowStyle BorderColor="#66FF99" BorderStyle="Solid" />
        </asp:GridView>
        <br />
        <!-- Address Textbox -->
        <asp:Label ID="AddressLabel" runat="server" AssociatedControlID="AddressTextBox" Text="Address" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" placeholder="Enter your address" ValidationGroup="OrderValidation" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="AddressRequiredValidator" runat="server" ControlToValidate="AddressTextBox" Display="Dynamic" InitialValue="" ValidationGroup="OrderValidation" ErrorMessage="Address is required." ForeColor="Red" />

        <!-- Pin Code Textbox -->
        <asp:Label ID="PinCodeLabel" runat="server" AssociatedControlID="PinCodeTextBox" Text="Pin Code" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="PinCodeTextBox" runat="server" CssClass="form-control" placeholder="Enter a 6-digit Pin Code" ValidationGroup="OrderValidation" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="PinCodeRequiredValidator" runat="server" ControlToValidate="PinCodeTextBox" Display="Dynamic" InitialValue="" ValidationGroup="OrderValidation" ErrorMessage="Pin Code is required." ForeColor="Red" />
        <asp:RegularExpressionValidator ID="PinCodeValidator" runat="server" ControlToValidate="PinCodeTextBox" Display="Dynamic" ValidationExpression="^\d{6}$" ValidationGroup="OrderValidation" ErrorMessage="Pin Code must be a 6-digit number." ForeColor="Red" />

        <!-- Checkbox for Agreeing to Terms and Conditions -->
        <asp:CheckBox ID="AgreeToTermsCheckBox" runat="server" ValidationGroup="OrderValidation" />
        <label for="AgreeToTermsCheckBox">I agree to the Terms and Conditions and the Cancellation Policy</label>
        <asp:CustomValidator ID="AgreeToTermsValidator" runat="server" ClientValidationFunction="validateAgreeToTerms" Display="Dynamic" ValidationGroup="OrderValidation" ErrorMessage="You must agree to the Terms and Conditions." ForeColor="Red" />

        <!-- Place Order Button -->
        <asp:Button ID="PlaceOrderButton" runat="server" Text="Place Order" CssClass="btn btn-primary" OnClick="PlaceOrderButton_Click" ValidationGroup="OrderValidation" />
    </div>

    <!-- JavaScript for CustomValidator -->
    <script type="text/javascript">
        function validateAgreeToTerms(sender, args) {
            args.IsValid = document.getElementById('<%= AgreeToTermsCheckBox.ClientID %>').checked;
        }
    </script>


    <style>
    /*.container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;*/
        /*border: 1px solid #ccc;
        border-radius: 5px;*/
/*        background-color: #f9f9f9;
*/    /*}*/

    .form-label {
        font-weight: bold;
        margin-bottom: 10px;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .form-control:focus {
        outline: none;
        border-color: #007bff;
    }

    .btn {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>


</asp:Content>

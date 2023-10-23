<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="LoginGrocery.ForgotPassword" %>
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
     <div class="container">
       <div class ="row">
           <div class ="col-md-6 mx-auto">
               <br>
               <div class ="card">
                   <div class ="card-body">
                       
                       <div class ="row">
                           <div class="col">
                               <center>
                                   <img src="Images/UserLogin.png" / width="130" height="130">

                               </center>
                           </div>
                       </div>

                       <div class ="row">
                           <div class="col">
                               <center>
                                   <h3>User Login</h3>

                               </center>
                           </div>
                       </div>

                        <div class ="row">
                           <div class="col">
                               <hr>
                           </div>
                       </div>

                       <div class ="row">
                           <div class="col">
                               <label>User ID</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="UserId" runat="server" placeholder="User ID"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User ID is Required" ControlToValidate="UserId" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserId" ErrorMessage="UserId must contain atleast 3 characters and atleast 1 digit" ForeColor="#CC0000" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]).{3,}$"></asp:RegularExpressionValidator>
                               </div>                               

                               <label>Contact Number</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="ContactNumber" runat="server" placeholder="Contact Number"></asp:TextBox>
                                   
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required" ControlToValidate="ContactNumber" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ContactNumber" ErrorMessage="Contact number must only contain 10 digits" ForeColor="#CC0000" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                               </div>
                               
                               <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                               <label>New Password</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="NewPassword" runat="server" placeholder="Password" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                    <asp:CheckBox ID="pass" runat="server" Text=" Show Password" onclick="showpass(this)" />
                                   <script type="text/javascript">
                                       function showpass(check_box) {
                                           var spass = document.getElementById("NewPassword");
                                           if (check_box.checked)
                                               spass.setAttribute("Type", "Text");
                                           else
                                               spass.setAttribute("Type", "Password");
                                       }
                               </script>

                                   
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is Required" ControlToValidate="NewPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="NewPassword" ErrorMessage="Password must contain atleast 6 characters including atleast 1 special character and 1 digit" ForeColor="#CC0000" ValidationExpression="^(?=.*[a-zA-Z]{3,})(?=.*\d)(?=.*[!@#$%^&amp;*(),.?&quot;:{}|&lt;&gt;]).{6,}$"></asp:RegularExpressionValidator>
                               </div>
                               
                               

                               <div class="form-group">
                                   <asp:Button ID="Button1" class="btn btn-primary w-100 btn-lg" runat="server" Text="Update" OnClick="Button1_Click" />
                                  
                               </div>
                               <br>

                   </div>
               </div>

</asp:Content>

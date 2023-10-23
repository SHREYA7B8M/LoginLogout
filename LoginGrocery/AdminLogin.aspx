<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="LoginGrocery.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
        background-image:url('https://img.freepik.com/premium-vector/seamless-pattern-grocery-department-store-with-different-food-icons-bright-background_642878-413.jpg?w=2000');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
        }

        .logo-image {
            display: block;
            margin: 0 auto;
            width: 130px;
            height: 130px;
        }

        h3 {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            font-size: 16px;
        }

        .btn-login {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #45A148;
        }

        .error-message {
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <center>
                    <img class="logo-image" src="Images/AdminLogin.png" alt="Admin Login">
                </center>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h3>Admin Login</h3>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <hr>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <label for="AdminId">Admin ID</label>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="AdminId" runat="server" placeholder="Admin ID"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Admin ID is Required" ControlToValidate="AdminId" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AdminId" ErrorMessage="UserId must contain at least 3 characters and at least 1 digit" ForeColor="#CC0000" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]).{3,}$"></asp:RegularExpressionValidator>
                </div>

                <label for="Password">Password</label>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="Password" runat="server" placeholder="Password" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                    <asp:CheckBox ID="pass" runat="server" Text="Show Password" onclick="showpass(this)" />
                    <script type="text/javascript">
                        function showpass(check_box) {
                            var spass = document.getElementById("Password");
                            if (check_box.checked)
                                spass.setAttribute("Type", "Text");
                            else
                                spass.setAttribute("Type", "Password");
                        }
                    </script>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password is Required" ControlToValidate="Password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="Password" ErrorMessage="Password must contain at least 6 characters, including at least 1 special character and 1 digit" ForeColor="#CC0000" ValidationExpression="^(?=.*[a-zA-Z]{3,})(?=.*\d)(?=.*[!@#$%^&*(),.?{}|<>]).{6,}$"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Button class="btn btn-login w-100 btn-lg" ID="Button3" runat="server" Text="Login" OnClick="Button3_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

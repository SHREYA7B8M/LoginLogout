<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="LoginGrocery.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url('https://i.pinimg.com/736x/2b/0e/c8/2b0ec8412934f69da8c5eea0a98b0ee9.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            font-family: Arial, sans-serif;

        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
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
            margin-bottom: 15px;
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

        .btn-signup {
            background-color: #337ab7;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-signup:hover {
            background-color: #235a92;
        }

        .forgot-password {
            text-align: right;
        }

        .forgot-password a {
            text-decoration: none;
            color: #337ab7;
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <center>
                    <img class="logo-image" src="Images/UserLogin.png" alt="User Login">
                </center>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h3>User Login</h3>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <label for="UserId">User ID</label>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="UserId" runat="server" placeholder="User ID"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User ID is Required" ControlToValidate="UserId" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserId" ErrorMessage="User ID must contain at least 3 characters and at least 1 digit" ForeColor="#CC0000" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]).{3,}$"></asp:RegularExpressionValidator>
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
                    <asp:Button class="btn btn-login w-100" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                </div>

                <div class="form-group">
                    <a href="SignUp.aspx"><input class="btn btn-signup w-100" type="button" value="Sign Up" /></a>
                </div>

                <div class="form-group forgot-password">
                    <a href="ForgotPassword.aspx">Forgot Password?</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

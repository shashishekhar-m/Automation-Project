<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_NEW.aspx.cs" Inherits="Automation_Project.Login_NEW" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tata BlueScope Steel Pvt. Ltd.</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background-image: url("Images/blue.png");
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            font-family: sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }
            
        
        .overlay-image {
            position: fixed; 
            top: 50px; 
            right: 50px;
            width: 380px;
            height: contain;
            z-index: 1;
            justify-content: right;
            margin:20px 50px auto;
            max-width: 100%; 
            max-height: 100%;
            object-fit: contain;
        }

        .login-panel {
            background-color: #cfd8fc;
            border: 2px solid black;
            padding: 30px;
            border-radius: 7px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            width: 350px;
            text-align: center;
            margin:100px auto;
        }

        .login-panel h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #1a2c70;
            font-family: 'Elephant', cursive;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .login-button {
            background-color: #0076EC;
            color: white;
            padding: 15px 20px;
            margin-top: 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            border: 2px solid white;
        }

        .login-button:hover {
            background-color: blueviolet;
        }

        .error-message {
            color: red;
            text-align: center;
        }
        @media screen and (max-width: 480px) {
            .login-panel {
                width: 90%;
                margin: 0 auto;
            }
        }
        
    </style>
</head>
<body>
    <img src="Images/bluescope.png" alt="Overlay Image" class="overlay-image" />
        <form id="form1" runat="server">
            <div class="login-panel">
                <h1>Automation</h1>
                <asp:TextBox ID="txt_user_name" runat="server" TextMode="SingleLine" CssClass="input-field" placeholder="User Name" BorderColor="Black" BorderWidth="1px"></asp:TextBox>
                <asp:TextBox ID="txt_pass" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password" BorderColor="Black" BorderWidth="1px"></asp:TextBox>
                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="login-button" OnClick="btn_login_Click" />
            </div>
            <div>
                <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" CssClass="error-message"></asp:Label>
            </div>
        </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmhomepage.aspx.cs" Inherits="Automation_Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Automation Reports</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #091b38;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .header label {
            font-size: 24px;
            font-weight: bold;
        }

         .logo-img {
            position: absolute;
            left: 20px;
            top: 10px;
            width: 80px;
            height: 50px;
         }

        .signout-button {
            position: absolute;
            right: 20px;
            top: 10px;
            font-size: 16px;
            text-align: center;
            display: inline-block;
            margin: 4px 2px;
            background-color: #7091e6;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .signout-button:hover {
            background-color: #0e3a80;

        }

        .menu-panel {
            float: left;
            width: 350px;
            background-color: #43608f;
            padding: 20px;
            border: 1px solid #ccc;
            height: 100vh;
            box-sizing: border-box;
            color:white;
        }

        .menu-panel label {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li {
            margin: 10px;
        }

        .menu a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .menu ul li a:hover {
            background-color: #b3d0ff;
        }

        .data-panel {
            float: left;
            width: 74%;
            padding: 20px;
            border: 1px solid #ccc;
            height: 654px;
        }

        .welcome-label {
            position: absolute;
            right: 150px;
            top: 20px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            margin-right: 10px;
        }

        .error-message {
            color: red;
            text-align: center;
        }
   
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <img src="Images/bluescope.png" alt="Logo" class="logo-img" />
            <asp:Label ID="lbl_head" runat="server" Text="Automation Reports" Font-Size="XX-Large" Font-Names="Britannic Bold" Font-Underline="true"></asp:Label>
            <asp:Label ID="lbl_welcome" runat="server" Font-Size="Large" ForeColor="White" CssClass="welcome-label"></asp:Label>
            <asp:Button ID="btn_signout" runat="server" Text="Sign Out" CssClass="signout-button" OnClick="btn_signout_Click" ></asp:Button>
            <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" CssClass="error-message"></asp:Label>
        </div>
        <asp:Panel ID="pnl_menu" runat="server" CssClass="menu-panel">
            <asp:Label ID="lbl_rpt" runat="server" Text="Reports" Font-Size="Larger" Font-Bold="true" Font-Underline="true"></asp:Label>
            <br />
            <asp:Menu ID="menu_rpt" runat="server" Orientation="Vertical" Font-Size="Large" CssClass="menu">
                <Items>
                    <asp:MenuItem Text="Production Report" Value="Production Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Process Value Report" Value="Process Value Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Propane Consumption Report" Value="Propane Consumption Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Coil Process Parameter Report" Value="Coil Process Parameter Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Colour Change Production Report" Value="Colour Change Production Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Process Line Scrap Report" Value="Process Line Scrap Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="CCL Delay Report" Value="CCL Delay Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Scrap Report" Value="Scrap Report" NavigateUrl="productionrpt.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </asp:Panel>
        <asp:Panel ID="pnl_data" runat="server" CssClass="data-panel">
            <!-- Data will be displayed here -->
        </asp:Panel>
    </form>
</body>
</html>
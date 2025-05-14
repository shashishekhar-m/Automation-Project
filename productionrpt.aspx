<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productionrpt.aspx.cs" Inherits="Automation_Project.productionrpt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Production Reports</title>
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
            position: relative;
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

        .header label {
            font-size: 24px;
            font-weight: bold;
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

        .dropdown {
            padding: 10px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-top: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group select {
            padding: 10px;
            font-size: 14px;
            width: 150px;
            margin-right: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #fff;
            color: #333;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        
        .table th, .table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        
        .table th {
            background-color: #f2f2f2;
        }

        .chkBox {
            width: 20px;
            height: 20px;
            margin: 10px;
            vertical-align: middle;
        }

        .chkBox input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin: 0;
            padding: 0;
            vertical-align: middle;
        }
        
        .chkBox label {
            font-size: 16px;
            margin-left: 5px;
            vertical-align: middle;
        }

        .search-btn {
            background-color: #7091e6;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .search-btn:hover {
            background-color: #0e3a80;

        }

        .custom-gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .custom-gridview-header {
            background-color: #c5e3fd;
            color: #333;
            font-family: Verdana, sans-serif;
            font-size: 14px;
            font-weight: bold;
            text-align: left;
            padding: 10px;
        }

        .custom-gridview-row {
            background-color: #f9f9f9;
            color: #333;
            font-family: Verdana, sans-serif;
            font-size: 14px;
            text-align: left;
            padding: 10px;
        }

        .custom-gridview-alternating-row {
            background-color: #f2f2f2;
            color: #333;
            font-family: Verdana, sans-serif;
            font-size: 14px;
            text-align: left;
            padding: 10px;
        }

        .custom-gridview-footer {
            background-color: #c5e3fd;
            color: #333;
            font-family: Verdana, sans-serif;
            font-size: 14px;
            font-weight: bold;
            text-align: left;
            padding: 10px;
        }

        .custom-gridview-pager {
            background-color: #e9f1fd;
            color: #333;
            font-family: Verdana, sans-serif;
            font-size: 14px;
            padding: 10px;
            text-align: right;
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
   
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <img src="Images/bluescope.png" alt="Logo" class="logo-img" />
            <asp:Label ID="lbl_head" runat="server" Text="Production Reports" Font-Size="XX-Large" Font-Names="Britannic Bold" Font-Underline="true"></asp:Label>
            <asp:Button ID="btn_signout" runat="server" Text="Sign Out" CssClass="signout-button" OnClick="btn_signout_Click" ></asp:Button>
            <asp:Label ID="lbl_welcome" runat="server" CssClass="welcome-label"></asp:Label>
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
             <asp:CheckBox ID="chk_bx_1" runat="server" Text="CCL" AutoPostBack="True" OnCheckedChanged="chk_bx_1_CheckedChanged" />
             <asp:CheckBox ID="chk_bx_2" runat="server" Text="MCL" AutoPostBack="True" OnCheckedChanged="chk_bx_2_CheckedChanged" />
             
            <div class="form-group">
                <asp:Label ID="lbl_StartDate" runat="server" Text="Start Date" Visible="false"></asp:Label>
                <asp:DropDownList ID="ddl_StartDate" runat="server" CssClass="dropdown" Visible="false">
                    <asp:ListItem Text="Select Date" Value="0"></asp:ListItem>
                    
                </asp:DropDownList>

                <asp:Label ID="lbl_EndDate" runat="server" Text="End Date" Visible="false"></asp:Label>
                <asp:DropDownList ID="ddl_EndDate" runat="server" CssClass="dropdown" Visible="false">
                    <asp:ListItem Text="Select Date" Value="0"></asp:ListItem>
                    
                </asp:DropDownList>

                <asp:Button ID="btn_Search" runat="server" Text="Search" CssClass="btn btn-primary search-btn" OnClick="btn_Search_Click"  />
            </div>
            <asp:Label ID="lblAccessDenied" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>

             <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="PCOIL_SID" HeaderText="PCOIL SID" />
                    <asp:BoundField DataField="TYPE" HeaderText="Type" />
                    <asp:BoundField DataField="MAT_IDENT" HeaderText="Material Identity" />
                    <asp:BoundField DataField="REF_INT_ID" HeaderText="Reference ID" />
                    <asp:BoundField DataField="PROD_DAY" HeaderText="Production Day" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="PROD_START" HeaderText="Production Start" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
                    <asp:BoundField DataField="PROD_END" HeaderText="Production End" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
                    <asp:BoundField DataField="LENGHT" HeaderText="Length (m)" />
                    <asp:BoundField DataField="WIDTH" HeaderText="Width (m)" />
                    <asp:BoundField DataField="THICKNESS" HeaderText="Thickness (mm)" />
                    <asp:BoundField DataField="WEIGHT" HeaderText="Weight (kg)" />
                    <asp:BoundField DataField="DIAM_INSIDE" HeaderText="Inner Diameter" />
                    <asp:BoundField DataField="DIAM_OUTSIDE" HeaderText="Outer Diameter" />
                    
                </Columns>
                <HeaderStyle CssClass="custom-gridview-header" />
                <RowStyle CssClass="custom-gridview-row" />
                <AlternatingRowStyle CssClass="custom-gridview-alternating-row" />
                <FooterStyle CssClass="custom-gridview-footer" />
                <PagerStyle CssClass="custom-gridview-pager" />
                
            </asp:GridView>

        </asp:Panel>
    </form>
</body>

</html>

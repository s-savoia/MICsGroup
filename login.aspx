<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Themes/public_theme/public_styles.css" rel="stylesheet" media="all" />
    <link href="App_Themes/public_theme/log_reg_styles.css" rel="stylesheet" media="all" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="log_reg_wrapper">
        <asp:Image ID="img_logo" runat="server" ImageUrl="~/img/logo.png" />
            <br />
    <div id="log_reg_main">
        <asp:Login ID="lgn_main" runat="server" DestinationPageUrl="~/admin/admin_master.aspx" CreateUserUrl="~/register.aspx" CreateUserText="Register" />    
    </div>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="App_Themes/public_theme/public_styles.css" rel="stylesheet" media="all" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Login ID="lgn_main" runat="server" DestinationPageUrl="~/admin/admin_master.aspx" CreateUserUrl="~/register.aspx" CreateUserText="Register" />    
    </div>
    </form>
</body>
</html>

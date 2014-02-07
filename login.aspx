<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Team_8_Hospital_Site_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Login ID="lgn_main" runat="server" DestinationPageUrl="~/admin/admin_master.aspx" CreateUserUrl="~/register.aspx" CreateUserText="Register" />
    </div>
    </form>
</body>
</html>

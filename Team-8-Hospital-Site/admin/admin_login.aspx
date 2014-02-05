<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--Login Control--%>
        <asp:Login ID="log_main" runat="server" DestinationPageUrl="~/administrative/administrative.aspx" />
    
    </div>
    </form>
</body>
</html>

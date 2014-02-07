<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="Team_8_Hospital_Site_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <%-- Registration Control --%>
        <asp:CreateUserWizard ID="cuw_main" runat="server" ContinueDestinationPageUrl="~/login.aspx" />
    </div>
    </form>
</body>
</html>

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="Team_8_Hospital_Site_register" %>

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
        <asp:Image ID="img_logo" runat="server" ImageUrl="~/img/log_reg_logo.png" />
            <br />
    <div id="log_reg_main">
       <%-- Registration Control --%>
        <asp:CreateUserWizard ID="cuw_main" runat="server" ContinueDestinationPageUrl="~/login.aspx" />
    </div>
    </div>
    </form>
</body>
</html>

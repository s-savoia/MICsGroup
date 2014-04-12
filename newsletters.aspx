<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="newsletters.aspx.cs" Inherits="newsletters" %>
<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/newsletter_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <div id="newsletter_application">
        <div class="floatL">
        <%-- newsletter image --%>
        <asp:Image ID="img_icon" runat="server" ImageUrl="~/img/newsicon.png" class="newsicon" />
        <div class="verticalAlign">
            <%-- header --%>
            <asp:Label ID="lbl_header" runat="server" Text="SUBSCRIBE NEWSLETTER" Font-Bold="true" CssClass="newshead" />
            <%-- header --%>
            <asp:Label ID="lbl_subheader" runat="server" Text="Please fill in a form to apply for our newsletter." class="floatL" />
        </div>
    </div>
    
    <div class="newsform">
        <%-- name --%>
        <asp:Label ID="lbl_name" runat="server" Text="Name:*" AssociatedControlID="txt_name" CssClass="floatClear" />
        <asp:TextBox ID="txt_name" runat="server" Text='<%#Bind("name")%>' CssClass="txt_news" />
        <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ControlToValidate="txt_name" Display="None" SetFocusOnError="true" ErrorMessage="Please enter your name" ValidationGroup="newsletter" />
        <br /><br />
        <%--email--%>
        <asp:Label ID="lbl_email" runat="server" Text="Email:*" AssociatedControlID="txt_email" />
        <asp:TextBox ID="txt_email" runat="server" Text='<%#Bind("email")%>' CssClass="txt_news" />
        <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_email" Display="None" SetFocusOnError="true" ErrorMessage="Please enter your email" ValidationGroup="application" />
        <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="*Invalid email" ControlToValidate="txt_email" Display="None" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ValidationGroup="newsletter" ErrorMessage="Your email is invalid" />
        <br /><br />
        <%--send button--%>
        <asp:Button ID="btn_send" runat="server" OnClick="subClick" Text="Apply" CausesValidation="true" ValidationGroup="newsletter" CssClass="floatButton" />
        <asp:ValidationSummary ID="vds_newsletter" runat="server" ShowMessageBox="true" ValidationGroup="newsletter" HeaderText="Newsletter Application Error" DisplayMode="List" />
        <br /><br />
        <%--confirmation message--%>
        <asp:Label ID="lbl_output" runat="server" />
    </div>
    </div>
</asp:Content>


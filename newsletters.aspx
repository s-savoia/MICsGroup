<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="newsletters.aspx.cs" Inherits="newsletters" %>
<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <%-- header --%>
    <asp:Label ID="lbl_header" runat="server" Text="Newsletter Application" Font-Bold="true" />
    <br />
    <%-- header --%>
    <asp:Label ID="lbl_subheader" runat="server" Text="Please fill in a form to apply for our newsletter." />
    <br /><br />
    <%-- name --%>
    <asp:Label ID="lbl_name" runat="server" Text="Name:*" AssociatedControlID="txt_name" />
    <asp:TextBox ID="txt_name" runat="server" Text='<%#Bind("name")%>' />
    <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ControlToValidate="txt_name" Display="None" SetFocusOnError="true" ErrorMessage="Please enter your name" ValidationGroup="newsletter" />
    <br /><br />
    <%--email--%>
    <asp:Label ID="lbl_email" runat="server" Text="Email:*" AssociatedControlID="txt_email" />
    <asp:TextBox ID="txt_email" runat="server" Text='<%#Bind("email")%>' />
    <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_email" Display="None" SetFocusOnError="true" ErrorMessage="Please enter your email" ValidationGroup="application" />
    <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="*Invalid email" ControlToValidate="txt_email" Display="None" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ValidationGroup="newsletter" ErrorMessage="Your email is invalid" />
    <br /><br />
    <%--send button--%>
    <asp:Button ID="btn_send" runat="server" OnClick="subClick" Text="Apply" CausesValidation="true" ValidationGroup="newsletter" />
    <asp:ValidationSummary ID="vds_newsletter" runat="server" ShowMessageBox="true" ValidationGroup="newsletter" HeaderText="Newsletter Application Error" DisplayMode="List" />
    <br /><br />
    <%--confirmation message--%>
    <asp:Label ID="lbl_output" runat="server" />
</asp:Content>


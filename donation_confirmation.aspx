<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="donation_confirmation.aspx.cs" Inherits="donation_confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/donation_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <div id="donation_confirm">
        <%--Header and subheader--%>
        <asp:Label ID="lbl_donationhead" runat="server" Text="THANKS YOU FOR YOUR GIFT!" CssClass="donationhead" />
        <br />
        <asp:Label ID="lbl_message" runat="server" />
    </div>
</asp:Content>


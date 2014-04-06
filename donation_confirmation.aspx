<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="donation_confirmation.aspx.cs" Inherits="donation_confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <%--Header and subheader--%>
    <asp:Label ID="lbl_donationhead" runat="server" Text="THANKS YOU FOR YOUR GIFT!" Font-Bold="true" />
    <br />
    <asp:Label ID="lbl_message" runat="server" />
</asp:Content>


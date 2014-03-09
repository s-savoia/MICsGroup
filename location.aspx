<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="location.aspx.cs" Inherits="Default2" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/location_styles.css" rel="stylesheet" media="all" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Contact Us</h2>
    google map goes here.
            <asp:ListView ID="lv_locations" runat="server" DataKeyNames="Id">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <div class="location_public_content">
                <div>
                    From: <%#Eval("fname") %> <%#Eval("lname") %>
                    Location: <%#Eval("city") %>, <%#Eval("province") %>
                    Email: <%#Eval("email") %>
                </div>
                <div class="post">
                    <%#Eval("subject") %>
                    <br />
                    <%#Eval("message") %>
                </div> 
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>


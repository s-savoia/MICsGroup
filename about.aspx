<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<%@ MasterType VirtualPath="~/public_master.master" %>

<%@ Register TagName="aboutUC" TagPrefix="uc" Src="~/aboutUC.ascx" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/about_styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_aboutUs.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    
    <div class="wraper1">

        <%--a user control for the about page content--%>
    <uc:aboutUC ID="uc_about" runat="server" />

    </div>
    


</asp:Content>


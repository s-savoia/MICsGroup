<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_about.aspx.cs" Inherits="admin_Default" %>

<%@ MasterType VirtualPath="~/admin/admin_master.master" %>


<%@ Register TagName="aboutUC" TagPrefix="uc" Src="~/aboutUC.ascx" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--STYLESHEET--%>
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_aboutUs.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--a user control for the about page content--%>
    <uc:aboutUC ID="uc_about" runat="server" />

</asp:Content>


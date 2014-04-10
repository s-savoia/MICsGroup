<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="TESTING-alert.aspx.cs" Inherits="TESTING_alert" %>
<%@ Register TagName="ucalert" TagPrefix="ua" Src="~/UC_alerts.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">

    <ua:ucalert runat="server" ID="Ucalert1" />


</asp:Content>


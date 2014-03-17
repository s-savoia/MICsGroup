<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_appointment.aspx.cs" Inherits="admin_Default" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Book an Appointment - Admin</h2>
    <asp:LinkButton ID="btn_show_create" runat="server" Text="Create Appointment Timeslots" OnClick="subShowCreate" />
    <asp:LinkButton ID="btn_show_view" runat="server" Text="View Appointments" OnClick="subShowView" />

    <asp:Panel ID="pnl_appointment_create" runat="server">
        <h3>Create an Appointment Timeslot</h3>
        <asp:Label ID="lbl_date" runat="server" Text="Date:" />
        <asp:TextBox ID="txt_date" runat="server" />
        <br />
        <asp:Label ID="lbl_time" runat="server" Text="Time:" />
    </asp:Panel>

    <asp:Panel ID="pnl_appointment_view" runat="server">
        View Appointment Timeslots
    </asp:Panel>
</asp:Content>


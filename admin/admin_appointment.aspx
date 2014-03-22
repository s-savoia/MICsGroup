<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_appointment.aspx.cs" Inherits="admin_Default" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/admin_theme/admin_appointment_styles.css" rel="stylesheet" />
</asp:content>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Book an Appointment - Admin</h2>
    <asp:LinkButton ID="btn_show_create" runat="server" Text="Create Appointment Timeslots" OnClick="subShowCreate" />
    <asp:LinkButton ID="btn_show_view" runat="server" Text="View Appointments" OnClick="subShowView" />

    <asp:Panel ID="pnl_appointment_create" runat="server">
        <h3>Create an Appointment Timeslot</h3>
        <table id="create_appointment_table">
            <tr>
                <td class="cat_left"><asp:Label ID="lbl_date" runat="server" Text="Date:" /></td>
                <td><asp:TextBox ID="txt_date" runat="server" /></td>
            </tr>
            <tr>
                <td class="cat_left"><asp:Label ID="lbl_time" runat="server" Text="Time:" /></td>
                <td><asp:DropDownList ID="ddl_province" runat="server">
                        <asp:ListItem Value="9:00am">9:00am</asp:ListItem>
                        <asp:ListItem Value="9:30am">9:30am</asp:ListItem>
                        <asp:ListItem Value="10:00am">10:00am</asp:ListItem>
                        <asp:ListItem Value="10:30am">10:30am</asp:ListItem>
                        <asp:ListItem Value="11:00am">11:00am</asp:ListItem>
                        <asp:ListItem Value="11:30am">11:30am</asp:ListItem>
                        <asp:ListItem Value="12:00pm">12:00pm</asp:ListItem>
                        <asp:ListItem Value="12:30pm">12:30pm</asp:ListItem>
                        <asp:ListItem Value="1:00pm">1:00pm</asp:ListItem>
                        <asp:ListItem Value="1:30pm">1:30pm</asp:ListItem>
                        <asp:ListItem Value="2:00pm">2:00pm</asp:ListItem>
                        <asp:ListItem Value="2:30pm">2:30pm</asp:ListItem>
                        <asp:ListItem Value="3:00pm">3:00pm</asp:ListItem>
                        <asp:ListItem Value="3:30pm">3:30pm</asp:ListItem>
                        <asp:ListItem Value="4:00pm">4:00pm</asp:ListItem>
                        <asp:ListItem Value="4:30pm">4:30pm</asp:ListItem>
                        <asp:ListItem Value="5:00pm">5:00pm</asp:ListItem>
                        <asp:ListItem Value="5:30pm">5:30pm</asp:ListItem>
                        <asp:ListItem Value="6:00pm">6:00pm</asp:ListItem>
                        <asp:ListItem Value="6:30pm">6:30pm</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="cat_left"></td>
                <td>
                    <asp:Button ID="btn_create_timeslot" runat="server" Text="Create" />
                </td>
            </tr>
        </table>

    </asp:Panel>

    <asp:Panel ID="pnl_appointment_view" runat="server">
        <h3>View Appointment Timeslots</h3>
    </asp:Panel>
</asp:Content>


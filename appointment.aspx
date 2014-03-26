<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="appointment.aspx.cs" Inherits="Default2" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/appointment_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <asp:Label ID="lbl_message" runat="server" CssClass="appointment_response_message" />
    <h2>Book an Appointment</h2>
    <asp:ValidationSummary ID="vs_insert" runat="server" ValidationGroup="insert" ShowSummary="false" ShowMessageBox="true" />
    <table id="book_appointment_public">
        <tr>
            <td class="va_left_side">
                <asp:Label ID="lbl_time" runat="server" Text="Date/Time: " AssociatedControlID="ddl_view_appointments" />
            </td>
            <td>
                <asp:DropDownList ID="ddl_view_appointments" runat="server" OnSelectedIndexChanged="subChangeEdited" AutoPostBack="true"  />
    <asp:RequiredFieldValidator ID="rfv_appointments_time" runat="server" Text="*" ControlToValidate="rbl_appointments" ValidationGroup="insert" ErrorMessage="Please select an appointment time" Display="Dynamic" />
    <asp:RadioButtonList ID="rbl_appointments" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"  Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
                <asp:Label ID="lbl_fname" runat="server" Text="First Name: " AssociatedControlID="txt_fname" />
            </td>
            <td>
                <asp:TextBox ID="txt_fname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="*" ControlToValidate="txt_fname" ValidationGroup="insert" ErrorMessage="Please enter your first name" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
                <asp:Label ID="lbl_lname" runat="server" Text="Last Name: " AssociatedControlID="txt_lname" />
            </td>
            <td>
                <asp:TextBox ID="txt_lname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="*" ControlToValidate="txt_lname" ValidationGroup="insert" ErrorMessage="Please enter your last name" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
                <asp:Label ID="lbl_address" runat="server" Text="Address: " AssociatedControlID="txt_address" />
            </td>
            <td>
                <asp:TextBox ID="txt_address" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_address" runat="server" Text="*" ControlToValidate="txt_address" Display="Dynamic" ValidationGroup="insert" ErrorMessage="Please enter your address" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
                <asp:Label ID="lbl_city" runat="server" Text="City/Town: " AssociatedControlID="txt_city" />
            </td>
            <td>
                <asp:TextBox ID="txt_city" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*" ControlToValidate="txt_city" ValidationGroup="insert" ErrorMessage="Please enter your city/town" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
                <asp:Label ID="lbl_province" runat="server" Text="Province: " AssociatedControlID="ddl_province" />
            </td>
            <td>
                <asp:DropDownList ID="ddl_province" runat="server">
                    <asp:ListItem Value="0">-- Select a Province --</asp:ListItem>
                    <asp:ListItem Value="Alberta">Alberta</asp:ListItem>
                    <asp:ListItem Value="British Columbia">British Columbia</asp:ListItem>
                    <asp:ListItem Value="Manitoba">Manitoba</asp:ListItem>
                    <asp:ListItem Value="New Brunswick">New Brunswick</asp:ListItem>
                    <asp:ListItem Value="Newfoundland and Labrador">Newfoundland and Labrador</asp:ListItem>
                    <asp:ListItem Value="Northwest Territories">Northwest Territories</asp:ListItem>
                    <asp:ListItem Value="Nova Scotia">Nova Scotia</asp:ListItem>
                    <asp:ListItem Value="Nunavut">Nunavut</asp:ListItem>
                    <asp:ListItem Value="Ontario">Ontario</asp:ListItem>
                    <asp:ListItem Value="Prince Edward Island">Prince Edward Island</asp:ListItem>
                    <asp:ListItem Value="Quebec">Quebec</asp:ListItem>
                    <asp:ListItem Value="Saskatchewan">Saskatchewan</asp:ListItem>
                    <asp:ListItem Value="Yukon">Yukon</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_province" runat="server" Text="*" ErrorMessage="Please select your province" ControlToValidate="ddl_province" ValidationGroup="insert" InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
            <asp:Label ID="lbl_postal" runat="server" Text="Postal Code: " AssociatedControlID="txt_postal" />
            </td>
            <td>
                <asp:TextBox ID="txt_postal" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_postal" runat="server" Text="*" ControlToValidate="txt_postal" ValidationGroup="insert" ErrorMessage="Please enter your postal code" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="rev_postal" runat="server" Text="*" ControlToValidate="txt_postal" ValidationGroup="insert" ErrorMessage="Please us the format 'A1A 1A1'" ValidationExpression="^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
            <asp:Label ID="lbl_phone" runat="server" Text="Phone: " AssociatedControlID="txt_phone" />
            </td>
            <td>
                <asp:TextBox ID="txt_phone" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" Text="*" ControlToValidate="txt_phone" ValidationGroup="insert" ErrorMessage="Please enter your phone number" />
            </td>
        </tr>
        <tr>
            <td class="va_left_side">
            <asp:Label ID="lbl_reason" runat="server" Text="Reason for Appointment: " AssociatedControlID="txt_reason" />
            </td>
            <td>
                <asp:TextBox ID="txt_reason" runat="server" TextMode="MultiLine" Columns="40" Rows="5" />
            <asp:RequiredFieldValidator ID="rfvreason" runat="server" Text="*" ControlToValidate="txt_reason" ValidationGroup="insert" ErrorMessage="Please enter the reason for your appointment" />
        </td>
        </tr>
        <tr>
            <td class="va_left_side"></td>
            <td><asp:Button ID="btn_insert" runat="server" Text="Submit" ValidationGroup="insert" CommandName="Update" OnCommand="subCommand" /></td>
        </tr>            
    </table>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="Default2" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="App_Themes/public_theme/contact_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Contact Us</h2>
    <asp:ValidationSummary ID="vs_insert" runat="server" ValidationGroup="insert" HeaderText="Validation Summary:" />
            <asp:Label ID="lbl_message" runat="server" />
    <table id="contact_us_public">
        <tr>
            <td>
                <asp:Label ID="lbl_fname" runat="server" Text="First Name: " AssociatedControlID="txt_fname" />
            </td>
            <td>
                <asp:TextBox ID="txt_fname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="*" ControlToValidate="txt_fname" ValidationGroup="insert" ErrorMessage="Please enter your first name" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_lname" runat="server" Text="Last Name: " AssociatedControlID="txt_lname" />
            </td>
            <td>
                <asp:TextBox ID="txt_lname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="*" ControlToValidate="txt_lname" ValidationGroup="insert" ErrorMessage="Please enter your last name" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_email" runat="server" Text="Email: " AssociatedControlID="txt_email" />
            </td>
            <td>
                <asp:TextBox ID="txt_email" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*" ControlToValidate="txt_email" Display="Dynamic" ValidationGroup="insert" ErrorMessage="Please enter your email address" />
                <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="*" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ValidationGroup="insert" ErrorMessage="Please enter a valid email address" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_city" runat="server" Text="City/Town: " AssociatedControlID="txt_city" />
            </td>
            <td>
                <asp:TextBox ID="txt_city" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*" ControlToValidate="txt_city" ValidationGroup="insert" ErrorMessage="Please enter your city/town" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_province" runat="server" Text="Province: " AssociatedControlID="txt_province" />
            </td>
            <td>
                <asp:TextBox ID="txt_province" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_province" runat="server" Text="*" ControlToValidate="txt_province" ValidationGroup="insert" ErrorMessage="Please select your province" />
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="lbl_subject" runat="server" Text="Subject: " AssociatedControlID="txt_subject" />
            </td>
            <td>
                <asp:TextBox ID="txt_subject" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_subject" runat="server" Text="*" ControlToValidate="txt_subject" ValidationGroup="insert" ErrorMessage="Please enter a subject for your message" />
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="lbl_contact_message" runat="server" Text="Message: " AssociatedControlID="txt_contact_message" />
            </td>
            <td>
                <asp:TextBox ID="txt_contact_message" runat="server" TextMode="MultiLine" Columns="40" Rows="3" />
            <asp:RequiredFieldValidator ID="rfv_contact_message" runat="server" Text="*" ControlToValidate="txt_contact_message" ValidationGroup="insert" ErrorMessage="Please enter a message" />
        </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_insert" runat="server" Text="Submit" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" /></td>
        </tr>            
    </table>
</asp:Content>


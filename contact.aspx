<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="Default2" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="App_Themes/public_theme/contact_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Contact Us</h2>
    <asp:ValidationSummary ID="vs_insert" runat="server" ValidationGroup="insert" ShowMessageBox="true" ShowSummary="false" />
            <asp:Label ID="lbl_message" runat="server" CssClass="contact_response_message" />
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


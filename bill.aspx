<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="bill.aspx.cs" Inherits="bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    <h1>Online Bill Payment</h1>
    <br />
    <br />
    <h3>Invoice Details</h3>
    <asp:Label ID="lbl_invoiceId" runat="server" Text="Invoice Id" />
    <asp:TextBox ID="txt_invoiceId" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_invoiceId" runat="server" ControlToValidate="txt_invoiceId" ErrorMessage="Please enter your Invoice Id" SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_pfname" runat="server" Text="Patient's First Name" />
    <asp:TextBox ID="txt_pfname" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_pfname" runat="server" ControlToValidate="txt_pfname" ErrorMessage="Please enter the patient's first name" SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_plname" runat="server" Text="Patient's Last Name" />
    <asp:TextBox ID="txt_plname" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_plname" runat="server" ControlToValidate="txt_plname" ErrorMessage="Please enter the patient's last name" SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_contact" runat="server" Text="Contact Number" />
    <asp:TextBox ID="txt_contact" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_contact" runat="server" ControlToValidate="txt_contact" ErrorMessage="Please enter the contact number" SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_email" runat="server" Text="Email" />
    <asp:TextBox ID="txt_email" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter the email id" SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_amt" runat="server" Text="Amount" />
    <asp:TextBox ID="txt_amount" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_amount" runat="server" ControlToValidate="txt_amount" ErrorMessage="Please enter the amount"  SetFocusOnError="true" Display="Dynamic" />
    <br />
    <br />
    <h3>Address Information</h3>
    <asp:Label ID="lbl_street" runat="server" Text="Street" />
    <asp:TextBox ID="txt_street" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_street" runat="server" ControlToValidate="txt_street" ErrorMessage="Please enter the street information" SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_address" runat="server" Text="Address Line2" />
    <asp:TextBox ID="txt_address" runat="server" />
    <br />
    <asp:Label ID="lbl_city" runat="server" Text="City" />
    <asp:TextBox ID="txt_city" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city" ErrorMessage="Please enter the City"  SetFocusOnError="true" Display="Dynamic" />
    <br />
    <asp:Label ID="lbl_province" runat="server" Text="Province" />
    <asp:DropDownList ID="ddl_province" runat="server" >
                <asp:ListItem Value="AB" Text="AB" />
                <asp:ListItem Value="BC" Text="BC" />
                <asp:ListItem Value="MB" Text="MB" />
                <asp:ListItem Value="NB" Text="NB" />
                <asp:ListItem Value="NS" Text="NS" />
                <asp:ListItem Value="ON" Text="ON" />
                <asp:ListItem Value="PE" Text="PE" />
                <asp:ListItem Value="QC" Text="QC" />
                <asp:ListItem Value="SK" Text="SK" />
                <asp:ListItem Value="N/A" Text="N/A" /> 
            </asp:DropDownList>
           
            <br />
            <asp:Label ID="lbl_postalcode" runat="server" Text="Postal Code" />
            <asp:TextBox ID="txt_postalcode" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_postalcode" runat="server" ControlToValidate="txt_postalcode" ErrorMessage="Please enter Postal Code" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Button ID="btn_continue" runat="server" Text="Pay Now" OnClick="subSubmit"  />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel"  />
    <asp:Label ID="lbl_result" runat="server" />
    <br />
    <asp:Label ID="lbl_error" runat="server" />
</asp:Content>


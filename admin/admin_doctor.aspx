<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_doctor.aspx.cs" Inherits="admin_admin_doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <asp:Button ID="btn_new" runat="server" Text="Add Doctor Information" OnClick="subNew" />
    <asp:Button ID="btn_edit" runat="server" Text="Edit Doctor Information" OnClick="subEdit" />
    <br />
    <br />
    <asp:ValidationSummary ID="vds_add" runat="server" ValidationGroup="add" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" HeaderText="Validation Summary" />
    <asp:ValidationSummary ID="vds_edit" runat="server" ValidationGroup="edit" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" HeaderText="Validation Summary" />
    <asp:MultiView ID="mtv_doctor" runat="server" ActiveViewIndex="0">
        <asp:View ID="view_add" runat="server" >
            <asp:Panel ID="pnl_add" runat="server" GroupingText="Add Doctor">
                <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
                <asp:TextBox ID="txt_fname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname" Text="*" ErrorMessage="Please enter the First Name" ValidationGroup="add" />
                <br />
                <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
                <asp:TextBox ID="txt_lname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" Text="*" ErrorMessage="Please enter the Last Name" ValidationGroup="add" />
                <br />
                <asp:Label ID="lbl_location" runat="server" Text="Location" />
                <asp:DropDownList ID="ddl_location" runat="server" />
                <br /> 
                <asp:Label ID="lbl_specialization" runat="server" Text="Specialization" />
                <asp:DropDownList ID="ddl_specialization" runat="server" />
                <br />
                <asp:Label ID="lbl_contact" runat="server" Text="Contact Number" />
                <asp:TextBox ID="txt_contact" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_contact" runat="server" ControlToValidate="txt_contact" Text="*" ErrorMessage="Please enter the Contact Number" />
                 <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="txt_contact" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}"  Text="*" ErrorMessage="Please enter valid Emergency contact number"  ValidationGroup="add" />
                <br />
                <asp:Label ID="lbl_email" runat="server" Text="Email" />
                <asp:TextBox ID="txt_email" runat="server" />
                <asp:RegularExpressionValidator ID="rev_email" runat="server" ControlToValidate="txt_email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter valid email address" Text="*" ValidationGroup="add" />
                <br />
                <asp:Button ID="btn_add" runat="server" Text="Add" CommandName="add" OnCommand="subAdmin" ValidationGroup="add" />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" OnCommand="subAdmin" />   
            </asp:Panel>
        </asp:View>
        <asp:View ID="view_edit" runat="server">
            <%--<asp:Panel ID="pnl_edit" runat="server" GroupingText="Edit Doctor Information">
                <asp:DataList ID="dtl_edit" runat="server" 
            </asp:Panel>--%>
        </asp:View>
    </asp:MultiView>
</asp:Content>


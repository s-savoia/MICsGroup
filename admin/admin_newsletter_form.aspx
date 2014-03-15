<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_newsletter_form.aspx.cs" Inherits="admin_newsletter_form" %>

<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <div>
        <%--newsletter header--%>
        <asp:Label ID="lbl_header" runat="server" Text="Newsletter Form" Font-Bold="true" />
        <br /><br />
        <%--newsletter subheader--%>
        <asp:Label ID="lbl_subhead" runat="server" Text="Please fill in a message to send a newsletter." />
        <br /><br />
        <%--newsletter subject--%>
        <asp:Label ID="lbl_subject" runat="server" Text="Subject: " AssociatedControlID="txt_subject" />
        <asp:TextBox ID="txt_subject" runat="server" Text='<%#Bind("subject") %>' />
        <asp:RequiredFieldValidator ID="rfv_subject" runat="server" ControlToValidate="txt_subject" Display="Dynamic" ErrorMessage="Please fill in a subject" Text="*Required" ValidationGroup="newsletter" SetFocusOnError="true" />
        <br />
        <%--newsletter message--%>
        <asp:Label ID="lbl_message" runat="server" Text="Message" AssociatedControlID="txt_message" />
        <br />
        <asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine" Columns="40" Rows="15" Text='<%#Bind("message") %>' />
        <asp:RequiredFieldValidator ID="rfv_message" runat="server" Display="Dynamic" ControlToValidate="txt_message" ErrorMessage="Please fill in a message" Text="*Required" ValidationGroup="newsletter" />
        <br />
        <%--file uplaod--%>
        <asp:FileUpload ID="ful_attach" runat="server" FileName='<%#Bind("image") %>' />
        <br /><br />
        <%--send button--%>
        <asp:Button ID="btn_newsletter" runat="server" Text="Send" CausesValidation="true" ValidationGroup="newsletter" OnClick="subClick" />
        <asp:ValidationSummary ID="vds_newsletter" runat="server" ShowMessageBox="true" ValidationGroup="newsletter" HeaderText="Newsletter Form Error" />
        <br />
        <%--confirmation message--%>
        <asp:Label ID="lbl_output" runat="server" />
    </div>
</asp:Content>


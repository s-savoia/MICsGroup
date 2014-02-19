<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_master.aspx.cs" Inherits="admin_master" %>

<%-- This page was coded by HIDEMI NAWATA (HTML5 + CSS3) --%>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <table id="tbl_list">
        <tr>
            <th><asp:Label ID="lbl_title" runat="server" Text="Title" /></th>
            <th><asp:Label ID="lbl_author" runat="server" Text="Author" /></th>
            <th><asp:Label ID="lbl_status" runat="server" Text="Status" /></th>
            <th><asp:Label ID="lbl_date" runat="server" Text="Date" /></th>
            <th></th>
        </tr>
       
        <%--Bind Data--%>
        <tr>
            <td><asp:Label ID="lbl_titleD" runat="server" Text="About MICs" /></td>
            <td><asp:Label ID="lbl_authorD" runat="server" Text="Bernie" /></td>
            <td><asp:Label ID="lbl_statusD" runat="server" Text="Published" /></td>
            <td><asp:Label ID="lbl_dateD" runat="server" Text="1999/12/31" /></td>
            <td><asp:Button ID="btn_edit" runat="server" Text="Edit" Width="55px" /></td>
        </tr>  
    </table>

    <%--Edit--%>
    <div id="content_edit">
        <asp:Label ID="lbl_titleEach" runat="server" Text="Title: " />
        <asp:TextBox ID="txt_titleEach" runat="server" TextMode="SingleLine" Width="180px" />
        <br /><br />
        <asp:Label ID="lbl_contentEach" runat="server" Text="Content: " />
        <br />
        <asp:TextBox ID="txt_contentEach" runat="server" TextMode="MultiLine" Columns="75" Rows="10" BorderColor="#666666" />
        <br />
        <asp:Button ID="btn_update" runat="server" Text="Update" Width="55px" />
        <asp:Button ID="btn_delete" runat="server" Text="Delete" Width="55px" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" Width="55px" />
    </div>
    


</asp:Content>

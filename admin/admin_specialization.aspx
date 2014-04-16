<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_specialization.aspx.cs" Inherits="admin_admin_specialization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <asp:ValidationSummary ID="vds_edit" ValidationGroup="edit" runat="server" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" HeaderText="Validation Summary" />
    <asp:ValidationSummary ID="vds_add" ValidationGroup="add" runat="server" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" HeaderText="Validation Summary" />
    <asp:Button ID="btn_new" runat="server" Text="Add New Specialization" OnClick="subNew" />
    <asp:Button ID="btn_edit" runat="server" Text="Edit Specialization" OnClick="subEdit" />
    <asp:MultiView ID="mtv_specialization" runat="server" ActiveViewIndex="0">
        <asp:View ID="view_add" runat="server">
            <asp:Panel ID="pnl_add" runat="server" GroupingText="Add Specialization">
                <asp:Label ID="lbl_specialization" runat="server" Text="Enter Specialization" />
                <asp:TextBox ID="txt_specialization" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_specialization" runat="server"  ControlToValidate="txt_specialization" Text="*" ValidationGroup="add" ErrorMessage="Please enter the Specialization" />
                <br />
                <asp:Button ID="btn_add" runat="server" Text="Add Specialization" OnClick="subAdd" ValidationGroup="add" />
            </asp:Panel>
        </asp:View>
        <asp:View ID="view_edit" runat="server" >
            <asp:Panel ID="pnl_edit" runat="server" GroupingText="Edit Specialization">
                <asp:ListView ID="lv_edit" runat="server" OnItemCommand="subUpDel" OnItemUpdating="SubUp" OnItemDeleting="subDel">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdfId" runat="server" Value='<%#Eval("Id")%>' />
                        <asp:Label ID="lbl_sname" runat="server" Text="Specialization" />
                        <asp:TextBox ID="txt_sname" runat="server" Text='<%#Bind("specialization")%>' />
                         <asp:RequiredFieldValidator ID="rfv_sname" runat="server"  ControlToValidate="txt_sname" Text="*" ValidationGroup="edit" ErrorMessage="Please enter the Specialization" />
                        <br />
                        <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ValidationGroup="edit" />
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  />
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        <hr />
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>
        </asp:View>
    </asp:MultiView>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_location.aspx.cs" Inherits="admin_Default" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/admin_theme/admin_location_styles.css" rel="stylesheet" />
</asp:content>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <asp:Label ID="lbl_message" runat="server" CssClass="location_response_message" />
    <h2>Locations - Admin</h2>
    <br />
    <h3>Update Hospital Location Information:</h3>
    <asp:ValidationSummary ID="vds_edit" ValidationGroup="edit" runat="server" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" HeaderText="Validation Summary:" />
    
    <asp:Listview ID="lv_all" runat="server" OnItemCommand="subUpDel" >
    <ItemTemplate>
        <div class="admin_locations_hospital">
            <div class="admin_locations_left">
            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
            <asp:Label ID="lbl_name" AssociatedControlID="txt_name" runat="server" Text="Name:" />
            <br />
            <asp:TextBox ID="txt_name" runat="server" Text='<%#Bind("name") %>' />
            <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*" ControlToValidate="txt_name" ValidationGroup="edit" ErrorMessage="Please insert a hospital name" />
            <br />
            <asp:Label ID="lbl_desc" AssociatedControlID="txt_desc" runat="server" Text="Address:" />
            <br />
            <asp:TextBox ID="txt_desc" runat="server" Text='<%#Bind("description") %>' TextMode="MultiLine" Columns="20" Rows="8"  />
            <asp:RequiredFieldValidator ID="rfv_desc" runat="server" Text="*" ControlToValidate="txt_desc" ValidationGroup="edit" ErrorMessage="Please insert an address" />
        </div>

        <div class="admin_locations_right">
            <asp:Label ID="lbl_image" AssociatedControlID="txt_image" runat="server" Text="Image:" />
            <br />
            <asp:TextBox ID="txt_image" runat="server" Text='<%#Bind("image") %>' />
            <asp:RequiredFieldValidator ID="rfv_image" runat="server" Text="*" ControlToValidate="txt_image" ValidationGroup="edit" ErrorMessage="Please insert a pathway to the hospital image" />
            <br />
            <asp:Label ID="lbl_phone" AssociatedControlID="txt_phone" runat="server" Text="Phone:" />
            <br />
            <asp:TextBox ID="txt_phone" runat="server" Text='<%#Bind("phone") %>' />
            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" Text="*" ControlToValidate="txt_phone" ValidationGroup="edit" ErrorMessage="Please insert a phone number" />

            <br />
            <asp:Label ID="lbl_lat" AssociatedControlID="txt_lat" runat="server" Text="Lat:" />
            <br />
            <asp:TextBox ID="txt_lat" runat="server" Text='<%#Bind("lat") %>' />
            <asp:RequiredFieldValidator ID="rfv_lat" runat="server" Text="*" ControlToValidate="txt_lat" ValidationGroup="edit" ErrorMessage="Please insert a latitude coordinate" Display="Dynamic" />
            <asp:CompareValidator ID="cv_lat" runat="server" Text="*" ControlToValidate="txt_lat" Type="Double" Operator="DataTypeCheck" ErrorMessage="Please insert a latitude coordinate (must be a decimal)" ValidationGroup="edit" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_lng" AssociatedControlID="txt_lng" runat="server" Text="Lng:" />
            <br />
            <asp:TextBox ID="txt_lng" runat="server" Text='<%#Bind("lng") %>' />
            <asp:RequiredFieldValidator ID="rfv_lng" runat="server" Text="*" ControlToValidate="txt_lng" ValidationGroup="edit" ErrorMessage="Please insert a longitude coordinate" Display="Dynamic" />
            <asp:CompareValidator ID="cv_lng" runat="server" Text="*" ControlToValidate="txt_lng" Type="Double" Operator="DataTypeCheck" ErrorMessage="Please insert a longitude coordinate (must be a decimal)" ValidationGroup="edit" Display="Dynamic" />
            <br />
    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update_This" ValidationGroup="edit" />
        </div>
            </div>
                        </ItemTemplate>
                    </asp:Listview>


</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <link href="App_Themes/public_theme/gallery_style.css" rel="stylesheet" />


    <div class="wraper1">

        <h1>Image Gallery</h1>

        <asp:GridView ID="grid_main" runat="server" AutoGenerateColumns="false" CellPadding="10">
            <Columns>
                <asp:ImageField DataImageUrlField="img" ControlStyle-Width="350"></asp:ImageField>

                <asp:BoundField DataField="name" />

                <%--<asp:BoundField HeaderText="Link" DataField="link" />--%>

            </Columns>

        </asp:GridView>

    </div>

</asp:Content>


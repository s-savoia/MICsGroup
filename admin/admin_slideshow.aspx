<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_slideshow.aspx.cs" Inherits="_admin_slideshow" %>
<%--****** CODE BY CLAUDIA  ******--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

        <link href="../App_Themes/admin_theme/admin_img_styles.css" rel="stylesheet" />

<%--*******************--%>


    <div class="wraper1">
         <h1>
                <asp:Label ID="admin1" runat="server">Admin page for the Slide-Show</asp:Label>
         </h1>


        <h3>
            <asp:Label ID="lbl_message" runat="server" ForeColor="#ff8149" /></h3>


        <h2>
            <asp:Label ID="insert" runat="server" Text="Insert new Images:" />
        </h2>
        <asp:Label ID="salida" runat="server" ForeColor="Red" />
        <br />
        <br />

        <asp:Label ID="lbl_image" AssociatedControlID="up_Image" runat="server" />
        <asp:FileUpload ID="up_Image" runat="server" /><br />
        <asp:Button ID="btn_add" runat="server" Text="Add image" OnClick="AddImage" />
        

        <asp:Panel runat="server" ID="pnl_datalist" Visible="false">
            
        
        <asp:DataList ID="dtl_main" runat="server" DataKeyField="Id" OnEditCommand="subShowEditTemplate"
            OnUpdateCommand="subUpdate" OnDeleteCommand="subDelete" OnCancelCommand="subCancel"
            RepeatColumns="1" GridLines="Horizontal">

            <%--template to insert the new info into the DB--%>
            <HeaderTemplate>

                <br />
                <asp:Label ID="lbl_nameI" Text="Image name:" runat="server" AssociatedControlID="txt_nameI" />
                <asp:TextBox ID="txt_nameI" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required"
                    ControlToValidate="txt_nameI" ValidationGroup="insert" Display="Dynamic" />
                <br />
                <asp:Label ID="lbl_link" Text="Link with:" runat="server" AssociatedControlID="txt_linkI" />
                <asp:TextBox ID="txt_linkI" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_link" runat="server" Text="*Required"
                    ControlToValidate="txt_linkI" ValidationGroup="insert" Display="Dynamic" />

                <br />
                <br />

<%--                <asp:Label ID="lbl_image" Text="Image file:" AssociatedControlID="up_Image" runat="server" />
        <asp:FileUpload ID="up_Image" runat="server" />
                <br />
                <br />--%>


                <asp:Button ID="btn_insert" Text="INSERT" runat="server" OnClientClick="addImage" OnClick="subInsert" ValidationGroup="insert" />
                <br />
                <br />
                <hr />
            </HeaderTemplate>

            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>


            <%-- template to show the DB info--%>
            <ItemTemplate>
                <%--<asp:Label ID="lbl_id" Text='<%#Eval("Id") %>' runat="server" />--%>

                <asp:Image ID="img_displayed" runat="server" ImageUrl='<%#Eval("img")%>' Width="350"/>

                <br />
                <asp:Label ID="lbl_name" Text='<%#Eval("name") %>' runat="server" />
                <br />
                <asp:Label ID="lbl_link" Text='<%#Eval("link") %>' runat="server" />
                <br />
                 <asp:Label ID="Label2" Text='<%#Eval("img") %>' runat="server" />
                
                <br />
                <asp:Button ID="btn_edit" Text="EDIT" runat="server" CommandName="Edit" />

            </ItemTemplate>

            <%--template to edit the info--%>
            <EditItemTemplate>
                <h2><asp:Label ID="Label1" Text="Edit images" runat="server" /></h2>
                <br />
                <asp:HiddenField ID="hdf_id" Value='<%#Eval("Id") %>' runat="server" />
                <asp:Label ID="lbl_nameE" Text="Name" runat="server" AssociatedControlID="txt_nameE" />
                <asp:TextBox ID="txt_nameE" Text='<%#Bind("name") %>' runat="server" />

                <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required"
                    ControlToValidate="txt_nameE" ValidationGroup="edit" Display="Dynamic" />

                <br />
                <asp:Label ID="lbl_linkE" Text="Link" runat="server" AssociatedControlID="txt_linkE" />
                <asp:TextBox ID="txt_linkE" Text='<%#Bind("link") %>' runat="server" />
                <asp:RequiredFieldValidator ID="rfv_link" runat="server" Text="*Required"
                    ControlToValidate="txt_linkE" ValidationGroup="edit" Display="Dynamic" />

                <br />
                <br />

                <asp:Button ID="btn_update" Text="UPDATE" CommandName="Update"
                    CommandArgument='<%#Eval("Id") %>' runat="server" ValidationGroup="edit" />

                <asp:Button ID="btn_delete" Text="DELETE" CommandName="Delete"
                    CommandArgument='<%#Eval("Id") %>' runat="server" CausesValidation="false" OnClientClick="return confirm('Confirm Delete?')" />

                <asp:Button ID="btn_cancel" Text="CANCEL" CommandName="Cancel" runat="server" CausesValidation="false" />
                <br />
                <br />
            </EditItemTemplate>

        </asp:DataList>

            </asp:Panel>
    </div>

</asp:Content>


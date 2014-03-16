<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_contact.aspx.cs" Inherits="admin_Default" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/admin_theme/admin_contact.css" rel="stylesheet" />
</asp:content>


<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <asp:Label ID="lbl_message" runat="server" CssClass="contact_response_message" />
    <h2>Contact Us - Admin</h2>
        <asp:ListView ID="lv_contact" runat="server"  onitemcommand="subUpDel" OnPagePropertiesChanging="lv_contact_PagePropertiesChanging">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <div class="contact_us_admin">
                <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
                <div class="contact_left">
                    From:
                    <br />
                    <span class="contact_details"><%#Eval("fname") %> <%#Eval("lname") %></span>
                    Location:
                    <br />
                    <span class="contact_details"><%#Eval("city") %>, <%#Eval("province") %></span>
                    Email:
                    <br />
                    <span class="contact_details"><%#Eval("email") %></span>
                </div>
                <div class="contact_right">
                    <span class="contact_subject"><%#Eval("subject") %></span>
                    <%#Eval("message") %>
                </div>
                <div class="contact_delete_button">
                     <asp:Button ID="btn_delete" runat="server" Text="Delete Message" CommandName="Delete_This" OnClientClick="return confirm('Confirm delete?');" CausesValidation="false" />
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    
    <asp:DataPager ID="dp_contact" runat="server" PageSize="3" PagedControlID="lv_contact">
        <Fields>
            <asp:TemplatePagerField OnPagerCommand="subPager">
                <PagerTemplate>                       
                        <asp:LinkButton ID="btn_pre" runat="server" Text="<-- Older Messages" CommandName="Prev" />
                    <asp:LinkButton ID="btn_nxt" runat="server" Text="Newer Messages -->" CommandName="Next" />
                </PagerTemplate>
            </asp:TemplatePagerField>
        </Fields>
    </asp:DataPager>

</asp:Content>


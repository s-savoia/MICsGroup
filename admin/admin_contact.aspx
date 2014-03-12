<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_contact.aspx.cs" Inherits="admin_Default" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>


<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">

    <h2>Contact Us - Admin</h2>
    <asp:Label ID="test" runat="server" />
        <asp:ListView ID="lv_contact" runat="server"  onitemcommand="subUpDel">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <div class="contact_us_admin">
                <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
                <div>
                    From: <%#Eval("fname") %> <%#Eval("lname") %>
                    Location: <%#Eval("city") %>, <%#Eval("province") %>
                    Email: <%#Eval("email") %>
                </div>
                <div class="post">
                    <%#Eval("subject") %>
                    <br />
                    <%#Eval("message") %>
                </div> 
                     <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete_This" OnClientClick="return confirm('Confirm delete?');" CausesValidation="false" />
            </div>
        </ItemTemplate>
    </asp:ListView>

    <asp:DataPager id="dp_contact" runat="server" PageSize="3" PagedControlID="lv_contact">
        <Fields>
            <asp:TemplatePagerField OnPagerCommand="subPager">
                <PagerTemplate>
                    <div class="btn_left">
                        <asp:LinkButton ID="btn_pre" runat="server" Text=" <-- Newer Posts" CommandName="Next" />
                    </div>
                    <div class="btn_right">  
                        <asp:LinkButton ID="btn_nxt" runat="server" Text="Older Posts -->" CommandName="Prev" />
                    </div>
                </PagerTemplate>
            </asp:TemplatePagerField>
        </Fields>
    </asp:DataPager>

</asp:Content>


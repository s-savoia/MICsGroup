<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--= = = CODED BY: JAMES HONG = = =--%>

    <h3>
        <asp:Literal ID="ltl_title" runat="server" Text="Services" />
    </h3>

    <table>
        <tr>
            <td>
                <asp:LinkButton ID="lnk_bingham" runat="server" Text="Bingham" />
            </td>
            <td>
                <asp:LinkButton ID="lnk_anson" runat="server" Text="Anson" />
            </td>
            <td>
                <asp:LinkButton ID="lnk_ladyMinto" runat="server" Text="Lady Minto" />
            </td>
        </tr>
    </table>

    <br /><br />

    <asp:Panel ID="pnl_bingham" runat="server">
        <h2>Bingham Memorial Hospital</h2>
        <br />
        <asp:DetailsView ID="dtv_bingham" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" PagerSettings-Mode="NumericFirstLast">
            <Fields>
                <asp:TemplateField HeaderText="Service">
                    <ItemTemplate>
                        <h3><%#Eval("service") %></h3>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <%#Eval("location") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Available only at this hospital?">
                    <ItemTemplate>
                        <%#Eval("unique") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <%#Eval("details") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>

           <%-- <PagerTemplate>
            <asp:Button ID="btn_first" runat="server" Text="First" CommandName="Page" CommandArgument="First"  /> <%--OnCommand="subPaging"
            <asp:Button ID="btn_previous" runat="server" Text="<" CommandName="Page" CommandArgument="Previous"  />
            <asp:Button ID="btn_next" runat="server" Text=">" CommandName="Page" CommandArgument="Next"  />
            <asp:Button ID="btn_last" runat="server" Text="Last" CommandName="Page" CommandArgument="Last"  />
        </PagerTemplate>--%>

        </asp:DetailsView>
    </asp:Panel>

     <br /><br />

    <asp:Panel ID="pnl_anson" runat="server">
        <h2>Anson General Hospital</h2>
        <br />
        <asp:DetailsView ID="dtv_anson" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" PagerSettings-Mode="NumericFirstLast">
            <Fields>
                <asp:TemplateField HeaderText="Service">
                    <ItemTemplate>
                        <h3><%#Eval("service") %></h3>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <%#Eval("location") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Available only at this hospital?">
                    <ItemTemplate>
                        <%#Eval("unique") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <%#Eval("details") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>

        </asp:DetailsView>
    </asp:Panel>

     <br /><br />

    <asp:Panel ID="pnl_lady_minto" runat="server">
        <h2>Lady Minto Hospital</h2>
        <br />
        <asp:DetailsView ID="dtv_lady_minto" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" PagerSettings-Mode="NumericFirstLast">
            <Fields>
                <asp:TemplateField HeaderText="Service">
                    <ItemTemplate>
                        <h3><%#Eval("service") %></h3>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <%#Eval("location") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Available only at this hospital?">
                    <ItemTemplate>
                        <%#Eval("unique") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <%#Eval("details") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>

        </asp:DetailsView>
    </asp:Panel>

</asp:Content>


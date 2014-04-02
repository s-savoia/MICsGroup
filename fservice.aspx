<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="fservice.aspx.cs" Inherits="Default2" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--= = = CODED BY: JAMES HONG = = =--%>

    <h3>
        <asp:Literal ID="ltl_title" runat="server" Text="Services" />
    </h3>

    <p>
        <asp:Label ID="lbl_note" runat="server">
        Here are thre three hospitals of MICs Group. <br /><br />You can either click on the picture or name of a hospital to jump to see the services at that location,
        or you can scroll to view a hospital and its services. <br /><br />Simply click on either the Prev or Next buttons to browse through the services.<br /><br />
        We are currently renovating this page, so more functionality is scheduled in the near future.
        </asp:Label>
    </p>

    <table>
        <tr>
            <td>
                <asp:HyperLink ID="hpl_bingham" runat="server" ImageUrl="~/img/locations_bingham.png" href="#content_main_lbl_bingham">Bingham</asp:HyperLink>
                <asp:HyperLink ID="hpl_bingham2" runat="server" href="#content_main_lbl_bingham">Bingham Memorial Hospital</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="hpl_anson" runat="server" ImageUrl="~/img/locations_anson.png" href="#content_main_lbl_anson">Anson</asp:HyperLink>
                <asp:HyperLink ID="hpl_anson2" runat="server" href="#content_main_lbl_anson">Anson General Hospital</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="hpl_ladyMinto" runat="server" ImageUrl="~/img/locations_minto.png" href="#content_main_lbl_lady_minto">Lady Minto</asp:HyperLink>
                <asp:HyperLink ID="hpl_ladyMinto2" runat="server" href="#content_main_lbl_lady_minto">Lady Minto Hospital</asp:HyperLink>
            </td>
        </tr>
    </table>

    <br />
    <br />

    <%--<asp:Panel ID="pnl_bingham" runat="server">--%>
    <h2>
        <asp:Label ID="lbl_bingham" runat="server" Text="Bingham Memorial Hospital" /></h2>
    <br />
    <asp:DetailsView ID="dtv_bingham" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" OnDataBound="dtv_bingham_DataBound">
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

        <PagerStyle VerticalAlign="Bottom" />

        <PagerTemplate>

            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="lkb_previousButton"
                            Text="Prev"
                            CommandName="changePageB"
                            CommandArgument="Prev"
                            runat="Server" />
                        <asp:LinkButton ID="lkb_nextButton"
                            Text="Next"
                            CommandName="changePageB"
                            CommandArgument="Next"
                            runat="Server" />
                    </td>
                    <td style="text-align: right;">Page
                            <asp:Label ID="lbl_pageNumber" runat="server" />
                        of
                            <asp:Label ID="lbl_totalPages" runat="server" />
                    </td>
                </tr>
            </table>
        </PagerTemplate>
    </asp:DetailsView>

    <%--<asp:Label ID="test" runat="server" />--%>
    <%--</asp:Panel>--%>

    <br />
    <br />

    <%--<asp:Panel ID="pnl_anson" runat="server">--%>
    <h2>
        <asp:Label ID="lbl_anson" runat="server" Text="Anson General Hospital" /></h2>
    <br />
    <asp:DetailsView ID="dtv_anson" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" OnDataBound="dtv_anson_DataBound">
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

        <PagerStyle VerticalAlign="Bottom" />

        <PagerTemplate>

            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="lkb_previousButton"
                            Text="Prev"
                            CommandName="changePageA"
                            CommandArgument="Prev"
                            runat="Server" />
                        <asp:LinkButton ID="lkb_nextButton"
                            Text="Next"
                            CommandName="changePageA"
                            CommandArgument="Next"
                            runat="Server" />
                    </td>
                    <td style="text-align: right;">Page
                            <asp:Label ID="lbl_pageNumber" runat="server" />
                        of
                            <asp:Label ID="lbl_totalPages" runat="server" />
                    </td>
                </tr>
            </table>
        </PagerTemplate>

    </asp:DetailsView>
    <%--</asp:Panel>--%>

    <br />
    <br />

    <%--<asp:Panel ID="pnl_lady_minto" runat="server">--%>
    <h2>
        <asp:Label ID="lbl_lady_minto" runat="server" Text="Lady Minto Hospital" /></h2>
    <br />
    <asp:DetailsView ID="dtv_lady_minto" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" OnDataBound="dtv_lady_minto_DataBound">
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

        <PagerStyle VerticalAlign="Bottom" />

        <PagerTemplate>

            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="lkb_previousButton"
                            Text="Prev"
                            CommandName="changePageLM"
                            CommandArgument="Prev"
                            runat="Server" />
                        <asp:LinkButton ID="lkb_nextButton"
                            Text="Next"
                            CommandName="changePageLM"
                            CommandArgument="Next"
                            runat="Server" />
                    </td>
                    <td style="text-align: right;">Page
                            <asp:Label ID="lbl_pageNumber" runat="server" />
                        of
                            <asp:Label ID="lbl_totalPages" runat="server" />
                    </td>
                </tr>
            </table>
        </PagerTemplate>

    </asp:DetailsView>
    <%--</asp:Panel>--%>
</asp:Content>


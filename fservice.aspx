<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="fservice.aspx.cs" Inherits="Default2" MaintainScrollPositionOnPostback="true" %>

<%@ MasterType VirtualPath="~/public_master.master" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<%--This feature displays the services at the three hospitals of MICs Group. Users can page through the services of each hospital.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" href="App_Themes/public_theme/find-service.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">
    
    <%--PAGE TITLE--%>
    <h3>
        <asp:Literal ID="ltl_title" runat="server" Text="Services" />
    </h3>

    <%--INSTRUCTIONS--%>
    <p>
        <asp:Label ID="lbl_note" runat="server">
        Below are links to the three hospitals of MICs Group. <br /><br />You can either click on the name of a hospital to see the services at that location,
        or you can scroll to view a hospital and its services. <br /><br />Simply click on either the Prev or Next buttons to browse through the services.<br /><br />        
        </asp:Label>
    </p>

    <%--HYPERLINKS TABLE (redirect to a certain hospital)--%>
    <table class="hospital">
        <tr>
            <td>                
                <asp:HyperLink ID="hpl_bingham2" runat="server" href="#content_main_lbl_bingham" >Bingham Memorial Hospital</asp:HyperLink>
            </td>
            <td>                
                <asp:HyperLink ID="hpl_anson2" runat="server" href="#content_main_lbl_anson">Anson General Hospital</asp:HyperLink>
            </td>
            <td>               
                <asp:HyperLink ID="hpl_ladyMinto2" runat="server" href="#content_main_lbl_lady_minto">Lady Minto Hospital</asp:HyperLink>
            </td>
        </tr>
    </table>

    <br />
    <br />

    <%--BINGHAM MEMORIAL HOSPITAL--%>
    <h2><asp:Label ID="lbl_bingham" runat="server" Text="Bingham Memorial Hospital" /></h2>

    <br />
    <%--DETAILSVIEW FOR BINGHAM--%>
    <asp:DetailsView ID="dtv_bingham" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" OnDataBound="dtv_bingham_DataBound">
        
        <%--TEMPLATE FIELDS (service name, hospital name, unique service?, service details. These represent the columns in the mic_services_bingham table.)--%>
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

        <%--PAGER STYLE--%>
        <PagerStyle VerticalAlign="Bottom" />

        <%--PAGER TEMPLATE (previous & next buttons [prev, next] )--%>
        <PagerTemplate>

            <table class="page-link" style="width: 100%;">
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
                    <%--display the current page and the total number of pages--%>
                    <td style="text-align: right;">Page
                            <asp:Label ID="lbl_pageNumber" runat="server" />
                        of
                            <asp:Label ID="lbl_totalPages" runat="server" />
                    </td>
                </tr>
            </table>
        </PagerTemplate>
    </asp:DetailsView>
   
    <br />
    <br />

    <%--ANSON GENERAL HOSPITAL--%>    
    <h2>
        <asp:Label ID="lbl_anson" runat="server" Text="Anson General Hospital" /></h2>
    <br />
    <%--DETAILSVIEW FOR ANSON--%>
    <asp:DetailsView ID="dtv_anson" runat="server" AllowPaging="true" DataKeyNames="Id" AutoGenerateRows="false" OnItemCommand="subAdmin" OnDataBound="dtv_anson_DataBound">
        <%--TEMPLATE FIELDS--%>
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

        <%--PAGER TEMPLATE--%>
        <PagerTemplate>

            <table class="page-link" style="width: 100%;">
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

    <br />
    <br />

    <%--LADY MINTO HOSPITAL--%>   
    <h2>
        <asp:Label ID="lbl_lady_minto" runat="server" Text="Lady Minto Hospital" /></h2>
    <br />
    <%--DETAILSVIEW FOR LADY MINTO--%> 
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

            <table class="page-link" style="width: 100%;">
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
    
</asp:Content>


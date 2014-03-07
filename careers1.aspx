<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="careers1.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--= = = CODED BY: JAMES = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <h3><asp:Literal ID="ltl_title" runat="server" Text="Job Postings" /></h3>

    <section>
        <asp:Repeater ID="rpt_data" runat="server">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th>
                            <asp:Label ID="lbl_idI" runat="server" Text="Id" /></th>
                        <th colspan="3">
                            <asp:Label ID="lbl_positionI" runat="server" Text="Position" /></th>
                        <th colspan="3">
                            <asp:Label ID="lbl_location" runat="server" Text="Location" /></th>
                        <th colspan="2">
                            <asp:Label ID="lbl_link" runat="server" Text="Link" /></th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%# Eval("Id") %></td>
                    <td colspan="3"><%# Eval("position") %></td>
                    <td colspan="3"><%# Eval("location") %></td>
                    <td colspan="2">
                        <asp:Button ID="btn_viewDetails" runat="server" Text="view details" />

                        <%--= = = INSIDE THE POPUP = = =--%>
                        <asp:ModalPopupExtender ID="mpe_view_details" runat="server" TargetControlID="btn_viewDetails" PopupControlID="pnl_view_details" OkControlID="btn_OK" CancelControlID="btn_cancel" />

                        <asp:Panel ID="pnl_view_details" runat="server">
                            <div style="background-color: #c3c3c3;">
                                <h3><asp:Label ID="lbl_title" runat="server" Text="View Details" /></h3>

                                <%--= = = POPUP REPEATER = = =--%>

                                <asp:Repeater ID="rpt_popup" runat="server" DataSourceID="sds_popup">
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="lbl_idI" runat="server" Text="Id" /></th>
                                                <th colspan="3">
                                                    <asp:Label ID="lbl_positionI" runat="server" Text="Position" /></th>
                                                <th colspan="3">
                                                    <asp:Label ID="lbl_location" runat="server" Text="Location" /></th>
                                                <th colspan="2">
                                                    <asp:Label ID="lbl_details" runat="server" Text="Details" /></th>
                                            </tr>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id") %></td>
                                            <td colspan="3"><%# Eval("position") %></td>
                                            <td colspan="3"><%# Eval("location") %></td>
                                            <td colspan="2"><%# Eval("details") %></td>
                                        </tr>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>

                                </asp:Repeater>

                                <%--= = = BUTTONS FOR MODAL POPUP EXTENDER = = =--%>
                                <asp:Button ID="btn_OK" runat="server" Text="OK" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" />
                            </div>
                        </asp:Panel>                        

                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>

        <asp:SqlDataSource ID="sds_popup" runat="server" ConnectionString="<%$ ConnectionStrings:DB_65873_micConnectionString %>" SelectCommand="SELECT * FROM [mic_job_postings]" />
    </section>

    <section>
        <%--<asp:Button ID="btn_viewDetails" runat="server" Text="click here" />--%>

        <asp:ToolkitScriptManager ID="tsm_main" runat="server" />



    </section>
</asp:Content>

<%--    <pages>  <!--pages section added by James (sorry, but I had to add this)-->
      <controls>
        <add tagPrefix="AJAX" namespace="AjaxControlToolkit" assembly="AjaxControlToolkit" />
      </controls>
    </pages>

<%@ Register TagPrefix="AJAX" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %> <!--this section added by James (sorry, but I had to add this)-->--%>
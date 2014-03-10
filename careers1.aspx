﻿<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="careers1.aspx.cs" Inherits="Default2" EnableEventValidation="false"  %> <%----%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">
    
    <h3>
        <asp:Literal ID="ltl_title" runat="server" Text="Job Postings" /></h3>



    <asp:Panel ID="pnl_all" runat="server">
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
                        <asp:Button ID="btn_viewDetails" runat="server" Text="view details" OnCommand="subAdmin" CommandName="ViewDetails" CommandArgument='<%# Eval("Id") %>' />
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </asp:Panel>

    <asp:Panel ID="pnl_viewDetails" runat="server">

        <%--= = = PANEL FOR VIEW DETAILS BUTTON = = =--%>

        <div style="background-color: #c3c3c3;">
            <h3>
                <asp:Label ID="lbl_title" runat="server" Text="View Details" /></h3>

            <%--= = =  REPEATER INSIDE PANEL = = =--%>

            <asp:Repeater ID="rpt_popup" runat="server">
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

            <%--= = = BUTTONS  = = =--%>
            <asp:Button ID="lnk_careerApp" runat="server" PostBackUrl="~/career_application.aspx"  Text="Go to career application page" />

            <%--!!!!!!!!!!!!!! change url of this button !!!!!!!!!!!!!!!!!!!--%>
            <asp:Button ID="lnk_volunteerApp" runat="server" PostBackUrl="~/login.aspx"  Text="Go to volunteer application page" />

            <asp:Button ID="btn_OK" runat="server" Text="OK" />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" />
        </div>


    </asp:Panel>



</asp:Content>

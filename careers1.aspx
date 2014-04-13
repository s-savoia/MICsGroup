<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="careers1.aspx.cs" Inherits="Default2" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/public_master.master" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<%--This feature displays job postings at the three hospitals of MICs Group. Users can click on a view details button to view the details of a job posting.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--PAGE TITLE--%>
    <h3> 
        <asp:Literal ID="ltl_title" runat="server" Text="Job Postings" />
    </h3>

    <%--JOB POSTINGS PANEL--%>
    <asp:Panel ID="pnl_all" runat="server">

        <%--INSTRUCTIONS FOR USING THIS FEATURE--%>
        <asp:CheckBoxList ID="cbl_instructions" runat="server">
            <asp:ListItem Text="Listed below are current job postings that are available at MICs Group hospitals." Selected="True" />
            <asp:ListItem Text="The basic information for each job posting is displayed. If you require more details about a posting, you can click on the 'view details' button for a particular posting." Selected="True" />
        </asp:CheckBoxList>
        <br />
        <br />
        
        <%--JOB POSTINGS REPEATER--%>
        <asp:Repeater ID="rpt_data" runat="server">

            <%--HEADER TEMPLATE--%>
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
                            <asp:Label ID="lbl_link" runat="server" Text="View more" /></th>
                    </tr>
            </HeaderTemplate>

            <%--ITEM TEMPLATE--%>
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

            <%--FOOTER TEMPLATE--%>
            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </asp:Panel>

    <%--JOB DETAILS PANEL--%>
    <asp:Panel ID="pnl_viewDetails" runat="server">

        <%--= = = PANEL FOR VIEW DETAILS BUTTON = = =--%>

        <div style="background-color: #c3c3c3;">
            <h3>
                <asp:Label ID="lbl_title" runat="server" Text="View Details" />
            </h3>
            <br />

            <%--= = =  REPEATER INSIDE PANEL = = =--%>

            <asp:Repeater ID="rpt_popup" runat="server">

                <%--HEADER TEMPLATE--%>
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>
                                <asp:Label ID="lbl_idI" runat="server" Text="Id" /></th>
                            <th colspan="3">
                                <asp:Label ID="lbl_positionI" runat="server" Text="Position" /></th>
                            <th colspan="3">
                                <asp:Label ID="lbl_location" runat="server" Text="Location" /></th>
                        </tr>
                </HeaderTemplate>

                <%--ITEM TEMPLATE--%>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Id") %></td>
                        <td colspan="3"><%# Eval("position") %></td>
                        <td colspan="3"><%# Eval("location") %></td>
                    </tr>
                    <tr>
                        <th colspan="2" style="text-decoration:underline;">
                            <asp:Label ID="lbl_details" runat="server" Text="Details" />
                        </th>
                    </tr>
                    <tr>
                        <td colspan="4"><%# Eval("details") %></td>
                    </tr>
                    <tr>
                        <td colspan="5">

                            <%--REDIRECTION INSTRUCTIONS--%>
                            <p>
                                <hr />
                                If you want to apply for a career/volunteer postion, click one of the two buttons below.
                                <br />
                                <br />
                                You will be redirected to another page. As well, the application is a general application form that will not be related to this job posting.                                
                            </p>
                        </td>
                    </tr>
                </ItemTemplate>

                <%--FOOTER TEMPLATE--%>
                <FooterTemplate>
                    </table>
                </FooterTemplate>

            </asp:Repeater>

            <%--BUTTONS  (go to career/volunteer application feature page or back to job postings panel--%>
            <asp:Button ID="lnk_careerApp" runat="server" PostBackUrl="~/career_application.aspx" Text="Go to career application page" />


            <asp:Button ID="lnk_volunteerApp" runat="server" PostBackUrl="~/careers3.aspx" Text="Go to volunteer application page" />

            <asp:Button ID="btn_OK" runat="server" Text="Back to job postings" />

        </div>

    </asp:Panel>

    <br />
    <br />
    
</asp:Content>


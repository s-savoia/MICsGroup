<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_jobposting.aspx.cs" Inherits="admin_Default" %>

<%@ MasterType VirtualPath="~/admin/admin_master.master" %>

<%--= = = Coded by: JAMES HONG = = = --%>

<%--This is the administrative side for managing job postings content.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--STYLESHEET--%>
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_job_postings.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">
       
    <%--Here is a message saying if an action (insert/update/delete) was successful or not.--%>
    <h3>
        <asp:Label ID="lbl_message" runat="server" /><br />
    </h3>

    <br />

    <%--VALIDATION SUMMARIES (insert, update)--%>
    <asp:ValidationSummary ID="vds_insert" runat="server" DisplayMode="List" ValidationGroup="insert" ShowMessageBox="true" ShowSummary="false" />

    <asp:ValidationSummary ID="vds_update" runat="server" DisplayMode="List" ValidationGroup="update" ShowMessageBox="true" ShowSummary="false" />


    <%--CONTENT MANAGEMENT BUTTONS (add a job posting, manage job postings--%>
    <asp:Button ID="btn_add" runat="server" Text="Add a job posting" OnCommand="subAdmin" CommandName="add" />
    <asp:Button ID="btn_manage" runat="server" Text="Manage job postings" OnCommand="subAdmin" CommandName="manage" />

    <br /><br />

    <%--= = = ADD A JOB PANEL (fields: position name, hospital name, job details) = = =--%>
    <asp:Panel ID="pnl_insert" runat="server" Visible="false">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_instruction" runat="server" Text="Add a job to the database" Font-Underline="true" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_positionI" runat="server" Text="Position" />
                </td>
                <td>
                    <asp:TextBox ID="txt_positionI" runat="server" ValidationGroup="insert" Columns="50" />
                    <asp:RequiredFieldValidator ID="rfv_positionI" runat="server" ControlToValidate="txt_positionI" Text="*" ErrorMessage="Position required" ValidationGroup="insert" CssClass="required" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_locationI" runat="server" Text="Location" />
                </td>
                <td>
                    <asp:TextBox ID="txt_locationI" runat="server" ValidationGroup="insert" Columns="50" />
                    <asp:RequiredFieldValidator ID="rfv_locationI" runat="server" ControlToValidate="txt_locationI" Text="*" ErrorMessage="Location required" ValidationGroup="insert" CssClass="required" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_detailsI" runat="server" Text="Details" />
                    <asp:RequiredFieldValidator ID="rfv_detailsI" runat="server" ControlToValidate="txt_detailsI" Text="*" ErrorMessage="Details required" ValidationGroup="insert" CssClass="required" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%--(the input entered in this textbox will need to sanitized. I tried using an HTMLEditorExtender, but I had runtime errors, so currently this textbox is unprotected against XSS)--%>
                    <asp:TextBox ID="txt_detailsI" runat="server" TextMode="MultiLine" CssClass="adm-textArea" ValidationGroup="insert" Columns="80" Rows="10" />
                </td>                
            </tr>
            <tr>
                <td>
                    <%--BUTTONS (insert, cancel)--%>
                    <asp:Button ID="btn_insertI" runat="server" Text="Insert" CommandName="InsertC" OnCommand="subAdmin" ValidationGroup="insert" />
                    <asp:Button ID="btn_cancelI" runat="server" Text="Cancel" CommandName="CancelC" OnCommand="subAdmin" CausesValidation="false" />

                </td>
            </tr>
        </table>

    </asp:Panel>

    <%--MAIN PANEL--%>
    <asp:Panel ID="pnl_main" runat="server" Visible="false">

        <%--= = = JOB POSTINGS LISTVIEW (display the id,, position name, and hospital name for each job posting)= = =--%>
        <asp:ListView ID="ltv_main" runat="server" DataKeyNames="Id" OnItemCommand="subControl">

            <LayoutTemplate>
                <table>
                    <thead>
                        <table>
                            <tr>
                                <th>
                                    <asp:Label ID="lbl_headingId" runat="server" Text="Id" />
                                </th>
                                <th>
                                    <asp:Label ID="lbl_headingPosition" runat="server" Text="Position" />
                                </th>
                                <th>
                                    <asp:Label ID="lbl_headingLocation" runat="server" Text="Location" />
                                </th>
                                <th>Options
                                </th>
                            </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </tbody>
                    <tfoot>
                </table>
                </tfoot>                
            </LayoutTemplate>

            <%--= = = ITEM TEMPLATE = = =--%>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_position" runat="server" Text='<%#Eval("position") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_location" runat="server" Text='<%#Eval("location") %>' />
                    </td>
                    <td>
                        <%--BUTTONS (edit, delete)--%>
                        <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="EditC" CommandArgument='<%#Eval("Id") %>' />
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="DeleteC" OnClientClick='confirm("Are you sure you want to delete this?");' />
                    </td>
                </tr>
            </ItemTemplate>

            <%--= = = EDIT ITEM TEMPLATE = = =--%>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lbl_IdE" runat="server" Text="Id" />

                    </td>
                    <td>
                        <asp:Label ID="lbl_id2E" runat="server" Text='<%#Eval("Id") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_positionE" runat="server" Text="Position" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_positionE" runat="server" Text='<%#Eval("position") %>' ValidationGroup="update" Columns="50" />
                        <asp:RequiredFieldValidator ID="rfv_positionE" runat="server" ControlToValidate="txt_positionE" Text="*" ErrorMessage="Position required" ValidationGroup="update" CssClass="required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_locationE" runat="server" Text="Location" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_locationE" runat="server" Text='<%#Eval("location") %>' ValidationGroup="update" Columns="50" />
                        <asp:RequiredFieldValidator ID="rfv_locationE" runat="server" ControlToValidate="txt_locationE" Text="*" ErrorMessage="Location required" ValidationGroup="update" CssClass="required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_detailsE" runat="server" Text="Details" />
                        <asp:RequiredFieldValidator ID="rfv_detailsE" runat="server" ControlToValidate="txt_detailsE" Text="*" ErrorMessage="Details required" ValidationGroup="update" CssClass="required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_detailsE" runat="server" TextMode="MultiLine" Rows="10" Columns="80" Text='<%#Eval("details") %>' ValidationGroup="update" CssClass="" />
                    </td>                    
                </tr>
                <tr>
                    <td>
                        <%--BUTTONS (update, cancel)--%>
                        <asp:Button ID="btn_updateE" runat="server" Text="Update" CommandName="UpdateC" ValidationGroup="update" />
                        <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="CancelC" CausesValidation="false" />

                    </td>
                </tr>

            </EditItemTemplate>

        </asp:ListView>

    </asp:Panel>

</asp:Content>


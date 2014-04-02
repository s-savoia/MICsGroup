<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_jobposting.aspx.cs" Inherits="admin_Default" %>

<%--This page is coded by: JAMES HONG--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_job_postings_styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--Here is a message saying if an action (insert/update/delete) was successful or not.--%>
    <h3>
        <asp:Label ID="lbl_message" runat="server" /><br />
    </h3>

    <br />

    <asp:ValidationSummary ID="vds_insert" runat="server" DisplayMode="List" ValidationGroup="insert" ShowMessageBox="true" ShowSummary="false" />

    <asp:ValidationSummary ID="vds_update" runat="server" DisplayMode="List" ValidationGroup="update" ShowMessageBox="true" ShowSummary="false" />


    <%--CONTENT MANAGEMENT BUTTONS--%>

    <asp:Button ID="btn_add" runat="server" Text="Add a job posting" OnCommand="subAdmin" CommandName="add" />
    <asp:Button ID="btn_manage" runat="server" Text="Manage job postings" OnCommand="subAdmin" CommandName="manage" />

    <br /><br />

    <%--= = = ADD A JOB  = = =--%>

    <asp:Panel ID="pnl_insert" runat="server" Visible="false">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_instruction" runat="server" Text="Add a job to the database" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_positionI" runat="server" Text="Position" />
                </td>
                <td>
                    <asp:TextBox ID="txt_positionI" runat="server" ValidationGroup="insert" />
                    <asp:RequiredFieldValidator ID="rfv_positionI" runat="server" ControlToValidate="txt_positionI" Text="*" ErrorMessage="Position required" ValidationGroup="insert" CssClass="required" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_locationI" runat="server" Text="Location" />
                </td>
                <td>
                    <asp:TextBox ID="txt_locationI" runat="server" ValidationGroup="insert" />
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
                    <asp:TextBox ID="txt_detailsI" runat="server" TextMode="MultiLine" CssClass="adm-textArea" ValidationGroup="insert" Columns="200" Rows="20" />
                </td>                
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_insertI" runat="server" Text="Insert" CommandName="InsertC" OnCommand="subAdmin" ValidationGroup="insert" />
                    <asp:Button ID="btn_cancelI" runat="server" Text="Cancel" CommandName="CancelC" OnCommand="subAdmin" CausesValidation="false" />

                </td>
            </tr>
        </table>

    </asp:Panel>

    <asp:Panel ID="pnl_main" runat="server" Visible="false">
        <%--= = = LISTVIEW = = =--%>
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
                        <asp:TextBox ID="txt_positionE" runat="server" Text='<%#Eval("position") %>' ValidationGroup="update" />
                        <asp:RequiredFieldValidator ID="rfv_positionE" runat="server" ControlToValidate="txt_positionE" Text="*" ErrorMessage="Position required" ValidationGroup="update" CssClass="required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_locationE" runat="server" Text="Location" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_locationE" runat="server" Text='<%#Eval("location") %>' ValidationGroup="update" />
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
                        <asp:TextBox ID="txt_detailsE" runat="server" TextMode="MultiLine" Text='<%#Eval("details") %>' ValidationGroup="update" CssClass="" />
                    </td>
                    <%--adm-textArea--%>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btn_updateE" runat="server" Text="Update" CommandName="UpdateC" ValidationGroup="update" />
                        <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="CancelC" CausesValidation="false" />

                    </td>
                </tr>

            </EditItemTemplate>

        </asp:ListView>

    </asp:Panel>

</asp:Content>


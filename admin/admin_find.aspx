<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_find.aspx.cs" Inherits="admin_Default" %>

<%@ MasterType VirtualPath="~/admin/admin_master.master" %>

<%--= = = Coded by: JAMES HONG = = =--%>

<%--This feature manages content for the various services at MICs Group. Currently there are three hospitals (Bingham, Anson, and Lady Minto).--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--STYLESHEET--%>
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_services.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--MESSAGE (displays result of an action: add, update, delete)--%>
    <h3>
        <asp:Label ID="lbl_message" runat="server" /><br />
        <br />
    </h3>

    <%--HEADING (displays which hospital's content is currently being managed)--%>
    <div class="floatL" style="margin-right:2%;">
        <asp:Label ID="lbl_manageContentTitle" runat="server" Text="Manage content for: " />
    </div>

    <%--HOSPITAL NAME (name of hospital which is currently being managed)--%>
    <div class="floatL margin-bottom-m">
        <h3 class="">
            <asp:Label ID="lbl_hospitalName" runat="server" Font-Bold="true" Font-Underline="true" /><br />
        </h3>
    </div>

    <br class="clear-both" />

    <%--PANEL FOR DROP DOWN LISTS (choose a mode and a hospital)--%>
    <asp:Panel ID="pnl_ddls" runat="server" CssClass="margin-bottom-m">
        <div class="floatL margin-right-m">
            <h4>Choose a mode</h4>
            <br />

            <%--CHOOSE A MODE (add/edit a service)--%>
            <asp:DropDownList ID="ddl_mode" runat="server" OnSelectedIndexChanged="subDDLMode" AutoPostBack="true">
                <asp:ListItem Text="Choose a mode" Value="not_chosen" />
                <asp:ListItem Text="Add a service" Value="pnl_insert" />
                <asp:ListItem Text="Edit a service" Value="pnl_edit" />
            </asp:DropDownList>
        </div>

        <%--PANEL TO CHOOSE A HOSPITAL--%>
        <asp:Panel ID="pnl_hospitalDDL" runat="server" CssClass="floatL">
            <h4>Choose a hospital</h4>
            <br />

            <%--CHOOSE A HOSPITAL--%>
            <asp:DropDownList ID="ddl_locationsC" runat="server" Visible="false" OnSelectedIndexChanged="subDDLlocations" AutoPostBack="true">
            </asp:DropDownList>
        </asp:Panel>

        <br class="clear-both" />
    </asp:Panel>

    <%--PANEL TO ADD A SERVICE--%>
    <asp:Panel ID="pnl_insert" runat="server">

        <%--VALIDATION SUMMARY FOR INSERT PANEL--%>
        <asp:ValidationSummary ID="vds_insert" runat="server" DisplayMode="List" ShowMessageBox="false" ValidationGroup="insert" ShowSummary="true" />
        <br />
        <br />

        <%--FORM TO ADD A SERVICE--%>
        <table>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lbl_header" runat="server" Text="Insert new record" Font-Bold="true" /></td>
            </tr>
            <tr>
                <td><strong>
                    <asp:Label ID="lbl_serviceI" runat="server" Text="Service" />
                </strong>
                </td>
                <td>
                    <%--SERVICE NAME--%>
                    <asp:TextBox ID="txt_serviceI" runat="server" Width="100%" MaxLength="100" />
                    <asp:RequiredFieldValidator ID="rfv_serviceI" runat="server" ControlToValidate="txt_serviceI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />
                </td>
            </tr>           
            <tr>
                <td><strong>
                    <asp:Label ID="lbl_locationI" runat="server" Text="Location" />
                </strong>
                </td>
                <td>
                    <%--LOCATION OF SERVICE--%>
                    <asp:DropDownList ID="ddl_locationsI" runat="server" />

                    <asp:RequiredFieldValidator ID="rfv_locationsI" runat="server" ControlToValidate="ddl_locationsI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />
                </td>
            </tr>

            <tr>
                <td><strong>
                    <asp:Label ID="lbl_uniqueI" runat="server" Text="Available only at this hospital?" />
                </strong>
                </td>
                <td>
                    <%--SERVICE UNIQUE TO THIS HOSPITAL?--%>
                    <asp:DropDownList ID="ddl_uniqueI" runat="server">
                        <asp:ListItem Text="No" Value="No " />
                        <asp:ListItem Text="Yes" Value="Yes" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_uniqueI" runat="server" ControlToValidate="ddl_uniqueI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />

                </td>
            </tr>
            <tr>
                <td><strong>
                    <asp:Label ID="lbl_detaiIsI" runat="server" Text="Details" />
                </strong>
                    <asp:RequiredFieldValidator ID="rfv_detailsI" runat="server" ControlToValidate="txt_detailsI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%--SERVICE DETAILS--%>
                    <asp:TextBox ID="txt_detailsI" runat="server" Width="100%" Height="300px" TextMode="MultiLine" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <%--BUTTONS (insert, cancel)--%>
                    <asp:Button ID="btn_insertI" runat="server" Text="Add" CommandName="InsertC" OnCommand="subInsert" ValidationGroup="insert" />
                    <asp:Button ID="btn_cancelI" runat="server" Text="Cancel" CommandName="CancelC" OnCommand="subInsert" CausesValidation="false" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <%--SQL DATA SOURCE FOR LOCATIONS (this table is already in the database, which is managed by the administrative side of the locations feature in admin_location.aspx)--%>
    <asp:SqlDataSource ID="sds_locations" runat="server" ConnectionString="<%$ ConnectionStrings:DB_65873_micConnectionString %>" SelectCommand="SELECT [name] FROM [mic_locations]" />

    <%--= = = EDIT PANEL (view/edit services) = = =--%>
    <asp:Panel ID="pnl_edit" runat="server">

        <%--DATALIST (to display services)--%>
        <asp:DataList ID="dlt_main" runat="server" RepeatLayout="flow" OnItemCommand="subAdmin">

            <%--= = = ITEM TEMPLATE = = =--%>
            <ItemTemplate>

                <table>
                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <asp:Label ID="lbl_IdE" runat="server" Text="Id" />

                        </td>
                        <td>
                            <%--ID--%>
                            <asp:Label ID="lbl_id2E" runat="server" Text='<%#Eval("id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <h4>
                                <%--SERVICE--%>
                                <asp:Label ID="lbl_service" runat="server" Text="Service" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <asp:Label ID="lbl_service2" runat="server" Text='<%# Eval("service") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <h4>
                                <asp:Label ID="lbl_location" runat="server" Text="Location" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <%--LOCATION--%>
                            <asp:Label ID="lbl_location2" runat="server" Text='<%# Eval("location") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <h4>
                                <%--SERVICE UNIQUE TO THIS HOSPITAL?--%>
                                <asp:Label ID="lbl_unique" runat="server" Text="Available only at this hospital?" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <asp:Label ID="lbl_unique2" runat="server" Text='<%# Eval("unique") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <h4>
                                <asp:Label ID="lbl_details" runat="server" Text="Details" />
                            </h4>
                        </td>
                        <td colspan="10" style="padding-bottom: 3%;">
                            <%--SERVICE DETAILS--%>
                            <asp:Label ID="lbl_details2" runat="server" Text='<%# Eval("details") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td colspan="3">
                            <%--BUTTONS (edit, delete)--%>
                            <asp:Button ID="btn_edit" runat="server" CommandName="EditC" Text="Edit" CausesValidation="false" />
                            <asp:Button ID="btn_delete" runat="server" CommandName="DeleteC" Text="Delete" OnClientClick='confirm("Are you sure you want to delete?");' />
                        </td>
                    </tr>
                </table>

            </ItemTemplate>

            <%--= = = EDIT TEMPLATE = = =--%>
            <EditItemTemplate>

                <table>
                     <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <asp:Label ID="lbl_IdE" runat="server" Text="Id" />

                        </td>
                        <td colspan="10">
                            <%--SERVICE ID--%>
                            <asp:Label ID="lbl_id2E" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <asp:Label ID="lbl_serviceE" runat="server" Text="Service" />
                        </td>
                        <td colspan="10">
                            <%--SERVICE NAME--%>
                            <asp:TextBox ID="txt_serviceE" runat="server" Text='<%# Eval("service") %>'  ValidationGroup="update" /> 
                            <asp:RequiredFieldValidator ID="rfv_serviceE" runat="server" ControlToValidate="txt_serviceE" Text="*" ErrorMessage="Service title required" ValidationGroup="update" CssClass="required" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <asp:Label ID="lbl_locationE" runat="server" Text="Location" />
                        </td>
                        <td colspan="10">
                            <%--LOCATION OF SERVICE--%>
                            <asp:DropDownList ID="ddl_locationsE" runat="server" DataSourceID="sds_locationsE" DataTextField="name" DataValueField="name" ValidationGroup="update" />
                            <asp:SqlDataSource ID="sds_locationsE" runat="server" ConnectionString="<%$ ConnectionStrings:DB_65873_micConnectionString %>" SelectCommand="SELECT [name] FROM [mic_locations]" />
                            <asp:RequiredFieldValidator ID="rfv_locationsE" runat="server" ControlToValidate="ddl_locationsE" Text="*" ForeColor="Red" ValidationGroup="update" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom: 3%;">
                            <asp:Label ID="lbl_uniqueE" runat="server" Text="Available only at this location?" />
                        </td>
                        <td colspan="10">
                            <%--SERVICE UNIQUE TO THIS HOSPITAL?--%>
                            <asp:DropDownList ID="ddl_uniqueE" runat="server">
                                <asp:ListItem Text="No" Value="No " />
                                <asp:ListItem Text="Yes" Value="Yes" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_uniqueE" runat="server" ControlToValidate="ddl_uniqueE" Text="*Required" ForeColor="Red" ValidationGroup="update" />
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
                            <%--SERVICE DETAILS--%>
                            <asp:TextBox ID="txt_detailsE" runat="server" TextMode="MultiLine" Rows="10" Columns="80" Text='<%# Eval("details") %>' ValidationGroup="update" CssClass="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <%--BUTTONS (update, cancel)--%>
                            <asp:Button ID="btn_updateE" runat="server" Text="Update" CommandName="UpdateC" ValidationGroup="update" />
                            <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="CancelC" CausesValidation="false" />

                        </td>
                    </tr>

                </table>

            </EditItemTemplate>

            <%--= = = SEPARATOR TEMPLATE = = =--%>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:DataList>

    </asp:Panel>

</asp:Content>


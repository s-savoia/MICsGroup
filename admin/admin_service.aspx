<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_service.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <h3>
        <asp:Label ID="lbl_message" runat="server" /><br />
    </h3>

    <h4>Choose a mode</h4>
    <asp:DropDownList ID="ddl_mode" runat="server" OnSelectedIndexChanged="subChangeMode" AutoPostBack="true">
        <asp:ListItem Text="Choose a mode" />
        <asp:ListItem Text="Add a service" Value="pnl_insert" />
        <asp:ListItem Text="Edit a service" Value="pnl_edit" />
    </asp:DropDownList>

    <asp:Panel ID="pnl_insert" runat="server">

        <asp:ValidationSummary ID="vds_insert" runat="server" DisplayMode="List" ShowMessageBox="false" ValidationGroup="insert" ShowSummary="true" />
        <br />
        <br />

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
                    <asp:TextBox ID="txt_serviceI" runat="server" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_serviceI" runat="server" ControlToValidate="txt_serviceI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />
                </td>
            </tr>

            <tr>
                <td><strong>
                    <asp:Label ID="lbl_locationI" runat="server" Text="Location" />
                </strong>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_locationsI" runat="server" DataSourceID="sds_locations" DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_locationsI" runat="server" ControlToValidate="ddl_locationsI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />
                </td>
            </tr>

            <tr>
                <td><strong>
                    <asp:Label ID="lbl_uniqueI" runat="server" Text="Available only at this hospital?" />
                </strong>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_uniqueI" runat="server">
                        <asp:ListItem Text="No" Value="N" />
                        <asp:ListItem Text="Yes" Value="Y" />                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_uniqueI" runat="server" ControlToValidate="ddl_uniqueI" Text="*Required" ForeColor="Red" ValidationGroup="insert" />

                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnClick="subInsert" ValidationGroup="insert" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:SqlDataSource ID="sds_locations" runat="server" ConnectionString="<%$ ConnectionStrings:DB_65873_micConnectionString %>" SelectCommand="SELECT [name] FROM [mic_locations]" />
    

    <%--This is the edit panel. Products (records) can be updated, deleted, or a cancel button may be clicked to see all the products.--%>
    <asp:Panel ID="pnl_edit" runat="server">

        <%--This is a DataList control to display the records (products) in a database. The items in this DataList are rendered as span elements.--%>
        <asp:DataList ID="dlt_main" runat="server" RepeatLayout="flow">
            <%--OnEditCommand="subShowEditTemplate" OnUpdateCommand="subCommitUpdate" OnDeleteCommand="subCommitDelete" OnCancelCommand="subCancel"--%>

            <%--This is the item template for each item (product). Each product has an Id, a name, a description, and a price. The values are being
                        retrieved from a table called products in the database. There is also an edit button to switch to the edit template.--%>
            <ItemTemplate>

                <table>
                    <tr>
                        <td>
                            <h4>
                                <asp:Label ID="lbl_id" runat="server" Text="Service" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <asp:Label ID="lbl_id2" runat="server" Text='<%# Eval("service") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <h4>
                                <asp:Label ID="lbl_name" runat="server" Text="Location" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <asp:Label ID="lbl_name2" runat="server" Text='<%# Eval("location") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <h4>
                                <asp:Label ID="lbl_desc" runat="server" Text="Available only at this hospital?" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <asp:Label ID="lbl_desc2" runat="server" Text='<%# Eval("unique") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <h4>
                                <asp:Label ID="lbl_price" runat="server" Text="Details" />
                            </h4>
                        </td>
                        <td colspan="10">
                            <asp:Label ID="lbl_price2" runat="server" Text='<%# Eval("details") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btn_edit" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="btn_delete" runat="server" CommandName="Delete" Text="Delete" OnClientClick='confirm("Are you sure you want to delete?");' />
                        </td>
                    </tr>
                </table>

            </ItemTemplate>

            <%--This is the edit template. It looks the same as the item template, but the insert panel is missing (ie. only the edit template is displayed).
                    Instead of the id of the current product being displayed, a hidden field is used. There are three buttons (update, delete, and cancel). When a
                        user clicks on the delete button, a confirm alert box displays asking for confirmation of the delete.--%>
            <EditItemTemplate>

                <table>

                    <tr>
                        <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
                        <td>
                            <asp:Label ID="lbl_nameU" runat="server" Text="Name" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("Name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_descU" runat="server" Text="Description" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("Description") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_priceU" runat="server" Text="Price" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_priceU" runat="server" Text='<%#Eval("Price") %>' />
                            <asp:CompareValidator ID="cpv_priceU" runat="server" ControlToValidate="txt_priceU" Operator="DataTypeCheck" Type="Currency" Text="A number must be inputted." ForeColor="IndianRed" ValidationGroup="update" />
                            <asp:Label ID="lbl_priceCheckE" runat="server" ForeColor="IndianRed" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                            &nbsp;
                                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("Id") %>' OnClientClick=' return confirm("Confirm delete?");' />
                            &nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                        </td>

                    </tr>
            </EditItemTemplate>

            <%--This is a separator template that renders a horizonal rule between items (products).--%>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:DataList>

    </asp:Panel>

</asp:Content>


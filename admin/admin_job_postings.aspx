<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_job_postings.aspx.cs" Inherits="admin_Default" %>

<%--This page is coded by: JAMES HONG--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_job_postings_styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <asp:GridView ID="grv_main" runat="server" DataKeyNames="Id" AllowPaging="true" AutoGenerateColumns="false" PagerSettings-Mode="NumericFirstLast">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
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
                </HeaderTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_Id" runat="server" Text="Id" />

                        </td>
                        <td>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='1' /> <%--<%#Eval("Id"); %>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_position" runat="server" Text="Position" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_postionI" runat="server" Text='doctor' ValidationGroup="insert" /> <%--<%#Eval("position"); %>--%>
                            <asp:RequiredFieldValidator ID="rfv_positionI" runat="server" ControlToValidate="txt_postionI" Text="*" ErrorMessage="Position required" ValidationGroup="insert" CssClass="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_locationI" runat="server" Text='Matheson' ValidationGroup="insert" /> <%--<%#Eval("location"); %>--%>
                            <asp:RequiredFieldValidator ID="rfv_locationI" runat="server" ControlToValidate="txt_locationI" Text="*" ErrorMessage="Location required" ValidationGroup="insert" CssClass="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Label ID="lbl_details" runat="server" Text="Details" />
                            <asp:RequiredFieldValidator ID="rfv_detailsI" runat="server" ControlToValidate="txt_detailsI" Text="*" ErrorMessage="Details required" ValidationGroup="insert" CssClass="required" />
                    </td>
                    </tr>
                    <tr>
                        <asp:TextBox ID="txt_detailsI" runat="server" TextMode="MultiLine" Text='best doctor' CssClass="adm-textArea" /> <%--<%#Eval("details"); %>--%>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btn_insertI" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" />
                            <asp:Button ID="btn_cancelI" runat="server" Text="Cancel" CommandName="Cancel" OnCommand="subAdmin" />
                            
                        </td>
                    </tr>

                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%--<%#Eval("Id"); %>--%>
                        </td>
                        <td>
                           <%-- <%#Eval("position"); %>--%>
                        </td>
                        <td>
                            <%--<%#Eval("location"); %>--%>
                        </td>
                        <td>
                            <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='' OnCommand="subAdmin" /> <%--<%#Eval("Id"); %>--%>
                            <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='' OnCommand="subAdmin" /> <%--<%#Eval("Id"); %>--%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>


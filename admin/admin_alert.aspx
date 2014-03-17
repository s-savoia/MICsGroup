<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_alert.aspx.cs" Inherits="admin_alert" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="../App_Themes/admin_theme/admin_alert_style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="wraper">
            <h1>
                <asp:Label ID="admin1" runat="server">Admin page for Alerts</asp:Label></h1>

            <h2>
                <asp:Label ID="insert" runat="server" Text="Insert new Alert:" />
            </h2>

            <asp:Label ID="lbl_message" runat="server" />

            <%--<asp:ValidationSummary ID="val_alert" runat="server" HeaderText="Errors" ShowSummary="true" ShowMessageBox="true" />--%>

            <%--******** INPUT USERS ********--%>

            <table>
                <tr>
<%--                    <td>
                        <asp:Label ID="date" runat="server" Text="Date of the alert:" />
                    </td>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                        <asp:TextBox ID="txt_date" runat="server" />--%>

                        <%--                        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" ControlToValidate="txt_date" Display="Dynamic" Text="*Required" ErrorMessage="Is not a date" SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                        <asp:CompareValidator ID="cv_date" runat="server" Operator="DataTypeCheck" Text="Is not a date" ControlToValidate="txt_date" Type="Date" ValidationGroup="insert" Display="Dynamic" />--%>

                        <%--<asp:CalendarExtender ID="calendar" runat="server" TargetControlID="txt_date" />--%>

<%--                    </td>
                </tr>--%>

                <tr>
                    <td>
                        <asp:Label ID="title" runat="server" Text="Title of the alert:<br /> 100 characters" />
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txt_title" runat="server" TextMode="MultiLine" Rows="4" Columns="50" />

                        <%--                        <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="txt_date" Display="Dynamic" Text="*Required" ErrorMessage="Please insert the title" SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                        <asp:RegularExpressionValidator ID="rev_title" ControlToValidate="txt_date" runat="server" ErrorMessage="Please insert the title" ValidationExpression="^[a-zA-Z'.\s]{5,100}$" ValidationGroup="insert" />--%>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="short_alert" runat="server" Text="Short Text:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_short" runat="server" TextMode="MultiLine" EnableViewState="false" Rows="4" Columns="50" />

                        <%--                        <cc1:Editor ID="Editor1" runat="server" TargetControlID="txt_short" />--%>

                        <%--                        <asp:RequiredFieldValidator ID="rfv_shot" runat="server" ControlToValidate="txt_short" Display="Dynamic" Text="*Required" ErrorMessage="Please insert the text" SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                        <asp:RegularExpressionValidator ID="rev_short" ControlToValidate="txt_date" runat="server" ErrorMessage="Please insert the text" ValidationExpression="^[a-zA-Z'.\s]{5,200}$" ValidationGroup="insert" />--%>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="long_alert" runat="server" Text="Long Text:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_long" runat="server" TextMode="MultiLine" Rows="4" Columns="50" />

                    </td>
                </tr>
            </table>


            <p class="left">
                <asp:Button runat="server" ID="btn_insert" CommandName="Insert" OnCommand="subAdmin" Text="Insert Alert" />
            </p>

            <p class="left">
                <asp:Button ID="btn_Cancel" Text="Cancel" runat="server" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" />
            </p>

            <div class="line"></div>


            <%--******** PANEL SHOW THE ALERTS ********--%>

            <asp:Panel ID="pnl_all" runat="server">

                <h2>Health Alerts</h2>

                <asp:Repeater ID="rpt_all" runat="server">

                    <ItemTemplate>
                        <div class="content">
                            <div class="date">
                                <%#Eval("date_alert") %>
                            </div>

                            <div class="title">
                                <%#Eval("title_alert") %>
                            </div>
                            <div class="short">
                                <p>Short Text:</p>
                                <%#Eval("short_alert") %>
                            </div>
                            <div class="long">
                                <p>Long Text:</p>
                                <%#Eval("long_alert") %>
                            </div>
                            <div class="left">
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("Id") %>' OnCommand="subAdmin" />
                            </div>
                            <div class="right">
                                <asp:Button ID="btl_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("Id") %>' OnCommand="subAdmin" />
                            </div>
                        </div>
                    </ItemTemplate>

                    <AlternatingItemTemplate>

                        <div class="alternating">
                            <div class="date">
                                <%#Eval("date_alert") %>
                            </div>

                            <div class="title">
                                <%#Eval("title_alert") %>
                            </div>
                            <div class="short">
                                <p>Short Text:</p>
                                <%#Eval("short_alert") %>
                            </div>
                            <div class="long">
                                <p>Long Text:</p>
                                <%#Eval("long_alert") %>
                            </div>
                            <div class="left">
                                <asp:Button ID="btn_update" runat="server" Text="Update"
                                    CommandName="Update" CommandArgument='<%#Eval("Id") %>' OnCommand="subAdmin" />
                            </div>
                            <div class="right">
                                <asp:Button ID="btl_delete" runat="server" Text="Delete"
                                    CommandName="Delete" CommandArgument='<%#Eval("Id") %>' OnCommand="subAdmin" />
                            </div>
                        </div>

                    </AlternatingItemTemplate>

                </asp:Repeater>
            </asp:Panel>



            <%--********panel to update *********--%>
            <asp:Panel runat="server" ID="pnl_update">

                <h2>Update Health Alerts</h2>
                <table>
                    <thead>
                        <tr>
                            <%--<th>
                                <asp:Label runat="server" ID="lbl_dateU" Text="Date" />
                            </th>--%>
                            <th>
                                <asp:Label runat="server" ID="lbl_titleU" Text="Title Alert" />
                            </th>
                            <th>
                                <asp:Label runat="server" ID="lbl_shortU" Text="Alert Short Text" />
                            </th>
                            <th>
                                <asp:Label runat="server" ID="lbl_longU" Text="Alert Long Text" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rpt_update" OnItemCommand="subUpDel">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("Id") %>' />

                                        <%--<asp:TextBox runat="server" ID="txt_dateU" Text='<%#Eval("date_alert") %>' />--%>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_titleU" Text='<%#Eval("title_alert") %>'
                                            TextMode="MultiLine" Rows="3" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_shortU" Text='<%#Eval("short_alert") %>'
                                            Rows="3" TextMode="MultiLine" />
                                    </td>

                                    <td>
                                        <asp:TextBox runat="server" ID="txt_longU" Text='<%#Eval("long_alert") %>'
                                         Rows="3" TextMode="MultiLine" />
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <%--<asp:RequiredFieldValidator ID="rfv_dateU" runat="server" Text="*Required" ControlToValidate="txt_dateU" ValidationGroup="update" Display="Dynamic" />

                                        <asp:CompareValidator ID="cv_date" runat="server" Operator="DataTypeCheck" Text="Is not a date" ControlToValidate="txt_dateU" Type="Date" ValidationGroup="update" Display="Dynamic" />--%>
                                    </td>

                                    <td>
                                        <%--<asp:RequiredFieldValidator ID="rfv_titleU" runat="server" Text="*Required" ControlToValidate="txt_titleU" ValidationGroup="update" Display="Dynamic" />--%>
                                    </td>

                                    <td>
                                        <%--<asp:RequiredFieldValidator ID="rfv_shortU" runat="server" Text="*Required" ControlToValidate="txt_shortU" ValidationGroup="update" Display="Dynamic" />--%>
                                    </td>

                                    <td>
                                        <%--<asp:RequiredFieldValidator ID="rfv_longU" runat="server" Text="*Required" ControlToValidate="txt_longU" ValidationGroup="update" Display="Dynamic" />--%>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <asp:Button runat="server" ID="btn_update" Text="Update" CommandName="Update" ValidationGroup="update" />
                                        &nbsp;&nbsp;&nbsp;

                                        <asp:Button runat="server" ID="btn_cancel" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--end repeter Update--%>
                    </tbody>
                </table>
            </asp:Panel>


            <%--******* panel to delete ********--%>
            <asp:Panel runat="server" ID="pnl_delete" GroupingText="Delete Health Alerts">
                <table>
                    <thead>
                        <tr>
                            <td colspan="3">
                                <asp:Label runat="server" ID="lbl_delete" Text="Are you sure you want to delete this item?" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lbl_dateD" runat="server" Text="Date:" />
                            </th>
                            <th>
                                <asp:Label ID="lbl_titleD" runat="server" Text="Alert Title:" />
                            </th>
                            <th>
                                <asp:Label ID="lbl_shortD" runat="server" Text="Alert Short Text:" />
                            </th>

                            <th>
                                <asp:Label ID="lbl_longD" runat="server" Text="Alert Long Text:" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("Id") %>' />

                                        <asp:TextBox runat="server" ID="txt_dateD" Text='<%#Eval("date_alert") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_titleD" Text='<%#Eval("title_alert") %>' TextMode="MultiLine" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_shortD" Text='<%#Eval("short_alert") %>' TextMode="MultiLine" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_longD" Text='<%#Eval("long_alert") %>' TextMode="MultiLine" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <asp:Button runat="server" ID="btn_delete" Text="Delete" CommandName="Delete" />
                                        &nbsp;&nbsp;&nbsp;

                                        <asp:Button runat="server" ID="btn_cancel" Text="Cancel" CommandName="Cancel" />
                                    </td>
                                </tr>

                            </ItemTemplate>

                        </asp:Repeater>
                        <%--end repeter delete--%>
                    </tbody>
                </table>
            </asp:Panel>

        </div>
    </form>
</body>
</html>

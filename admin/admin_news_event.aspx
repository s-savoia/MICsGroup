<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_news_event.aspx.cs" Inherits="admin_admin_news_event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">
    <link href="../App_Themes/admin_theme/admin_events_styles.css" rel="stylesheet" />

    <%--*******************--%>

    <div class="wraper1">
        <h1>
            <asp:Label ID="admin1" runat="server">Admin page for News and Events</asp:Label></h1>

        <h2>
            <asp:Label ID="insert" runat="server" Text="Create new record:" />
        </h2>

        <h3>
            <asp:Label ID="lbl_message" runat="server" ForeColor="#ff8149" /></h3>

        <%--<asp:ValidationSummary ID="val_alert" runat="server" HeaderText="Errors" ShowSummary="true" ShowMessageBox="true" />--%>

        <%--******** INPUT USERS ********--%>

        <table class="table1">

            <tr>
                <td>
                    <asp:Label ID="title" runat="server" Text="Title:<br /> 100 characters" />
                </td>
                <td class="td_left">
                    <asp:TextBox ID="txt_title" runat="server" TextMode="MultiLine" Rows="2" Columns="40" ValidationGroup="insert" />

                    <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="txt_title" Display="Dynamic" Text="*Required" ErrorMessage="Please insert the title" SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                    <%--<asp:RegularExpressionValidator ID="rev_title" ControlToValidate="txt_date" runat="server" ErrorMessage="Please insert the title" ValidationExpression="^[a-zA-Z'.\s]{5,100}$" ValidationGroup="insert" />--%>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="short_ne" runat="server" Text="Short content:" />
                </td>
                <td class="td_left">
                    <asp:TextBox ID="txt_short" runat="server" TextMode="MultiLine" EnableViewState="false"
                        Rows="2" Columns="40" ValidationGroup="insert" />


                    <asp:RequiredFieldValidator ID="rfv_shot" runat="server" ControlToValidate="txt_short"
                        Display="Dynamic" Text="*Required" ErrorMessage="Please insert the text"
                        SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                    <%-- <asp:RegularExpressionValidator ID="rev_short" ControlToValidate="txt_date" runat="server" ErrorMessage="Please insert the text" ValidationExpression="^[a-zA-Z'.\s]{5,200}$" ValidationGroup="insert" />--%>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="long_ne" runat="server" Text="Content:" />
                </td>
                <td class="td_left">
                    <asp:TextBox ID="txt_content" runat="server" TextMode="MultiLine"
                        Rows="2" Columns="40" ValidationGroup="insert" />

                    <asp:RequiredFieldValidator ID="rfv_content" runat="server" ControlToValidate="txt_content"
                        Display="Dynamic" Text="*Required" ErrorMessage="Please insert the text"
                        SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Label ID="lbl_t1" runat="server" Text="Please select the category:" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:RadioButton ID="rbt_event" Text="Event" runat="server"
                        GroupName="news_event" ValidationGroup="insert" />
                </td>
                <td class="td_left">
                    <asp:RadioButton ID="rbt_news" Text="News" runat="server"
                        GroupName="news_event" ValidationGroup="insert" />

                </td>
            </tr>
        </table>


        <p class="left">
            <asp:Button runat="server" ID="btn_insert" CommandName="Insert" OnCommand="subAdmin"
                Text="Insert" />
        </p>

        <p class="left">
            <asp:Button ID="btn_Cancel" Text="Cancel" runat="server" OnCommand="subAdmin"
                CommandName="Cancel" CausesValidation="false" />
        </p>

        <div class="line"></div>


        <%--******** PANEL SHOW THE NEWS & EVENTS ********--%>

        <asp:Panel ID="pnl_all" runat="server">

            <h2>News nad Events</h2>

            <asp:Repeater ID="rpt_all" runat="server">

                <ItemTemplate>
                    <div class="content1">
                        <div class="news">
                            <%#Eval("category") %>
                        </div>

                        <div class="date">
                            <%#Eval("date") %>
                        </div>

                        <div class="title">
                            <%#Eval("title") %>
                        </div>
                        <div class="short">
                            <p>Short Content:</p>
                            <%#Eval("short_cont") %>
                        </div>
                        <div class="long">
                            <p>Content:</p>
                            <%#Eval("Content") %>
                        </div>
                        <div class="left">
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("Id") %>' OnCommand="subAdmin" />
                        </div>
                        <div class="right">
                            <asp:Button ID="btl_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("Id") %>' OnCommand="subAdmin" />
                        </div>
                    </div>
                </ItemTemplate>

<%--                <AlternatingItemTemplate>

                    <div class="news">
                        <%#Eval("category") %>
                    </div>

                    <div class="alternating">
                        <div class="date">
                            <%#Eval("date") %>
                        </div>

                        <div class="title">
                            <%#Eval("title") %>
                        </div>
                        <div class="short">
                            <p>Short Text:</p>
                            <%#Eval("short_cont") %>
                        </div>
                        <div class="long">
                            <p>Long Text:</p>
                            <%#Eval("content") %>
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

                </AlternatingItemTemplate>--%>

            </asp:Repeater>
        </asp:Panel>



        <%--********panel to update *********--%>
        <asp:Panel runat="server" ID="pnl_update">

            <h2>Update News and Events</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>
                            <asp:Label runat="server" ID="lbl_titleU" Text="Title:" />
                        </th>
                        <th>
                            <asp:Label runat="server" ID="lbl_shortU" Text="Short Text:" />
                        </th>
                        <th>
                            <asp:Label runat="server" ID="lbl_longU" Text="Content:" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="rpt_update" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr style="float: left;">
                                <td>
                                    <asp:Label ID="date1" runat="server" Text='<%#Eval("date") %>' />
                                    <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("Id") %>' />

                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txt_titleU" Text='<%#Eval("title") %>'
                                        TextMode="MultiLine" Rows="4" Width="150" ValidationGroup="upate" />
                                </td>
                                <td style="margin: 4px;">
                                    <asp:TextBox runat="server" ID="txt_shortU" Text='<%#Eval("short_cont") %>'
                                        Rows="4" TextMode="MultiLine" Width="180" ValidationGroup="upate" />
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="txt_contentU" Text='<%#Eval("content") %>'
                                        Rows="4" TextMode="MultiLine" ValidationGroup="upate" />
                                </td>

                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_titleU" runat="server" Text="*Required" ControlToValidate="txt_titleU" ValidationGroup="update" Display="Dynamic" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_shortU" runat="server" Text="*Required" ControlToValidate="txt_shortU" ValidationGroup="update" Display="Dynamic" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_longU" runat="server" Text="*Required" ControlToValidate="txt_contentU" ValidationGroup="update" Display="Dynamic" />
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
                            <asp:Label ID="lbl_titleD" runat="server" Text="Title:" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_shortD" runat="server" Text="Short content:" />
                        </th>

                        <th>
                            <asp:Label ID="lbl_longD" runat="server" Text="Content:" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("Id") %>' />

                                    <asp:Label runat="server" ID="txt_dateD" Text='<%#Eval("date") %>' />
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txt_titleD" Text='<%#Eval("title") %>' TextMode="MultiLine" />
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txt_shortD" Text='<%#Eval("short_cont") %>' TextMode="MultiLine" />
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txt_longD" Text='<%#Eval("content") %>' TextMode="MultiLine" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <asp:Button runat="server" ID="btn_delete" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?')" />
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


</asp:Content>


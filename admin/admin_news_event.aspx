<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_news_event.aspx.cs" Inherits="admin_admin_news_event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">


       <link href="../App_Themes/admin_theme/admin_alert_style.css" rel="stylesheet" />

<%--*******************--%>

            <div class="wraper1">
            <h1>
                <asp:Label ID="admin1" runat="server">Admin page for News and Events</asp:Label></h1>

            <h2>
                <asp:Label ID="insert" runat="server" Text="Insert new Alert:" />
            </h2>

            <h3><asp:Label ID="lbl_message" runat="server" ForeColor="#ff8149" /></h3>

            <%--<asp:ValidationSummary ID="val_alert" runat="server" HeaderText="Errors" ShowSummary="true" ShowMessageBox="true" />--%>

            <%--******** INPUT USERS ********--%>

            <table class="table1">

                <tr>
                    <td >
                        <asp:Label ID="title" runat="server" Text="Title of the News or Event:<br /> 100 characters" />
                    </td>
                    <td  class="td_left">
                        <asp:TextBox ID="txt_title" runat="server" TextMode="MultiLine" Rows="2" Columns="40" ValidationGroup="insert" />

                       <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="txt_title" Display="Dynamic" Text="*Required" ErrorMessage="Please insert the title" SetFocusOnError="true" Font-Size="Small" ForeColor="Red" ValidationGroup="insert" />

                        <%--<asp:RegularExpressionValidator ID="rev_title" ControlToValidate="txt_date" runat="server" ErrorMessage="Please insert the title" ValidationExpression="^[a-zA-Z'.\s]{5,100}$" ValidationGroup="insert" />--%>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="short_ne" runat="server" Text="Short Text:" />
                    </td>
                    <td  class="td_left">
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

                    </td>
                </tr>

                <tr>
                    <td colspan="2">Please select if the Info is an Event or a News:</td>
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
                    Text="Insert Alert" />
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
                                <%--<asp:Label ID="lbl_category" runat="server" OnLoad="lbl_category_Load" />--%>
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

                    <AlternatingItemTemplate>

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

                    </AlternatingItemTemplate>

                </asp:Repeater>
            </asp:Panel>



            <%--********panel to update *********--%>
            <asp:Panel runat="server" ID="pnl_update" >

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
                                <tr style="float:left;">
                                    <td>
                                        <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("Id") %>' />


                                        <%--**********************************************************************
                                        *******  OJO preguntar lo de si es una noticia poner news o events ******
                                        *************************************************************************--%>

                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_titleU" Text='<%#Eval("title") %>'
                                            TextMode="MultiLine" Rows="4" Width="150" />
                                    </td>
                                    <td style="margin:4px;">
                                        <asp:TextBox runat="server" ID="txt_shortU" Text='<%#Eval("short_cont") %>'
                                            Rows="4" TextMode="MultiLine" Width="180" />
                                    </td>

                                    <td>
                                        <asp:TextBox runat="server" ID="txt_contentU" Text='<%#Eval("content") %>'
                                         Rows="4" TextMode="MultiLine" />
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

                                        <asp:TextBox runat="server" ID="txt_dateD" Text='<%#Eval("date") %>' />
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


</asp:Content>


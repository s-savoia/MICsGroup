<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_appointment.aspx.cs" Inherits="admin_Default" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/admin_theme/admin_appointment_styles.css" rel="stylesheet" />
</asp:content>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    <asp:Label ID="lbl_message" runat="server" CssClass="appointments_response_message" />
    <h2>Book an Appointment - Admin</h2>
    <asp:LinkButton ID="btn_show_create" runat="server" Text="Create Appointment Timeslots" OnClick="subShowCreate" />
    <asp:LinkButton ID="btn_show_view" runat="server" Text="View Appointments" OnClick="subShowView" />

    <asp:Panel ID="pnl_appointment_create" runat="server">
        <asp:ValidationSummary ID="vs_insert" runat="server" ValidationGroup="insert" ShowMessageBox="true" ShowSummary="false" />
        <h3>Create an Appointment Timeslot</h3>
        <table id="create_appointment_table">
            <tr>
                <td class="cat_left"><asp:Label ID="lbl_date" runat="server" Text="Date:" /></td>
                <td>
                    <asp:TextBox ID="txt_date" runat="server" />
                    <AJAX:CalendarExtender ID="ce_date" runat="server" TargetControlID="txt_date" FirstDayOfWeek="Sunday" Format="yyyy-MM-dd" DefaultView="Days" PopupButtonID="ibtn_calendar" />
                    <asp:ImageButton ID="ibtn_calendar" runat="server" ImageUrl="~/admin/img/calendar_button.png" ToolTip="Select Appointment Date" />
                    <asp:RequiredFieldValidator ID="rfv_date" runat="server" Text="*" ControlToValidate="txt_date" Display="Dynamic" ValidationGroup="insert" ErrorMessage="Please enter a timeslot date" />
                <asp:RegularExpressionValidator ID="rev_date" runat="server" Text="*" ControlToValidate="txt_date" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$" ValidationGroup="insert" ErrorMessage="Please use the format YYYY-MM-DD" />
                </td>
            </tr>
            <tr>
                <td class="cat_left"><asp:Label ID="lbl_time" runat="server" Text="Times:" /></td>
                <td>
                    <asp:ListBox ID="lb_time" runat="server" SelectionMode="Multiple">
                        <asp:ListItem Value="9:00:00 AM" Selected="True">9:00am</asp:ListItem>
                        <asp:ListItem Value="9:30:00 AM">9:30am</asp:ListItem>
                        <asp:ListItem Value="10:00:00 AM">10:00am</asp:ListItem>
                        <asp:ListItem Value="10:30:00 AM">10:30am</asp:ListItem>
                        <asp:ListItem Value="11:00:00 AM">11:00am</asp:ListItem>
                        <asp:ListItem Value="11:30:00 AM">11:30am</asp:ListItem>
                        <asp:ListItem Value="12:00:00 PM">12:00pm</asp:ListItem>
                        <asp:ListItem Value="12:30:00 PM">12:30pm</asp:ListItem>
                        <asp:ListItem Value="1:00:00 PM">1:00pm</asp:ListItem>
                        <asp:ListItem Value="1:30:00 PM">1:30pm</asp:ListItem>
                        <asp:ListItem Value="2:00:00 PM">2:00pm</asp:ListItem>
                        <asp:ListItem Value="2:30:00 PM">2:30pm</asp:ListItem>
                        <asp:ListItem Value="3:00:00 PM">3:00pm</asp:ListItem>
                        <asp:ListItem Value="3:30:00 PM">3:30pm</asp:ListItem>
                        <asp:ListItem Value="4:00:00 PM">4:00pm</asp:ListItem>
                        <asp:ListItem Value="4:30:00 PM">4:30pm</asp:ListItem>
                        <asp:ListItem Value="5:00:00 PM">5:00pm</asp:ListItem>
                        <asp:ListItem Value="5:30:00 PM">5:30pm</asp:ListItem>
                        <asp:ListItem Value="6:00:00 PM">6:00pm</asp:ListItem>
                        <asp:ListItem Value="6:30:00 PM">6:30pm</asp:ListItem>
                    </asp:ListBox>
                    
                    
<%--                    <asp:DropDownList ID="ddl_time" runat="server">
                        <asp:ListItem Value="9:00:00 AM">9:00am</asp:ListItem>
                        <asp:ListItem Value="9:30:00 AM">9:30am</asp:ListItem>
                        <asp:ListItem Value="10:00:00 AM">10:00am</asp:ListItem>
                        <asp:ListItem Value="10:30:00 AM">10:30am</asp:ListItem>
                        <asp:ListItem Value="11:00:00 AM">11:00am</asp:ListItem>
                        <asp:ListItem Value="11:30:00 AM">11:30am</asp:ListItem>
                        <asp:ListItem Value="12:00:00 PM">12:00pm</asp:ListItem>
                        <asp:ListItem Value="12:30:00 PM">12:30pm</asp:ListItem>
                        <asp:ListItem Value="1:00:00 PM">1:00pm</asp:ListItem>
                        <asp:ListItem Value="1:30:00 PM">1:30pm</asp:ListItem>
                        <asp:ListItem Value="2:00:00 PM">2:00pm</asp:ListItem>
                        <asp:ListItem Value="2:30:00 PM">2:30pm</asp:ListItem>
                        <asp:ListItem Value="3:00:00 PM">3:00pm</asp:ListItem>
                        <asp:ListItem Value="3:30:00 PM">3:30pm</asp:ListItem>
                        <asp:ListItem Value="4:00:00 PM">4:00pm</asp:ListItem>
                        <asp:ListItem Value="4:30:00 PM">4:30pm</asp:ListItem>
                        <asp:ListItem Value="5:00:00 PM">5:00pm</asp:ListItem>
                        <asp:ListItem Value="5:30:00 PM">5:30pm</asp:ListItem>
                        <asp:ListItem Value="6:00:00 PM">6:00pm</asp:ListItem>
                        <asp:ListItem Value="6:30:00 PM">6:30pm</asp:ListItem>
                </asp:DropDownList>--%>
                </td>
            </tr>
            <tr>
                <td class="cat_left"></td>
                <td>
                    <asp:Button ID="btn_create_timeslot" runat="server" Text="Create" ValidationGroup="insert" OnClick="subInsert" />
                </td>
            </tr>
        </table>

    </asp:Panel>

    <asp:Panel ID="pnl_appointment_view" runat="server">
        <h3>View Appointment Timeslots</h3>

        <asp:DropDownList ID="ddl_view_appointments" runat="server" OnSelectedIndexChanged="subChangeEdited" AutoPostBack="true"  />
        
        <div id="appointments_admin_list">
                    <asp:Listview ID="lv_appointments" runat="server" OnItemCommand="subUpDel" >
                        <ItemTemplate>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
                            <h3><%#DataBinder.Eval(Container.DataItem, "date", "{0:h:mm tt}")%></h3>
                            <asp:Panel ID="pnl_booked_timeslot" runat="server" Visible='<%#Eval("booked") %>'>
                            <table>
                                <tr>
                                    <td class="va_left_side">First Name:</td>
                                    <td><%#Eval("fname") %></td>
                                </tr>
                                <tr>
                                    <td class="va_left_side">Last Name:</td>
                                    <td><%#Eval("lname") %></td>
                                </tr>
                                <tr>
                                    <td class="va_left_side">Address:</td>
                                    <td>
                                        <%#Eval("address") %>,
                                        <br />
                                        <%#Eval("city") %>, <%#Eval("province") %>
                                        <br />
                                        <%#Eval("postal_code") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="va_left_side">Phone:</td>
                                    <td><%#Eval("phone") %></td>
                                </tr>
                                <tr>
                                    <td class="va_left_side">Reason for Appointment:</td>
                                    <td><%#Eval("reason") %></td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                    <td>
                                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete_This" OnClientClick="return confirm('Confirm delete?');" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnl_free_timeslot" runat="server" Visible='<%# !(bool)Eval("booked") %>'>
                            <span class="appointments_free_time">Timeslot has not been booked.</span>
                            <asp:Button ID="Button1" runat="server" Text="Delete" CommandName="Delete_This" OnClientClick="return confirm('Confirm delete?');" />
                        </asp:Panel>

                        </ItemTemplate>
                    </asp:Listview>
            </div>
    </asp:Panel>
</asp:Content>


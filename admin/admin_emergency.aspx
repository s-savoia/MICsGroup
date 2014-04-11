<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_emergency.aspx.cs" Inherits="admin_admin_emergency"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <h1>Emergency Waiting Time</h1>
    <p>Please enter the number of patients to display the emergency waiting time.</p>
    <asp:Panel ID="pnl_main" runat="server" GroupingText="Emergency waiting time">
        <table>
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_locations" runat="server" Text="Hospital Location" /></th>
                    <th><asp:Label ID="lbl_patients" runat="server" Text="Number of Patients waiting" /></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt_emergency" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                               <asp:Label ID="lbl_loctaion" runat="server" Text='<%#Eval("location")%>' />
                            </td>
                            <td>
                                <asp:Label ID="lbl_patients" runat="server" Text='<%#Eval("patients")%>' />
                                
                            </td>
                            <td>
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("Id")%>' OnCommand="subUp" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>      
    </asp:Panel>
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Details" >
        <hr />
        <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpdate">
            <ItemTemplate>
                 <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("Id")%>' />
                <asp:Label ID="lbl_locationsU" runat="server" Text="Hospital Location" />
                <asp:Label ID="lbl_locationU" runat="server" Text='<%#Eval("location")%>' />
                <br />
                <asp:Label ID="lbl_patientsU" runat="server" Text="Number of Patients waiting" />
                <asp:TextBox ID="txt_patientsU" runat="server" Text='<%#Eval("patients")%>' />
                <br />
                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
             </ItemTemplate>
          </asp:Repeater>
    </asp:Panel>
</asp:Content>


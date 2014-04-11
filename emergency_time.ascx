<%@ Control Language="C#" AutoEventWireup="true" CodeFile="emergency_time.ascx.cs" Inherits="emergency_time" %>

  <asp:ScriptManagerProxy ID="scm_main" runat="server" />
    <asp:UpdatePanel ID="udp_emergency" runat="server">
    <ContentTemplate>
    <asp:Repeater ID="rpt_detail" runat="server">
        <ItemTemplate>
            <asp:Label ID="lbl_location" runat="server" Text='<%#Eval("location")%>' />
            <br />
            <asp:Label ID="lbl_time" runat="server" Text='<%#Eval("time")%>' />     
            <br /> 
            <br />     
        </ItemTemplate>
    </asp:Repeater>
    <asp:Timer ID="tmr_main" runat="server" Interval="5000" OnTick="subTick" />
    </ContentTemplate>
    </asp:UpdatePanel>
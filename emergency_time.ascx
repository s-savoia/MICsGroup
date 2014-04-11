<%@ Control Language="C#" AutoEventWireup="true" CodeFile="emergency_time.ascx.cs" Inherits="emergency_time" %>
<link href="App_Themes/public_theme/emergency_wait_styles.css" rel="stylesheet" />

<div class="main">
  <asp:ScriptManagerProxy ID="scm_main" runat="server" />
    <asp:UpdatePanel ID="udp_emergency" runat="server">
    <ContentTemplate>
    <asp:Repeater ID="rpt_detail" runat="server">
        <ItemTemplate>
            <div class="Location">
            <asp:Label ID="lbl_location" runat="server" Text='<%#Eval("location")%>' />
            </div>
           
            <div class="time">
            <asp:Label ID="lbl_time" runat="server" Text='<%#Eval("time")%>' />  
            </div>   
               
        </ItemTemplate>
    </asp:Repeater>
    <asp:Timer ID="tmr_main" runat="server" Interval="5000" OnTick="subTick" />
    </ContentTemplate>
    </asp:UpdatePanel>
    </div>
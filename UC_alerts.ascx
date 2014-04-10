<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_alerts.ascx.cs" Inherits="UC_alerts" %>

<%--**** CODE BY CLAUDIA ****--%>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="js/script_alert.js"></script>

<link href="App_Themes/public_theme/home_style.css" rel="stylesheet" media="all" />

<%--*************************************--%>



<div class="alert">
    <asp:Label ID="alert1" runat="server" Text=">> ALERTS" />
    <asp:HyperLink ID="hpl_alert" runat="server" NavigateUrl="~/alert_list.aspx" Target="_blank">
        <div id="columnas">
            <asp:Repeater ID="rpt_main" runat="server">
                <ItemTemplate>

                    <div class="text_alert"><%#Eval("title_alert")%> </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:HyperLink>
</div>

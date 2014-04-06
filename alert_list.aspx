<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="alert_list.aspx.cs" Inherits="alert_list" %>

<%--****** CODE BY CLAUDIA ******--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">

<link href="App_Themes/public_theme/alert_styles.css" rel="stylesheet" />

    <div class="wraper1">

           <h1>Health Alerts</h1>

                <asp:Repeater ID="rpt_main" runat="server">

                    <ItemTemplate>
                        <div class="content1">
                            <div class="date">
                                <%#Eval("date_alert") %>
                            </div>

                            <div class="title1">
                                <%#Eval("title_alert") %>
                            </div>
                            <div class="short">
                                <p>Summary:</p>
                                <%#Eval("short_alert") %>
                            </div>
                            <div class="long">
                                <p>Alert Details</p>
                                <%#Eval("long_alert") %>
                            </div>
                            
                        </div>
                    </ItemTemplate>

                </asp:Repeater>
    </div>


    
</asp:Content>


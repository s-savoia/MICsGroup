<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="news_events.aspx.cs" Inherits="news_events" %>

<%--****** CODE BY CLAUDIA ******--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <link href="App_Themes/public_theme/news_events_styles.css" rel="stylesheet" />

    <div class="wraper1">
        <h1>News and Events</h1>

        <asp:DataList ID="dtl_main" runat="server" DataKeyField="Id" RepeatColumns="1" GridLines="Horizontal">


            <ItemTemplate>
                <div class="content1">
                    <div class="date1">
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("date") %>' />
                    </div>
                    <div class="title1">
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("title") %>' />
                    </div>

                    <div class="img">
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("img") %>' />
                    </div>

                    <div class="long">
                        <p>
                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("content") %>' />
                        </p>
                    </div>

                </div>
            </ItemTemplate>

        </asp:DataList>


    </div>



</asp:Content>


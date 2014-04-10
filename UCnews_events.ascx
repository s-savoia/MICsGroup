<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCnews_events.ascx.cs" Inherits="UCnews_events" %>
<link href="App_Themes/public_theme/news_styles.css" rel="stylesheet" />

<%--**** CODE BY CLAUDIA ****--%>

 <script src="js/jquery-latest.pack.js" type="text/javascript"></script>

    <script src="js/jcarousellite_1.0.1c4.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $(".newsticker-jcarousellite").jCarouselLite({
                vertical: true,
                hoverPause: true,
                visible: 1,
                auto: 500,
                speed: 6000
            });
        });
    </script>

    <%-- *************************--%>

   
        <div id="newsticker-demo">
            <div class="newsticker-jcarousellite">
                <ul>
                            <li>

            <asp:DataList ID="dtl_main" runat="server" DataKeyField="Id" RepeatColumns="1" GridLines="Horizontal">
                <ItemTemplate>
                                <div class="categ">
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("category") %>' />
                                </div>
                                <div class="date1">
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("date") %>' />
                                </div>
                                <div class="title1">
                                    <asp:HyperLink runat="server" ID="lnk_alert" NavigateUrl="~/alert_list.aspx">
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("title") %>' />
                                    </asp:HyperLink>
                                    
                                </div>

                                <%--<div class="img">
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("img") %>' />
                                </div>--%>

                                <div class="long">
                                    <p>
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("shorT_cont") %>' />
                                    </p>
                                </div>
                           

                   
                </ItemTemplate>

            </asp:DataList>
                                 </li>
                        </ul>

                 </div>
        </div>
</asp:Content>

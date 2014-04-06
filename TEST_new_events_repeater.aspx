<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="TEST_new_events_repeater.aspx.cs" Inherits="TEST_new_events" %>

<%@ Register TagName="news_events" TagPrefix="ne" Src="~/UCnews_events.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <%--<link rel="stylesheet" href="style.css" type="text/css" media="screen" />--%>
  
    <script src="js/jquery-latest.pack.js" type="text/javascript"></script>

    <script src="js/jcarousellite_1.0.1c4.js" type="text/javascript"></script>

   <%--<script type="text/javascript">
       $(function () {
           $('#mycarousel').jcarousel();
       });
    </script>--%>

    <script>

        var timer;
        function autoScrollFunction() {
            

            $(function(){

                var pane = $('.wrapperContent');

                pane.jScrollPane({
                    horizontalDragMaxWidth: 86,
                    horizontalDragMinWidth: 86,
                    animateScroll: true,
                    animateDuration : 20000
                });

                var api = pane.data('jsp');

                api.scrollToX(parseInt(900));
                return false;
            });


        }
        timer = setInterval(changeImageFeature);


        $("#super_feature").hover(function () {
            clearInterval(timer); // stop the timer
        });


</script>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #newsticker-demo {
            width: 90%;
            background: #00ff21;
            padding: 2%;
            font-family: Verdana,Arial,Sans-Serif;
            font-size: .9em;
            margin: 1% auto;
        }

            #newsticker-demo a {
                text-decoration: none;
            }

            #newsticker-demo img {
                border: 2px solid #FFFFFF;
            }

            #newsticker-demo .title {
                text-align: center;
                font-size: 14px;
                font-weight: bold;
                padding: 5px;
            }

        .newsticker-jcarousellite {
            width: 300px;
        }

         .newsticker-jcarousellite ul {
                list-style: none;
                display: block;
                padding-bottom: 1px;
                margin-bottom: 5px;

            }

            .newsticker-jcarousellite ul li {
                list-style: none;
                display: block;
                padding-bottom: 1px;
                margin-bottom: 5px;
            }

            .newsticker-jcarousellite .thumbnail {
                float: left;
                width: 110px;
            }

            .newsticker-jcarousellite .info {
                float: right;
                width: 190px;
            }

                .newsticker-jcarousellite .info span.cat {
                    display: block;
                    font-size: 10px;
                    color: #808080;
                }

        .clear {
            clear: both;
        }


        .wrapperContent {
               width: 90%;
            background: #00ff21;
            padding: 2%;
            font-family: Verdana,Arial,Sans-Serif;
            font-size: .9em;
            margin: 1% auto;
        }
    </style>

    <%-- *************************--%>

    
        <h1>News and Events</h1>

<%--        <div id="newsticker-demo">
            <ul  id="mycarousel" class="jcarousel-skin-tango">
            <asp:Repeater ID="rpt_main" runat="server" >

                <ItemTemplate>                        
                            <li>
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
                            </li>
                        
                </ItemTemplate>

            </asp:Repeater>
            </ul>

        </div>--%>

    *********************** otro intento


            <div id="super_feature">
            <%--<ul  id="mycarousel" class="jcarousel-skin-tango">--%>
            <asp:Repeater ID="rpt_main" runat="server" >

                <ItemTemplate>                        
                            <%--<li>--%>
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
                            <%--</li>--%>
                        
                </ItemTemplate>

            </asp:Repeater>
         <%--   </ul>--%>

        </div>






</asp:Content>


﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCnews_events.ascx.cs" Inherits="UCnews_events" %>

 <script src="js/jquery-latest.pack.js" type="text/javascript"></script>

    <script src="js/jcarousellite_1.0.1c4.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $(".newsticker-jcarousellite").jCarouselLite({
                vertical: true,
                hoverPause: true,
                visible: 1,
                auto: 1000,
                speed: 4000
            });
        });
    </script>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #newsticker-demo {
            width: 90%;
            background: #fff;
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
    </style>

    <%-- *************************--%>

   
        <div id="newsticker-demo">
            <div class="newsticker-jcarousellite">
                <ul>
                            <li>

            <asp:DataList ID="dtl_main" runat="server" DataKeyField="Id" RepeatColumns="1" GridLines="Horizontal">
                <ItemTemplate>
                    
                        

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
                           

                   
                </ItemTemplate>

            </asp:DataList>
                                 </li>
                        </ul>

                 </div>
        </div>
</asp:Content>


<%--<div class="wraper1">
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


    </div>--%>
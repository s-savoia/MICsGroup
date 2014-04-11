<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_home_slide_show" %>

<%@ Register TagName="news_events" TagPrefix="ne" Src="~/UCnews_events.ascx" %>
<%@ Register TagName="alertUC" TagPrefix="aUC" Src="~/UC_alerts.ascx" %>
<%@ Register TagPrefix="uc" TagName="emergency_timeUC" Src="~/emergency_time.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--CODE BY CLAUDIA--%>

<!DOCTYPE html>

<link href="App_Themes/public_theme/home_style.css" rel="stylesheet" media="all" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%--****** SCRIPTS ALERT AND SLIDER ******--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/script_alert.js"></script>
    <script type="text/javascript" src="js/script_slider.js"></script>
    <title>HOME</title>
</head>

<body>
    <form id="form1" runat="server">


        <div class="wraper">

            <%--***** HEADER *****--%>
            <header>
                <div class="logo">
                    <asp:Image CssClass="img" runat="server" ID="logo" ImageUrl="~/img/logo.png" />
                    <h1>
                        <asp:Label ID="labl_hospital" runat="server">
                        MICs Group of Health Services
                        </asp:Label></h1>
                    <p>
                        <asp:Label ID="lbl_group" runat="server">
                            Bingham Memorial Hospital
                            <br />
                            Anson General Hospital
                            <br />
                            Lady Minto Hospital
                        </asp:Label>
                    </p>
                </div>

                <div class="box_head">
                    <div class="log">
                        <asp:LinkButton ID="btn" Text="Log in" runat="server" Target="_self" DescriptionUrl="~/home.aspx" />
                    </div>

                    <div class="reg">
                        <asp:LinkButton ID="btn_reg" Text="Register" runat="server" Target="_self" DescriptionUrl="~/home.aspx" />
                    </div>

                    <div class="access">
                        <asp:Image ImageUrl="~/img/access.png" runat="server" ID="img_acc" CssClass="a_img" />
                        <asp:LinkButton ID="btn_access" Text="Accessibility" DescriptionUrl="~/home.aspx" runat="server" />
                    </div>

                    <div class="donate">

                        <asp:LinkButton ID="btn_donate" Text="Donate Now" DescriptionUrl="~/home.aspx" runat="server" />
                    </div>
                </div>
            </header>


            <%--***** NAVEGATION MENU *****--%>
            <nav>
                <asp:SiteMapDataSource ID="sds_menu" runat="server" />

                <asp:Menu ID="menu_nav" DataSourceID="sds_menu" StaticDisplayLevels="2" Orientation="Horizontal" runat="server" DynamicMenuItemStyle-BackColor="#8cc63f" DisappearAfter="500" DynamicVerticalOffset="5" StaticEnableDefaultPopOutImage="false" DynamicHoverStyle-CssClass="DynamicHoverStyle" DynamicMenuItemStyle-CssClass="dropdown" CssClass="menu">
                    <StaticMenuItemStyle ItemSpacing="100" />

                    <Items>

                        <asp:MenuItem Text="Home" NavigateUrl="~/home.aspx" ToolTip="Home" Target="_self" />
                        <asp:MenuItem Text="Patients & Families" NavigateUrl="~/patients.aspx" ToolTip="Patients &amp; Families" />
                        <asp:MenuItem Text="Services & Programs " NavigateUrl="~/services.aspx" ToolTip="Services &amp; Programs" />
                        <asp:MenuItem Text="Careers" NavigateUrl="~/careers.aspx" ToolTip="Careers" />
                        <asp:MenuItem Text="About Us" NavigateUrl="~/about.aspx" ToolTip="About Us" />
                    </Items>
                </asp:Menu>
            </nav>

            <%--******** SLIDER SHOW *********--%>
            <div class="slider">

                <div id="photo">

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                    <%--******** SLIDE-SHOW CON JQUERY SLIDE ********--%>

                    <div id="columnas1">
                        <asp:Repeater ID="rpt_images" runat="server">
                            <ItemTemplate>
                                <div>
                                    <asp:HyperLink ID="hpl_1" runat="server" NavigateUrl='<%#Eval("link") %>'
                                            ForeColor="#ff66cc" Target="_blank" >
                                        <%--<%#Eval("name")%>--%>
                                        <asp:Image runat="server" ID="img" ImageUrl='<%#Eval("img") %>' CssClass="photo" />
                                        </asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <%--******** END SLIDE-SHOW ********--%>

                    <div class="shape1">

                        <asp:Image runat="server" ImageUrl="~/img/shape_slide_show.png" Height="250" CssClass="shape1" />

                    </div>

                </div>
                <asp:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnl_feature"></asp:DragPanelExtender>


                <%--***** BOX WITH FEATURES ****--%>

                <asp:Panel runat="server" ID="pnl_feature" CssClass="features">
                    <div class="btn">
                        <asp:Image ID="img_search" runat="server" ImageUrl="~/img/search.png" CssClass="icon" />
                        <asp:HyperLink ID="hpl_dr" runat="server" Text="Find a Doctor" NavigateUrl="#" />
                    </div>

                    <div class="btn">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/img/search.png" CssClass="icon" />
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Locations" />
                    </div>

                    <div class="btn">
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/img/money.png" CssClass="icon" />
                        <asp:HyperLink ID="HyperLink2" runat="server" Text="Pay your Bill" />
                    </div>

                    <div class="btn">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/img/cruz.png" CssClass="icon" />
                        <asp:HyperLink ID="HyperLink3" runat="server" Text="Symptom Checker" />
                    </div>

                    <div class="btn">
                        <asp:Image ID="Image8" runat="server" ImageUrl="~/img/phone.png" CssClass="icon" />
                        <asp:HyperLink ID="HyperLink4" runat="server" Text="Contact Us" />
                    </div>

                    <div class="btn">
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/img/pen.png" CssClass="icon" />
                        <asp:HyperLink ID="HyperLink5" runat="server" Text="Careers" />
                    </div>

                </asp:Panel>
            </div>
            <%--end features--%>



            <%--******** ALERT USER CONTROL **********--%>

            <aUC:alertUC ID="alert_UC" runat="server" />

            <%--******** END ALERT USER CONTROL **********--%>


            <%-- ********* BOOK AN APPOINTMENT BOX ************--%>
            <div class="box">

                <div class="box_left">
                    <h1 class="title">
                        <asp:Image runat="server" ID="Image1" ImageUrl="~/img/1.png" CssClass="shape" />
                        <asp:Label ID="label2" runat="server" Text="Book an Appointment" /></h1>
                    <asp:Literal ID="literal3" runat="server">
                    </asp:Literal>
                    <asp:Label ID="ImagePath" runat="server"></asp:Label>

                </div>

               <%-- ********* NEWS AND EVENTS BOX ************--%>
                <div class="box_centre">
                    <h1 class="title">
                        <asp:Image runat="server" ID="Image2" ImageUrl="~/img/1.png" CssClass="shape" />
                        <asp:Label ID="label3" runat="server" Text="  News &amp; Events" /></h1>
                    
                        <ne:news_events runat="server" ID="uc_newsEvent" />
                </div>


                <%-- ********* EMERGENCY WAITING TIME BOX ************--%>
                <div class="box_right">
                    <h1 class="title">
                        <asp:Image runat="server" ID="Image3" ImageUrl="~/img/1.png" CssClass="shape" />
                        <asp:Label ID="label4" runat="server" Text="Emergecy Waiting Time" /></h1>
                     
                       <uc:emergency_timeUC ID="emergency_wait" runat="server"  />
                       
                    <%--<div class="chat">
                        <asp:Image runat="server" ID="Image4" ImageUrl="~/img/chat.png" />
                    </div>--%>
                </div>


            </div>
            <%--**** END 3 BOXES ****--%>

            <div class="footer">
                <div class="box_l">
                    <p>
                        <asp:ImageButton ID="btn_fb" runat="server" ImageUrl="~/img/L2.png" />
                        <asp:ImageButton ID="btn_li" runat="server" ImageUrl="~/img/L3.png" />
                        <asp:ImageButton ID="btn_tw" runat="server" ImageUrl="~/img/L4.png" />
                        <asp:ImageButton ID="btn_you" runat="server" ImageUrl="~/img/L5.png" />
                    </p>
                </div>

                <div class="box_c">
                    <p>
                        <strong>
                            <asp:Literal runat="server" ID="literal" Text="PARTNERS" /></strong>
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink9" Text="Health Canada" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink10" Text="Ontario College of Physicians and Surgeons" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink11" Text="The Ontario Hospital Association" runat="server" />
                    </p>
                    <p>

                        <asp:HyperLink ID="HyperLink12" Text="Ontario Ministry of Health and Long Term Care" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink13" Text="Porcupine Health Unit" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink14" Text="Timmins and District Hospital" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink15" Text="Ontario Ministry of Health and Long Term Care" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink16" Text="Town of Cochrane" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink17" Text="Town of Iroquois Falls" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink18" Text="Town of Matheson" runat="server" />
                    </p>

                </div>

                <div class="box_r">
                    <p>
                        <asp:HyperLink ID="HyperLink7" Text="Site map" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink6" Text="Privacy &amp; Confidentiality" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink8" Text="Copyright &amp; terms of use" runat="server" />
                    </p>
                </div>
            </div>

        </div>

        <%--end wraper--%>
    </form>
</body>
</html>

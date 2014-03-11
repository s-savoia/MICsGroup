<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!-- This page is coded by CLAUDIA REINOZA -->

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--CODE BY CLAUDIA--%>

<!DOCTYPE html>

<link href="App_Themes/public_theme/home_style.css" rel="stylesheet" media="all" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


        <div class="wraper">
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



            <div class="slider">

                <div>
                    <asp:Button ID="btn_next" runat="server" Text=">>" CssClass="b_next" />
                    <asp:Button ID="btn_prev" runat="server" Text="<<" CssClass="b_prev" />
                    <asp:Button ID="btn_play" runat="server" Text="Play" CssClass="b_play" />

                </div>


                <%--******************* CODE slideshow *********************--%>

                <div id="photo">

                    <asp:ScriptManager ID="ScriptManager1" runat="server" />

                    <%--******************* link slideshow *********************--%>

                    <asp:HyperLink ID="HyperLink19" NavigateUrl="http://www.cbc.ca" runat="server" Target="_blank">
                        <asp:Image ID="slide_show" runat="server" CssClass="photo" />
                    </asp:HyperLink>

                    <asp:SlideShowExtender ID="SlideShowExtender" runat="server" TargetControlID="slide_show" SlideShowServiceMethod="GetImages" AutoPlay="true" Loop="true" PlayButtonID="btn_play" PlayButtonText="play" NextButtonID="btn_next" PreviousButtonID="btn_prev" StopButtonText="stop" />


                    <div class="shape1">

                        <asp:Image runat="server" ImageUrl="~/img/shape_slide_show.png" Height="250" CssClass="shape1" />

                    </div>

                </div>


                <asp:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnl_feature" />

                <%--nav features--%>
                <asp:Panel runat="server" ID="pnl_feature" CssClass="features">
                    <%--<div class="features">--%>
                    <div class="btn">
                        <asp:Image ID="img_search" runat="server" ImageUrl="~/img/search.png" CssClass="icon" />
                        <asp:HyperLink ID="hpl_dr" runat="server" Text="Find a Doctor" />
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

                    <%--</div>--%>
                </asp:Panel>
                <%--end features--%>
            </div>


            <div class="alert">
                <asp:Label runat="server" ID="lbl_alert" Text='<%#"title_alert"%>'>
                    In week 05, overall influenza activity continued to decrease in Canada, with most activity identified in eastern provinces.
                </asp:Label>
            </div>

            <div class="box">

                <div class="box_left">
                    <h1 class="title">
                        <asp:Image runat="server" ID="Image2" ImageUrl="~/img/1.png" CssClass="shape" />
                        <asp:Label ID="label2" runat="server" Text="Book an Appointment" /></h1>
                    <asp:Literal ID="literal3" runat="server">
                        Rfhfhfha fjhkzjfhfhhf f fhfhfh fhf fh fhf fhf hjkhk.
                    </asp:Literal>

                </div>

                <div class="box_centre">
                    <h1 class="title">
                        <asp:Image runat="server" ID="Image3" ImageUrl="~/img/1.png" CssClass="shape" />
                        <asp:Label ID="label3" runat="server" Text="  News &amp; Events" /></h1>
                    <asp:Literal ID="literal2" runat="server">
                        Rfhfhfha fjhkzjfhfhhf f fhfhfh fhf fh fhf fhf hjkhk.
                    </asp:Literal>
                </div>

                <div class="box_right">
                    <h1 class="title">
                        <asp:Image runat="server" ID="Image4" ImageUrl="~/img/1.png" CssClass="shape" />
                        <asp:Label ID="label4" runat="server" Text="CHAT with an advisor" /></h1>
                    <asp:Literal ID="literal1" runat="server">
                        Rfhfhfha fjhkzjfhfhhf f fhfhfh fhf fh fhf fhf hjkhk.
                    </asp:Literal>
                    <div class="chat">
                        <asp:Image runat="server" ID="Image10" ImageUrl="~/img/chat.png" />
                    </div>
                </div>


            </div>
            <%--end div box--%>

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

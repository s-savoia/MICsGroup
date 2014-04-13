<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<%@ MasterType VirtualPath="~/public_master.master" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/about_styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_aboutUs.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    
    <div class="wraper1">

    <asp:Literal ID="ltl_info" runat="server" Mode="PassThrough" Text="Welcome to the Humber MICs Group Hospital site. <br /><br /> This is a student project built by Humber College students in the Web Development post-graduate program of year 2013-2014. <br /><br /> The builders of this site are: Hidemi Nawata, Stephen Savoia, Prabhjot Mand, Claudia Reinoza, and James Hong. <br /><br /> Below you can find brief intoductions to the people behind the scenes. <br /><br /> Thank you. <br /><br /><br /><br />" />

    <asp:Panel ID="pnl_introJames" runat="server">
        <asp:Panel ID="pnl_imgJames" runat="server" CssClass="">
            <asp:Image ID="img_james" runat="server" ImageUrl="~/img/about/james.png" AlternateText="James Hong - Web Developer" Width="30%" Height="30%" />
        </asp:Panel>
        
        <asp:Panel ID="pnl_aboutJames" runat="server" CssClass="line-height-m link">
            <asp:Literal ID="ltl_about_james" runat="server" Mode="PassThrough" Text="James Hong<br />Web Developer<br /><br />James graduated from University of Waterloo, where he studied Liberal Studies, focusing in sociology. Enjoying the flexibility of the liberal studies program, he went on an adventure to teach English in South Korea. After four years of teaching, he decided to try web development and found his passion. Having found his joy for coding, he can spend hours puzzling over how to solve problems and make code work, because code problems are like puzzles for him. Although he enjoys coding in .NET, he loves to code in PHP. You can find out more about him at his blog: <a href='http://jameshong.ca'>jameshong.ca</a>." />
        </asp:Panel>
    </asp:Panel>

    <br class="clear" />
        
    <asp:Panel ID="pnl_introYourName" runat="server">
        <asp:Panel ID="pnl_imgYourName" runat="server" CssClass="">
            <asp:Image ID="img_YourName" runat="server" ImageUrl="~/" AlternateText="" Width="30%" Height="30%" />
        </asp:Panel>
        
        <asp:Panel ID="pnl_aboutYourName" runat="server" CssClass="line-height-m link">
            <asp:Literal ID="ltl_about_YourName" runat="server" Mode="PassThrough" Text="About you..." />
        </asp:Panel>
    </asp:Panel>

    <br class="clear" />

    </div>
    


</asp:Content>


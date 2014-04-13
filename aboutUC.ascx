<%@ Control Language="C#" AutoEventWireup="true" CodeFile="aboutUC.ascx.cs" Inherits="aboutUC" %>

<%--INTRODUCTION--%>
<asp:Literal ID="ltl_info" runat="server" Mode="PassThrough" Text="Welcome to the Humber MICs Group Hospital site. <br /><br /> This is a student project built by Humber College students in the Web Development post-graduate program of year 2013-2014. <br /><br /> The builders of this site are: Hidemi Nawata, Stephen Savoia, Prabhjot Mand, Claudia Reinoza, and James Hong. <br /><br /> Below you can find brief intoductions to the people behind the scenes. <br /><br /> Thank you. <br /><br /><br /><br />" />

    <%--ABOUT JAMES--%>
    <asp:Panel ID="pnl_introJames" runat="server">
        <asp:Panel ID="pnl_imgJames" runat="server" CssClass="">
            <%--IMAGE OF JAMES--%>
            <asp:Image ID="img_james" runat="server" ImageUrl="~/img/about/james.png" AlternateText="James Hong - Web Developer" Width="30%" Height="30%" />
        </asp:Panel>
        
        <asp:Panel ID="pnl_aboutJames" runat="server" CssClass="line-height-m link">
            <%--JAMES' BIO--%>
            <asp:Literal ID="ltl_about_james" runat="server" Mode="PassThrough" Text="James Hong<br />Web Developer<br /><br />James graduated from University of Waterloo, where he studied Liberal Studies, focusing in sociology. Enjoying the flexibility of the liberal studies program, he went on an adventure to teach English in South Korea. After four years of teaching, he decided to try web development and found his passion. Having found his joy for coding, he can spend hours puzzling over how to solve problems and make code work, because code problems are like puzzles for him. Although he enjoys coding in .NET, he loves to code in PHP. You can find out more about him at his blog: <a href='http://jameshong.ca'>jameshong.ca</a>." />
        </asp:Panel>
    </asp:Panel>

    <br class="clear" />
    
    <%--ABOUT STEPHEN--%>
    <asp:Panel ID="pnl_introStephen" runat="server">
        <asp:Panel ID="pnl_imgStephen" runat="server" CssClass="">
            <%--IMAGE OF STEPHEN--%>
            <asp:Image ID="img_stephen" runat="server" ImageUrl="~/img/about/stephen.png" AlternateText="Stephen Savoia- Web Developer" Width="30%" />
        </asp:Panel>
        
        <asp:Panel ID="pnl_aboutStephen" runat="server" CssClass="line-height-m link">
            <%--STEPHEN'S BIO--%>
            <asp:Literal ID="Literal1" runat="server" Mode="PassThrough" Text="Stephen Savoia<br />Web Developer<br /><br />Stephen graduated from the University of Toronto with a degree in psychology in 2012 and from Humber College's web development program in 2014. He loves bringing creativity and innovation to web development projects and is particularly interested in looking at the internet through the lenses of psychology and communication studies. You can find out more about him at his website: <a href='http://www.stephensavoia.com'>stephensavoia.com</a>." />
        </asp:Panel>
    </asp:Panel>

    <br class="clear" />

        <%--Write about yourself....--%>
    <asp:Panel ID="pnl_introYourName" runat="server">
        <asp:Panel ID="pnl_imgYourName" runat="server" CssClass="">
            <%--Your picture--%>
            <asp:Image ID="img_YourName" runat="server" ImageUrl="~/" AlternateText="" Width="30%" Height="30%" />
        </asp:Panel>
        
        <asp:Panel ID="pnl_aboutYourName" runat="server" CssClass="line-height-m link">
            <%--Your bio--%>
            <asp:Literal ID="ltl_about_YourName" runat="server" Mode="PassThrough" Text="About you..." />
        </asp:Panel>
    </asp:Panel>

    <br class="clear" />

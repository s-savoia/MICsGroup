<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="career_application.aspx.cs" Inherits="career_application" %>
<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/career_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <div ID="career_application">
        <%--Header and subheader--%>
        <asp:Label ID="lbl_careerhead" runat="server" Text="Job Application" CssClass="careerhead" />
        <br />
        <asp:Label ID="lbl_careersubhead" runat="server" Text="Please fill out the on-line application form below. (* denotes mandatory fields)" CssClass="careersubhead" />
        <br /><br />     

        <%--First Name--%>
        <asp:Label ID="lbl_fname" runat="server" Text="First Name:*" AssociatedControlID="txt_fname" />
        <asp:TextBox ID="txt_fname" runat="server" CssClass="txt_career" Columns="30" Rows="50"  Text='<%#Bind("fname")%>' />
        <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="*Required" ControlToValidate="txt_fname" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your first name" ValidationGroup="careerapplication" />
        <br /><br />
        <%--Last Name--%>
        <asp:Label ID="lbl_lname" runat="server" Text="Last Name:*" AssociatedControlID="txt_lname" />
        <asp:TextBox ID="txt_lname" runat="server" Columns="30" Rows="50" CssClass="txt_career" Text='<%#Bind("lname")%>' />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*Required" ControlToValidate="txt_fname" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your first name" ValidationGroup="careerapplication" />
        <br /><br />

        <%--email--%>
        <asp:Label ID="lbl_email" runat="server" Text="Email:*" AssociatedControlID="txt_email" />
        <asp:TextBox ID="txt_email" runat="server" Columns="30" Rows="50" CssClass="txt_career" Text='<%#Bind("email")%>' />
        <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your email" ValidationGroup="careerapplication" />
        <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="*Invalid email" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ValidationGroup="careerapplication" ErrorMessage="Your email is invalid" />
        <br /><br />

        <%--address--%>
        <asp:Label ID="lbl_address" runat="server" Text="Address:*" AssociatedControlID="txt_address" />
        <br />
        <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" CssClass="txt_multiline" Text='<%#Bind("address")%>' />
        <asp:RequiredFieldValidator ID="rfv_address" runat="server" Text="*Required" ControlToValidate="txt_address" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter an address" ValidationGroup="careerapplication" />
        <br /><br />

        <%--Country--%>
        <asp:Label ID="lbl_country" runat="server" Text="Country: " />
        <asp:Dropdownlist ID="ddl_country" runat="server" CausesValidation="false" SelectedValue='<%#Bind("country")%>' CssClass="ddl_career">
            <asp:ListItem Value="1" Text="Canada" Selected="True" />
            <asp:ListItem Value="2" Text="International" />
        </asp:Dropdownlist>

        <br /><br />
        <%--Province--%>
        <asp:Label ID="lbl_province" runat="server" Text="Province: " />
        <asp:Dropdownlist ID="ddl_province" runat="server" CausesValidation="false" SelectedValue='<%#Bind("province")%>' CssClass="ddl_careershort">
            <asp:ListItem Value="1" Text="ON" Selected="True" />
            <asp:ListItem Value="2" Text="QC" />
            <asp:ListItem Value="3" Text="NS" />
            <asp:ListItem Value="4" Text="NB" />
            <asp:ListItem Value="5" Text="MB" />
            <asp:ListItem Value="6" Text="BC" />
            <asp:ListItem Value="7" Text="PE" />
            <asp:ListItem Value="8" Text="SK" />
            <asp:ListItem Value="9" Text="AB" />
            <asp:ListItem Value="10" Text="NL" />
            <asp:ListItem Value="11" Text="N/A" />
        </asp:Dropdownlist>
        <br /><br />

        <%--city--%>
        <asp:Label ID="lbl_city" runat="server" Text="City:" AssociatedControlID="txt_city" />
        <asp:TextBox ID="txt_city" runat="server" CssClass="txt_career" Text='<%#Bind("city")%>' />
        <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*Required" ControlToValidate="txt_city" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a city" ValidationGroup="careerapplication" />
        <br /><br />

        <%--postal code--%>
        <asp:Label ID="lbl_zip" runat="server" Text="Postal Code:" AssociatedControlID="txt_zip" />
        <asp:TextBox ID="txt_zip" runat="server" CssClass="txt_career" Text='<%#Bind("zip")%>' />
        <asp:RequiredFieldValidator ID="rfv_zip" runat="server" Text="*Required" ControlToValidate="txt_zip" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter an postal code" ValidationGroup="careerapplication" />
        <asp:RegularExpressionValidator ID="rev_zip" runat="server" Text="*Invalid postal code: uppercase letters required" ControlToValidate="txt_zip" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ])\ {0,1}(\d[ABCEGHJKLMNPRSTVWXYZ]\d)$" ValidationGroup="careerapplication" ErrorMessage="Your postal code is invalid" />
        <br /><br />

        <%--phone number--%>
        <asp:Label ID="lbl_phone" runat="server" Text="Your phone number:" AssociatedControlID="txt_phone" />
        <asp:TextBox ID="txt_phone" runat="server" CssClass="txt_career" Text='<%#Bind("phone")%>' />
        <asp:RequiredFieldValidator ID="rfv_phone" runat="server" Text="*Required" ControlToValidate="txt_phone" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your phone number" ValidationGroup="careerapplication" />
        <asp:RegularExpressionValidator ID="rev_phone" runat="server" Text="*Invalid phone number" ControlToValidate="txt_phone" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[2-9]\d{2}-\d{3}-\d{4}$" ValidationGroup="careerapplication" ErrorMessage="Your phone number is invalid" />
        <br /><br />
               
        <%--question1--%>
        <asp:Label ID="lbl_status" runat="server" Text="Are you legally entitled to work in Canada and are you able to provide supportive documentation?*" />
        <br />
        <asp:RadioButtonList ID="rbl_status" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" ValidationGroup="careerapplication" SelectedValue='<%#Bind("ques_status")%>' CssClass="rbl_career">
            <asp:ListItem Value="1" Text="yes" Selected="True" />
            <asp:ListItem Value="2" Text="no" />
        </asp:RadioButtonList>
        <br />

        <%--question2--%>
        <asp:Label ID="lbl_crime" runat="server" Text="Have you ever been convicted of a criminal offence for which a pardon has not been granted?*" />
        <asp:RadioButtonList ID="rbl_crime" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" ValidationGroup="careerapplication" SelectedValue='<%#Bind("ques_crime")%>'>
            <asp:ListItem Value="1" Text="yes" Selected="True" />
            <asp:ListItem Value="2" Text="no" />
        </asp:RadioButtonList>
        <br />

        <%--question3--%>
        <asp:Label ID="lbl_certificate" runat="server" Text="What is your current status with the College of Nurses of Ontario?" />
        <br />
        <asp:Dropdownlist ID="ddl_certificate" runat="server" CausesValidation="false" SelectedValue='<%#Bind("ques_certificate")%>' CssClass="ddl_careerlong">
            <asp:ListItem Value="1" Text="Currently registered and in good standing" Selected="True" />
            <asp:ListItem Value="2" Text="Graduated and awaiting license" />
            <asp:ListItem Value="3" Text="Not registered" />
        </asp:Dropdownlist>
        <br /><br />

        <%--skill proficiency--%>
        <asp:Label ID="lbl_proficiency" runat="server" Text="Do you have Medical/Surgical ICU experience?" />
        <br />
        <asp:Dropdownlist ID="ddl_proficiency" runat="server" CausesValidation="false" SelectedValue='<%#Bind("skill_proficiency")%>' CssClass="ddl_career">
            <asp:ListItem Value="1" Text="No Knowledge" Selected="True" />
            <asp:ListItem Value="2" Text="Familiar" />
            <asp:ListItem Value="3" Text="Light" />
            <asp:ListItem Value="4" Text="Medium" />
            <asp:ListItem Value="5" Text="Expert" />
        </asp:Dropdownlist>
        <br /><br />

        <%--skill year--%>
        <asp:Label ID="lbl_experience" runat="server" Text="How many years of experience do you have in nursing?" />
        <br />
        <asp:Dropdownlist ID="ddl_experience" runat="server" CausesValidation="false" SelectedValue='<%#Bind("skill_experience")%>' CssClass="ddl_career">
            <asp:ListItem Value="1" Text="N/A" Selected="True" />
            <asp:ListItem Value="2" Text="Less than 1 yr" />
            <asp:ListItem Value="3" Text="1-2 yr" />
            <asp:ListItem Value="4" Text="2-5 yr" />
            <asp:ListItem Value="5" Text="5-8 yr" />
            <asp:ListItem Value="6" Text="8+ yr" />
        </asp:Dropdownlist>
        <br /><br />

        <%--resume upload--%>
        <asp:Label ID="lbl_resume" runat="server" Text="Please upload your resume." />
        <br />
        <asp:FileUpload ID="ful_resume" runat="server" FileName='<%#Bind("resume") %>' Width="250px" Height="35px" BorderStyle="None" Font-Size="Small" />
        <br /><br />

        <%--coverletter upload--%>
        <asp:Label ID="lbl_cover" runat="server" Text="Please upload your cover letter." />
        <br />
        <asp:FileUpload ID="ful_cover" runat="server" FileName='<%#Bind("coverletter") %>' Width="250px" Height="35px" BorderStyle="None" Font-Size="Small" />
        <br /><br />

        <%--reason--%>
        <asp:Label ID="lbl_reason" runat="server" Text="Reason:" AssociatedControlID="txt_reason" />
        <br />
        <asp:TextBox ID="txt_reason" runat="server" CssClass="txt_multiline" TextMode="MultiLine" Text='<%#Bind("reason")%>' />
        <asp:RequiredFieldValidator ID="rfv_reason" runat="server" Text="*Required" ControlToValidate="txt_reason" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a reason" ValidationGroup="careerapplication" />
        <br /><br />

        <%--comment--%>
        <asp:Label ID="lbl_comment" runat="server" Text="Comment:" AssociatedControlID="txt_comment" />
        <br />
        <asp:TextBox ID="txt_comment" runat="server" CssClass="txt_multiline" textmode="MultiLine" Wrap="true" Text='<%#Bind("comment")%>' />
        <asp:RequiredFieldValidator ID="rfv_comment" runat="server" Text="*Required" ControlToValidate="txt_comment" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please give any feedback." ValidationGroup="careerapplication" />
        <br /><br />

        <%--consent--%>
        <asp:Label ID="lbl_consent" runat="server" Text="I certify that the information I've provided through this application process is correct." />
        <div class="consent">
        <asp:CheckBoxList ID="ckb_consent" runat="server"  SelectedValue='<%#Bind("consent")%>'>
            <asp:ListItem Value="1" Text="yes" Selected="True" />
            <asp:ListItem Value="2" Text="no" />
        </asp:CheckBoxList>
        </div>
        <br />

        <%--send button--%>
        <asp:Button ID="btn_send" runat="server" OnCommand="subAdmin" CommandName="Insert" Text="Apply" CausesValidation="true" ValidationGroup="careerapplication" CssClass="btn_career" />
        <asp:Button ID="btn_cancel" runat="server" OnCommand="subAdmin" CommandName="Cancel" Text="Cancel" CausesValidation="false" ValidationGroup="careerapplication" CssClass="btn_career" />
        <asp:ValidationSummary ID="vds_career" runat="server" ShowMessageBox="true" ValidationGroup="careerapplication" HeaderText="Career Application Error" DisplayMode="List" />
        <br />
        <%--confirmation message--%>
        <asp:Label ID="lbl_output" runat="server" />
    </div>
</asp:Content>


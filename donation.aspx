<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="donation.aspx.cs" Inherits="donation" %>
<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/donation_styles.css" rel="stylesheet" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <div class="donation_application">
        <asp:MultiView ID="mtv_main" runat="server" ActiveViewIndex="0">
            <asp:View ID="view1" runat="server">
                <%--Header and subheader--%>
                <asp:Label ID="lbl_donationhead" runat="server" Text="Donor Information" CssClass="donationhead" />
                <br />
                <asp:Label ID="lbl_donationsubhead" runat="server" Text="Please tell us about your donation." />
                <br />
                <br />
                <%--First Name--%>
                <asp:Label ID="lbl_fname" runat="server" Text="First Name:*" AssociatedControlID="txt_fname" />
                <asp:TextBox ID="txt_fname" runat="server" Text='<%#Bind("fname")%>' CssClass="txt_donation" />
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="*Required" ControlToValidate="txt_fname" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your first name" ValidationGroup="donation1" />
                <br /><br />

                <%--Last Name--%>
                <asp:Label ID="lbl_lname" runat="server" Text="Last Name:*" AssociatedControlID="txt_lname" />
                <asp:TextBox ID="txt_lname" runat="server" Text='<%#Bind("lname")%>' CssClass="txt_donation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*Required" ControlToValidate="txt_fname" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your first name" ValidationGroup="donation1" />
                <br /><br />

                <%--address--%>
                <asp:Label ID="lbl_address" runat="server" Text="Address:*" AssociatedControlID="txt_address" />
                <br />
                <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" Text='<%#Bind("address")%>' CssClass="txt_multiline" />
                <asp:RequiredFieldValidator ID="rfv_address" runat="server" Text="*Required" ControlToValidate="txt_address" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter an address" ValidationGroup="donation1" />
                <br /><br />

                <%--city--%>
                <asp:Label ID="lbl_city" runat="server" Text="City:*" AssociatedControlID="txt_city" />
                <asp:TextBox ID="txt_city" runat="server" Text='<%#Bind("city")%>' CssClass="txt_donationS" />
                <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*Required" ControlToValidate="txt_city" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a city" ValidationGroup="donation1" />
                <br /><br />

                <%--Province--%>
                <asp:Label ID="lbl_province" runat="server" Text="Province:*" />
                <asp:Dropdownlist ID="ddl_province" runat="server" CausesValidation="false" SelectedItem='<%#Bind("province")%>' CssClass="ddl_donationshort">
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
                
                <%--Country--%>
                <asp:Label ID="lbl_country" runat="server" Text="Country:*" />
                <asp:Dropdownlist ID="ddl_country" runat="server" CausesValidation="false" SelectedItem='<%#Bind("country")%>' CssClass="ddl_donation">
                    <asp:ListItem Value="1" Text="Canada" Selected="True" />
                    <asp:ListItem Value="2" Text="USA" />
                    <asp:ListItem Value="3" Text="International" />
                </asp:Dropdownlist>
                <br /><br />         

                <%--postal code--%>
                <asp:Label ID="lbl_zip" runat="server" Text="Postal Code:*" AssociatedControlID="txt_zip" />
                <asp:TextBox ID="txt_zip" runat="server" Text='<%#Bind("zip")%>' CssClass="txt_donationS" />
                <asp:RequiredFieldValidator ID="rfv_zip" runat="server" Text="*Required" ControlToValidate="txt_zip" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter an postal code" ValidationGroup="donation1" />
                <asp:RegularExpressionValidator ID="rev_zip" runat="server" Text="*Invalid postal code: uppercase letters required" ControlToValidate="txt_zip" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ])\ {0,1}(\d[ABCEGHJKLMNPRSTVWXYZ]\d)$" ValidationGroup="donation1" ErrorMessage="Your postal code is invalid" />
                <br /><br />

                <%--phone number--%>
                <asp:Label ID="lbl_phone" runat="server" Text="Your phone number:*" AssociatedControlID="txt_phone" />
                <asp:TextBox ID="txt_phone" runat="server" Text='<%#Bind("phone")%>' CssClass="txt_donation" />
                <asp:RequiredFieldValidator ID="rfv_phone" runat="server" Text="*Required" ControlToValidate="txt_phone" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your phone number" ValidationGroup="donation1" />
                <asp:RegularExpressionValidator ID="rev_phone" runat="server" Text="*Invalid phone number" ControlToValidate="txt_phone" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[2-9]\d{2}-\d{3}-\d{4}$" ValidationGroup="donation1" ErrorMessage="Your phone number is invalid" />
                <br /><br />

                <%--email--%>
                <asp:Label ID="lbl_email" runat="server" Text="Email:*" AssociatedControlID="txt_email" />
                <asp:TextBox ID="txt_email" runat="server" Text='<%#Bind("email")%>' CssClass="txt_donation" />
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter your email" ValidationGroup="donation1" />
                <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="*Invalid email" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ValidationGroup="donation1" ErrorMessage="Your email is invalid" />
                <br /><br />

                <%--Validation Summary--%>
                <asp:ValidationSummary ID="vds_donate1" runat="server" ShowMessageBox="true" ValidationGroup="donate1" HeaderText="Donation Error" DisplayMode="List" />
                <%--NextView Button--%>
                <asp:Button ID="btn_next" runat="server" Text="Next" CommandName="NextView" ValidationGroup="donation1" CausesValidation="true" CssClass="btn_donation" />
            </asp:View>

            <asp:View ID="view2" runat="server">
                <%--reason for donation--%>
                <asp:Label ID="lbl_survey" runat="server" Text="What led you to donate today?" />
                <br />
                <asp:Dropdownlist ID="ddl_survey" runat="server" CausesValidation="false" SelectedItem='<%#Bind("survey")%>' CssClass="ddl_donationlong">
                    <asp:ListItem Value="1" Text="Please select one:" Selected="True" />
                    <asp:ListItem Value="2" Text="I have been a patient of MICs hospital" />
                    <asp:ListItem Value="3" Text="A family member/friend has been a patient of MICs hospital" />
                    <asp:ListItem Value="4" Text="I work, or have worked, at MICs hospital" />
                    <asp:ListItem Value="5" Text="MICs hospital is my local hospital" />
                    <asp:ListItem Value="6" Text="I support the important research done at MICs shopital" />
                    <asp:ListItem Value="7" Text="Other reasons" />
                </asp:Dropdownlist>
                <br /><br />

                <%--comment--%>
                <asp:Label ID="lbl_comment" runat="server" Text="Comment:" AssociatedControlID="txt_comment" />
                <br />
                <asp:TextBox ID="txt_comment" runat="server" textmode="MultiLine" Wrap="true" Text='<%#Bind("comment")%>' CssClass="txt_multiline" />
                <asp:RequiredFieldValidator ID="rfv_comment" runat="server" Text="*Required" ControlToValidate="txt_comment" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please give any feedback." ValidationGroup="donation2" />
                <br /><br />

                

                <%--payment type--%>
                <asp:Label ID="lbl_type" runat="server" Text="Which payment type do you prefer?" />
                <asp:RadioButtonList ID="rbl_type" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" ValidationGroup="donation2" SelectedItem='<%#Bind("payment_type")%>' CssClass="rbl_career">
                    <asp:ListItem Value="1" Text="VISA" Selected="True" />
                    <asp:ListItem Value="2" Text="Master Card" />
                    <asp:ListItem Value="3" Text="American Express" />
                    <asp:ListItem Value="3" Text="PayPal" />
                </asp:RadioButtonList>
                <br /><br />

                <%--card number--%>
                <asp:Label ID="lbl_cardnum" runat="server" Text="Card Number:" AssociatedControlID="txt_cardnum" />
                <br />
                <asp:TextBox ID="txt_cardnum" runat="server" Text='<%#Bind("card_number")%>' CssClass="txt_donation" />
                <asp:RequiredFieldValidator ID="rfv_cardnum" runat="server" Text="*Required" ControlToValidate="txt_cardnum" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the card number." ValidationGroup="donation2" />
                <asp:RegularExpressionValidator ID="rev_cardnum" runat="server" Text='*Your card number starts from "3" for AMEX, "4" for VISA and "5" for Master Card.' ControlToValidate="txt_cardnum" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^((4\d{3})|(5[1-5]\d{2}))(-?|\040?)(\d{4}(-?|\040?)){3}|^(3[4,7]\d{2})(-?|\040?)\d{6}(-?|\040?)\d{5}" ValidationGroup="donation2" ErrorMessage='Your card number format has to be "4-6-5" for AMEX, "4-4-4-4" for Visa and Mastercard' />
                
                <br /><br />

                <%--security number--%>
                <asp:Label ID="lbl_security" runat="server" Text="Security Code:" AssociatedControlID="txt_security" />
                <br />
                <asp:TextBox ID="txt_security" runat="server" Text='<%#Bind("security_number")%>' CssClass="txt_donationS" />
                <asp:RequiredFieldValidator ID="rfv_security" runat="server" Text="*Required" ControlToValidate="txt_security" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the security number." ValidationGroup="donation2" />
                <asp:RegularExpressionValidator ID="rfv_securityE" runat="server" Text='*Your security code is either 3 or 4-digit number.' ControlToValidate="txt_security" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\d{3}$|^\d{4}$" ValidationGroup="donation2" ErrorMessage='Your security code is either 3 or 4-digit number.' />
                <br /><br />

                <%--cardholder name--%>
                <asp:Label ID="lbl_holdername" runat="server" Text="Cardholder's name:" AssociatedControlID="txt_holdername" />
                <br />
                <asp:TextBox ID="txt_holdername" runat="server" Text='<%#Bind("cardholder_name")%>' CssClass="txt_donation" />
                <asp:RequiredFieldValidator ID="rfv_holdername" runat="server" Text="*Required" ControlToValidate="txt_holdername" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the cardholder's name" ValidationGroup="donation2" />
                <br /><br />

                <%--card expiration--%>
                <asp:Label ID="lbl_expiration" runat="server" Text="Credit Card Expiration:" />
                <br />
                <asp:Dropdownlist ID="ddl_expirationM" runat="server" CausesValidation="false" SelectedItem='<%#Bind("expiration_month")%>' CssClass="ddl_donation">
                    <asp:ListItem Value="1" Text="Please select one:" Selected="True" />
                    <asp:ListItem Value="2" Text="01" />
                    <asp:ListItem Value="3" Text="02" />
                    <asp:ListItem Value="4" Text="03" />
                    <asp:ListItem Value="5" Text="04" />
                    <asp:ListItem Value="6" Text="05" />
                    <asp:ListItem Value="7" Text="06" />
                    <asp:ListItem Value="8" Text="07" />
                    <asp:ListItem Value="9" Text="08" />
                    <asp:ListItem Value="10" Text="09" />
                    <asp:ListItem Value="11" Text="10" />
                    <asp:ListItem Value="12" Text="11" />
                    <asp:ListItem Value="13" Text="12" />
                </asp:Dropdownlist>
                <asp:Dropdownlist ID="ddl_expirationY" runat="server" CausesValidation="false" SelectedItem='<%#Bind("expiration_year")%>' CssClass="ddl_donation">
                    <asp:ListItem Value="1" Text="Please select one:" Selected="True" />
                    <asp:ListItem Value="2" Text="14" />
                    <asp:ListItem Value="3" Text="15" />
                    <asp:ListItem Value="4" Text="16" />
                    <asp:ListItem Value="5" Text="17" />
                    <asp:ListItem Value="6" Text="18" />
                    <asp:ListItem Value="7" Text="19" />
                    <asp:ListItem Value="8" Text="20" />
                    <asp:ListItem Value="9" Text="21" />
                    <asp:ListItem Value="10" Text="22" />
                    <asp:ListItem Value="11" Text="23" />
                    <asp:ListItem Value="12" Text="24" />
                </asp:Dropdownlist>
                <br /><br />

                <%--amount--%>
                <asp:Label ID="lbl_amount" runat="server" Text="Donation Amount:" AssociatedControlID="payment_amt" />
                <br />
                <asp:TextBox ID="payment_amt" runat="server" Text='' CssClass="txt_donationS" />
                <asp:RequiredFieldValidator ID="rfv_amount" runat="server" Text="*Required" ControlToValidate="payment_amt" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the amount." ValidationGroup="donation2" />
                <br /><br />
                
                <%--Donate/Paypal Button--%>
                <asp:ImageButton ID="btn_donate" src='https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif' runat="server" Text="Donate" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="donation2" CausesValidation="true" />
                <asp:Image ID="img_card" runat="server" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" />
                <asp:HiddenField ID="hdf_button_id" runat="server" value="RTSTZNYUU4SJE" />
                <asp:HiddenField ID="hdf_cmd" runat="server" value="_s-xclick" />

                <br /><br />

                <%--PreView Button--%>
                <asp:Button ID="btn_prev" runat="server" Text="Previous" CommandName="PrevView" CausesValidation="false" CssClass="btn_donation" />
                <%--Cancel Button--%>
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" OnCommand="subAdmin" ValidationGroup="donation2" CausesValidation="false" CssClass="btn_donation" />
                <%--Validation Summary--%>
                <asp:ValidationSummary ID="vds_donate2" runat="server" ShowMessageBox="true" ValidationGroup="donate2" HeaderText="Donation Error" DisplayMode="List" />
                <br />

                <%--confirmation message--%>
                <asp:Label ID="lbl_output" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div><%--donation application--%>
</asp:Content>


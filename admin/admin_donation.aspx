<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_donation.aspx.cs" Inherits="admin_donation" %>

<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <%--Donation Header--%>
    <asp:Label ID="lbl_header" runat="server" Text="Donor Information" Font-Bold="true" />
    <br /><br />

    <%--Applicant Information List--%>
    <asp:Panel ID="pnl_main" runat="server">
    <asp:Datalist ID="dtl_main" runat="server" OnItemCommand="subAdmin">
        <HeaderTemplate>
            <table id="tbl_list">
                <tr>
                    <th><asp:Label ID="lbl_title" runat="server" Text="ID" /></th>
                    <th><asp:Label ID="lbl_author" runat="server" Text="First Name" /></th>
                    <th><asp:Label ID="lbl_status" runat="server" Text="Last Name" /></th>
                    <th><asp:Label ID="lbl_date" runat="server" Text="Amount" /></th>
                    <th></th>
                    <th></th>
                </tr>
            </table>
        </HeaderTemplate>

        <%--Bind Data--%>
        <ItemTemplate>
            <table id="tbl_list2">       
                <tr>
                    <td><asp:Label ID="lbl_titleD" runat="server" Text='<%#Eval("donation_id") %>' /></td>
                    <td><asp:Label ID="lbl_authorD" runat="server" Text='<%#Eval("fname") %>' /></td>
                    <td><asp:Label ID="lbl_statusD" runat="server" Text='<%#Eval("lname") %>' /></td>
                    <td><asp:Label ID="lbl_dateD" runat="server" Text='<%#Eval("amount") %>' /></td>
                    <td></td>
                    <td><asp:Button ID="btn_edit" runat="server" Text="Edit" Width="55px" CommandName="Update" CommandArgument='<%#Eval("donation_id") %>' /></td>
                </tr>  
            </table>
        </ItemTemplate>
    </asp:Datalist>
    </asp:Panel>
    
    <%--Applicant Information Each--%>
    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_message" runat="server" />
        <asp:Datalist ID="dtl_edit" runat="server" OnItemCommand="subUpdate">      
            <%--Edit--%>
            <ItemTemplate>
                <div id="content_edit">
                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("donation_id") %>' />
                    <%--first name--%>
                    <asp:Label ID="lbl_fnameE" runat="server" Text="First Name: " />
                    <asp:TextBox ID="txt_fnameE" runat="server" Width="180px" Text='<%#Bind("fname") %>' />
                    <asp:RequiredFieldValidator ID="rfv_fnameE" runat="server" ControlToValidate="txt_fnameE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--last name--%>
                    <asp:Label ID="lbl_lnameE" runat="server" Text="Last Name: " />
                    <asp:TextBox ID="txt_lnameE" runat="server" Width="180px" Text='<%#Bind("lname") %>' />
                    <asp:RequiredFieldValidator ID="rfv_lnameE" runat="server" ControlToValidate="txt_lnameE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    
                    <%--address--%>
                    <asp:Label ID="lbl_addressE" runat="server" Text="Address: " />
                    <asp:TextBox ID="txt_addressE" TextMode="Multiline" runat="server" Text='<%#Bind("address") %>' Columns="75" Rows="5" BorderColor="#666666" />
                    <asp:RequiredFieldValidator ID="rfv_addressE" runat="server" ControlToValidate="txt_addressE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--city--%>
                    <asp:Label ID="lbl_cityE" runat="server" Text="City: " />
                    <asp:TextBox ID="txt_cityE" runat="server" Width="180px" Text='<%#Bind("city") %>' />
                    <asp:RequiredFieldValidator ID="rfv_cityE" runat="server" ControlToValidate="txt_cityE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--province--%>
                    <asp:Label ID="lbl_provinceE" runat="server" Text="Province: " />
                    <asp:Label ID="lbl_provinceResult" runat="server" Text='<%#Eval("province")%>' />
                    <br />
                    <asp:Dropdownlist ID="ddl_provinceE" runat="server" CausesValidation="false" SelectedItem='<%#Bind("province")%>'>
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
                    <%--country--%>
                    <asp:Label ID="lbl_countryE" runat="server" Text="Country: " />
                    <asp:Label ID="lbl_countryResult" runat="server" Text='<%#Eval("country")%>' />
                    <br />
                    <asp:Dropdownlist ID="ddl_countryE" runat="server" CausesValidation="false" SelectedItem='<%#Bind("country")%>'>
                        <asp:ListItem Value="1" Text="Canada" Selected="True" />
                        <asp:ListItem Value="2" Text="USA" />
                        <asp:ListItem Value="3" Text="International" />
                    </asp:Dropdownlist>
                    <br /><br />                 
                    <%--zip--%>
                    <asp:Label ID="lbl_zipE" runat="server" Text="Postal Code: " />
                    <asp:TextBox ID="txt_zipE" runat="server" Width="180px" Text='<%#Bind("zip") %>' />
                    <asp:RequiredFieldValidator ID="rfv_zipE" runat="server" ControlToValidate="txt_zipE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--phone--%>
                    <asp:Label ID="lbl_phoneE" runat="server" Text="Phone: " />
                    <asp:TextBox ID="txt_phoneE" runat="server" Width="180px" Text='<%#Bind("phone") %>' />
                    <asp:RequiredFieldValidator ID="rfv_phoneE" runat="server" ControlToValidate="txt_phoneE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--email--%>
                    <asp:Label ID="lbl_emailE" runat="server" Text="email: " />
                    <asp:TextBox ID="txt_emailE" runat="server" Width="180px" Text='<%#Bind("email") %>' />
                    <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    
                    <%--survey--%>
                    <asp:Label ID="lbl_statusE" runat="server" Text="Status: " />
                    <asp:Label ID="lbl_statusResult" runat="server" Text='<%#Eval("survey")%>' />
                    <br />
                    <asp:Dropdownlist ID="ddl_surveyE" runat="server" CausesValidation="false" SelectedItem='<%#Bind("survey")%>'>
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
                    <asp:Label ID="lbl_commentE" runat="server" Text="Comment:" AssociatedControlID="txt_commentE" />
                    <br />
                    <asp:TextBox ID="txt_commentE" runat="server" TextMode="MultiLine" Text='<%#Bind("comment")%>' Columns="75" Rows="5" BorderColor="#666666" />
                    <asp:RequiredFieldValidator ID="rfv_commentE" runat="server" ControlToValidate="txt_commentE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />                 
                    <%--amount--%>
                    <asp:Label ID="lbl_amountE" runat="server" Text="Amount:" AssociatedControlID="txt_amountE" />
                    <asp:TextBox ID="txt_amountE" runat="server" Text='<%#Bind("amount")%>' />
                    <asp:RequiredFieldValidator ID="rfv_amountE" runat="server" ControlToValidate="txt_amountE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    
                    <%--payment type--%>
                    <asp:Label ID="lbl_typeE" runat="server" Text="Payment Type:" />
                    <asp:Label ID="lbl_typeResult" runat="server" Text='<%#Eval("payment_type")%>' />
                    <asp:RadioButtonList ID="rbl_typeE" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" ValidationGroup="edit" SelectedItem='<%#Bind("payment_type")%>'>
                        <asp:ListItem Value="1" Text="VISA" Selected="True" />
                        <asp:ListItem Value="2" Text="Master Card" />
                        <asp:ListItem Value="3" Text="American Express" />
                        <asp:ListItem Value="3" Text="PayPal" />
                    </asp:RadioButtonList>
                    <br /><br />

                    <%--card number--%>
                    <asp:Label ID="lbl_cardnumE" runat="server" Text="Card Number:" AssociatedControlID="txt_cardnumE" />
                    <br />
                    <asp:TextBox ID="txt_cardnumE" runat="server" Text='<%#Bind("card_number")%>' />
                    <asp:RequiredFieldValidator ID="rfv_cardnumE" runat="server" Text="*Required" ControlToValidate="txt_cardnumE" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the correct card number." ValidationGroup="edit" />
                    <br /><br />

                    <%--security number--%>
                    <asp:Label ID="lbl_securityE" runat="server" Text="Security Number:" AssociatedControlID="txt_securityE" />
                    <br />
                    <asp:TextBox ID="txt_securityE" runat="server" Text='<%#Bind("security_number")%>' />
                    <asp:RequiredFieldValidator ID="rfv_securityE" runat="server" Text="*Required" ControlToValidate="txt_securityE" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the security number." ValidationGroup="edit" />
                    <br /><br />

                    <%--cardholder name--%>
                    <asp:Label ID="lbl_holdernameE" runat="server" Text="Cardholder's name:" AssociatedControlID="txt_holdernameE" />
                    <br />
                    <asp:TextBox ID="txt_holdernameE" runat="server" Text='<%#Bind("cardholder_name")%>' />
                    <asp:RequiredFieldValidator ID="rfv_holdernameE" runat="server" Text="*Required" ControlToValidate="txt_holdernameE" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the cardholder's name" ValidationGroup="edit" />
                    <br /><br />

                    <%--card expiration--%>
                    <asp:Label ID="lbl_expirationE" runat="server" Text="Credit Card Expiration:" />
                    <asp:Label ID="lbl_expirationMonth" runat="server" Text='<%#Eval("expiration_month")%>' />
                    <asp:Label ID="lbl_slash" runat="server" Text="/" />
                    <asp:Label ID="lbl_expirationYear" runat="server" Text='<%#Eval("expiration_year")%>' />
                    <br />
                    <asp:Dropdownlist ID="ddl_expirationmonthE" runat="server" CausesValidation="false" SelectedItem='<%#Bind("expiration_month")%>'>
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
                    <asp:Dropdownlist ID="ddl_expirationyearE" runat="server" CausesValidation="false" SelectedItem='<%#Bind("expiration_year")%>'>
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

                    <%--token--%>
                    <asp:Label ID="lbl_tokenE" runat="server" Text="Token:" AssociatedControlID="txt_cardnumE" />
                    <br />
                    <asp:TextBox ID="txt_tokenE" runat="server" Text='<%#Bind("token")%>' />
                    <asp:RequiredFieldValidator ID="rfv_tokenE" runat="server" Text="*Required" ControlToValidate="txt_tokenE" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter the correct token." ValidationGroup="edit" />
                    <br /><br />
                    <%--success--%>
                    <asp:Label ID="lbl_successE" runat="server" Text="Token:" AssociatedControlID="txt_successE" />
                    <br />
                    <asp:TextBox ID="txt_successE" runat="server" Text='<%#Bind("success")%>' />
                    <asp:RequiredFieldValidator ID="rfv_successE" runat="server" Text="*Required" ControlToValidate="txt_tokenE" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a success number." ValidationGroup="edit" />
                    <br />

                    <%--update/delete/cancel button--%>
                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" Width="55px" />
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  Width="55px" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel"  Width="55px" />
                </div>
            </ItemTemplate>   
        </asp:Datalist>     
    </asp:Panel>
</asp:Content>


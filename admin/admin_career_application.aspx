<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_career_application.aspx.cs" Inherits="admin_career_application" %>

<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="content_main" Runat="Server">
    <%--Career Application header--%>
    <asp:Label ID="lbl_header" runat="server" Text="Career Application" Font-Bold="true" />
    <br /><br />

    <%--Applicant Information List--%>
    <asp:Panel ID="pnl_main" runat="server">
    <asp:Repeater ID="rpt_main" runat="server" OnItemCommand="subAdmin">
        <HeaderTemplate>
            <table id="tbl_list">
                <tr>
                    <th><asp:Label ID="lbl_title" runat="server" Text="ID" /></th>
                    <th><asp:Label ID="lbl_author" runat="server" Text="First Name" /></th>
                    <th><asp:Label ID="lbl_status" runat="server" Text="Last Name" /></th>
                    <th><asp:Label ID="lbl_date" runat="server" Text="email" /></th>
                    <th></th>
                    <th></th>
                </tr>
            </table>
        </HeaderTemplate>

        <%--Bind Data--%>
        <ItemTemplate>
            <table id="tbl_list2">       
                <tr>
                    <td><asp:Label ID="lbl_titleD" runat="server" Text='<%#Eval("career_id") %>' /></td>
                    <td><asp:Label ID="lbl_authorD" runat="server" Text='<%#Eval("fname") %>' /></td>
                    <td><asp:Label ID="lbl_statusD" runat="server" Text='<%#Eval("lname") %>' /></td>
                    <td><asp:Label ID="lbl_dateD" runat="server" Text='<%#Eval("email") %>' /></td>
                    <td></td>
                    <td><asp:Button ID="btn_edit" runat="server" Text="Edit" Width="55px" CommandName="Update" CommandArgument='<%#Eval("career_id") %>' /></td>
                </tr>  
            </table>
        </ItemTemplate>
    </asp:Repeater>
    </asp:Panel>
    
    <%--Applicant Information Each--%>
    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_message" runat="server" />
        <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpdate">      
            <%--Edit--%>
            <ItemTemplate>
                <div id="content_edit">
                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("career_id") %>' />
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
                    <%--email--%>
                    <asp:Label ID="lbl_emailE" runat="server" Text="email: " />
                    <asp:TextBox ID="txt_emailE" runat="server" Width="180px" Text='<%#Bind("email") %>' />
                    <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--address--%>
                    <asp:Label ID="lbl_addressE" runat="server" Text="Address: " />
                    <asp:TextBox ID="txt_addressE" TextMode="Multiline" runat="server" Text='<%#Bind("address") %>' Columns="75" Rows="5" BorderColor="#666666" />
                    <asp:RequiredFieldValidator ID="rfv_addressE" runat="server" ControlToValidate="txt_addressE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--country--%>
                    <asp:Label ID="lbl_countryE" runat="server" Text="Country: " />
                    <asp:Dropdownlist ID="ddl_countryE" runat="server" CausesValidation="false" SelectedValue='<%#Bind("country")%>'>
                        <asp:ListItem Value="1" Text="Canada" />
                        <asp:ListItem Value="2" Text="International" />
                    </asp:Dropdownlist>
                    <br /><br />
                    <%--province--%>
                    <asp:Label ID="lbl_provinceE" runat="server" Text="Province: " />
                    <asp:Dropdownlist ID="ddl_provinceE" runat="server" CausesValidation="false" SelectedValue='<%#Bind("province")%>'>
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
                    <asp:Label ID="lbl_cityE" runat="server" Text="City: " />
                    <asp:TextBox ID="txt_cityE" runat="server" Width="180px" Text='<%#Bind("city") %>' />
                    <asp:RequiredFieldValidator ID="rfv_cityE" runat="server" ControlToValidate="txt_cityE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
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
                    <%--status--%>
                    <asp:Label ID="lbl_statusE" runat="server" Text="Status: " />
                    <br />
                    <asp:RadioButtonList ID="rbl_statusE" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CausesValidation="false" SelectedValue='<%#Bind("ques_status")%>'>
                        <asp:ListItem Value="1" Text="yes" />
                        <asp:ListItem Value="2" Text="no" />
                    </asp:RadioButtonList>
                    <br /><br />
                    <%--crime--%>
                    <asp:Label ID="lbl_crimeE" runat="server" Text="Crime: " />
                    <asp:RadioButtonList ID="rbl_crimeE" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CausesValidation="false" SelectedValue='<%#Bind("ques_crime")%>'>
                        <asp:ListItem Value="1" Text="yes" />
                        <asp:ListItem Value="2" Text="no" />
                    </asp:RadioButtonList>
                    <br /><br />
                    <%--certificate--%>
                    <asp:Label ID="lbl_certificateE" runat="server" Text="Certificate: " />
                    <br />
                    <asp:Dropdownlist ID="ddl_certificateE" runat="server" CausesValidation="false" SelectedValue='<%#Bind("ques_certificate")%>'>
                        <asp:ListItem Value="1" Text="Currently registered and in good standing" />
                        <asp:ListItem Value="2" Text="Graduated and awaiting license" />
                        <asp:ListItem Value="3" Text="Not registered" />
                    </asp:Dropdownlist>
                    <br /><br />
                    <%--skill proficiency--%>
                    <asp:Label ID="lbl_proficiencyE" runat="server" Text="Do you have Medical/Surgical ICU experience?" />
                    <br />
                    <asp:Dropdownlist ID="ddl_proficiencyE" runat="server" CausesValidation="false" SelectedValue='<%#Bind("skill_proficiency")%>'>
                        <asp:ListItem Value="1" Text="No Knowledge" />
                        <asp:ListItem Value="2" Text="Familiar" />
                        <asp:ListItem Value="3" Text="Light" />
                        <asp:ListItem Value="4" Text="Medium" />
                        <asp:ListItem Value="5" Text="Expert" />
                    </asp:Dropdownlist>
                    <br /><br />
                    <%--experience--%>
                    <asp:Label ID="lbl_experienceE" runat="server" Text="How many years of experience do you have in nursing?" />
                    <br />
                    <asp:Dropdownlist ID="ddl_experienceE" runat="server" CausesValidation="false" SelectedValue='<%#Bind("skill_experience")%>'>
                        <asp:ListItem Value="1" Text="N/A" />
                        <asp:ListItem Value="2" Text="Less than 1 yr" />
                        <asp:ListItem Value="3" Text="1-2 yr" />
                        <asp:ListItem Value="4" Text="2-5 yr" />
                        <asp:ListItem Value="5" Text="5-8 yr" />
                        <asp:ListItem Value="6" Text="8+ yr" />
                    </asp:Dropdownlist>
                    <br /><br />
                    <%--resume--%>
                    <asp:Label ID="lbl_resumeE" runat="server" Text="Resume:" />
                    <asp:Label ID="lbl_resumeShow" runat="server" Text='<%#Bind("resume") %>' />
                    <%-- <asp:Image ID="img_resumeE" runat="server" ImageUrl='<%#Bind("resume") %>' /> --%>
                    <br />
                    <asp:FileUpload ID="ful_resumeE" runat="server" FileName='<%#Bind("resume") %>' />
                    <br /><br />
                    <%--coverletter--%>
                    <asp:Label ID="lbl_coverletterE" runat="server" Text="Coverletter:" />
                    <asp:Label ID="lbl_coverletterShow" runat="server" Text='<%#Bind("coverletter") %>' />
                    <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%#Bind("coverletter") %>' /> --%>
                    <br />
                    <asp:FileUpload ID="ful_coverletterE" runat="server" FileName='<%#Bind("coverletter") %>' />
                    <br /><br />
                    <%--reason--%>
                    <asp:Label ID="lbl_reasonE" runat="server" Text="Reason:" AssociatedControlID="txt_reasonE" />
                    <br /><br />
                    <asp:TextBox ID="txt_reasonE" runat="server" TextMode="MultiLine" Text='<%#Bind("reason")%>' Columns="75" Rows="5" BorderColor="#666666" />
                    <asp:RequiredFieldValidator ID="rfv_reasonE" runat="server" ControlToValidate="txt_reasonE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--comment--%>
                    <asp:Label ID="lbl_commentE" runat="server" Text="Comment:" AssociatedControlID="txt_commentE" />
                    <br />
                    <asp:TextBox ID="txt_commentE" runat="server" TextMode="MultiLine" Text='<%#Bind("comment")%>' Columns="75" Rows="5" BorderColor="#666666" />
                    <asp:RequiredFieldValidator ID="rfv_commentE" runat="server" ControlToValidate="txt_commentE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                    <br /><br />
                    <%--consent--%>
                    <asp:Label ID="lbl_consentE" runat="server" Text="Consent:" />
                    <asp:CheckBoxList ID="ckb_consentE" runat="server"  SelectedValue='<%#Bind("consent")%>'>
                        <asp:ListItem Value="1" Text="yes" />
                        <asp:ListItem Value="2" Text="no" />
                    </asp:CheckBoxList>
                    <br /><br />
                    <%--update/delete/cancel button--%>
                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" Width="55px" />
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  Width="55px" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel"  Width="55px" />
                </div>
            </ItemTemplate>   
        </asp:Repeater>     
    </asp:Panel> 
</asp:Content>


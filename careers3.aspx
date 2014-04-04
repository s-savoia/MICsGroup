<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="careers3.aspx.cs" Inherits="careers3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <%--Coded By Prabhjot Mand --%>


    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    <h2>Online Volunteer Application</h2>
    <asp:MultiView ID="mtv_main" runat="server" ActiveViewIndex="0">
        <asp:View ID="view1" runat="server">
 <h4>Contact Information</h4>
            <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
            <asp:TextBox ID="txt_fname" runat="server"  />
            <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate ="txt_fname" ErrorMessage="Please enter your First Name" SetFocusOnError="true" Display="Dynamic" />
            <asp:CompareValidator ID="cmp_fname" runat="server" ControlToValidate="txt_fname" Type="String" Operator="DataTypeCheck" ErrorMessage="Please enter correct First Name" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
            <asp:TextBox ID="txt_lname" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="Please enter your Last Name" SetFocusOnError="true" Display="Dynamic" />
              <asp:CompareValidator ID="cmp_lname" runat="server" ControlToValidate="txt_lname" Type="String" Operator="DataTypeCheck" ErrorMessage="Please enter correct Last Name" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_title" runat="server" Text="Title" />
            <asp:DropDownList ID="ddl_title" runat="server" >
                <asp:ListItem Value="Dr." Text="Dr." />
                <asp:ListItem Value="Miss" Text="Miss" />
                <asp:ListItem Value="Mr" Text="Mr" />
                <asp:ListItem Value="Mrs" Text="Mrs" />
                <asp:ListItem Value="RN" Text="RN" />
            </asp:DropDownList>
           
            <br />
            <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth" />
            <asp:TextBox ID="txt_dob" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_dob" runat="server" ControlToValidate="txt_dob" ErrorMessage="Please enter your Date of Birth" SetFocusOnError="true" Display="Dynamic" />
              <asp:CompareValidator ID="cmp_dob" runat="server" ControlToValidate="txt_dob" Type="Date" Operator="DataTypeCheck" ErrorMessage="Please enter correct Date of Birth" SetFocusOnError="true" Display="Dynamic" />
            <AJAX:CalendarExtender ID="dob" runat="server" TargetControlID="txt_dob" FirstDayOfWeek="Sunday" Format="yyyy-MM-dd" />
            <br />
            <asp:Label ID="lbl_city" runat="server" Text="City" />
            <asp:TextBox ID="txt_city" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city" ErrorMessage="Please enter City" SetFocusOnError="true" Display="Dynamic" />
              <asp:CompareValidator ID="cmp_city" runat="server" ControlToValidate="txt_city" Type="String" Operator="DataTypeCheck" ErrorMessage="Please enter correct city" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_province" runat="server" Text="Province" />
            <asp:DropDownList ID="ddl_province" runat="server" >
                <asp:ListItem Value="AB" Text="AB" />
                <asp:ListItem Value="BC" Text="BC" />
                <asp:ListItem Value="MB" Text="MB" />
                <asp:ListItem Value="NB" Text="NB" />
                <asp:ListItem Value="NS" Text="NS" />
                <asp:ListItem Value="ON" Text="ON" />
                <asp:ListItem Value="PE" Text="PE" />
                <asp:ListItem Value="QC" Text="QC" />
                <asp:ListItem Value="SK" Text="SK" />
                <asp:ListItem Value="N/A" Text="N/A" /> 
            </asp:DropDownList>
           
            <br />
            <asp:Label ID="lbl_postalcode" runat="server" Text="Postal Code" />
            <asp:TextBox ID="txt_postalcode" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_postalcode" runat="server" ControlToValidate="txt_postalcode" ErrorMessage="Please enter Postal Code" SetFocusOnError="true" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="rev_postalcode" runat="server" ControlToValidate="txt_postalcode" ValidationExpression="^([A-Z]{1}[0-9]{1}[A-z]{1}[0-9]{1}[A-Z]{1}[0-9]{1})$"  ErrorMessage="Please enter valid Postal code" SetFocusOnError="true" Display="Dynamic"/>
            <br />
            <asp:Label ID="lbl_hphone" runat="server" Text="Home Phone" />
            <asp:TextBox ID="txt_hphone" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_hphone" runat="server" ControlToValidate="txt_hphone" ErrorMessage="Please enter Home phone number" SetFocusOnError="true" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="rev_hphone" runat="server" ControlToValidate="txt_hphone" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}" ErrorMessage="Please enter valid Home phone number" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_wphone" runat="server" Text="Work Phone" />
            <asp:TextBox ID="txt_wphone" runat="server" />
            <asp:RegularExpressionValidator ID="rev_wphone" runat="server" ControlToValidate="txt_wphone" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}" ErrorMessage="Please enter valid Work phone number" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_cphone" runat="server" Text="Cell Phone" />
            <asp:TextBox ID="txt_cphone" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_cphone" runat="server" ControlToValidate="txt_cphone" ErrorMessage="Please enter Cell phone number" SetFocusOnError="true" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="rev_cphone" runat="server" ControlToValidate="txt_cphone" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}" ErrorMessage="Please enter valid Cell phone number" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_email" runat="server" Text="Email Address" />
            <asp:TextBox ID="txt_email" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter Email Address" SetFocusOnError="true" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="rev_email" runat="server" ControlToValidate="txt_email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter valid email address" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_ename" runat="server" Text="Emergency Contact Name" />
            <asp:TextBox ID="txt_ename" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_ename" runat="server" ControlToValidate="txt_ename" ErrorMessage="Please enter Emergency Contact Name"
 SetFocusOnError="true" Display="Dynamic" />
            <br />
            <asp:Label ID="lbl_ephone" runat="server" Text="Emergency Contact Number" />
            <asp:TextBox ID="txt_ephone" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_ephone" runat="server" ControlToValidate="txt_ephone" ErrorMessage="Please enter Emergency Contact Number" SetFocusOnError="true" Display="Dynamic" />
              <asp:RegularExpressionValidator ID="rev_ephone" runat="server" ControlToValidate="txt_ephone" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}" ErrorMessage="Please enter valid Emergency contact number" SetFocusOnError="true" Display="Dynamic" />
            <br />
            <br />
            <h4>Demographic Information</h4>
            <asp:Label ID="lbl_cpath" runat="server" Text="Intended Career Path" />
            <asp:DropDownList ID="ddl_cpath" runat="server" >
                <asp:ListItem Value="Administrative" Text="Administrative" />
                <asp:ListItem Value="Business" Text="Business" />
                <asp:ListItem Value="Education" Text="Education" />
                <asp:ListItem Value="Health Care" Text="Health Care" />
                <asp:ListItem Value="Other" Text="Other" />
            </asp:DropDownList>
            <br />
           <%--  <asp:Label ID="lbl_other" runat="server" Text="If other, Please specify:" />
            <asp:TextBox ID="txt_other" runat="server" />
            <br />--%>
            <br />
            <asp:Button ID="btn_next1" runat="server" Text="Continue"  CommandName="NextView" />
            <asp:Button ID="btn_cancel1" runat="server" Text="Cancel" CommandName="Cancel1" OnCommand="subAdmin" />
        </asp:View>
        <asp:View ID="view2" runat="server">
          <h4>Employment History</h4>
            <h5>1</h5>
            <asp:Label ID="lbl_efname1" runat="server" Text="First Name" />
            <asp:TextBox ID="txt_efname1" runat="server"  />
            <br />
            <asp:Label ID="lbl_elname1" runat="server" Text="Last Name" />
            <asp:TextBox ID="txt_lname1" runat="server" />
            <br />
            <asp:Label ID="lbl_jtitle1" runat="server" Text="Job Title" />
            <asp:TextBox ID="txt_jtitle1" runat="server" />
            <br />
            <asp:Label ID="lbl_wphone1" runat="server" Text="Work Phone" />
            <asp:TextBox ID="txt_wphone1" runat="server" />
              <asp:RegularExpressionValidator ID="rev_wphone1" runat="server" ControlToValidate="txt_wphone1" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}" ErrorMessage="Please enter valid Work phone number" SetFocusOnError="true" Display="Dynamic" />
            <asp:Label ID="lbl_ext1" runat="server" Text="ext" />
            <asp:TextBox ID="txt_ext1" runat="server" />
            <br />
            <asp:Label ID="lbl_semp1" runat="server" Text="Start of Employment" />
            <asp:TextBox ID="txt_semp1" runat="server" />
            <AJAX:CalendarExtender ID="semp1" runat="server" TargetControlID="txt_semp1" FirstDayOfWeek="Sunday" Format="yyyy-MM-dd" />
            <br />
            <asp:Label ID="lbl_eemp1" runat="server" Text="End of Employment" />
            <asp:TextBox ID="txt_eemp1" runat="server" />
            <AJAX:CalendarExtender ID="eemp1" runat="server" TargetControlID="txt_eemp1" FirstDayOfWeek="Sunday" Format="yyyy-MM-dd" />
            <br />
            <br />
            <h5>2</h5>
            <asp:Label ID="lbl_efname2" runat="server" Text="First Name" />
            <asp:TextBox ID="txt_efname2" runat="server"  />
            <br />
            <asp:Label ID="lbl_elname2" runat="server" Text="Last Name" />
            <asp:TextBox ID="txt_elname2" runat="server" />
            <br />
            <asp:Label ID="lbl_jtitle2" runat="server" Text="Job Title" />
            <asp:TextBox ID="txt_jtitle2" runat="server" />
            <br />
            <asp:Label ID="lbl_wphone2" runat="server" Text="Work Phone" />
            <asp:TextBox ID="txt_wphone2" runat="server" />
            <asp:RegularExpressionValidator ID="rev_wphone2" runat="server" ControlToValidate="txt_wphone2" ValidationExpression="^[1-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{4}" ErrorMessage="Please enter valid Work phone number" SetFocusOnError="true" Display="Dynamic" />
            <asp:Label ID="lbl_ext2" runat="server" Text="ext" />
            <asp:TextBox ID="txt_ext2" runat="server" />
            <br />
            <asp:Label ID="lbl_semp2" runat="server" Text="Start of Employment" />
            <asp:TextBox ID="txt_semp2" runat="server" />
            <AJAX:CalendarExtender ID="seemp2" runat="server" TargetControlID="txt_semp2" FirstDayOfWeek="Sunday" Format="yyyy-MM-dd" />
            <br />
            <asp:Label ID="lbl_eemp2" runat="server" Text="End of Employment" />
            <asp:TextBox ID="txt_eemp2" runat="server" />
            <AJAX:CalendarExtender ID="eemp2" runat="server" TargetControlID="txt_eemp2" FirstDayOfWeek="Sunday" Format="yyyy-MM-dd" />
            <br />
            <br />
            <asp:Button ID="btn_next2" runat="server" Text="Continue" CommandName="NextView" />
            <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CommandName="Cancel2" OnCommand="subAdmin"/>
            </asp:View>
            <asp:View ID="view3" runat="server" >
            <h4>Skills & Experience</h4>
            <asp:Label ID="lbl_leducation" runat="server" Text="Level of Education" />
            <asp:DropDownList ID="ddl_leducation" runat="server" >
                <asp:ListItem Value="College Degree" Text="College Degree" />
                <asp:ListItem Value="Diploma" Text="Diploma" />
                <asp:ListItem Value="High School" Text="High School" />
                <asp:ListItem Value="Middle School" Text="Middle School" />
                <asp:ListItem Value="University Doctrate Degree" Text="University Doctrate Degree" />
                <asp:ListItem Value="University Masters Degree" Text="University Masters Degree" />
                <asp:ListItem Value="University Undergraduate Degree" Text="University Undergraduate Degree" />
            </asp:DropDownList>
            <br />
            <asp:Label ID="lbl_skills" runat="server" Text="Skills" />
                <asp:CheckBoxList ID="ckb_skills" runat="server" RepeatColumns="2" RepeatDirection="Vertical">
                    <asp:ListItem Value="Communication Skills" Text="Communication Skills" />
                    <asp:ListItem Value="Creative" Text="Creative" />
                    <asp:ListItem Value="Health Care" Text="Health Care" />
                    <asp:ListItem Value="Training/Educate" Text="Training/Educate" />
                    <asp:ListItem Value="Experience with Elderly" Text="Experience with Elderly" />
                    <asp:ListItem Value="Research" Text="Research" />
                    <asp:ListItem Value="Computer Skills" Text="Computer Skills" />
                    <asp:ListItem Value="Fundraising Experience" Text="Fundraising Experience" />
                    <asp:ListItem Value="Public Speaker" Text="Public Speaker" />
                    <asp:ListItem Value="Retail Experience" Text="Retail Experience" />
                </asp:CheckBoxList>
            <br />
            <asp:Label ID="lbl_vexp" runat="server" Text="Volunteer Experience" />
            <asp:TextBox ID="txt_vexp" runat="server" TextMode="MultiLine" />
            <br />
            <asp:Label ID="lbl_location" runat="server" Text="Location Preference" />
            <asp:RadioButtonList ID="rdb_location" runat="server" >
                <asp:ListItem Value="Anson General Hospital" Text="Anson General Hospital" />
                <asp:ListItem Value="Bingham Memorial Hospital" Text="Bingham Memorial Hospital" />
                <asp:ListItem Value="Lady Minto Hospital" Text="Lady Minto Hospital" />
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="lbl_reason" runat="server" Text="Main Reason for Volunteering" />
            <asp:CheckBoxList ID="ckb_reason" runat="server" RepeatColumns="2" RepeatDirection="Vertical">
                <asp:ListItem Value="Academic Credit" Text="Academic Credit" />
                <asp:ListItem Value="Help Others" Text="Help Others" />
                <asp:ListItem Value="Learn new skills" Text="Learn new skills" />
                <asp:ListItem Value="Employment Experience" Text="Employment Experience" />
                <asp:ListItem Value="Improve Health Care" Text="Improve Health Care" />
                <asp:ListItem Value="Practice English skills" Text="Practice English Skills" />
                <asp:ListItem Value="Social Interaction" Text="Social Interaction" />
                <asp:ListItem Value="Explore Careers" Text="Explore Careers" />
                <asp:ListItem Value="Increase Self Esteem" Text="Increase Self Esteem" />
                <asp:ListItem Value="Stay active and involved" Text="Stay active and involved" />
            </asp:CheckBoxList>
            <br />
            <asp:Label ID="lbl_resume" runat="server" Text="Resume" />
            <asp:FileUpload ID="fileUploader" runat="server" />
         
            <br />
            <asp:Label ID="lbl_disclaimer" runat="server" Text="Disclaimer" />
            <br />
            <asp:Label ID="lbl_pdisclaimer" runat="server" Text="By submitting the application, I agree the information I have provided on the form is true and accurate. Furthermore, I understand and agree that submitting this application form does not automatically register me as volunteer." />
            <br />
            <asp:CheckBox ID="ckb_disclaimer" runat="server" Text="I agree." />
            <asp:Label ID="lbl_error" runat="server" />
            <br />
            <br />
            <asp:Button ID="btn_submit" runat="server" Text="Submit" CommandName="Insert" OnCommand="subAdmin" />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" OnCommand="subAdmin" />                
            </asp:View>            
       
    </asp:MultiView>
</asp:Content>




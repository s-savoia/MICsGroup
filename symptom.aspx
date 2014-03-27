<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="symptom.aspx.cs" Inherits="symptom" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <h3>
        <asp:Literal ID="ltl_title" runat="server" Text="Symptom Checker (For colds)" />
    </h3>
    <br />
    <br />

    <asp:BulletedList ID="bll_info" runat="server" BulletStyle="CustomImage" BulletImageUrl="~/img/cruz.png">
        <asp:ListItem Text="&nbsp;&nbsp; You can view symptoms for common colds on this page" />
        <asp:ListItem Text="&nbsp;&nbsp; If you do not see the symptom you are looking for, please use the 'Chat with a Nurse' feature, or 'book an appointment'." />
    </asp:BulletedList>
    <br />
    <br />
    <asp:Label ID="lbl_warning" runat="server" Text="! This is NOT a replacement for a doctor's diagnosis. " BackColor="#ecf10e" ForeColor="Black" />
    <br />
    <br />

    <asp:LinkButton ID="lkb_chat" runat="server" Text="Chat with a nurse" PostBackUrl="~/symptom.aspx" />
    <%--change the postBackUrl to chat feature--%>
    &nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lkb_appointment" runat="server" Text="Book an appointment" PostBackUrl="~/appointment.aspx" />

    
    <br />
    <br />
    
    <h4>
        <asp:Label ID="lbl_symptoms" runat="server" Text="Symptoms" /></h4>

    <%--symptoms checkbox list--%>
    <asp:CheckBoxList ID="cbl_symptoms" runat="server" AutoPostBack="false" DataTextField="symptom" DataValueField="id">
<%--        <asp:ListItem Text='<%#Eval("symptom") %>' Value='<%#Eval("symptom") %>' />--%>
        <%--<asp:ListItem Text="test" Value="test" />
        <asp:ListItem Text="hi" Value="hi" />
        <asp:ListItem Text="ha" Value="ha" />--%>
    </asp:CheckBoxList>

    <%--<asp:SqlDataSource ID="sds_symptoms" runat="server" ConnectionString="<%$ ConnectionStrings:DB_65873_micConnectionString %>" SelectCommand="SELECT [id], [symptom] FROM [mic_symptoms]" />

    <asp:GridView ID="grv_test" runat="server" DataKeyNames="symptom" AutoGenerateColumns="false"> 
        <Columns>
            <asp:CheckBoxField DataField="has" HeaderText="I have this" />
            <asp:BoundField DataField="symptom" HeaderText="symptom" />
                                 
        </Columns>
    </asp:GridView>--%>

    <br />

    <asp:Button ID="btn_advice" runat="server" Text="Get advice" OnCommand="sub_admin" CommandName="getAdvice" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CausesValidation="false" OnCommand="sub_admin" CommandName="cancel" />

    <br />
    <br />

    <asp:Panel ID="pnl_advice" runat="server" GroupingText="Advice">
        <asp:Label ID="lbl_advice" runat="server" />
        <br />

        <%--advice bulleted list--%>
        <asp:BulletedList ID="bll_advice" runat="server" BulletStyle="CustomImage" BulletImageUrl="~/img/pen.png" DataTextField="advice" DataValueField="level" />
    </asp:Panel>

</asp:Content>


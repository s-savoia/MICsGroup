<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="symptom.aspx.cs" Inherits="symptom" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">


    <asp:ScriptManager ID="scm_main" runat="server" />

    <h3>
        <asp:Literal ID="ltl_title" runat="server" Text="Symptom Checker (For colds)" />
    </h3>
    <br />
    <br />

    <asp:BulletedList ID="bll_info" runat="server" BulletStyle="CustomImage" BulletImageUrl="~/img/pen.png">
        <asp:ListItem Text="&nbsp;&nbsp; You can view symptoms for common colds on this page" />
        <asp:ListItem Text="&nbsp;&nbsp; If you do not see the symptom you are looking for, please use the 'Chat with a Nurse' feature, or 'book an appointment'." />
        <asp:ListItem Text="&nbsp;&nbsp;To get advice, choose some symptoms by clicking on a checkbox or the actual text, then click/touch the 'get advice' button to receive advice." />
    </asp:BulletedList>
    <br />
    <br />
    <asp:Label ID="lbl_warning" runat="server" Text="! This is NOT a replacement for a doctor's diagnosis. " BackColor="#f1ed36" ForeColor="#996633" />
    <br />
    <br />
    <asp:LinkButton ID="lkb_chat" runat="server" Text="Chat with a nurse" PostBackUrl="~/symptom.aspx" />

    <%--change the postBackUrl to chat feature--%>
    &nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lkb_appointment" runat="server" Text="Book an appointment" PostBackUrl="~/appointment.aspx" />


    <asp:Image ID="img_doctor_patient" runat="server" ImageUrl="~/img/symptom-checker/doctor-patient.jpg" ImageAlign="Right" Width="400" Height="300" />
    <br />
    <br />


    <asp:UpdatePanel ID="udp_symptoms" runat="server">
        <ContentTemplate>

            <asp:Panel ID="pnl_symptomsList" runat="server" Visible="false">
                <h4>
                    <asp:Label ID="lbl_symptoms" runat="server" Text="Symptoms" />
                </h4>

                <%--symptoms checkbox list--%>
                <asp:CheckBoxList ID="cbl_symptoms" runat="server" AutoPostBack="false" DataTextField="symptom" DataValueField="id" />
            </asp:Panel>

            <asp:Label ID="lbl_underConstruction" runat="server" Text="Sorry, this feature is currently under construction." Visible="false" />
            <br />
        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_clear" EventName="Command" />
        </Triggers>

    </asp:UpdatePanel>

    <asp:Panel ID="pnl_buttons" runat="server" Visible="false">
        <asp:Button ID="btn_advice" runat="server" Text="Get advice" OnCommand="sub_admin" CommandName="getAdvice" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_clear" runat="server" Text="Clear" CausesValidation="false" OnCommand="sub_admin" CommandName="clear" />
    </asp:Panel>

    <br />
    <br />

    <asp:UpdatePanel ID="udp_advice" runat="server">

        <ContentTemplate>

            <%--a panel for showing advice--%>
            <asp:Panel ID="pnl_advice" runat="server" Visible="false">

                <h4>
                    <asp:Label ID="lbl_advice" runat="server" Text="Advice" />
                </h4>

                <%--advice bulleted list--%>
                <asp:BulletedList ID="bll_advice" runat="server" BulletStyle="CustomImage" BulletImageUrl="~/img/pen.png" DataTextField="advice" DataValueField="level" />


                <br />
                <br />

                <asp:LinkButton ID="lkb_chatPnl" runat="server" Text="Chat with a nurse" PostBackUrl="~/symptom.aspx" />

                <%--change the postBackUrl to chat feature--%>
    &nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lkb_appointmentPnl" runat="server" Text="Book an appointment" PostBackUrl="~/appointment.aspx" />
            </asp:Panel>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_advice" EventName="Command" />
        </Triggers>

    </asp:UpdatePanel>



</asp:Content>


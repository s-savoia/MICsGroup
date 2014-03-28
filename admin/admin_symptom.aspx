<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_symptom.aspx.cs" Inherits="admin_symptom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_symptom.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <asp:ScriptManager ID="scm_main" runat="server" />

    <%--main control buttons--%>

    <asp:Panel ID="pnl_controlPanel" runat="server" Visible="false">

        <asp:Button ID="btn_manageSymptoms" runat="server" Text="Manage Symptoms" OnCommand="sub_admin" CommandName="manageSymptoms" />
        <br />
        <br />


        <asp:Button ID="btn_manageAdvice" runat="server" Text="Manage advice" OnCommand="sub_admin" CommandName="manageAdvice" />
        <br />
        <br />

    </asp:Panel>

    <asp:UpdatePanel ID="udp_main" runat="server">
        <ContentTemplate>

            <%-- = = = insert panel = = = --%>
            <asp:Panel ID="pnl_insertSymptom" runat="server" Visible="false">

                <div style="float: left;">
                    <h1>
                        <asp:Label ID="lbl_viewModeInsertSymptom" runat="server" Text="Add a symptom" />
                    </h1>

                    <br />
                    <br />

                    <asp:Label ID="lbl_symptomI" runat="server" Text="Symptom" AssociatedControlID="txt_symptomI" />

                    <asp:TextBox ID="txt_symptomI" runat="server" ValidationGroup="insert" />

                    <asp:RequiredFieldValidator ID="rfv_symptomI" runat="server" ControlToValidate="txt_symptomI" Text="*" ValidationGroup="insert" CssClass="requiredColour" ToolTip="Please fill in this field" />


                    <br />
                    <br />
                    <asp:Button ID="btn_insertSymptom" runat="server" Text="Add" OnCommand="sub_admin" CommandName="insert" ValidationGroup="insert" />
                </div>

                <div style="float: right; padding-right: 5%;">
                    <h4>
                        <asp:Label ID="lbl_requiredNote" runat="server" Text="* Required field" CssClass="requiredColour" />
                    </h4>
                </div>

            </asp:Panel>

            <%--manage symptoms buttons--%>

            <asp:Panel ID="pnl_symptomControl" runat="server" Visible="false" CssClass="floatR">
                <br />
                <hr />

                <asp:Button ID="btn_viewInsert" runat="server" Text="Add new symptom" OnCommand="sub_admin" CommandName="viewInsert" />
                <br />
                <br />


                <asp:Button ID="btn_viewSymptoms" runat="server" Text="View symptoms" OnCommand="sub_admin" CommandName="viewSymptoms" />
                <br />
                <br />


                <asp:Button ID="btn_switchToAdvice" runat="server" Text="Manage advice" OnCommand="sub_admin" CommandName="manageAdvice" />
                
                <hr />
                <br />

            </asp:Panel>

            <%-- = = = view/edit panel = = = --%>
            <asp:Panel ID="pnl_viewEditSymptom" runat="server" Visible="false">

                <h1>
                    <asp:Label ID="lbl_viewModeVE" runat="server" Text="View/Edit symptoms" />
                </h1>

                <br />
                <br />

                <div style="float: left; margin-right: 3%;">
                    <h3>
                        <asp:Label ID="lbl_headingIdVE" runat="server" Text="Id" />
                    </h3>
                </div>

                <div style="float: left;">
                    <h3>
                        <asp:Label ID="lbl_headingSymptomVE" runat="server" Text="Symptom" />
                    </h3>
                </div>

                <%--gridview--%>

                <div style="float: left;">
                    <%--border: 1px dashed red;--%>
                    <asp:GridView ID="grd_symptomsTable" runat="server" AutoGenerateColumns="false" DataKeyNames="id">

                        <Columns>

                            <%--item template--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div style="padding: 2%;">
                                        <div style="width: 5%; float: left; padding-top: 2%;">
                                            <asp:Label ID="lbl_idE" runat="server" Text='<%# Eval("id") %>' />
                                        </div>


                                        <div style="width: 45%; float: left; padding-top: 2%;">
                                            <asp:Label ID="lbl_symptomE" runat="server" Text='<%#Eval ("symptom") %>' />
                                        </div>

                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" OnCommand="sub_admin" CommandName="delete" />
                                        </div>

                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_edit" runat="server" Text="Edit" OnCommand="sub_admin" CommandName="edit" />
                                        </div>

                                        <div style="border-bottom: 2px dotted #22BCB9;" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </asp:Panel>

            <asp:Panel ID="pnl_viewEditAdvice" runat="server" Visible="false">
            </asp:Panel>

        </ContentTemplate>

        <Triggers>

            <%--main control buttons (manage symptoms or advice)--%>
            <asp:AsyncPostBackTrigger ControlID="btn_manageAdvice" EventName="Command" />


            <asp:AsyncPostBackTrigger ControlID="btn_manageSymptoms" EventName="Command" />


            <%--symptoms control buttons (insert, view/edit symptoms, switch to managing advice--%>
            <asp:AsyncPostBackTrigger ControlID="btn_viewInsert" EventName="Command" />


            <asp:AsyncPostBackTrigger ControlID="btn_viewSymptoms" EventName="Command" />


            <asp:AsyncPostBackTrigger ControlID="btn_switchToAdvice" EventName="Command" />

        </Triggers>
    </asp:UpdatePanel>

    <br style="clear: both;" />








    <%--edit template--%>

    <%--separator template--%>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_symptom.aspx.cs" Inherits="admin_symptom" %>

<%@ MasterType VirtualPath="~/admin/admin_master.master" %>

<%--= = = CODED BY: JAMES HONG = = =--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--STYLESHEETS--%>
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_services.css" />
    <link rel="stylesheet" href="../App_Themes/admin_theme/admin_symptom.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" runat="Server">

    <asp:ScriptManager ID="scm_main" runat="server" />

    <%--= = = UPDATE PANEL = = =--%>
    <asp:UpdatePanel ID="udp_main" runat="server">

        <%--= = = CONTENT TEMPLATE = = =--%>
        <ContentTemplate>

            <%--MAIN CONTROL BUTTONS (manage the type of content: symptoms/advice)--%>
            <asp:Panel ID="pnl_controlPanel" runat="server" Visible="false">

                <asp:Label ID="lbl_starting_instructions" runat="server" Text="Please choose a content type to begin managing content." /> 
                <br /><br />
                <asp:Button ID="btn_manageSymptoms" runat="server" Text="Manage Symptoms" OnCommand="sub_adminOther" CommandName="manageSymptoms" />
                <br />
                <br />

                <asp:Button ID="btn_manageAdvice" runat="server" Text="Manage advice" OnCommand="sub_adminOther" CommandName="manageAdvice" />
                <br />
                <br />
                <asp:Label ID="lbl_message" runat="server" Text="message" Visible="true" />
                <br />
                <br />
            </asp:Panel>

            <%-- = = = INSERT SYMPTOM PANEL (symptom name)= = = --%>
            <asp:Panel ID="pnl_insertSymptom" runat="server" Visible="false">

                <div style="float: left;">

                    <br />
                    <br />

                    <asp:Label ID="lbl_symptomI" runat="server" Text="Symptom" AssociatedControlID="txt_symptomI" />

                    <asp:TextBox ID="txt_symptomI" runat="server" ValidationGroup="insert" Columns="50" />

                    <asp:RequiredFieldValidator ID="rfv_symptomI" runat="server" ControlToValidate="txt_symptomI" Text="*" ValidationGroup="insert" CssClass="requiredColour" ToolTip="Please fill in this field" />


                    <br />
                    <br />
                    <%--ADD BUTTON--%>
                    <asp:Button ID="btn_insertSymptom" runat="server" Text="Add" OnCommand="sub_adminOther" CommandName="insertSymp" ValidationGroup="insert" />

                    <%--CANCEL BUTTON--%>
                    <asp:Button ID="btn_cancelInsertSymptom" runat="server" Text="Cancel" OnCommand="sub_adminOther" CommandName="cancelSymp" CausesValidation="false" ValidationGroup="insert" />
                </div>

                <div style="float: right; padding-right: 5%;">
                    <h4>
                        <%--REQUIRED FIELD LEGEND--%>
                        <asp:Label ID="lbl_requiredNoteSymp" runat="server" Text="* Required field" CssClass="requiredColour" />
                    </h4>
                </div>

            </asp:Panel>

            <%--MANAGE SYMPTOMS PANEL--%>
            <asp:Panel ID="pnl_symptomControl" runat="server" Visible="false" CssClass="contentControlBtns">

                <br />
                <hr />

                <%--BUTTONS (add a symptom, view symptoms)--%>
                <asp:Button ID="btn_viewInsert" runat="server" Text="Add new symptom" OnCommand="sub_adminOther" CommandName="viewInsertSymp" CssClass="margin-right-m" />

                <asp:Button ID="btn_viewSymptoms" runat="server" Text="View symptoms" OnCommand="sub_adminOther" CommandName="viewSymptoms" CssClass="margin-right-m" />

                <hr />
                <br />

            </asp:Panel>

            <%-- VIEW/EDIT SYMPTOMS PANEL --%>
            <asp:Panel ID="pnl_viewEditSymptom" runat="server" Visible="false">

                <br />
                <br />
                <%--HEADINGS--%>
                <div style="float: left; margin-right: 3%;">
                    <h3>
                        <%--SYMPTOM ID--%>
                        <asp:Label ID="lbl_headingIdVE" runat="server" Text="Id" />
                    </h3>
                </div>

                <div style="float: left;">
                    <h3>
                        <%--SYMPTOM NAME--%>
                        <asp:Label ID="lbl_headingSymptomVE" runat="server" Text="Symptom" />
                    </h3>
                </div>

                <%--GRIDVIEW (SYMPTOMS) --%>
                <div style="float: left;">
                    <%--border: 1px dashed red;--%>
                    <asp:GridView ID="grd_symptomsTable" runat="server" AutoGenerateColumns="false" DataKeyNames="id">

                        <Columns>

                            <%--ITEM TEMPLATE--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div style="padding: 2%; margin-right: 3%;">
                                        <div style="width: 5%; float: left; padding-top: 2%;">

                                            <%--ID--%>
                                            <asp:Label ID="lbl_idE" runat="server" Text='<%# Eval("id") %>' />
                                        </div>

                                        <%--SYMPTOM--%>
                                        <div style="width: 45%; float: left; padding-top: 2%;">
                                            <asp:Label ID="lbl_symptomE" runat="server" Text='<%#Eval ("symptom") %>' />
                                        </div>

                                        <%--DELETE BUTTON--%>
                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_deleteSymp" runat="server" Text="Delete" OnCommand="sub_admin" CommandName="deleteSymp" CommandArgument='<%#Eval ("id") %>' OnClientClick='return confirm("Are you sure you want to delete this?");' />
                                        </div>

                                        <%--EDIT BUTTON--%>
                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_editSymp" runat="server" Text="Edit" OnCommand="sub_admin" CommandName="editSymp" CommandArgument='<%#Eval ("id") %>' />
                                        </div>

                                        <div style="border-bottom: 2px dotted #22BCB9;" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--EDIT ITEM TEMPLATE--%>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <div style="padding: 2%;">
                                        <div style="width: 5%; float: left; padding-top: 2%;">

                                            <%--ID--%>
                                            <asp:Label ID="lbl_idE" runat="server" Text='<%# Eval("id") %>' />
                                        </div>

                                        <%--SYMPTOM--%>
                                        <div style="width: 45%; float: left; padding-top: 2%;">
                                            <asp:Label ID="lbl_symptomE" runat="server" Text='<%#Eval ("symptom") %>' />
                                            <br />                                            
                                        </div>
                                        
                                        <%--UPDATE BUTTON--%>
                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_updateSymp" runat="server" Text="Update" OnCommand="sub_admin" CommandName="updateSymp" />
                                        </div>

                                        <div style="border-bottom: 2px dotted #22BCB9;" />
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </asp:Panel>


            <%-- = = = INSERT ADVICE PANEL (advice content)= = = --%>
            <asp:Panel ID="pnl_insertAdvice" runat="server" Visible="false">

                <div style="float: left;">

                    <br />
                    <br />

                    <asp:Label ID="lbl_adviceI" runat="server" Text="Advice" AssociatedControlID="txt_adviceI" />
                    <%--ADVICE--%>
                    <asp:TextBox ID="txt_adviceI" runat="server" ValidationGroup="insert" Columns="50" />

                    <asp:RequiredFieldValidator ID="rfv_adviceI" runat="server" ControlToValidate="txt_adviceI" Text="*" ValidationGroup="insert" CssClass="requiredColour" ToolTip="Please fill in this field" />

                    <br />
                    <br />
                    <%--ADD BUTTON--%>
                    <asp:Button ID="btn_insertAdvice" runat="server" Text="Add" OnCommand="sub_adminOther" CommandName="insertAdv" ValidationGroup="insert" />

                    <%--CANCEL BUTTON--%>
                    <asp:Button ID="btn_cancelInsertAdv" runat="server" Text="Cancel" OnCommand="sub_adminOther" CommandName="cancelAdv" CausesValidation="false" ValidationGroup="insert" />
                </div>
                <%--REQUIRED FIELD LEGEND--%>
                <div style="float: right; padding-right: 5%;">
                    <h4>
                        <asp:Label ID="lbl_requiredNoteAdv" runat="server" Text="* Required field" CssClass="requiredColour" />
                    </h4>
                </div>

            </asp:Panel>

            <%--MANAGE ADVICE PANEL--%>
            <asp:Panel ID="pnl_adviceControl" runat="server" Visible="false" CssClass="contentControlBtns">
                <br />
                <hr />

                <%--BUTTONS (add/view advice)--%>
                <asp:Button ID="btn_viewInsertA" runat="server" Text="Add new advice" OnCommand="sub_adminOther" CommandName="viewInsertAdv" CssClass="margin-right-m" />

                <asp:Button ID="btn_viewAdviceA" runat="server" Text="View advice" OnCommand="sub_adminOther" CommandName="viewAdvice" CssClass="margin-right-m" />

                <hr />
                <br />

            </asp:Panel>

            <%--VIEW/EDIT ADVICE PANEL (level of severity, advice content)--%>
            <asp:Panel ID="pnl_viewEditAdvice" runat="server" Visible="false">

                <br />
                <br />
                <%--HEADINGS--%>
                <div style="float: left; margin-right: 3%;">
                    <h3>
                        <%--LEVEL OF SEVERITY--%>
                        <asp:Label ID="lbl_headingLevelVE" runat="server" Text="Level" />
                    </h3>
                </div>

                <div style="float: left;">
                    <h3>
                        <%--ADVICE--%>
                        <asp:Label ID="lbl_headingAdviceVE" runat="server" Text="Advice" />
                    </h3>
                </div>

                <%--GRIDVIEW (ADVICE) --%>
                <div style="float: left;">
                    <asp:GridView ID="grd_adviceTable" runat="server" AutoGenerateColumns="false" DataKeyNames="level">

                        <Columns>
                            <%--ITEM TEMPLATE--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div style="padding: 2%;">
                                        <div style="width: 5%; float: left; padding-top: 2%;">

                                            <%--LEVEL OF SEVERITY--%>
                                            <asp:Label ID="lbl_levelE" runat="server" Text='<%# Eval("level") %>' />
                                        </div>

                                        <%--ADVICE CONTENT--%>
                                        <div style="width: 45%; float: left; padding-top: 2%;">
                                            <asp:Label ID="lbl_adviceE" runat="server" Text='<%#Eval ("advice") %>' />
                                        </div>

                                        <%--DELETE BUTTON--%>
                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" OnCommand="sub_admin" CommandName="deleteAdv" CommandArgument='<%#Eval ("level") %>' OnClientClick='return confirm("Are you sure you want to delete this?");' />
                                        </div>

                                        <%--EDIT BUTTON--%>
                                        <div style="width: 10%; float: right; padding-top: 2%;">
                                            <asp:Button ID="btn_edit" runat="server" Text="Edit" OnCommand="sub_admin" CommandName="editAdv" CommandArgument='<%#Eval ("level") %>' />
                                        </div>

                                        <div style="border-bottom: 2px dotted #22BCB9;" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--EDIT ITEM TEMPLATE--%>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <%--<asp:Panel ID="pnl_editAdvice" runat="server" Visible="false">--%>
                                        <div style="padding: 2%;">
                                            <div style="width: 5%; float: left; padding-top: 2%;">

                                                <%--LEVEL OF SEVERITY--%>
                                                <asp:Label ID="lbl_levelE" runat="server" Text='<%# Eval("level") %>' />
                                            </div>

                                            <%--ADVICE CONTENT--%>
                                            <div style="width: 45%; float: left; padding-top: 2%;">
                                                <asp:Label ID="lbl_adviceE" runat="server" Text='<%#Eval ("advice") %>' />
                                            </div>                                            

                                            <%--UPDATE BUTTON--%>
                                            <div style="width: 10%; float: right; padding-top: 2%;">
                                                <asp:Button ID="btn_updateAdvE" runat="server" Text="Update" OnCommand="sub_admin" CommandName="updateAdv" />
                                            </div>

                                            <div style="border-bottom: 2px dotted #22BCB9;" />
                                        </div>
                                    <%--</asp:Panel>--%>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </asp:Panel>

        </ContentTemplate>

        <%--= = = TRIGGERS = = =--%>
        <Triggers>

            <%--main control buttons (manage symptoms or advice)--%>
            <asp:AsyncPostBackTrigger ControlID="btn_manageAdvice" EventName="Command" />


            <asp:AsyncPostBackTrigger ControlID="btn_manageSymptoms" EventName="Command" />


            <%--symptoms control buttons (insert, view/edit symptoms, switch to managing advice--%>
            <asp:AsyncPostBackTrigger ControlID="btn_viewInsert" EventName="Command" />


            <asp:AsyncPostBackTrigger ControlID="btn_viewSymptoms" EventName="Command" />

            <asp:AsyncPostBackTrigger ControlID="btn_insertSymptom" EventName="Command" />

        </Triggers>
    </asp:UpdatePanel>

    <br style="clear: both;" />


    <%--edit template--%>

    <%--separator template--%>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_newsletter.aspx.cs" Inherits="admin_newsletter" %>

<%-- This page was coded by HIDEMI NAWATA --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">

<%-----------------------------Newsletter Applicant Edit Section Start-----------------------------%>
    <asp:Panel ID="pnl_applicant" runat="server">
        <%--Newsletter Applicant header--%>
        <asp:Label ID="lbl_header" runat="server" Text="Newsletter Applicant Information" Font-Bold="true" />
        <br /><br />

        <%--Applicant Information List--%>
        <asp:Panel ID="pnl_main" runat="server">
        <asp:ListView ID="ltv_main" runat="server" OnItemCommand="subAdmin">     
            <LayoutTemplate>
                <table>
                    <thead id="tbl_list">
                        <tr>
                            <th><asp:Label ID="lbl_id" runat="server" Text="ID" /></th>
                            <th><asp:Label ID="lbl_name" runat="server" Text="Name" /></th>
                            <th><asp:Label ID="lbl_email" runat="server" Text="email" /></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </tbody>
                </table>                      
            </LayoutTemplate>
            <ItemTemplate>
                <%--Bind Data--%>      
                <tr id="tbl_list2">
                    <td><asp:Label ID="lbl_idD" runat="server" Text='<%#Eval("mailing_id") %>' /></td>
                    <td><asp:Label ID="lbl_nameD" runat="server" Text='<%#Eval("name") %>' /></td>
                    <td><asp:Label ID="lbl_emailD" runat="server" Text='<%#Eval("email") %>' /></td>
                    <td></td>
                    <td><asp:Button ID="btn_edit" runat="server" Text="Edit" Width="55px" CommandName="showUpdate" CommandArgument='<%#Eval("mailing_id") %>' /></td>
                </tr>  
            </ItemTemplate>
        </asp:ListView>
        </asp:Panel>

        <%--Newsletter Information Each--%>
        <asp:Panel ID="pnl_edit" runat="server">
            <asp:Listview ID="ltv_edit" runat="server" OnItemCommand="subUpdate">      
                <%--Edit--%>
                <ItemTemplate>
                    <div id="content_edit">
                        <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("mailing_id") %>' />
                        <%--name--%>
                        <asp:Label ID="lbl_nameE" runat="server" Text="Name: " />
                        <asp:TextBox ID="txt_nameE" runat="server" Width="180px" Text='<%#Bind("name") %>' />
                        <asp:RequiredFieldValidator ID="rfv_nameE" runat="server" ControlToValidate="txt_nameE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                        <br /><br />
                    
                        <%--email--%>
                        <asp:Label ID="lbl_emailE" runat="server" Text="email: " />
                        <asp:TextBox ID="txt_emailE" runat="server" Width="180px" Text='<%#Bind("email") %>' />
                        <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="*Required" Display="None" ValidationGroup="edit" />
                        <br /><br />

                        <%--update/delete/cancel button--%>
                        <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="doUpdate" Width="55px" />
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="doDelete"  Width="55px" />
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="doCancel"  Width="55px" />
                    </div>
                </ItemTemplate>   
            </asp:Listview>     
        </asp:Panel>
    </asp:Panel>
    <br /><br />
<%-----------------------------Newsletter Applicant Edit Section Ends-----------------------------%>


<%-------------------------------Newsletter Form Edit Section Start-------------------------------%>

    <asp:Panel ID="pnl_newsform" runat="server">
        <%--Newsletter Applicant header--%>
        <asp:Label ID="lbl_headerDL" runat="server" Text="Newsletter Form Information" Font-Bold="true" />
        <br /><br />

        <%--Applicant Information List--%>
        <asp:Panel ID="pnl_mainDL" runat="server">
        <asp:Datalist ID="dtl_mainDL" runat="server" OnItemCommand="subAdminDL">     
            <HeaderTemplate>
                <table id="tbl_list">
                    <tr>
                        <th><asp:Label ID="lbl_idDL" runat="server" Text="ID" /></th>
                        <th><asp:Label ID="lbl_subjectDL" runat="server" Text="Subject" /></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>                                     
                <%--Bind Data--%>      
                <tr id="tbl_list2">
                    <td><asp:Label ID="lbl_idDDL" runat="server" Text='<%#Eval("sendletter_id") %>' /></td>
                    <td><asp:Label ID="lbl_nameDDL" runat="server" Text='<%#Eval("subject") %>' /></td>
                    <td></td>
                    <td></td>
                    <td><asp:Button ID="btn_edit" runat="server" Text="Edit" Width="55px" CommandName="showUpdateDL" CommandArgument='<%#Eval("sendletter_id") %>' /></td>
                </tr>  
            </ItemTemplate>
        </asp:Datalist>
        </asp:Panel>

        <%--Newsletter Information Each--%>
        <asp:Panel ID="pnl_editDL" runat="server">            
            <asp:Datalist ID="dtl_editDL" runat="server" OnItemCommand="subUpdateDL">      
                <%--Edit--%>
                <ItemTemplate>
                    <div id="content_edit">
                        <asp:HiddenField ID="hdf_idDL" runat="server" Value='<%#Eval("sendletter_id") %>' />
                        <%--subject--%>
                        <asp:Label ID="lbl_subjectEDL" runat="server" Text="Subject: " />
                        <asp:TextBox ID="txt_subjectEDL" runat="server" Width="180px" Text='<%#Bind("subject") %>' />
                        <asp:RequiredFieldValidator ID="rfv_nameEDL" runat="server" ControlToValidate="txt_subjectEDL" ErrorMessage="*Required" Display="None" ValidationGroup="editnews" />
                        <br /><br />
                    
                        <%--message--%>
                        <asp:Label ID="lbl_messageEDL" runat="server" Text="Message: " />
                        <asp:TextBox ID="txt_messageEDL" runat="server" Text='<%#Bind("message") %>' TextMode="Multiline" Columns="75" Rows="5" BorderColor="#666666" />
                        <asp:RequiredFieldValidator ID="rfv_emailEDL" runat="server" ControlToValidate="txt_messageEDL" ErrorMessage="*Required" Display="None" ValidationGroup="editnews" />
                        <br /><br />

                        <%--image--%>
                        <asp:Label ID="lbl_imageEDL" runat="server" Text="Attached Image:" />
                        <br />
                        <asp:Image ID="img_imageEDL" runat="server" ImageUrl='<%#Bind("image") %>' />
                        
                        <br />
                        <asp:FileUpload ID="ful_imageEDL" runat="server" FileName='<%#Bind("image") %>' />
                        <br /><br />

                        <%--update/delete/cancel button--%>
                        <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="UpdateDL" Width="55px" />
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="DeleteDL"  Width="55px" />
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="CancelDL"  Width="55px" />
                    </div>
                </ItemTemplate>   
            </asp:Datalist>     
        </asp:Panel>
    </asp:Panel>
    <%--Message--%>
    <br /><br />
    <asp:Label ID="lbl_message" runat="server" />
<%-----------------------------Newsletter Applicant Edit Section Ends-----------------------------%>

</asp:Content>

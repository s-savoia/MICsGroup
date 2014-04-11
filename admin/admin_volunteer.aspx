<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_volunteer.aspx.cs" Inherits="admin_admin_volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <asp:Panel ID="pnl_main" runat="server">
        <table>
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_name" runat="server" Text="Name" /></th>
                    <th><asp:Label ID="lbl_location" runat="server" Text="Prefered Location" /></th>
                    <th><asp:Label ID="lbl_career" runat="server" Text="Career" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt_volunteer" runat="server" OnItemCommand="subViewDelete" >
                    <ItemTemplate>
                        <tr>
                            <td><asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("id") %>' />
                                <asp:Label ID="lbl_vname" runat="server" Text='<%#Eval("fname") %>' />
                            </td>
                            <td><asp:Label ID="lbl_vlocation" runat="server" Text='<%#Eval("location") %>' /></td>
                            <td><asp:Label ID="lbl_career" runat="server" Text='<%#Eval("education_level") %>' /></td>
                            <td><asp:Button ID="btn_viewdetails" runat="server" Text="View Details" CommandName="View" CommandArgume nt='<%#Eval("id") %>' />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("id") %>'  />
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
             </tbody>
          </table>
    </asp:Panel>
    <asp:Panel ID="pnl_details" runat="server" >
        <hr />
        <asp:FormView ID="fmv_details" runat="server" >
            <ItemTemplate>
                <h2>Volunteer Applicant Details</h2>
                <table>
                    <tr>
                        <td>
                            <h4><asp:Label ID="lbl_fname" runat="server" Text="First Name: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vfname" runat="server" Text='<%#Eval("fname") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_lname" runat="server" Text="Last Name: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vlname" runat="server" Text='<%#Eval("lname") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_title" runat="server" Text="Title: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vtitle" runat="server" Text='<%#Eval("title") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_dob" runat="server" Text="Date of Birth: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vdob" runat="server" Text='<%#Eval("dob") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_city" runat="server" Text="City: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vcity" runat="server" Text='<%#Eval("city") %>' /></td>
                    </tr>
                    <tr>
                        <td>
                            <h4><asp:Label ID="lbl_province" runat="server" Text="Province: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vprovince" runat="server" Text='<%#Eval("province") %>' /></td>
                     </tr> 
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_postalCode" runat="server" Text="Postal Code: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vpostalCode" runat="server" Text='<%#Eval("postalCode") %>' /></td>
                    </tr>
                    <tr>
                        <td>
                            <h4><asp:Label ID="lbl_hphone" runat="server" Text="Home Phone Number: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vhphone" runat="server" Text='<%#Eval("home_phone") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_wphone" runat="server" Text="Work Phone Number: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vwphone" runat="server" Text='<%#Eval("work_phone") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_pphone" runat="server" Text="Personal Contact Number: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vpphone" runat="server" Text='<%#Eval("personal_phone") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_email" runat="server" Text="Email: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vemail" runat="server" Text='<%#Eval("email") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_econtact" runat="server" Text="Emergency Contact Name: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vecontact" runat="server" Text='<%#Eval("emergency_contactName") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_enumber" runat="server" Text="Emergency Contact Number: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_venumber" runat="server" Text='<%#Eval("emergency_contact") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_education" runat="server" Text="Education Level: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_veducation" runat="server" Text='<%#Eval("education_level") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_skills" runat="server" Text="Skills: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vskills" runat="server" Text='<%#Eval("skills") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_experience" runat="server" Text="Experience: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vexperience" runat="server" Text='<%#Eval("experience") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_location" runat="server" Text="Prefered Location: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vlocation" runat="server" Text='<%#Eval("location") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_reason" runat="server" Text="Reason: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vreason" runat="server" Text='<%#Eval("reason") %>' /></td>
                    </tr>
                     <tr>
                        <td>
                            <h4><asp:Label ID="lbl_resume" runat="server" Text="Resume: " /></h4>
                        </td>
                        <td><asp:Label ID="lbl_vresume" runat="server" Text='<%#Eval("resume") %>' /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
    </asp:Panel>
</asp:Content>


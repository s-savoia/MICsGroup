using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class careers3 : System.Web.UI.Page
{
     volunteerApplication objVolunteer = new volunteerApplication();
    employment objEmployment = new employment();
    Label skills = new Label();
    Label reason = new Label();
    

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "Insert":
                if (ckb_disclaimer.Checked)
                {
                    foreach (ListItem item in ckb_skills.Items)
                    {
                        if (item.Selected)
                        {
                            skills.Text += item.Text + ",";
                        }
                    }

                    foreach (ListItem item in ckb_reason.Items)
                    {
                        if (item.Selected)
                        {
                            reason.Text += item.Text + ",";
                        }
                    }

                    if (fileUploader.HasFile)
                    {
                        fileUploader.SaveAs(Server.MapPath("~/Resumes/") + fileUploader.FileName.ToString());
                    }

                    objVolunteer.commitInsert(txt_fname.Text.ToString(), txt_lname.Text.ToString(), ddl_title.Text.ToString(), txt_dob.Text.ToString(), txt_city.Text.ToString(), ddl_province.Text.ToString(), txt_postalcode.Text.ToString(), txt_hphone.Text.ToString(), txt_wphone.Text.ToString(), txt_cphone.Text.ToString(), txt_email.Text.ToString(), txt_ename.Text.ToString(), txt_ephone.Text.ToString(), ddl_leducation.SelectedValue.ToString(), skills.Text.ToString(), txt_vexp.Text.ToString(), rdb_location.SelectedValue.ToString(), reason.Text.ToString(), fileUploader.FileName.ToString());

                    if (txt_efname1.Text.ToString() != null)
                    {
                        objEmployment.commitInsert(txt_fname.Text.ToString() + txt_cphone.Text.ToString(), txt_efname1.Text.ToString(), txt_lname1.Text.ToString(), txt_jtitle1.Text.ToString(), txt_wphone1.Text.ToString(), txt_ext1.Text.ToString(), txt_semp1.Text.ToString(), txt_eemp1.Text.ToString());
                    }

                    if (txt_efname2.Text.ToString() != null)
                    {
                        objEmployment.commitInsert(txt_fname.Text.ToString() + txt_cphone.Text.ToString(), txt_efname2.Text.ToString(), txt_elname2.Text.ToString(), txt_jtitle2.Text.ToString(), txt_wphone2.Text.ToString(), txt_ext2.Text.ToString(), txt_semp2.Text.ToString(), txt_eemp2.Text.ToString());
                    }
                }
                else
                {
                    lbl_error.Text = "Please agree";
                }
                
                
                break;

            case "Cancel1":
                _subRebind();
                break;
        }
    }    

   
   

    protected void _subRebind()
    {
        txt_fname.Text = string.Empty;
        txt_lname.Text = string.Empty;
        txt_dob.Text = string.Empty;
        txt_city.Text = string.Empty;
        txt_postalcode.Text = string.Empty;
        txt_hphone.Text = string.Empty;
        txt_wphone.Text = string.Empty;
        txt_cphone.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_ename.Text = string.Empty;
        txt_ephone.Text = string.Empty;        
    }

   
}
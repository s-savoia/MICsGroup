using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class career_application : System.Web.UI.Page
{
    careerApplicationClass objLinq = new careerApplicationClass();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Insert data to database
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(txt_fname.Text.ToString(), txt_lname.Text.ToString(), txt_email.Text.ToString(), txt_address.Text.ToString(), int.Parse(ddl_country.SelectedValue.ToString()), int.Parse(ddl_province.SelectedValue.ToString()), txt_city.Text.ToString(), txt_zip.Text.ToString(), txt_phone.Text.ToString(), int.Parse(rbl_status.SelectedValue.ToString()), int.Parse(rbl_crime.SelectedValue.ToString()), int.Parse(ddl_certificate.SelectedValue.ToString()), int.Parse(ddl_proficiency.SelectedValue.ToString()), int.Parse(ddl_experience.SelectedValue.ToString()), ful_resume.FileName.ToString(), ful_cover.FileName.ToString(), txt_reason.Text.ToString(), txt_comment.Text.ToString(), int.Parse(ckb_consent.SelectedValue.ToString())), "insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

        }
    }
    //Clear a form and rebind data
    private void _subRebind()
    {
        txt_fname.Text = String.Empty;
        txt_lname.Text = String.Empty;
        txt_email.Text = String.Empty;
        txt_address.Text = String.Empty;
        ddl_country.SelectedValue = "1";
        ddl_province.SelectedValue = "1";
        txt_city.Text = String.Empty;
        txt_zip.Text = String.Empty;
        txt_phone.Text = String.Empty;
        rbl_status.SelectedValue = "1";
        rbl_crime.SelectedValue = "1";
        ddl_certificate.SelectedValue = "1";
        ddl_proficiency.SelectedValue = "1";
        ddl_experience.SelectedValue = "1";
        txt_reason.Text = String.Empty;
        txt_comment.Text = String.Empty;
        ckb_consent.SelectedValue = "1";
    }

    //Set up error message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_output.Text = "Thank you for your application!";
        else
            lbl_output.Text = "Sorry, you are unable to apply.";
    }
}
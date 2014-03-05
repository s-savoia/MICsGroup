using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class career_application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Thank you message
    protected void subClick(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lbl_output.Text = "Thank you for your applicaion, " + txt_fname + " " + txt_lname + "We will contact you at " + txt_email;
            _subRebind();
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

        //ltb_company.ClearSelection();
        //rbl_quality.ClearSelection();
    }
}
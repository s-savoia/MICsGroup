using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class donation : System.Web.UI.Page
{
    donationClass objLinq = new donationClass();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(txt_fname.Text.ToString(), txt_lname.Text.ToString(), txt_address.Text.ToString(), txt_city.Text.ToString(), ddl_province.SelectedItem.ToString(), ddl_country.SelectedItem.ToString(), txt_zip.Text.ToString(), txt_phone.Text.ToString(), txt_email.Text.ToString(), ddl_survey.SelectedItem.ToString(), txt_comment.Text.ToString(), int.Parse(txt_amount.Text.ToString()), rbl_type.SelectedItem.ToString(), txt_cardnum.Text.ToString(), int.Parse(txt_security.Text.ToString()), txt_holdername.Text.ToString(), ddl_expirationM.SelectedItem.ToString(), ddl_expirationY.SelectedItem.ToString()), "insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

        }
    }

    private void _subRebind()
    {
        txt_fname.Text = String.Empty;
        txt_lname.Text = String.Empty;
        txt_address.Text = String.Empty;      
        txt_city.Text = String.Empty;
        ddl_province.SelectedValue = "1";
        ddl_country.SelectedValue = "1";       
        txt_zip.Text = String.Empty;
        txt_phone.Text = String.Empty;
        txt_email.Text = String.Empty;
        ddl_survey.SelectedValue = "1";
        txt_comment.Text = String.Empty;
        txt_amount.Text = String.Empty;
        rbl_type.SelectedValue = "1";
        txt_cardnum.Text = String.Empty;
        txt_security.Text = String.Empty;
        txt_holdername.Text = String.Empty;
        ddl_expirationM.SelectedValue = "1";
        ddl_expirationY.SelectedValue = "1";
    }

    //Set up error message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_output.Text = "Thank you for donating MICs hospital!";
        else
            lbl_output.Text = "Sorry, you are unable to donnate. Please try again.";
    }
}
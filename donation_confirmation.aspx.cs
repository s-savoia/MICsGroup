using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class donation_confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        donationClass donationSuccess = new donationClass();
        string token = HttpContext.Current.Session["token"].ToString();

        _strMessage(donationSuccess.commitUpdateSuccess(token), "update");

    }

    //Set up error message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "Thank you for donating MICs Group of Health Services! By donating to MICs hospital, you enhance the care patients receive. You provide outstanding learning opportunities for staff and future generations of health-care professionals. Moreover, you fund groundbreaking research that will lead to new discoveries, treatments and cures. Thank you again for your generous support.";
        else
            lbl_message.Text = "Sorry, you are unable to donnate. Please try again.";
    }
}
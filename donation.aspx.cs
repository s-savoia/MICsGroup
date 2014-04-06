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
                
                //_subRebind();

                NVPAPICaller test = new NVPAPICaller();
                string retMsg = "";
                string token = "";

                string amt = payment_amt.Text.ToString();
                //amt = HttpContext.Current.Session["payment_amt"].ToString();
                HttpContext.Current.Session["payment_amt"] = amt;
                
      
                if ( HttpContext.Current.Session["payment_amt"] != null)
                {
                    //donationClass amtDonate = new donationClass();
                    //var allAmount = amtDonate.getDonation();
                    //foreach (var eachAmount in allAmount)
                    //{
                    //    string amt = eachAmount.amount;
                    //}

                    //string amt = payment_amt.Text.ToString();
                    //amt = HttpContext.Current.Session["payment_amt"].ToString();
                    //HttpContext.Current.Session["payment_amt"] = amt;

                    bool ret = test.ShortcutExpressCheckout(amt, ref token, ref retMsg);
                    if (ret)
                    {
				        HttpContext.Current.Session["token"] = token;
                        _strMessage(objLinq.commitInsert(txt_fname.Text.ToString(), txt_lname.Text.ToString(), txt_address.Text.ToString(), txt_city.Text.ToString(), ddl_province.SelectedItem.ToString(), ddl_country.SelectedItem.ToString(), txt_zip.Text.ToString(), txt_phone.Text.ToString(), txt_email.Text.ToString(), ddl_survey.SelectedItem.ToString(), txt_comment.Text.ToString(), payment_amt.Text.ToString(), rbl_type.SelectedItem.ToString(), txt_cardnum.Text.ToString(), int.Parse(txt_security.Text.ToString()), txt_holdername.Text.ToString(), ddl_expirationM.SelectedItem.ToString(), ddl_expirationY.SelectedItem.ToString(), token), "insert");
                        //insert everything with token

                        Response.Redirect( retMsg );
                    }
                    else
                    {
                        Response.Redirect("APIError.aspx?" + retMsg);
                    }
                }
                else
                {
                    Response.Redirect("APIError.aspx?ErrorCode=AmtMissing");
                }

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
        payment_amt.Text = String.Empty;
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
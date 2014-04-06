using System;
using System.Web;

public partial class expresscheckout : System.Web.UI.Page 
{
    donationClass amtDonation = new donationClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Session["payment_amt"] = "100";
        NVPAPICaller test = new NVPAPICaller();
        string retMsg = "";
        string token = "";
        //string amt = payment_amt.Text.ToString();
        
        if ( HttpContext.Current.Session["payment_amt"] != null)
        {

            string amt = HttpContext.Current.Session["payment_amt"].ToString();

            bool ret = test.ShortcutExpressCheckout(amt, ref token, ref retMsg);
            if (ret)
            {
				HttpContext.Current.Session["token"] = token;
                Response.Redirect( retMsg );
            }
            else
            {
                Response.Redirect("APIError.aspx?" + retMsg);
            }
        }
        else
        {
            Response.Redirect( "APIError.aspx?ErrorCode=AmtMissing" );
        }
    }
}
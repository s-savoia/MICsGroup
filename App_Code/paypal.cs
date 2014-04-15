using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for paypal
/// </summary>
public class paypal
{
    public paypal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string getAmount(string invoice_id, string amt)
    {
        decimal amount = Convert.ToDecimal(amt);
        string redirectUrl = "";
        redirectUrl += "https://www.paypal.com/xclick/business=pmand15@gmail.com";
        redirectUrl += "&item_name=" + invoice_id;
        redirectUrl += "&amount=" + amount;
        redirectUrl += "&currency=CAD";
        return redirectUrl;
    }
}
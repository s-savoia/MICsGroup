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

    public static string getAmount(string invoice_id, string _amt,string _return, string _cancel)
    {
        decimal amount = Convert.ToDecimal(_amt);
        string redirectUrl = "";
        redirectUrl += "https://www.sandbox.paypal.com/cgi-bin/webscr?";
        redirectUrl += "cmd=_xclick&business=pmand15-facilitator@gmail.com";
        redirectUrl += "&item_name=" + invoice_id;
        redirectUrl += "&amount=" + amount;
        redirectUrl += "&currency_code=CAD";
        redirectUrl +="&return=" + _return;
        redirectUrl +="&cancel_return="+_cancel;
        return redirectUrl;
    }
}
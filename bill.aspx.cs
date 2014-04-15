using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void subSubmit(object sender, EventArgs e)
    {
        string amt = txt_amount.Text;
        string invoice_id = txt_invoiceId.Text;
        string redirectUrl = paypal.getAmount(invoice_id, amt);
        Response.Redirect(redirectUrl);
    }
}
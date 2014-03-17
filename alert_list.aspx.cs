using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alert_list : System.Web.UI.Page
{
    alertLinkClass objLinkAlert = new alertLinkClass();


    protected void Page_Load(object sender, EventArgs e)
    {
        rpt_main.DataSource = objLinkAlert.getAlert();
        rpt_main.DataBind();
    }
}
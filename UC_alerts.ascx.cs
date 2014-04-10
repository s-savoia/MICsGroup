using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_alerts : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)

    {
        alertLinkClass objAlert = new alertLinkClass();

        rpt_main.DataSource = objAlert.getAlert();
        rpt_main.DataBind();
    }
}
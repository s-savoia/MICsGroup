using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class emergency_time : System.Web.UI.UserControl
{
    emergency objEmergency = new emergency();
    protected void Page_Load(object sender, EventArgs e)
    {
        rpt_detail.DataSource = objEmergency.getDetails();
        rpt_detail.DataBind();

    }

    protected void subTick(object sender, EventArgs e)
    {
        objEmergency.getDetail();
        rpt_detail.DataSource = objEmergency.getDetails();
        rpt_detail.DataBind();
    }
  
}
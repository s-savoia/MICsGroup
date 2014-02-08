using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_master : System.Web.UI.MasterPage
{
    protected void subClick(object sender, EventArgs e)
    {
        Response.Redirect("admin_login.aspx");
        //change an link to the home later
    }
}

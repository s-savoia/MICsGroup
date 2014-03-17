using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            pnl_appointment_create.Visible = true;
            pnl_appointment_view.Visible = false;            
        }
    }

    protected void subShowView(object sender, EventArgs e)
    {
        pnl_appointment_create.Visible = false;
        pnl_appointment_view.Visible = true;
    }

    protected void subShowCreate(object sender, EventArgs e)
    {
        pnl_appointment_create.Visible = true;
        pnl_appointment_view.Visible = false;
    }
}
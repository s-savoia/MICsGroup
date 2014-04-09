using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_volunteer : System.Web.UI.Page
{
    volunteerApplication objVolunteer = new volunteerApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void _subRebind()
    {
        rpt_volunteer.DataSource = objVolunteer.getApplications();
        rpt_volunteer.DataBind();
    }

    protected void subViewDelete(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "View":
                fmv_details.DataSource = objVolunteer.getApplicationByID(int.Parse(e.CommandArgument.ToString()));
                fmv_details.DataBind();
                break;
            case "Delete":
                objVolunteer.commitDelete(int.Parse(e.CommandArgument.ToString()));
                _subRebind();
                break;

        }
    }
}
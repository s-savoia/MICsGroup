using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    jobPostingsClass objJobPosting = new jobPostingsClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        _subRebind();
    }

    private void _subRebind()
    {        
        rpt_data.DataSource = objJobPosting.getJobPostings();
        rpt_data.DataBind();

    }
}
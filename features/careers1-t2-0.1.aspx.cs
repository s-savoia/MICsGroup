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

    public void subAdmin(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "ViewDetails":

                // X pass id of clicked button (command argument) to databound control inside panel


                // create a select statement based on this id (where clause)
                SqlDataSource Sds_popup = (SqlDataSource)this.FindControl("sds_popup");
                Sds_popup.SelectCommand = "SELECT * FROM [mic_job_postings] WHERE [id] =" + e.CommandArgument;

                // Assign this data source (sql data source) to the inner repeater (inside the panel)
                Repeater Rpt_popup = (Repeater)this.FindControl("rpt_data").FindControl("pnl_view_details").FindControl("rpt_popup");
                Rpt_popup.DataSource = Sds_popup;
                Rpt_popup.DataBind();
                 
                break;
        }
    }
}
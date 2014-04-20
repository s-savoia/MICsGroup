using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// = = = CODED BY: JAMES HONG = = =

public partial class jobPostings : System.Web.UI.Page
{
    // new instance
    jobPostingsClass objJobPosting = new jobPostingsClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        // call this function
        _subRebind();
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Humber MICs Group | Job Postings";        
    }

    // rebind data source to data bound control. show job postings panel. 
    private void _subRebind()
    {
        rpt_data.DataSource = objJobPosting.getJobPostings();
        rpt_data.DataBind();
        _PanelControl(pnl_all);        
    }

    // control subroutine for job postings repeater
    public void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "ViewDetails":
                // page title changes
                ltl_title.Text = "Job posting ID: " + e.CommandArgument.ToString();
                //call this function
                _showUpdate(e.CommandArgument.ToString());
                break;

        }
    }
        // display job details panel. bind data source (one job posting) to databound control
        private void _showUpdate(string id)
    {
        _PanelControl(pnl_viewDetails);
        rpt_popup.DataSource = objJobPosting.getJobPostingById(Int32.Parse(id)); 
        rpt_popup.DataBind();
    }

    // control which panel is visible
    private void _PanelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_viewDetails.Visible = false;
        pnl.Visible = true;
    }


}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    servicesClass objService = new servicesClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        _subRebind();
    }

    private void _subRebind()
    {
        dtv_bingham.DataSource = objService.getServicesBingham();
        dtv_bingham.DataBind();


        dtv_anson.DataSource = objService.getServicesAnson();
        dtv_anson.DataBind();

        dtv_lady_minto.DataSource = objService.getServicesLadyMinto();
        dtv_lady_minto.DataBind();


        //_PanelControl(pnl_all);

    }

    public void subAdmin(object sender, CommandEventArgs e)
    {
    //    switch (e.CommandName)
    //    {
    //        case "ViewDetails":
    //            ltl_title.Text = e.CommandArgument.ToString();
    //            _showUpdate(e.CommandArgument.ToString());
    //            break;

    //    }
    }

    //private void _showUpdate(string id)
    //{
    //    _PanelControl(pnl_viewDetails);
    //    rpt_popup.DataSource = objJobPosting.getJobPostingById(Int32.Parse(id));
    //    rpt_popup.DataBind();
    //}

    //private void _PanelControl(Panel pnl)
    //{
    //    pnl_all.Visible = false;
    //    pnl_viewDetails.Visible = false;
    //    pnl.Visible = true;
    //}

    public void subPaging(object sender, DetailsViewCommandEventArgs e)
    {

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_career_application : System.Web.UI.Page
{
    careerApplicationClass objCareer = new careerApplicationClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }
    private void _subRebind()
    {
        rpt_main.DataSource = objCareer.getCareer();
        rpt_main.DataBind();
    }

    private void _PanelControl(Panel pnl)
    {
        pnl_edit.Visible = false;
        pnl.Visible = true;
    }

    private void showEdit(int id)
    {
        _PanelControl(pnl_edit);
        careerApplicationClass objCareerEach = new careerApplicationClass();
        rpt_edit.DataSource = objCareerEach.getItemByID(Int32.Parse("career_id"));
        rpt_edit.DataBind();
    }

    protected void subUpdate(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":

                break;
            case "Cancel":
                break;
        }
    }
}
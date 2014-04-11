using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_emergency : System.Web.UI.Page
{
    emergency objEmergency = new emergency();
    protected void Page_Load(object sender, EventArgs e)
    {
        _subRebind();
    }
    protected void subUp(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    private void _showUpdate(int id)
    {
        emergency objEmergency1 = new emergency();
        pnl_update.Visible = true;
        rpt_update.DataSource = objEmergency1.getDetails(id);
        rpt_update.DataBind();
    }

    protected void subUpdate(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtPatient = (TextBox)e.Item.FindControl("txt_patientsU");
                Label lblLocation = (Label)e.Item.FindControl("lbl_locationU");
                HiddenField hdfId = (HiddenField)e.Item.FindControl("hdf_id");

                int id = int.Parse(hdfId.Value.ToString());
                int patient = int.Parse(txtPatient.Text.ToString());
               
                objEmergency.commitUpdate(id, lblLocation.Text, patient);
                _subRebind();

                break;
            case "Cancel":
                _subRebind();
                break;


        }
    }

    private void _subRebind()
    {
        rpt_emergency.DataSource = objEmergency.getDetails();
        rpt_emergency.DataBind();
        pnl_update.Visible = false;
    }
}
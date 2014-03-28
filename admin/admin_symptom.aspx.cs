using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_symptom : System.Web.UI.Page
{
    symptomsClass objSymptoms = new symptomsClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        _pnlControl(pnl_controlPanel);
        _subRebind();
    }

    protected void sub_admin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName.ToString())
        {
            // for the main management panels (symptoms and advice)
            case "manageSymptoms":
                _pnlControl(pnl_viewEditSymptom);

                break;

            case "manageAdvice":
                _pnlControl(pnl_viewEditAdvice);
                break;

            //for three navigational buttons (add a symptom, view/edit symptoms, switch to advice
            case "viewInsert":
                _pnlControl(pnl_insertSymptom);
                break;

            case "viewSymptoms":
                _pnlControl(pnl_viewEditSymptom);
                break;
            
            // for working with the data (insert, update, delete)
            case "insert":

                break;

            case "edit":

                break;

            case "update":

                break;

            case "delete":

                break;
        }

    }

    private void _pnlControl(Panel pnl)
    {
        pnl_symptomControl.Visible = false;
        pnl_insertSymptom.Visible = false;
        pnl_viewEditSymptom.Visible = false;
        
        //pnl_adviceControl.Visible = false;
        //pnl_insertAdvice.Visible = false;
        pnl_viewEditAdvice.Visible = false;

        


        if (pnl == pnl_viewEditSymptom) // pnl == pnl_insertSymptom || 
        {
            pnl_symptomControl.Visible = true;
        }

        pnl.Visible = true;
    }

    private void _subRebind()
    {
        GridView grdSymptomsTable = (GridView)this.udp_main.FindControl("pnl_viewEditSymptom").FindControl("grd_symptomsTable");
        grdSymptomsTable.DataSource = objSymptoms.getSymptoms();
        grdSymptomsTable.DataBind();
    }

}
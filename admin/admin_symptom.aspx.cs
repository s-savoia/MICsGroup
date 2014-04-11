using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_symptom : System.Web.UI.Page
{
    symptomsClass objSymptoms = new symptomsClass();

    adviceClass objAdvice = new adviceClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _pnlControl(pnl_controlPanel);
            _subRebind("pnl_viewEditSymptom");
            //lbl_message.Visible = false;
        }
    }


    protected void sub_adminOther(object sender, CommandEventArgs e)
    {
        switch (e.CommandName.ToString())
        {
            // = = = SYMPTOMS = = = 
            case "manageSymptoms":
                _pnlControl(pnl_viewEditSymptom);
                _subRebind("pnl_viewEditSymptom");
                break;

            case "manageAdvice":
                _pnlControl(pnl_viewEditAdvice);
                _subRebind("pnl_viewEditAdvice");
                break;

            // insert a symptom
            case "insertSymp":
                lbl_message.Text = "Adding new symptom";
                TextBox txtSymptomI = (TextBox)this.FindControl("udp_main").FindControl("pnl_insertSymptom").FindControl("txt_symptomI");
                // TextBox txtSymptomI = new TextBox(); //(TextBox)this.FindControl("udp_main").FindControl("pnl_insertSymptom").FindControl("txt_symptomI");
                // txtSymptomI.Text = "test";                
                _strMessage("symptom", objSymptoms.commitInsertSymptom(txtSymptomI.Text), "Add");
                _pnlControl(pnl_viewEditSymptom);
                _subRebind("pnl_viewEditSymptom");
                break;

            //for three navigational buttons (add a symptom, view/edit symptoms, switch to advice
            case "viewInsertSymp":
                _pnlControl(pnl_insertSymptom);
                break;

            case "viewSymptoms":
                _pnlControl(pnl_viewEditSymptom);
                break;

            case "cancelSymp":
                _pnlControl(pnl_viewEditSymptom);
                _subRebind("pnl_viewEditSymptom");
                break;

            // = = = ADVICE = = = 
            case "viewAdvice":
                _subRebind("pnl_viewEditAdvice");
                break;

            case "viewInsertAdv":
                _pnlControl(pnl_insertAdvice);
                break;

            case "cancelAdv":
                _pnlControl(pnl_viewEditAdvice);
                _subRebind("pnl_viewEditAdvice");
                break;
        }
    }

    protected void sub_admin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName.ToString())
        {
                                   
            case "editSymp":

                break;

            case "updateSymp":

                break;

            case "deleteSymp":
                int _id = Int16.Parse(e.CommandArgument.ToString());
                _strMessage("symptom", objSymptoms.commitDeleteSymptom(_id), "Delete");
                _subRebind("pnl_viewEditSymptom");
                break;

            case "deleteAdv":
                int _level = Int16.Parse(e.CommandArgument.ToString());
                _strMessage("symptom", objAdvice.commitDeleteAdvice(_level), "Delete");
                _subRebind("pnl_viewEditAdvice");
                break;
            
        }
        
    }

    private void _strMessage(string content, bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = str + " " + content + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + content;
        }
    }

    private void _pnlControl(Panel pnl)
    {
        pnl_symptomControl.Visible = false;
        pnl_insertSymptom.Visible = false;
        pnl_viewEditSymptom.Visible = false;

        pnl_adviceControl.Visible = false;
        pnl_insertAdvice.Visible = false;
        pnl_viewEditAdvice.Visible = false;

        string pnlName = pnl.ID;

        switch (pnlName)
        {
            case ("pnl_viewEditSymptom"):
                pnl_symptomControl.Visible = true;
                break;
            case ("pnl_viewEditAdvice"):
                pnl_adviceControl.Visible = true;
                break;
        }

        pnl.Visible = true;
        lbl_message.Visible = true;
    }

    private void _subRebind(string panelName)
    {
        switch (panelName)
        {
            case "pnl_viewEditSymptom":
                GridView grdSymptomsTable = (GridView)this.udp_main.FindControl("pnl_viewEditSymptom").FindControl("grd_symptomsTable");
                grdSymptomsTable.DataSource = objSymptoms.getSymptoms();
                grdSymptomsTable.DataBind();
                break;
            case "pnl_viewEditAdvice":
                GridView grdAdviceTable = (GridView)this.udp_main.FindControl("pnl_viewEditAdvice").FindControl("grd_adviceTable");
                grdAdviceTable.DataSource = objAdvice.getAdvice();
                grdAdviceTable.DataBind();
                break;
        }
    }
  
}
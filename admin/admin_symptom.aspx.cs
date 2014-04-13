using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// = = = CODED BY: JAMES HONG = = =

public partial class admin_symptom : System.Web.UI.Page
{
    // create an instance of the symptomsClass and adviceClass classes
    symptomsClass objSymptoms = new symptomsClass();

    adviceClass objAdvice = new adviceClass();

    // when the page finishes loading completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_adminMasterTitle = "Humber MICs Group | CMS - Symptom Checker";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // when the page loads for the first time, display the panel to view/edit symptoms 
        if (!Page.IsPostBack)
        {
            _pnlControl(pnl_controlPanel);
            _subRebind("pnl_viewEditSymptom");
            lbl_message.Visible = false;
        }
    }

    // SUBADMIN OTHER - a control subroutine for manging events when changing content, adding a new symptom/advice, viewing symptoms/advice, or cancelling an add a symptom/advice process
    protected void sub_adminOther(object sender, CommandEventArgs e)
    {
        switch (e.CommandName.ToString())
        {
            // = = = SYMPTOMS = = = 

            // when the 'manage symptoms' button is clicked, display the view/edit symptoms panel
            case "manageSymptoms":               
                _pnlControl(pnl_viewEditSymptom);
                _subRebind("pnl_viewEditSymptom");
                lbl_message.Text = "Mode: view/edit symptoms";
                grd_symptomsTable.Columns[0].Visible = true;
                grd_symptomsTable.Columns[1].Visible = false;
                break;
            // when the 'manage advice' button is clicked, display the view/edit advice panel
            case "manageAdvice":
                lbl_message.Text = "Mode: view/edit advice";
                _pnlControl(pnl_viewEditAdvice);
                _subRebind("pnl_viewEditAdvice");
                grd_adviceTable.Columns[0].Visible = true;
                grd_adviceTable.Columns[1].Visible = false;
                break;

            // when the 'add' button is clicked to add a symptom, try to commit an insert statement against the mic_symptoms table in the database and display the result of the insert
            case "insertSymp":                
                TextBox txtSymptomI = (TextBox)this.udp_main.FindControl("pnl_insertSymptom").FindControl("txt_symptomI");                             
                _strMessage("symptom", objSymptoms.commitInsertSymptom(txtSymptomI.Text), "Add");
                _pnlControl(pnl_viewEditSymptom);
                _subRebind("pnl_viewEditSymptom");
                break;

            // depending on which button was clicked, display the correct panel (add a symptom, view/edit symptoms, switch to advice content system)
            case "viewInsertSymp":
                lbl_message.Text = "Mode: add a new symptom";
                _pnlControl(pnl_insertSymptom);
                break;

            // display symptoms data in view/edit mode
            case "viewSymptoms":
                lbl_message.Text = "Mode: view/edit symptoms";
                grd_symptomsTable.EditIndex = -1;
                grd_symptomsTable.Columns[0].Visible = true;
                grd_symptomsTable.Columns[1].Visible = false;
                _pnlControl(pnl_viewEditSymptom);
                break;

            case "cancelSymp":
                lbl_message.Text = "Mode: view/edit symptoms";
                _pnlControl(pnl_viewEditSymptom);
                _subRebind("pnl_viewEditSymptom");
                break;

            // = = = ADVICE = = = 

            // when the 'add' button is clicked to add advice, try to commit an insert statement against the mic_advice table in the database and display the result of the insert
            case "insertAdv":                
                TextBox txtAdviceI = (TextBox)this.udp_main.FindControl("pnl_insertAdvice").FindControl("txt_adviceI");
                _strMessage("advice", objAdvice.commitInsertAdvice(txtAdviceI.Text), "Add");
                _pnlControl(pnl_viewEditAdvice);
                _subRebind("pnl_viewEditAdvice");
                break;

            // display advice data in view/edit mode
            case "viewAdvice":
                lbl_message.Text = "Mode: view/edit advice";
                grd_adviceTable.EditIndex = -1;
                grd_adviceTable.Columns[0].Visible = true;
                grd_adviceTable.Columns[1].Visible = false;
                _pnlControl(pnl_viewEditAdvice);
                _subRebind("pnl_viewEditAdvice");
                break;

            case "viewInsertAdv":
                lbl_message.Text = "Mode: add new advice";
                _pnlControl(pnl_insertAdvice);
                break;

            case "cancelAdv":
                lbl_message.Text = "Mode: view/edit advice";
                _pnlControl(pnl_viewEditAdvice);
                _subRebind("pnl_viewEditAdvice");
                break;
        }
    }
    // SUBADMIN - control subroutine while editing and updating content
    protected void sub_admin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName.ToString())
        {
             // SYMPTOMS                      
            case "editSymp":
                lbl_message.Text = "Mode: edit, symptom ID: " + e.CommandArgument.ToString() + "<br /><br />To stop editing, please click on the 'view symptoms' button";
                grd_symptomsTable.EditIndex = Int32.Parse(e.CommandArgument.ToString()) - 1;
                grd_symptomsTable.Columns[0].Visible = false;
                grd_symptomsTable.Columns[1].Visible = true;
                _subRebind("pnl_viewEditSymptom");               
                break;
                // when a 'delete' button is clicked, try to commit a delete statement against the mic_symptoms table in the database, display the result of the delete, and display the view/edit symptoms panel
            case "deleteSymp":
                int _id = Int16.Parse(e.CommandArgument.ToString());
                _strMessage("symptom", objSymptoms.commitDeleteSymptom(_id), "Delete");
                _subRebind("pnl_viewEditSymptom");
                break;

                // ADVICE

            case "editAdv":
                lbl_message.Text = "Mode: edit, advice level: " + e.CommandArgument.ToString() + "<br /><br />To stop editing, please click on the 'view advice' button";
                grd_adviceTable.EditIndex = Int32.Parse(e.CommandArgument.ToString()) - 1;
                grd_adviceTable.Columns[0].Visible = false;
                grd_adviceTable.Columns[1].Visible = true;                
                _subRebind("pnl_viewEditAdvice");
                break;

            // when a 'delete' button is clicked, try to commit a delete statement against the mic_advice table in the database, display the result of the delete, and display the view/edit advice panel
            case "deleteAdv":
                int _level = Int16.Parse(e.CommandArgument.ToString());
                _strMessage("symptom", objAdvice.commitDeleteAdvice(_level), "Delete");
                _subRebind("pnl_viewEditAdvice");
                break;
            
        }
        
    }
    // display the result of an action depending on the content type and action (content type: symptoms, advice. actions: add, update, delete)
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

    // display one panel while hiding the other panels
    private void _pnlControl(Panel pnl)
    {
        pnl_symptomControl.Visible = false;
        pnl_insertSymptom.Visible = false;
        pnl_viewEditSymptom.Visible = false;

        pnl_adviceControl.Visible = false;
        pnl_insertAdvice.Visible = false;
        pnl_viewEditAdvice.Visible = false;

        string pnlName = pnl.ID;
        // depending on the content type being managed (symptoms or advice), display the correct control panel (add, view/edit content, switch to other content type buttons)
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
    // depneding on the panel name, get the data source and bind it to the content type's GridView control
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
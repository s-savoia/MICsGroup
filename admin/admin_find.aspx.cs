using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// = = = Coded by: JAMES HONG = = =

public partial class admin_Default : System.Web.UI.Page
{
    // a new object of the linq class is created
    servicesClass objService = new servicesClass();

    // when the page finishes loading completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_adminMasterTitle = "Humber MICs Group | CMS - Find a Service";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // if the page is being requested for the first time, call the subRebind() and PanelControl() functions
        if (!Page.IsPostBack)
        {
            _PanelControl(pnl_edit);
            ddl_locationsC.Visible = true;
            ddl_mode.SelectedIndex = 2;

            //set the locations drop-down list on the view/edit services page
            ddl_locationsC.DataSourceID = "sds_locations";
            ddl_locationsC.DataTextField = "name";
            ddl_locationsC.DataValueField = "name";
            ddl_locationsC.DataBind();

            // set the locations drop-down list on the add a service page
            ddl_locationsI.DataSourceID = "sds_locations";
            ddl_locationsI.DataTextField = "name";
            ddl_locationsI.DataValueField = "name";
            ddl_locationsI.DataBind();
            
            // page loads with managing services for Bingham 
            setMode("pnl_edit");
            showServicesByHospital("Bingham Memorial");
        }
    }
    // control subroutine for services DataList
    protected void subAdmin(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            // if the 'edit' button was clicked, open the EditItemTemplate for a specific service
            case "EditC":
                dlt_main.EditItemIndex = e.Item.ItemIndex;
                lbl_message.Text = ddl_locationsC.SelectedValue;                
                break;
            // if the 'update' button was clicked, find the form fields to update a service
            case "UpdateC":
                Label lblID = (Label)e.Item.FindControl("lbl_id2E");
                TextBox txtService = (TextBox)e.Item.FindControl("txt_serviceE");
                DropDownList ddlLocation = (DropDownList)e.Item.FindControl("ddl_locationsE");
                DropDownList ddlUnique = (DropDownList)e.Item.FindControl("ddl_uniqueE");
                TextBox txtDetails = (TextBox)e.Item.FindControl("txt_detailsE");
                int jobID = int.Parse(lblID.Text.ToString());
                
                // depending on which hospital's content is being managed, commit an update to a hospital's table in the database and exit edit mode
                switch (ddl_locationsC.SelectedValue)
                {
                    case "Bingham Memorial":
                        _strMessage(objService.commitUpdateBingham(jobID, txtService.Text, ddlUnique.SelectedValue, ddlLocation.SelectedValue, txtDetails.Text), "update");
                        dlt_main.EditItemIndex = -1; 
                        break;
                    case "Anson General":
                        _strMessage(objService.commitUpdateAnson(jobID, txtService.Text, ddlUnique.SelectedValue, ddlLocation.SelectedValue, txtDetails.Text), "update");
                        break;
                    case "Lady Minto":
                        _strMessage(objService.commitUpdateLadyMinto(jobID, txtService.Text, ddlUnique.SelectedValue, ddlLocation.SelectedValue, txtDetails.Text), "update");
                        break;
                }
                               
                break;
                // if the 'delete' button was clicked, find the ID of the service
            case "DeleteC":
                Label ID = (Label)e.Item.FindControl("lbl_id2E");
                int _id = int.Parse(ID.Text.ToString());

                // depending on which hospital's content is being managed, commit an delete to a hospital's table in the database, exit edit mode and display services for the current hospital
                switch (ddl_locationsC.SelectedValue.ToString())
                {
                    case "Bingham Memorial":
                        _strMessage(objService.commitDeleteBingham(_id), "delete");
                        break;
                    case "Anson General":
                        _strMessage(objService.commitDeleteAnson(_id), "delete");
                        break;
                    case "Lady Minto":
                        _strMessage(objService.commitDeleteLadyMinto(_id), "delete");
                        break;
                }               
                setMode("pnl_edit");
                showServicesByHospital(ddl_locationsC.SelectedValue);
                break;
            // if a 'cancel' button was clicked, exit edit mode and display services for the current hospital 
            case "CancelC":
                dlt_main.EditItemIndex = -1;
                setMode("pnl_edit");
                showServicesByHospital(ddl_locationsC.SelectedValue);
                break;
        }
    }
    // display the result of an action (add/update/delete a service)
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Service " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " service";
        }
    }
    // event called when the 'add' button is clicked whihle adding a service
    protected void subInsert(object sender, CommandEventArgs e)
    {        
        // if a 'cancel' button was clicked, display the view/edit services panel
        if (e.CommandName == "CancelC")
        {
            setMode("pnl_edit");
        }
        else
        {
            // else, depending on the chosen hospital, commit an insert to the current hospital's table in the database and display a message for the result
            switch (ddl_locationsI.SelectedValue.ToString())
            {
                case "Bingham Memorial":
                    _strMessage(objService.commitInsertBingham(txt_serviceI.Text, ddl_uniqueI.SelectedValue, ddl_locationsC.SelectedValue, txt_detailsI.Text), "insert");
                    break;
                case "Anson General":
                    _strMessage(objService.commitInsertAnson(txt_serviceI.Text, ddl_uniqueI.SelectedValue, ddl_locationsC.SelectedValue, txt_detailsI.Text), "insert");
                    break;
                case "Lady Minto":
                    _strMessage(objService.commitInsertLadyMinto(txt_serviceI.Text, ddl_uniqueI.SelectedValue, ddl_locationsC.SelectedValue, txt_detailsI.Text), "insert");
                    break;
            }
        }
        // display services for the chosen hospital, clear fields in the 'add a service' panel, and display the view/edit services panel
        string chosenHospital = ddl_locationsI.SelectedValue.ToString();
        showServicesByHospital(chosenHospital);
        _subClearFields();
        _PanelControl(pnl_edit);

    }
    // clear the fields in the 'add a service' panel, unsert the mode and the hospital location (whatever was chosen becomes unselected)
    private void _subClearFields()
    {
        txt_serviceI.Text = string.Empty;
        ddl_locationsI.SelectedIndex = 0;
        ddl_uniqueI.SelectedIndex = 0;
        txt_detailsI.Text = string.Empty;
        ddl_mode.SelectedIndex = 0;
        ddl_locationsC.SelectedIndex = 0;        
    }
    // depending on which mode was chosen (add/edit a service, set that mode)
    protected void subDDLMode(object sender, EventArgs e)
    {
        string chosenMode = ddl_mode.SelectedValue.ToString();
        if (chosenMode != "not_chosen")
        {
            setMode(chosenMode);
        }

    }

    // go to showServicesByHospital function by determining which hospital was chosen in a drop down list
    protected void subDDLlocations(object sender, EventArgs e)
    {
        string pickedHospital = ddl_locationsC.SelectedValue.ToString();
        showServicesByHospital(pickedHospital);
    }
    // set the mode (add or view/edit services)
    private void setMode(string selectedMode)
    {
        // display the right panel (insert or edit)
        if (selectedMode == "pnl_insert")
        {
            _PanelControl(pnl_insert);
            lbl_message.Text = "Mode: Add a service";
        }
        else if (selectedMode == "pnl_edit")
        {
            _PanelControl(pnl_edit);
            lbl_message.Text = "Mode: View/Edit service(s)";
        }

    }
    // display one panel while hiding the other panels
    private void _PanelControl(Panel pnl)
    {
        pnl_insert.Visible = false;
        pnl_edit.Visible = false;
        Panel PnlHospitalDDL = (Panel)pnl_ddls.FindControl("pnl_hospitalDDL");

        if (pnl == pnl_insert)
        {
            pnl_edit.Visible = false;
            PnlHospitalDDL.Visible = false;
        }
        else if (pnl == pnl_edit)
        {
            PnlHospitalDDL.Visible = true;
        }

        pnl.Visible = true;
    }
    // depending on the chosen hospital, display the services for a chosen hospital by getting the data source for a hospital and binding it to that hospital's DataList control
    private void showServicesByHospital(string selectedHospital)
    {
        switch (selectedHospital)
        {
            case "Bingham Memorial":
                lbl_hospitalName.Text = "Bingham Memorial Hospital";
                dlt_main.DataSource = objService.getServicesBingham();
                dlt_main.DataBind();
                break;

            case "Anson General":
                lbl_hospitalName.Text = "Anson General Hospital";
                dlt_main.DataSource = objService.getServicesAnson();
                dlt_main.DataBind();
                break;

            case "Lady Minto":
                lbl_hospitalName.Text = "Lady Minto Hospital";
                dlt_main.DataSource = objService.getServicesLadyMinto();
                dlt_main.DataBind();
                break;

        }
    }

}
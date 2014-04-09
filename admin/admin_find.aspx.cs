using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    // a new object of the linq class is created
    servicesClass objService = new servicesClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        // if the page is being requested for the first time, send the insert panel to the panel control and call the subRebind function
        if (!Page.IsPostBack)
        {
            _PanelControl(pnl_edit);
            ddl_locationsC.Visible = true;
            ddl_mode.SelectedIndex = 2;

            //choose a location on the view/edit page
            ddl_locationsC.DataSourceID = "sds_locations";
            ddl_locationsC.DataTextField = "name";
            ddl_locationsC.DataValueField = "name";
            ddl_locationsC.DataBind();

            // choose a location in on the add a service page
            ddl_locationsI.DataSourceID = "sds_locations";
            ddl_locationsI.DataTextField = "name";
            ddl_locationsI.DataValueField = "name";
            ddl_locationsI.DataBind();
            
            //default is Bingham services
            setMode("pnl_edit");
            showServicesByHospital("Bingham Memorial");
        }
    }

    protected void subAdmin(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "EditC":
                dlt_main.EditItemIndex = e.Item.ItemIndex;
                lbl_message.Text = ddl_locationsC.SelectedValue;
                //DropDownList ddlLocationSet = (DropDownList)e.Item.FindControl("ddl_locationsE");
                //ddlLocationSet.SelectedValue = ddl_locationsC.SelectedValue;
                break;
            case "UpdateC":
                Label lblID = (Label)e.Item.FindControl("lbl_id2E");
                TextBox txtService = (TextBox)e.Item.FindControl("txt_serviceE");
                DropDownList ddlLocation = (DropDownList)e.Item.FindControl("ddl_locationsE");
                DropDownList ddlUnique = (DropDownList)e.Item.FindControl("ddl_uniqueE");
                TextBox txtDetails = (TextBox)e.Item.FindControl("txt_detailsE");
                int jobID = int.Parse(lblID.Text.ToString());
                

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
            case "DeleteC":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                int _id = int.Parse(hdfID.Value.ToString());

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
            case "CancelC":
                dlt_main.EditItemIndex = -1;
                setMode("pnl_edit");
                showServicesByHospital(ddl_locationsC.SelectedValue);
                break;
        }
    }

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

    protected void subInsert(object sender, CommandEventArgs e)
    {        

        if (e.CommandName == "CancelC")
        {
            setMode("pnl_edit");
        }
        else
        {
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

        string chosenHospital = ddl_locationsI.SelectedValue.ToString();
        showServicesByHospital(chosenHospital);
        _subClearFields();
        _PanelControl(pnl_edit);

    }

    private void _subClearFields()
    {
        txt_serviceI.Text = string.Empty;
        ddl_locationsI.SelectedIndex = 0;
        ddl_uniqueI.SelectedIndex = 0;
        txt_detailsI.Text = string.Empty;
        ddl_mode.SelectedIndex = 0;
        ddl_locationsC.SelectedIndex = 0;
        //lbl_message.Text = string.Empty;

    }

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
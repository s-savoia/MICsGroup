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

            ddl_locationsC.DataSourceID = "sds_locations";
            ddl_locationsC.DataTextField = "name";
            ddl_locationsC.DataValueField = "name";
            ddl_locationsC.DataBind();

            ddl_locationsI.DataSourceID = "sds_locations";
            ddl_locationsI.DataTextField = "name";
            ddl_locationsI.DataValueField = "name";
            ddl_locationsI.DataBind();

            showServicesByHospital("Bingham Memorial");
        }
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Product " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " product";
        }
    }

    protected void subInsert(object sender, EventArgs e)
    {
        lbl_message.Text = "Processing - Insert";

        switch (ddl_locationsI.SelectedValue.ToString())
        {
            case "Bingham Memorial":
                _strMessage(objService.commitInsertBingham(txt_serviceI.Text, ddl_locationsI.SelectedValue, ddl_uniqueI.SelectedValue, txt_detailsI.Text), "insert");                
                break;
            case "Anson General":
                _strMessage(objService.commitInsertAnson(txt_serviceI.Text, ddl_locationsI.SelectedValue, ddl_uniqueI.SelectedValue, txt_detailsI.Text), "insert");                
                break;
            case "Lady Minto":
                _strMessage(objService.commitInsertLadyMinto(txt_serviceI.Text, ddl_locationsI.SelectedValue, ddl_uniqueI.SelectedValue, txt_detailsI.Text), "insert");                
                break;
        }
        //lbl_message.Text = txt_serviceI.Text + ", " + ddl_locationsI.SelectedValue + ", " + ddl_uniqueI.SelectedValue + ", " + txt_detailsI.Text;
                        
        string chosenHospital = ddl_locationsI.SelectedValue.ToString();
        showServicesByHospital(chosenHospital);
        _subClearFields();
        _PanelControl(pnl_edit);
    }


    protected void subCancel(object sender, DataListCommandEventArgs e)
    {
        dlt_main.EditItemIndex = -1;
        _PanelControl(pnl_edit);
        _subClearFields();
    }


    protected void subCommitUpdate(object sender, DataListCommandEventArgs e)
    {

        //    HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
        //    TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
        //    TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
        //    TextBox txtPrice = (TextBox)e.Item.FindControl("txt_priceU");
        //    Label lblPriceCheck = (Label)e.Item.FindControl("lbl_priceCheckE");
        //    int proID = int.Parse(hdfID.Value.ToString());

        //    if (Double.Parse(txtPrice.Text.ToString()) < 0)
        //    {
        //        lblPriceCheck.Text = "A price that is greater than zero must be entered.";
        //    }

        //    else
        //    {
        //        _strMessage(objLinq.commitUpdate(proID, txtName.Text, txtDesc.Text, decimal.Parse(txtPrice.Text.ToString())), "update");
        //        dlt_main.EditItemIndex = -1;
        //        _PanelControl(pnl_insert);
        //        _subRebind();
        //    }
    }


    protected void subCommitDelete(object sender, DataListCommandEventArgs e)
    {
        //    int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
        //    _strMessage(objLinq.commitDelete(_id), "delete");
        //    dlt_main.EditItemIndex = -1;
        //    _PanelControl(pnl_insert);
        //    _subRebind();
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


    private void _subClearFields()
    {
        txt_serviceI.Text = string.Empty;
        ddl_locationsI.SelectedIndex = 0;
        ddl_uniqueI.SelectedIndex = 0;
        txt_detailsI.Text = string.Empty;
        ddl_mode.SelectedIndex = 0;
        ddl_locationsC.SelectedIndex = 0;
       
    }

    protected void subDDLMode(object sender, EventArgs e)
    {
        string chosenMode = ddl_mode.SelectedValue.ToString();
        setMode(chosenMode);
    }

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
        }
        else if (selectedMode == "pnl_edit")
        {           
            _PanelControl(pnl_edit);            
        }
                
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
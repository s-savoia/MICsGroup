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
            _subRebind();
        }
    }

    // this is a message function that has two parameters (a boolean and a string). The boolean represents whether the action (insert/update/delete)
    // was successful or not, and the string represents the type of action. Depending on the value of the boolean (flag), the text of a label changes
    // and displays if the action was successful or not.
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

    // This fuction commits an insert using linq. First, the strMessage function is called with two arguments (a boolean and a string). The boolean is the commitInsert function of the linq class, and the string is the word 'insert'. In the call to the commitInsert function of the linq class, there are three arguments (the text values of the three textboxes in the insert panel, which are name, description, and price). The textbox for the price is converted from a decimal to a string. Then the subRebind function is called.
    protected void subInsert(object sender, EventArgs e)
    {
        lbl_message.Text = "Processing - Insert";
            // _strMessage(objService.commitInsert(txt_nameI.Text, txt_descI.Text, decimal.Parse(txt_priceI.Text.ToString())), "insert");
            _subRebind();
        
    }


    //This is the cancel function. The edit item index of the datalist is set to -1, which switches the template of the edit template back to the item template. The inset panel is sent to the panel control and the subRebind function is called.
    protected void subCancel(object sender, DataListCommandEventArgs e)
    {
        dlt_main.EditItemIndex = -1;
        _PanelControl(pnl_edit);
        _subRebind();
    }

    // This is a function to commit an update. A hidden field, and three textboxes are found and cast. A variable for an integer (proID) converts the value of the casted hidden value from a string to an integer. Then the strMessage function is called with two arguments (a boolean and a string). The boolean is the commitUpdate function of the linq class, and the string is the word 'update'. In the call to the commitUpdate function of the linq class, there are three arguments (the text values of the three textboxes in the edit panel, which are name, description, and price). The textbox for the price is converted from a decimal to a string.  The edit item index of the datalist is set to -1, which switches the template of the edit template back to the item template. The inset panel is sent to the panel control and the subRebind function is called.
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

    // This is a function to commit a delete. A variable for an integer (proID) converts the value of the casted hidden value from a string to an integer. Then the strMessage function is called with two arguments (a boolean and a string). The boolean is the commitDelete function of the linq class, and the string is the word 'delete'. In the call to the commitDelete function of the linq class, there is one argument (the variable for the product's id). The edit item index of the datalist is set to -1, which switches the template of the edit template back to the item template. The inset panel is sent to the panel control and the subRebind function is called.
    protected void subCommitDelete(object sender, DataListCommandEventArgs e)
    {
    //    int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
    //    _strMessage(objLinq.commitDelete(_id), "delete");
    //    dlt_main.EditItemIndex = -1;
    //    _PanelControl(pnl_insert);
    //    _subRebind();
    }

    // This is the panel control function which sets which panel to display. It receives a panel as a parameter. This function sets the insert and edit panels to false, and if the passed argument is the insert panel, the edit panel is shown.The passed panel is displayed.
    private void _PanelControl(Panel pnl)
    {
        pnl_insert.Visible = false;
        pnl_edit.Visible = false;
        if (pnl == pnl_insert)
        {
            pnl_edit.Visible = false;
        }
        pnl.Visible = true;
    }

    // This is the subRebind function. It clears the textboxes in the insert panel, sets the datasource of the datalist to the getProducts function of the linq class, and then binds this data source to the dataList.
    private void _subRebind()
    {
        txt_serviceI.Text = string.Empty;
        ddl_locationsI.SelectedIndex = 0;
        ddl_uniqueI.SelectedIndex = 0;
        dlt_main.DataSource = objService.getServicesBingham();
        dlt_main.DataBind();
    }

    protected void subChangeMode(object sender, EventArgs e)
    {
        string chosenMode = ddl_mode.SelectedValue.ToString();
        if (chosenMode == "pnl_insert")
        {
            Panel pnlMode = pnl_insert;
            _PanelControl(pnlMode);
        }
        else
        {
            Panel pnlMode = pnl_edit;
            _PanelControl(pnlMode);
        }

        
    }

}
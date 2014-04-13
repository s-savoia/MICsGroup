using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    // when the page finishes loading completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_adminMasterTitle = "Humber MICs Group | CMS - Locations";
    }

    locationsClass objLinq = new locationsClass();

    // Resets the values of the insert input fields and updates the database fields.
    private void _subRebind()
    {
        lv_all.DataSource = objLinq.getLocations();
        lv_all.DataBind();
    }


    // Excecutes and then checks if the insert/update/delete was sucessful, and sends a response to the user.
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "Hospital location " + str + " was successful";
        else
            lbl_message.Text = "Sorry, unable to " + str + " the hospital location";
    }

    // This function is triggered when the user clicks anything in the ListView (Update, Delete, Cancel)
    protected void subUpDel(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update_This":
                TextBox txtName = (TextBox)e.Item.FindControl("txt_name");
                TextBox txtImage = (TextBox)e.Item.FindControl("txt_image");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_desc");
                TextBox txtPhone = (TextBox)e.Item.FindControl("txt_phone");
                decimal doubLat = decimal.Parse(((TextBox)e.Item.FindControl("txt_lat")).Text.ToString());
                decimal doubLng = decimal.Parse(((TextBox)e.Item.FindControl("txt_lng")).Text.ToString());
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int hospID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(hospID, txtName.Text, txtImage.Text, txtDesc.Text, doubLat, doubLng, txtPhone.Text), "update");
                _subRebind();
                break;
        }
    }

}
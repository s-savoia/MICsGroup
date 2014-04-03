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

    contactClass objLinq = new contactClass();

    // Excecutes and then checks if the insert/update/delete was sucessful, and sends a response to the user.
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "Message deleted.";
        else
            lbl_message.Text = "Error. Message not deleted";
    }

    // Resets the values of the insert input fields and updates the database fields.
    private void _subRebind()
    {
        lv_contact.DataSource = objLinq.getMessages();
        lv_contact.DataBind();
    }



    // This function is triggered when the user clicks anything in the ListView (Update, Delete, Cancel)
    protected void subUpDel(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Delete_This":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel_This":
                _subRebind();
                break;
        }
    }


    protected void lv_contact_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dp_contact.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        _subRebind();
    }

    //this function happens when a button in the datapager is pressed
    protected void subPager(object sender, DataPagerCommandEventArgs e)
    {
        e.NewMaximumRows = e.Item.Pager.MaximumRows;
        
        //switch statement that takes the button pressed by the user as the parameter
        switch (e.CommandName)
        {
            case "Next":
                if (e.Item.Pager.StartRowIndex + 3 < e.TotalRowCount)
                {
                    e.NewStartRowIndex = e.Item.Pager.StartRowIndex + 3;
                    //_subRebind();
                }

                break;
            case "Prev":
                if (e.Item.Pager.StartRowIndex - 3 >= 0)
                {
                    e.NewStartRowIndex = e.Item.Pager.StartRowIndex - 3;
                    //_subRebind();
                }
                break;
        }
    }
}
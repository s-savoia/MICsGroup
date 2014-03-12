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
            Response.Write("Message deleted.");
        else
            Response.Write("Error. Message not deleted");
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

    //this function happens when a button in the datapager is pressed
    protected void subPager(object sender, DataPagerCommandEventArgs e)
    {
        e.NewMaximumRows = e.Item.Pager.MaximumRows;

        test.Text += "<br/><br/> command: " + e.CommandName.ToString();
        test.Text += "<br/>max rows: " + e.NewMaximumRows.ToString();  
        test.Text += "<br />total rows: " + e.TotalRowCount.ToString();
        test.Text += "<br />startRow index: " + e.Item.Pager.StartRowIndex.ToString();

        //switch statement that takes the button pressed by the user as the parameter
        switch (e.CommandName)
        {
            case "Prev":
                if (e.Item.Pager.StartRowIndex + 3 <= e.TotalRowCount - 3)
                {
                    e.NewStartRowIndex = e.Item.Pager.StartRowIndex + 3;
                }
                break;
            case "Next":
                if (e.Item.Pager.StartRowIndex - 3 >= 0)
                {
                    e.NewStartRowIndex = e.Item.Pager.StartRowIndex - 3;
                }
                break;
        }
    }
}
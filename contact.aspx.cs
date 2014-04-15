using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // when the page load completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Humber MICs Group | Contact Us";
    }

    contactClass objLinq = new contactClass();

    // Resets the values of the insert input fields and updates the database fields.
    private void _subRebind()
    {
        txt_fname.Text = string.Empty;
        txt_lname.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_city.Text = string.Empty;
        ddl_province.SelectedValue = "0"; 
        txt_subject.Text = string.Empty;
        txt_contact_message.Text = string.Empty;
    }

    // Inserts data into the database.
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(txt_fname.Text, txt_lname.Text, txt_email.Text, txt_city.Text, ddl_province.SelectedValue.ToString(), txt_subject.Text, txt_contact_message.Text), "insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    // Excecutes and then checks if the insert/update/delete was sucessful, and sends a response to the user.
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "Your message was sent. Thank you.";
        else
            lbl_message.Text = "Sorry, we were unable to send your message.";
    }


}
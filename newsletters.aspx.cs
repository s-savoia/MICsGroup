using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsletters : System.Web.UI.Page
{
    newsletterClass objNews = new newsletterClass();

    protected void subClick(object sender, EventArgs e)
    {
        //insert(send) data to database
        _strMessage(objNews.commitInsert(txt_name.Text.ToString(), txt_email.Text.ToString()), "insert");
    }

    private void _subRebind()
    {
        txt_name.Text = string.Empty;
        txt_email.Text = string.Empty;
    }

    //set the message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_output.Text = "Thank you for applying our neswletter " + txt_name.Text + "! We will send our newsletter at " + txt_email.Text;

        }
        else
        {
            lbl_output.Text = "Sorry, please try again.";
        }
    }
}
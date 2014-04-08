using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_news_event : System.Web.UI.Page
{

    eventClass objLinq = new eventClass();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    //******* CALLING SUBADMIN *******//

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                
               // CHEQUING IF IS AN EVENT OR NEWS
               string img="img";
                if (rbt_event.Checked)
                {

                    string events = "e";
                    _strMessage(objLinq.commitInsert(txt_title.Text, txt_content.Text, img, events, txt_short.Text), "Insert");
                }
                else
                {
                    string news = "n";
                    _strMessage(objLinq.commitInsert(txt_title.Text, txt_content.Text, img, news, txt_short.Text), "Insert");
                }

                _subRebind();
                break;

            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;

            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                break;

        }
    }


    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                //TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateU"); ..... ORIGINAL
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleU"); //assign. values from the repeater to an object
                TextBox txtShort = (TextBox)e.Item.FindControl("txt_shortU");
                TextBox txtCont = (TextBox)e.Item.FindControl("txt_contentU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");

                int newsEventID = int.Parse(hdfID.Value.ToString()); 
               //converting the id in number

                //assing to _strMessage the boolean and string arguments
                //_strMessage(objLinq.commitUpdate(alertID, txtTitle.Text, txtShort.Text, txtLong.Text), "update");



                string img = "img";
                _strMessage(objLinq.commitUpdate(newsEventID, txtTitle.Text, txtCont.Text, img, txtShort.Text), "Update");

                _subRebind();
                break;

            case "Delete":

                HiddenField hdfID_D = (HiddenField)e.Item.FindControl("hdf_idD");

                int alertID_D = int.Parse(hdfID_D.Value.ToString()); 
                //converting the id in number

                _strMessage(objLinq.commitDelete(alertID_D), "delete");
                _subRebind();
                break;

            case "Cancel":
                _subRebind();
                break;
        }
    }


    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        eventClass _linq = new eventClass();
        rpt_update.DataSource = _linq.getEventByID(id);
        rpt_update.DataBind();
    }

    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objLinq.getEventByID(id);
        rpt_delete.DataBind();
    }


    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    private void _subRebind()
    {
        //txt_date.Text = string.Empty;ESTE ESTABA ORIGINAL
        txt_title.Text = string.Empty;
        txt_short.Text = string.Empty;
        txt_content.Text = string.Empty;

        rpt_all.DataSource = objLinq.getEvent();//???
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag) // if flag is true
            lbl_message.Text = "News and Events " + str + " was successful"; //writing the output
        else
            lbl_message.Text = "sorry, unable to" + str + " News and Events";
    }



    protected void lbl_category_Load(object sender, EventArgs e)
    {

    }
}
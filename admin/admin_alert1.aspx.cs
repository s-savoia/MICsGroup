using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    alertLinkClass objLinq = new alertLinkClass();


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

                //_strMessage(objLinq.commitInsert(txt_title.Text, txt_short.Text, txt_long.Text, txt_date.Text), "Insert"); ESTE ES EL ORIGINAL

                _strMessage(objLinq.commitInsert(txt_title.Text, txt_short.Text, txt_long.Text), "Insert");

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
                TextBox txtLong = (TextBox)e.Item.FindControl("txt_longU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");

                int alertID = int.Parse(hdfID.Value.ToString()); //converting the id in number



                //assing to _strMessage the boolean and string arguments
                //_strMessage(objLinq.commitUpdate(alertID, txtTitle.Text, txtShort.Text, txtLong.Text, txtDate.Text), "update"); ....ORIGINAL

                _strMessage(objLinq.commitUpdate(alertID, txtTitle.Text, txtShort.Text, txtLong.Text), "update");

                _subRebind();
                break;

            case "Delete":

                HiddenField hdfID_D = (HiddenField)e.Item.FindControl("hdf_idD");

                int alertID_D = int.Parse(hdfID_D.Value.ToString()); //converting the id in number

                //int _id = int.Parse((HiddenField)e.Item.FindControl("hdf_idD")).Value; ??????? not working

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
        alertLinkClass _linq = new alertLinkClass();
        rpt_update.DataSource = _linq.getAlertByID(id);
        rpt_update.DataBind();
    }

    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objLinq.getAlertByID(id);
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
        txt_long.Text = string.Empty;

        rpt_all.DataSource = objLinq.getAlert();//???
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag) // if flag is true
            lbl_message.Text = "Health Alert " + str + " was successful"; //writing the output
        else
            lbl_message.Text = "sorry, unable to" + str + " Health Alert";
    }

}
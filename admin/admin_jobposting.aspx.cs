using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{

    jobPostingsClass objJob = new jobPostingsClass();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            _subRebind();
            _pnlControl(pnl_main);
        }
              
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Job " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " job";
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "InsertC":
                subInsert();
                break;

            case "CancelC":
                _subRebind();
                _pnlControl(pnl_main);
                break;
            
            case "add":
                _pnlControl(pnl_insert);
                break;

            case "manage":
                _pnlControl(pnl_main);
                break;
        }
    }

    private void subInsert()
    {
        lbl_message.Text = "Mode: insert";
        _strMessage(objJob.commitInsert(txt_positionI.Text, txt_locationI.Text, txt_detailsI.Text), "insert");
        _subRebind();
        _pnlControl(pnl_main);

    }

    protected void subControl(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "EditC":
                
                int editIndex = Int32.Parse(e.CommandArgument.ToString());
                ltv_main.EditIndex = editIndex - 1;
                lbl_message.Text = "Mode: edit, id: " + e.CommandArgument + ", edit index: " + editIndex;
                _subRebind();
                break;

            case "UpdateC":
                lbl_message.Text = "Mode: Update";
                Label lblID2 = (Label)e.Item.FindControl("lbl_id2E");
                TextBox txtPostion = (TextBox)e.Item.FindControl("txt_positionE");
                TextBox txtLocation = (TextBox)e.Item.FindControl("txt_locationE");
                TextBox txtDetails = (TextBox)e.Item.FindControl("txt_detailsE");
                int jobID = int.Parse(lblID2.Text.ToString());

                _strMessage(objJob.commitUpdate(jobID, txtPostion.Text, txtLocation.Text, txtDetails.Text), "update");
                //lbl_message.Text = txtPostion.Text + ", " + txtLocation.Text + ", " + txtDetails.Text;
                _subRebind();
                _pnlControl(pnl_main);
                ltv_main.EditIndex = -1;
                break;

            case "DeleteC":
                lbl_message.Text = "Mode: delete";
                Label lblID = (Label)e.Item.FindControl("lbl_id");
                int _id = int.Parse(lblID.Text.ToString());
                _strMessage(objJob.commitDelete(_id), "delete");
                //ltv_main.EditIndex = -1;
                _subRebind();
                break;

                case "CancelC":
                //lbl_message.Text = "Mode: cancel";
                ltv_main.EditIndex = -1;
                _subRebind();
                break;
        }


    }

    private void _subRebind()
    {
        TextBox TxtPositionI = (TextBox)this.pnl_insert.FindControl("txt_positionI");
        TextBox TxtLocationI = (TextBox)this.pnl_insert.FindControl("txt_locationI");
        TextBox TxtDetailsI = (TextBox)this.pnl_insert.FindControl("txt_detailsI");
        TxtPositionI.Text = string.Empty;
        TxtLocationI.Text = string.Empty;
        TxtDetailsI.Text = string.Empty;

        ltv_main.DataSource = objJob.getJobPostings();
        ltv_main.DataBind();
        //lbl_message.Text = "Manage Job Postings";
    }

    protected void _pnlControl(Panel pnl) 
    {
        pnl_insert.Visible = false;
        pnl_main.Visible = false;
        pnl.Visible = true;

        if (pnl == pnl_main)
        {

            btn_add.Enabled = true;
            btn_manage.Enabled = false;
        }
        else
        {
            btn_add.Enabled = false;
            btn_manage.Enabled = true;
            txt_positionI.Focus();
        }
    }
}
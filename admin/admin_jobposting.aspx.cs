using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// = = = Coded by: JAMES HONG = = = 

public partial class admin_jobposting : System.Web.UI.Page
{
    // create an instance of the jobPostings class
    jobPostingsClass objJob = new jobPostingsClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        // when the page loads for the first time, call the subRebind() function and the panel control function
        if (!Page.IsPostBack)
        {
            _subRebind();
            _pnlControl(pnl_main);

        }

    }

    // when the page finishes loading completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_adminMasterTitle = "Humber MICs Group | CMS - Job Postings";
    }

    // display a message if an action was successful or not (actions: add, update, delete)
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
    // control subroutine for the job postings ListView
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            // call the subroutine for inserting a row into the database table (mic_job_postings)
            case "InsertC":
                subInsert();
                break;
            // rebind the data source and display the main job postings panel
            case "CancelC":
                _subRebind();
                _pnlControl(pnl_main);
                break;
            // display a message telling the user that the current mode is 'add' for adding a new job posting
            case "add":
                lbl_message.Text = "Mode: add <br /><br />(You can add a new job posting)";
                _pnlControl(pnl_insert);
                break;
            // display a message telling the user that the current mode is 'manage' for viewing/editing job postings
            case "manage":
                lbl_message.Text = "Mode: manage <br /><br />(You can view/edit job posting(s) ";
                _subRebind();
                _pnlControl(pnl_main);
                break;
        }
    }
    // subroutine for inserting a row into the database table
    private void subInsert()
    {
        lbl_message.Text = "Mode: insert";
        _strMessage(objJob.commitInsert(txt_positionI.Text, txt_locationI.Text, txt_detailsI.Text), "insert");
        _subRebind();
        _pnlControl(pnl_main);

    }
    // control subroutine while editing in the EditItemTemplate
    protected void subControl(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            // set the edit index for one item in the ListView and display the current mode (edit)
            case "EditC":
                int itemDisplayIndex = e.Item.DisplayIndex;
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string id = commandArgs[0];
                string position = commandArgs[1];
                int integerId = Int16.Parse(id);

                Panel pnlItemHeadings = (Panel)this.pnl_main.FindControl("ltv_main").FindControl("pnl_itemHeadings");
                pnlItemHeadings.Visible = false;

                ltv_main.EditIndex = 0; //itemDisplayIndex; 
                ltv_main.DataSource = objJob.getJobPostingById(integerId);
                ltv_main.DataBind();

                lbl_message.Text = "Mode: edit";

                break;
            // update a row in the database table based on the input fields in the EditItemTemplate of the job postings ListView
            case "UpdateC":
                lbl_message.Text = "Mode: Update";
                Label lblID2 = (Label)e.Item.FindControl("lbl_id2E");
                TextBox txtPosition = (TextBox)e.Item.FindControl("txt_positionE");
                TextBox txtLocation = (TextBox)e.Item.FindControl("txt_locationE");
                TextBox txtDetails = (TextBox)e.Item.FindControl("txt_detailsE");
                int jobID = int.Parse(lblID2.Text.ToString());
                _strMessage(objJob.commitUpdate(jobID, txtPosition.Text, txtLocation.Text, txtDetails.Text), "update");
                ltv_main.EditIndex = -1;
                _subRebind();
                _pnlControl(pnl_main);

                break;
            // delete a row in the database table
            case "DeleteC":
                lbl_message.Text = "Mode: delete";
                Label lblID = (Label)e.Item.FindControl("lbl_id");
                int _id = int.Parse(lblID.Text.ToString());
                _strMessage(objJob.commitDelete(_id), "delete");
                _subRebind();
                break;
            // display the ItemTemplate for the job postings ListView
            case "CancelC":
                ltv_main.EditIndex = -1;
                _subRebind();
                _pnlControl(pnl_main);
                break;
        }


    }
    // clear the fields in the panel for adding a job posting, and rebind the data source for the job postings ListView
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
    // display one panel while hiding the other panels
    protected void _pnlControl(Panel pnl)
    {
        pnl_insert.Visible = false;
        pnl_main.Visible = false;
        pnl.Visible = true;

        // depending on the mode (add or manage) enable one button while disabling the other 
        if (pnl == pnl_main)
        {

            btn_add.Enabled = true;
            btn_manage.Enabled = false;
            lbl_message.Text = "Mode: View/edit job postings";
        }
        else
        {
            btn_add.Enabled = false;
            btn_manage.Enabled = true;
            txt_positionI.Focus();
        }
    }
}
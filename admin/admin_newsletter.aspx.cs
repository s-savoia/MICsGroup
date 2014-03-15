using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newsletter : System.Web.UI.Page
{

    //create an instance of newletterClass and sendNewsletter Class
    newsletterClass objNews = new newsletterClass();
    sendNewsletterClass objLetter = new sendNewsletterClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    //bind data
    private void _subRebind()
    {
        ltv_main.DataSource = objNews.getNewsletter();
        ltv_main.DataBind();
        dtl_mainDL.DataSource = objLetter.getSendNewsletter();
        dtl_mainDL.DataBind();
    }

    //set the pannel
    private void _PanelControl(Panel pnl)
    {
        pnl_main.Visible = false;
        pnl_edit.Visible = false;
        pnl.Visible = true;
    }

    //set an update pannel
    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "showUpdate":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }
    //show each update
    private void _showUpdate(int id)
    {
        _PanelControl(pnl_edit);
        pnl_newsform.Visible = false;
        newsletterClass objNewsEach = new newsletterClass();
        ltv_edit.DataSource = objNewsEach.getNewsletterByID(id);
        ltv_edit.DataBind();
    }
    //set update, delete and cancel
    protected void subUpdate(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "doUpdate":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");

                int newsID = int.Parse(hdfID.Value.ToString());

                _strMessage(objNews.commitUpdate(newsID, txtName.Text, txtEmail.Text), "update");
                _PanelControl(pnl_main);
                pnl_newsform.Visible = true;
                _subRebind();
                break;

            case "doDelete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objNews.commitDelete(_id), "delete");
                _subRebind();
                _PanelControl(pnl_main);
                pnl_newsform.Visible = true;
                break;

            case "doCancel":
                _subRebind();
                _PanelControl(pnl_main);
                pnl_newsform.Visible = true;
                break;
        }
    }
    //set the message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Newsletter application was changed successfully.";

        }
        else
        {
            lbl_message.Text = "Sorry, please try again.";
        }
    }

    //end newsletter applicant information

    //start newsletter form information

    private void _PanelControlDL(Panel pnl)
    {
        pnl_mainDL.Visible = false;
        pnl_editDL.Visible = false;
        pnl.Visible = true;
    }

    //set an update pannel
    protected void subAdminDL(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "showUpdateDL":
                _showUpdateDL(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }
    //show each update
    private void _showUpdateDL(int id)
    {
        _PanelControlDL(pnl_editDL);
        pnl_applicant.Visible = false;
        sendNewsletterClass objLetterEach = new sendNewsletterClass();
        dtl_editDL.DataSource = objLetterEach.getSentNewsletterByID(id);
        dtl_editDL.DataBind();
    }
    //set update, delete and cancel
    protected void subUpdateDL(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "UpdateDL":
                HiddenField hdfIDDL = (HiddenField)e.Item.FindControl("hdf_idDL");
                TextBox txtSubjectDL = (TextBox)e.Item.FindControl("txt_subjectEDL");
                TextBox txtMessageDL = (TextBox)e.Item.FindControl("txt_messageEDL");
                //Image imgAttachment = (Image)e.Item.FindControl("img_imageEDL");
                FileUpload fulAttachment = (FileUpload)e.Item.FindControl("ful_imageEDL");

                if (fulAttachment.HasFile)
                {
                    String filePath = "~/admin/img/newsletter/" + fulAttachment.FileName;
                    fulAttachment.SaveAs(MapPath(filePath));
                }

                int letterID = int.Parse(hdfIDDL.Value.ToString());

                _strMessageDL(objLetter.commitUpdate(letterID, txtSubjectDL.Text, txtMessageDL.Text, fulAttachment.FileName), "update");
                _PanelControlDL(pnl_mainDL);
                pnl_applicant.Visible = true;
                _subRebind();
                break;

            case "DeleteDL":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idDL")).Value);
                _strMessageDL(objLetter.commitDelete(_id), "delete");             
                _PanelControlDL(pnl_mainDL);
                pnl_applicant.Visible = true;
                _subRebind();
                break;

            case "CancelDL":              
                _PanelControlDL(pnl_mainDL);
                pnl_applicant.Visible = true;
                _subRebind();
                break;
        }
    }
    //set the message
    private void _strMessageDL(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Newsletter information was changed successfully.";

        }
        else
        {
            lbl_message.Text = "Sorry, please try again.";
        }
    }
}
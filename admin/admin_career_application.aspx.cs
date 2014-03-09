using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_career_application : System.Web.UI.Page
{
    careerApplicationClass objCareer = new careerApplicationClass();

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
        rpt_main.DataSource = objCareer.getCareer();
        rpt_main.DataBind();
    }

    //set the pannel
    private void _PanelControl(Panel pnl)
    {
        pnl_main.Visible = false;
        pnl_edit.Visible = false;
        pnl.Visible = true;
    }

    //set an update pannel
    protected void subAdmin(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }
    //show each update
    private void _showUpdate(int id)
    {
        _PanelControl(pnl_edit);
        careerApplicationClass objCareerEach = new careerApplicationClass();
        rpt_edit.DataSource = objCareerEach.getCareerByID(id);
        rpt_edit.DataBind();
    }
    //set update, delete and cancel
    protected void subUpdate(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                TextBox txtFname = (TextBox)e.Item.FindControl("txt_fnameE");
                TextBox txtLname = (TextBox)e.Item.FindControl("txt_lnameE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtAddress = (TextBox)e.Item.FindControl("txt_addressE");
                DropDownList ddlCountry = (DropDownList)e.Item.FindControl("ddl_countryE");
                DropDownList ddlProvince = (DropDownList)e.Item.FindControl("ddl_provinceE");
                TextBox txtCity = (TextBox)e.Item.FindControl("txt_cityE");
                TextBox txtZip = (TextBox)e.Item.FindControl("txt_zipE");
                TextBox txtPhone = (TextBox)e.Item.FindControl("txt_phoneE");
                RadioButtonList rblStatus = (RadioButtonList)e.Item.FindControl("rbl_statusE");
                RadioButtonList rblCrime = (RadioButtonList)e.Item.FindControl("rbl_crimeE");
                DropDownList ddlCertificate = (DropDownList)e.Item.FindControl("ddl_certificateE");
                DropDownList ddlProficiency = (DropDownList)e.Item.FindControl("ddl_proficiencyE");
                DropDownList ddlExperience = (DropDownList)e.Item.FindControl("ddl_experienceE");
                FileUpload fulResume = (FileUpload)e.Item.FindControl("ful_resumeE");
                Label lblResume = (Label)e.Item.FindControl("lbl_resumeShow");
                FileUpload fulCover = (FileUpload)e.Item.FindControl("ful_coverletterE");
                Label lblCover = (Label)e.Item.FindControl("lbl_coverletterShow");
                TextBox txtReason = (TextBox)e.Item.FindControl("txt_reasonE");
                TextBox txtComment = (TextBox)e.Item.FindControl("txt_commentE");
                CheckBoxList cblConsent = (CheckBoxList)e.Item.FindControl("ckb_consentE");

                int careerID = int.Parse(hdfID.Value.ToString());
                if (fulResume.HasFile)
                {
                    String filePath = "~/admin/img/career/" + fulResume.FileName;
                    fulResume.SaveAs(MapPath(filePath));
                }
                if (fulCover.HasFile)
                {
                    String filePath = "~/admin/img/career/" + fulCover.FileName;
                    fulCover.SaveAs(MapPath(filePath));
                }
                _strMessage(objCareer.commitUpdate(careerID, txtFname.Text, txtLname.Text, txtEmail.Text, txtAddress.Text, int.Parse(ddlCountry.SelectedValue.ToString()), int.Parse(ddlProvince.SelectedValue.ToString()), txtCity.Text, txtZip.Text, txtPhone.Text, int.Parse(rblStatus.SelectedValue.ToString()), int.Parse(ddlCertificate.SelectedValue.ToString()), int.Parse(ddlProficiency.SelectedValue.ToString()), int.Parse(ddlExperience.SelectedValue.ToString()), int.Parse(rblCrime.SelectedValue.ToString()), fulResume.FileName.ToString(), fulCover.FileName, txtReason.Text, txtComment.Text, int.Parse(cblConsent.SelectedValue.ToString())), "update");
                _subRebind();
                break;
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objCareer.commitDelete(_id), "delete");
                _subRebind();
                _PanelControl(pnl_main);
                break;
            case "Cancel":
                _subRebind();
                _PanelControl(pnl_main);
                break;
        }
    }
    //set the message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Career application was changed successfully.";

        }
        else
        {
            lbl_message.Text = "Sorry, please try again.";
        }
    }
}
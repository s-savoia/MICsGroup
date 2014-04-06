using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_donation : System.Web.UI.Page
{
    donationClass objDonate = new donationClass();

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
        dtl_main.DataSource = objDonate.getDonation();
        dtl_main.DataBind();
    }

    //set the pannel
    private void _PanelControl(Panel pnl)
    {
        pnl_main.Visible = false;
        pnl_edit.Visible = false;
        pnl.Visible = true;
    }

    //set an update pannel
    protected void subAdmin(object sender, DataListCommandEventArgs e)
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
        donationClass objDonateEach = new donationClass();
        dtl_edit.DataSource = objDonateEach.getDonationByID(id);
        dtl_edit.DataBind();
    }
    //set update, delete and cancel
    protected void subUpdate(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                TextBox txtFname = (TextBox)e.Item.FindControl("txt_fnameE");
                TextBox txtLname = (TextBox)e.Item.FindControl("txt_lnameE");
                TextBox txtAddress = (TextBox)e.Item.FindControl("txt_addressE");
                TextBox txtCity = (TextBox)e.Item.FindControl("txt_cityE");
                DropDownList ddlProvince = (DropDownList)e.Item.FindControl("ddl_provinceE");
                DropDownList ddlCountry = (DropDownList)e.Item.FindControl("ddl_countryE");
                TextBox txtZip = (TextBox)e.Item.FindControl("txt_zipE");
                TextBox txtPhone = (TextBox)e.Item.FindControl("txt_phoneE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");
                DropDownList ddlSurvey = (DropDownList)e.Item.FindControl("ddl_surveyE");
                TextBox txtComment = (TextBox)e.Item.FindControl("txt_commentE");
                TextBox txtAmount = (TextBox)e.Item.FindControl("txt_amountE");
                RadioButtonList rblType = (RadioButtonList)e.Item.FindControl("rbl_typeE");
                TextBox txtCardNum = (TextBox)e.Item.FindControl("txt_cardnumE");
                TextBox txtSecurity = (TextBox)e.Item.FindControl("txt_securityE");
                TextBox txtHolder = (TextBox)e.Item.FindControl("txt_holdernameE");
                DropDownList ddlExmonth = (DropDownList)e.Item.FindControl("ddl_expirationmonthE");
                DropDownList ddlExyear = (DropDownList)e.Item.FindControl("ddl_expirationyearE");
                TextBox txtToken = (TextBox)e.Item.FindControl("txt_tokenE");
                TextBox txtSuccess = (TextBox)e.Item.FindControl("txt_successE");

                int donationID = int.Parse(hdfID.Value.ToString());
                int securityNum = int.Parse(txtSecurity.Text);
                string amount = txtAmount.Text;
                int success = int.Parse(txtSuccess.Text);

                _strMessage(objDonate.commitUpdate(donationID, txtFname.Text, txtLname.Text, txtAddress.Text, txtCity.Text, ddlProvince.SelectedItem.ToString(), ddlCountry.SelectedItem.ToString(), txtZip.Text, txtPhone.Text, txtEmail.Text, ddlSurvey.SelectedItem.ToString(), txtComment.Text, amount, rblType.SelectedItem.ToString(), txtCardNum.Text, securityNum, txtHolder.Text, ddlExmonth.SelectedItem.ToString(), ddlExyear.SelectedItem.ToString(), txtToken.Text, success), "update");
                _subRebind();
                break;

            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objDonate.commitDelete(_id), "delete");
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
            lbl_message.Text = "Donor Information was changed successfully.";

        }
        else
        {
            lbl_message.Text = "Sorry, please try again.";
        }
    }
}
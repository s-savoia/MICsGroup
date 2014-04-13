using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_doctor : System.Web.UI.Page
{
    doctor objDoctor = new doctor();
    specialization objSpecialization = new specialization();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();        
        }
    }

    protected void subNew(object sender, EventArgs e)
    {
        mtv_doctor.ActiveViewIndex = 0;
    }

    protected void subEdit(object sender, EventArgs e)
    {
        mtv_doctor.ActiveViewIndex = 1;
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "add":
                objDoctor.commitInsert(txt_fname.Text.ToString(), txt_lname.Text.ToString(), ddl_location.SelectedItem.Text.ToString(), ddl_specialization.SelectedItem.Text.ToString(), txt_contact.Text.ToString(), txt_email.Text.ToString());
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
   

    private void _subRebind()
    {
        ddl_location.DataSource = objDoctor.getLocation();
        ddl_location.DataTextField = "name";
        ddl_location.DataValueField = "name";
        ddl_location.DataBind();

        ddl_specialization.DataSource = objSpecialization.getSpecialization();
        ddl_specialization.DataTextField = "specialization";
        ddl_specialization.DataValueField = "specialization";
        ddl_specialization.DataBind();

        txt_fname.Text = "";
        txt_lname.Text = "";
        txt_email.Text = "";
        txt_contact.Text = "";
    }

    private void subCancel(object sender, EventArgs e)
    {
        _subRebind();
    }
}
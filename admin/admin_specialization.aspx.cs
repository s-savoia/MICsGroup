using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_specialization : System.Web.UI.Page
{
    specialization objSpecialization = new specialization();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void subNew(object sender, EventArgs e)
    {
        mtv_specialization.ActiveViewIndex = 0;
    }

    protected void subEdit(object sender, EventArgs e)
    {
        mtv_specialization.ActiveViewIndex = 1;
        _subRebind();
    }

    protected void subAdd(object sender, EventArgs e)
    {
        objSpecialization.commitInsert(txt_specialization.Text.ToString());
        txt_specialization.Text = "";
    }

    protected void subUpDel(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                HiddenField hdf_id = (HiddenField)e.Item.FindControl("hdfId");
                TextBox txtSpecilialization = (TextBox)e.Item.FindControl("txt_sname");
                objSpecialization.commitUpdate(int.Parse(hdf_id.Value.ToString()), txtSpecilialization.Text);
                _subRebind();
                break;
            case "Delete":
                HiddenField hdfd_id = (HiddenField)e.Item.FindControl("hdfId");
                objSpecialization.commitDelete(int.Parse(hdfd_id.Value.ToString()));
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

        }
    }

    private void _subRebind()
    {
        lv_edit.DataSource = objSpecialization.getSpecialization();
        lv_edit.DataBind();
    }

    protected void SubUp(object sender, ListViewUpdateEventArgs e)
    {

    }

    protected void subDel(object sender, ListViewDeleteEventArgs e)
    {
    }
}
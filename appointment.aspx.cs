using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
        
    }

    bookAppointmentClass objLinq = new bookAppointmentClass();

    protected void subChangeEdited(object sender, EventArgs e)
    {
        rbl_appointments.DataSource = objLinq.getAppointmentsByDateNotBooked(ddl_view_appointments.SelectedValue.ToString());
        rbl_appointments.DataTextField = "date";
        rbl_appointments.DataTextFormatString = "{0:h:mm tt}";
        rbl_appointments.DataValueField = "Id";
        rbl_appointments.DataBind();
    }

    private void _subRebind()
    {
        ddl_view_appointments.DataSource = objLinq.getAppointmentDates();
        ddl_view_appointments.DataTextField = "date_string";
        ddl_view_appointments.DataValueField = "date_string";
        ddl_view_appointments.DataBind();

        rbl_appointments.DataSource = objLinq.getAppointmentsByDateNotBooked(ddl_view_appointments.SelectedValue.ToString());
        rbl_appointments.DataTextField = "date";
        rbl_appointments.DataTextFormatString = "{0:h:mm tt}";
        rbl_appointments.DataValueField = "Id";
        rbl_appointments.DataBind();

        txt_fname.Text = "";
        txt_lname.Text = "";
        txt_address.Text = "";
        txt_city.Text = "";
        ddl_province.SelectedValue = "0";
        txt_postal.Text = "";
        txt_phone.Text = "";
        txt_reason.Text = "";
    }

    // Inserts data into the database.
    protected void subCommand(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _strMessage(objLinq.commitUpdate(int.Parse(rbl_appointments.SelectedValue.ToString()), txt_fname.Text.ToString(),txt_lname.Text.ToString(),txt_address.Text.ToString(),txt_city.Text.ToString(), ddl_province.SelectedValue.ToString(),txt_postal.Text.ToString(),txt_phone.Text.ToString(),txt_reason.Text.ToString(), true), "update");
                _subRebind();
                break;
        }
    }

    // Excecutes and then checks if the insert/update/delete was sucessful, and sends a response to the user.
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "Product " + str + " was successful";
        else
            lbl_message.Text = "Sorry, unable to " + str + " product";
    }
}

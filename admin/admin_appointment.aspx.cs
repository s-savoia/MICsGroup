using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            pnl_appointment_create.Visible = true;
            pnl_appointment_view.Visible = false;            
        }
    }

    // when the page finishes loading completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_adminMasterTitle = "Humber MICs Group | CMS - Book an Appointment";
    }

    protected void subShowView(object sender, EventArgs e)
    {
        pnl_appointment_create.Visible = false;
        pnl_appointment_view.Visible = true;

        _subBindView();
    }

    protected void subShowCreate(object sender, EventArgs e)
    {
        pnl_appointment_create.Visible = true;
        pnl_appointment_view.Visible = false;
    }

    bookAppointmentClass objLinq = new bookAppointmentClass();

    // Resets the values of the insert input fields and updates the database fields.
    private void _subRebind()
    {
        txt_date.Text = string.Empty;
        lb_time.SelectedValue = "9:00:00 AM";
    }

    // resets the ddl and lv
    private void _subBindView()
    {
        ddl_view_appointments.DataSource = objLinq.getAppointmentDates();
        ddl_view_appointments.DataTextField = "date_only";
        ddl_view_appointments.DataTextFormatString = "{0:D}";
        ddl_view_appointments.DataValueField = "date_only";
        ddl_view_appointments.DataBind();

        lv_appointments.DataSource = objLinq.getAppointmentsByDate(DateTime.Parse(ddl_view_appointments.SelectedValue.ToString()));
        lv_appointments.DataBind();
    }

    // Inserts data into the database.
    protected void subInsert (object sender, EventArgs e)
    {
        // Get the date that the appointment timeslot will be on
        DateTime date_only_selected = DateTime.Parse(txt_date.Text.ToString());
        
        // For each selected timeslot, make an appointment on the date selected above
        for (int i = 0; i < lb_time.Items.Count; i++)
        {
            if (lb_time.Items[i].Selected)
            {
                string date_to_insert = txt_date.Text.ToString() + " " + lb_time.Items[i].Value.ToString();
                _strMessage(objLinq.commitInsert(DateTime.Parse(date_to_insert), date_only_selected), "Appointment timeslot(s) successfully created.");
            }
        }


        _subRebind();
    }

    // Excecutes and then checks if the insert/update/delete was sucessful, and sends a response to the user.
    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = str;
        else
            lbl_message.Text = "Sorry, your input was NOT sent.";
    }

    // This function is triggered when the user clicks anything in the ListView (Update, Delete, Cancel)
    protected void subUpDel(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Delete_This":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(objLinq.commitDelete(_id), "Appointment timeslot successfully deleted.");
                _subBindView();
                break;
        }
    }

    protected void subChangeEdited(object sender, EventArgs e)
    {
        lv_appointments.DataSource = objLinq.getAppointmentsByDate(DateTime.Parse(ddl_view_appointments.SelectedValue.ToString()));
        lv_appointments.DataBind();
    }
}
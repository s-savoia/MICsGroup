using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class appointment_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Array helloman = objLinq.getAppointmentDatesNotBooked().ToArray();
 
        foreach (DateTime hello in helloman)
        {
                    lbl.Text += hello.ToString();
        }

    }

    
    bookAppointmentClass objLinq = new bookAppointmentClass();

}
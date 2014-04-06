using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TEST_new_events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //creating an object from the eventClass
        eventClass objEvent = new eventClass();

        rpt_main.DataSource = objEvent.getEvent();

        rpt_main.DataBind();//binding the DB
    }
}
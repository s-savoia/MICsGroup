using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UCnews_events : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //creating an object from the eventClass
        eventClass objEvent = new eventClass();

        dtl_main.DataSource = objEvent.getEvent();

        dtl_main.DataBind();//binding the DB
    }
}
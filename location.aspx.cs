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

    locationsClass objLinq = new locationsClass();

    // Resets the values of the insert input fields and updates the database fields.
    private void _subRebind()
    {
        lv_locations.DataSource = objLinq.getLocations();
        lv_locations.DataBind();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about : System.Web.UI.Page
{
    // when the page finishes loading completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Humber MICs Group | About Us";
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
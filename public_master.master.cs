using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class public_master : System.Web.UI.MasterPage
{
    private string _title = "Humber MICs Group";
    public string pp_masterTitle
    {
        get { return _title; }
        set { _title = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}

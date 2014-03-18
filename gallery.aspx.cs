using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gallery : System.Web.UI.Page
{
    imagesLinkClass objImages = new imagesLinkClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid_main.DataSource = objImages.getImages();
        grid_main.DataBind();
    }
}
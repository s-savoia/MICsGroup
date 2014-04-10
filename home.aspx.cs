using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections.Generic;
using System.Xml;


public partial class _home_slide_show : System.Web.UI.Page
{

    //protected void subTick(object sender, EventArgs e)
    //{
    //    if (mtv.ActiveViewIndex < 3)
    //    {
    //        mtv.ActiveViewIndex += 1;
    //    }
    //    else
    //    {
    //        mtv.ActiveViewIndex = 0;
    //    }
    //}


    alertLinkClass objLinq = new alertLinkClass();

    imagesLinkClass objImages = new imagesLinkClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        //rpt_main.DataSource = objLinq.getAlert();
        //rpt_main.DataBind();

        rpt_images.DataSource = objImages.getImages();
        rpt_images.DataBind();
    }


    //[WebMethod]
    //[ScriptMethod]


    //public static Slide[] GetImages()
    //{
    //    List<Slide> slides = new List<Slide>();
    //    string path = HttpContext.Current.Server.MapPath("~/img1/");


    //    if (path.EndsWith("\\"))
    //    {
    //        path = path.Remove(path.Length - 1);
    //    }
    //    Uri pathUri = new Uri(path, UriKind.Absolute);
    //    string[] files = Directory.GetFiles(path);
    //    foreach (string file in files)
    //    {
    //        Uri filePathUri = new Uri(file, UriKind.Absolute);
    //        slides.Add(new Slide
    //        {
    //            Name = Path.GetFileNameWithoutExtension(file),
    //            //Description = Path.GetFileNameWithoutExtension(file) + " Description.",
    //            ImagePath = pathUri.MakeRelativeUri(filePathUri).ToString()
    //        });
    //    }
    //    return slides.ToArray();
    //}
}
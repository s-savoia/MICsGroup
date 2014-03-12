﻿using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections.Generic;

//******** los que tenia originalmente ********
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class _home_slide_show : System.Web.UI.Page
{
    [WebMethod]
    [ScriptMethod]


    public static Slide[] GetImages()
    {
        List<Slide> slides = new List<Slide>();
        string path = HttpContext.Current.Server.MapPath("~/img1/");

        //if (path.EndsWith("\\"))
        //{
        //    path = path.Remove(path.Length - 1);
        //}
        Uri pathUri = new Uri(path, UriKind.Absolute);
        string[] files = Directory.GetFiles(path);
        foreach (string file in files)
        {
            Uri filePathUri = new Uri(file, UriKind.Absolute);
            slides.Add(new Slide
            {
                Name = Path.GetFileNameWithoutExtension(file),
                //Description = Path.GetFileNameWithoutExtension(file) + " Description.",
                ImagePath = pathUri.MakeRelativeUri(filePathUri).ToString()                
            });
          //Label imagepath = (Label)
        }
        return slides.ToArray();
    }
}
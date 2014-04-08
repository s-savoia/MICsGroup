using System;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Object;
using System.IO;
//using System.IO.DirectoryInfo;
//using System.MarshalByRefObject;
//using System.IO.FileSystemInfo;

public partial class _admin_slideshow : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subReset();
        }
    }

    private void _subReset()
    {

        //lbl_message.Text = string.Empty;
        salida.Text = string.Empty;


        imagesLinkClass objLinq = new imagesLinkClass(); //creating an object from the linqClass
        dtl_main.DataSource = objLinq.getImages();
        dtl_main.DataBind(); //binding the DB

    }

    protected void subInsert(object sender, EventArgs e)
    {

        imagesLinkClass objLinq = new imagesLinkClass(); //creating an object from the imagesLinkClass

        Button btn_insert = (Button)sender;
        DataListItem dli = (DataListItem)btn_insert.NamingContainer;

        TextBox txtNameI = (TextBox)dli.FindControl("txt_nameI");  //Reading the user imput
        TextBox txtlinkI = (TextBox)dli.FindControl("txt_linkI");  //Reading the user imput

        string img_path = salida.Text;

        //_strMessage(objLinq.commitInsert(img_path, txtNameI.Text, txtlinkI.Text)), "insert");

        objLinq.commitInsert(img_path, txtNameI.Text, txtlinkI.Text);

        dtl_main.DataSource = objLinq.getImages();
        dtl_main.DataBind();  //binding the DB
    }

    protected void subShowEditTemplate(object sender, DataListCommandEventArgs e)
    {

        imagesLinkClass objLinq = new imagesLinkClass(); //creating an object from the imagesLinkClass

        dtl_main.DataSource = objLinq.getImages();
        dtl_main.EditItemIndex = e.Item.ItemIndex;
        dtl_main.DataBind();   //binding the DB
    }

    protected void subUpdate(object sender, DataListCommandEventArgs e)
    {
        HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");


        TextBox txtNameE = (TextBox)e.Item.FindControl("txt_nameE"); //Reading the user imput
        TextBox txtlinkE = (TextBox)e.Item.FindControl("txt_linkE");  //Reading the user imput


        imagesLinkClass objLinq = new imagesLinkClass(); //creating an object from the imagesLinkClass

        //string img_path = salida.Text;

        // commiting the change and passing the to parameters into _strMesage
        _strMessage(objLinq.commitUpdate(int.Parse(hdfID.Value.ToString()), txtNameE.Text, txtlinkE.Text), "update");

        dtl_main.DataSource = objLinq.getImages();
        dtl_main.EditItemIndex = -1;
        dtl_main.DataBind(); //binding the DB
        _subReset();// reseting textboxes
    }

    protected void subDelete(object sender, DataListCommandEventArgs e)
    {

        imagesLinkClass objLinq = new imagesLinkClass();  //creating an object from the imagesLinkClass


        HiddenField hdfID_D = (HiddenField)e.Item.FindControl("hdf_id"); // reading the id value

        int imgID_D = int.Parse(hdfID_D.Value.ToString()); //converting the id in number
        //int x = Convert.ToInt32(hdfID_D);

        _strMessage(objLinq.commitDelete(imgID_D), "delete"); // commiting the change and passing the to parameters into _strMesage


        dtl_main.DataSource = objLinq.getImages();
        dtl_main.EditItemIndex = -1;// to go back and hide de edit panel
        dtl_main.DataBind();//binding the DB
        _subReset();

    }

    protected void subCancel(object sender, DataListCommandEventArgs e)
    {

        imagesLinkClass objLinq = new imagesLinkClass(); //creating an object from the imagesLinkClass

        dtl_main.DataSource = objLinq.getImages();
        dtl_main.EditItemIndex = -1;
        dtl_main.DataBind();

        //frm_img.DataSource = objLinq.getImages();
        //frm_img.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag) // if flag is true then was successful
            lbl_message.Text = "Image " + str + " was successful"; //writing the output
        else
            lbl_message.Text = "Sorry, unable to" + str + " Image";
    }

    //************* INSERTING IMAGE WITH FILEUPLOAD ****************//

    public void AddImage(object sender, EventArgs e)
    {
        if (up_Image.HasFile)
        {
            if (CheckFile(up_Image.FileName))
            {
                String filePath = "~/img1/" + up_Image.FileName;
                up_Image.SaveAs(MapPath(filePath));

                salida.Text = filePath;

                pnl_datalist.Visible = true;/// para ver el panel
                /// 
                //string path_image = filePath; COMO SACAR ESTE VALOR DE AQUI PARA ASIGNARLO AL IMG_PATH DE ARRIBA

                return;

            }
        }
    }

    bool CheckFile(string fileName)
    {
        string ext = Path.GetExtension(fileName);

        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".jpg":
                return true;
            case ".png":
                return true;

            default:
                return false;
        }
    }

    //private void _panelControl(Panel pnl)
    //{
    //    pnl_datalist.Visible = false;
    //    pnl.Visible = true;
    //}

}

//void Page_PreRender()
//{
//    string upFolder = MapPath("~/img1/");
//    DirectoryInfo dir=new DirectoryInfo(upFolder);

//    }






//protected void UpLoadImg(object sender, FormViewInsertEventArgs e)
//{
//    FileUpload upImage = (FileUpload)frm_img.FindControl("up_img");

//    frm_img.

//}



using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;

public partial class admin_newsletter_form : System.Web.UI.Page
{
    sendNewsletterClass objNews = new sendNewsletterClass();
    newsletterClass objEmail = new newsletterClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            lbl_output.Text = String.Empty;
        }
    }

    protected void subClick(object sender, EventArgs e)
    {
        //setting a newsletter
        //string to = "micsnewsletter@gmail.com";
        string to = objEmail.getNewsemail();
        string from = "micsnewsletter@gmail.com";
        
        //save images
        if (ful_attach.HasFile)
        {
            string file = ful_attach.FileName.ToString();
            String filePath = "~/admin/img/newsletter/" + file;
            ful_attach.SaveAs(MapPath(filePath));
        }

        //insert(send) data to database
        _strMessage(objNews.commitInsert(txt_subject.Text.ToString(), txt_message.Text.ToString(), ful_attach.FileName.ToString()), "insert");

        //setting from and to
        MailMessage message = new MailMessage(from, to);
        message.Subject = txt_subject.Text.ToString();
        message.Body = txt_message.Text.ToString();

        //attach a file
        Attachment data = new Attachment(Server.MapPath("~/admin/img/newsletter/" + ful_attach.FileName.ToString()), MediaTypeNames.Application.Octet);
        message.Attachments.Add(data);

        //send a newsletter
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("micsnewsletter@gmail.com", "micsnewsletter!");

        try
        {
            client.Send(message);
        }
        catch (Exception ex)
        {
            lbl_output.Text = "Exception caught: " + ex.ToString();
        }
        finally
        {
            lbl_output.Text = "Newsletter is sent sucessfully. Thanks!";
            _subRebind();
        }

    }

    private void _subRebind()
    {
        txt_subject.Text = string.Empty;
        txt_message.Text = string.Empty;
    }

    //set the message
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_output.Text = "Image was attached successfully.";

        }
        else
        {
            lbl_output.Text = "Sorry, please try again.";
        }
    }
}
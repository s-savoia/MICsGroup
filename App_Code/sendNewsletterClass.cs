using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class sendNewsletterClass
{
    //Get Sent Newsletter Info
    public IQueryable<mic_sendletter> getSendNewsletter()
    {
        hospitalDataContext objNews = new hospitalDataContext();
        var allNews = objNews.mic_sendletters.Select(x => x);
        return allNews;
    }

    //Get Specific Sent Newsletter Info
    public IQueryable<mic_sendletter> getSentNewsletterByID(int _id)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        var allNews = objNews.mic_sendletters.Where(x => x.sendletter_id == _id).Select(x => x);
        return allNews;
    }

    //Insert Newsletter Info
    public bool commitInsert(string _subject, string _message, string _image)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        using (objNews)
        {
            mic_sendletter objSentNews = new mic_sendletter();
            objSentNews.subject = _subject;
            objSentNews.message = _message;
            objSentNews.image = _image;           
            objNews.mic_sendletters.InsertOnSubmit(objSentNews);
            objNews.SubmitChanges();
            return true;
        }
    }

    //Update Newsletter Info
    public bool commitUpdate(int _id, string _subject, string _message, string _image)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        using (objNews)
        {
            var objUpNews = objNews.mic_sendletters.Single(x => x.sendletter_id == _id);
            objUpNews.subject = _subject;
            objUpNews.message = _message;
            objUpNews.image = _image;          
            objNews.SubmitChanges();
            return true;
        }
    }

    //Delete Newsletter Info
    public bool commitDelete(int _id)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        using (objNews)
        {
            var objDelNews = objNews.mic_sendletters.Single(x => x.sendletter_id == _id);
            objNews.mic_sendletters.DeleteOnSubmit(objDelNews);
            objNews.SubmitChanges();
            return true;
        }
    }
}
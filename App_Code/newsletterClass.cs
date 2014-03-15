using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class newsletterClass
{
    //Get All Newsletter Info
    public IQueryable<mic_mailing_list> getNewsletter()
    {
        hospitalDataContext objNews = new hospitalDataContext();
        var allNews = objNews.mic_mailing_lists.Select(x => x);
        return allNews;
    }

    //Get Specific Newsletter Info
    public IQueryable<mic_mailing_list> getNewsletterByID(int _id)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        var allNews = objNews.mic_mailing_lists.Where(x => x.mailing_id == _id).Select(x => x);
        return allNews;
    }

    //Insert Newsletter Info
    public bool commitInsert(string _name, string _email)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        using (objNews)
        {
            mic_mailing_list objNewNews = new mic_mailing_list();
            objNewNews.name = _name;
            objNewNews.email = _email;
            objNews.mic_mailing_lists.InsertOnSubmit(objNewNews);
            objNews.SubmitChanges();
            return true;
        }
    }


    //Update Newsletter Info
    public bool commitUpdate(int _id, string _name, string _email)
    {
        hospitalDataContext objNews = new hospitalDataContext();
        using (objNews)
        {
            var objUpNews = objNews.mic_mailing_lists.Single(x => x.mailing_id == _id);
            objUpNews.name = _name;
            objUpNews.email = _email;
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
            var objDelNews = objNews.mic_mailing_lists.Single(x => x.mailing_id == _id);
            objNews.mic_mailing_lists.DeleteOnSubmit(objDelNews);
            objNews.SubmitChanges();
            return true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;


public class eventClass
{
    public IQueryable<mic_news_event> getEvent()
    {
        //linea 25 o 25 del codigo
        //creating an instance of our LINQ object

        hospitalDataContext objHospitalDC = new hospitalDataContext();

        // methot syntax
        // creating an anonymous variable with its value being the instance of our LINQ object
        var allEvent = objHospitalDC.mic_news_events.Select(x => x);

        //x son todas las columnas
        //return IQueryable<product> for data bound control to bind to

        return allEvent;  //return allProducts;
    }

    public IQueryable<mic_news_event> getEventByID(int _id)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        var allEvent = objHospitalDC.mic_news_events.Where(x => x.Id == _id).Select(x => x);
        return allEvent;
    }



    //******** Query showing the rows by category... CLAUDIA ******//
    public IQueryable<mic_news_event> getEventByCategory(string _category)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();
        var allrow = objHospitalDC.mic_news_events.Where(x => x.category == _category).Select(x => x);
        return allrow;
    }
    //****** QUERY CLAUDIA ******//



    //******** INSERT *******//

    public bool commitInsert(string _title, string _content, string _img, string _category, string _short_cont)
    {
        // to ensure all data will be disposed when finished
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {
            //create an instance of the table
            mic_news_event objNewEvent = new mic_news_event();

            //set table columns to new values being pass from *.aspx page
            DateTime dateEvent = DateTime.Now;
            objNewEvent.date = dateEvent;

            objNewEvent.title = _title;
            objNewEvent.content = _content;
            objNewEvent.img = _img;
            objNewEvent.category = _category;
            objNewEvent.short_cont = _short_cont;

            //insert comand
            objHospitalDC.mic_news_events.InsertOnSubmit(objNewEvent);

            //commit insert against database
            objHospitalDC.SubmitChanges();
            return true;

        }
    }

    //******** UPDATE *******//

    public bool commitUpdate(int _id, string _title, string _content, string _img, string _short_cont)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {

            var objUPhospital = objHospitalDC.mic_news_events.Single(x => x.Id == _id);

            DateTime dateEvent = DateTime.Now;
            objUPhospital.date = dateEvent;
            objUPhospital.title = _title;
            objUPhospital.content = _content;
            objUPhospital.img = _img;
            //objUPhospital.category = _category;
            objUPhospital.short_cont = _short_cont;

            objHospitalDC.SubmitChanges();
            return true;

        }
    }

    //******** DELETE *******//

    public bool commitDelete(int _id)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {
            //anonymous
            var objDelHosp = objHospitalDC.mic_news_events.Single(x => x.Id == _id);

            //delete command            
            objHospitalDC.mic_news_events.DeleteOnSubmit(objDelHosp);

            //commit delete against DB
            objHospitalDC.SubmitChanges();
            return true;

        }
    }

}
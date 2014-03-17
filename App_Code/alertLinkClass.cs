using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;


public class alertLinkClass
{
    //public IQueryable<hospital> getAlert()
    public IQueryable<mic_alert> getAlert()
    {
        //linea 25 o 25 del codigo
        //creating an instance of our LINQ object

        hospitalDataContext objHospitalDC = new hospitalDataContext();

        // methot syntax
        // creating an anonymous variable with its value being the instance of our LINQ object
        var allAlert = objHospitalDC.mic_alerts.Select(x => x);

        //x son todas las columnas
        //return IQueryable<product> for data bound control to bind to

        return allAlert;  //return allProducts;
    }

    public IQueryable<mic_alert> getAlertByID(int _id)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        var allAlert = objHospitalDC.mic_alerts.Where(x => x.Id == _id).Select(x => x);
        return allAlert;
    }


    //******** INSERT *******//

    public bool commitInsert(string _title, string _short, string _long)
    {
        // to ensure all data will be disposed when finished

        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {
            //create an instance of the table
            mic_alert objNewAlert = new mic_alert();

            //set table columns to new values being pass from *.aspx page

           

            DateTime dateAlert = DateTime.Now;
            objNewAlert.date_alert = dateAlert;

            objNewAlert.title_alert = _title;
            objNewAlert.short_alert = _short;
            objNewAlert.long_alert = _long;


            //insert comand
            objHospitalDC.mic_alerts.InsertOnSubmit(objNewAlert);

            //commit insert against database
            objHospitalDC.SubmitChanges();
            return true;

        }
    }

    //******** UPDATE *******//

    public bool commitUpdate(int _id, string _title, string _short, string _long)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {

            var objUPhospital = objHospitalDC.mic_alerts.Single(x => x.Id == _id);

            DateTime dateAlert = DateTime.Now;
            objUPhospital.date_alert = dateAlert;
            
            objUPhospital.short_alert = _short;
            objUPhospital.title_alert = _title;
            objUPhospital.long_alert = _long;

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
            var objDelHosp = objHospitalDC.mic_alerts.Single(x => x.Id == _id);

            //delete command            
            objHospitalDC.mic_alerts.DeleteOnSubmit(objDelHosp);

            //commit delete against DB
            objHospitalDC.SubmitChanges();
            return true;

        }
    }


}



//objNewAlert.date_alert = Convert.ToDateTime(_date);
//objNewAlert.date_alert = _date;

//objNewAlert.date_alert = DateTime.Parse(_date);

//DateTime dateAlert = DateTime.Parse(_date);

//DateTime dateAlert = DateTime.ParseExact(_date,"ddMMyyyy", null);
//objNewAlert.date_alert = dateAlert;
// objNewAlert.date_alert = Convert.ToDateTime(objHospitalDC.["date_alert"]);

//***********************************************************
// DateTime date1 = new DateTime(2008, 6, 1, 7, 47, 0);
//Console.WriteLine(date1.ToString());

// Get date-only portion of date, without its time.
//DateTime dateOnly = date1.Date;
// Display date using short date string.
//Console.WriteLine(dateOnly.ToString("d"));
// Display date using 24-hour clock.
//Console.WriteLine(dateOnly.ToString("g"));
//Console.WriteLine(dateOnly.ToString("MM/dd/yyyy HH:mm"));

// The example displays the following output to the console: 
//       6/1/2008 7:47:00 AM 
//       6/1/2008 
//       6/1/2008 12:00 AM 
//       06/01/2008 00:00
//***************************************************************

//DateTime dateAlert = DateTime.ParseExact(_date, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None);

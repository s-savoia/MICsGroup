using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//This page is the bridge between the class pages and the products.dbml file
public class bookAppointmentClass
{
    public IQueryable<mic_book_appointment> getAppointmentDates()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allAppointments = objHospital.mic_book_appointments.Select(date => date).Distinct().OrderBy(x=>x.date);
        return allAppointments;
    }

    public IQueryable<mic_book_appointment> getAppointmentsByID(int _id)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var appointment = objHospital.mic_book_appointments.Where(x => x.Id == _id).Select(x => x);
        return appointment;
    }

    public IQueryable<mic_book_appointment> getAppointmentsByDate(DateTime _date)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var appointments = objHospital.mic_book_appointments.Where(x => x.date == _date).Select(x => x);
        return appointments;
    }

    public bool commitInsert(DateTime _date, string _time)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_book_appointment objBook = new mic_book_appointment();
            objBook.date = _date;
            objBook.time = _time;
            objHospital.mic_book_appointments.InsertOnSubmit(objBook);
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _fname, string _lname, string _address, string _city, string _province, string _postal_code, string _phone, DateTime _date, string _reason, string time, bool _booked)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_book_appointment objBook = objHospital.mic_book_appointments.Single(x => x.Id == _id);
            objBook.fname = _fname;
            objBook.lname = _lname;
            objBook.address = _address;
            objBook.city = _city;
            objBook.province = _province;
            objBook.postal_code = _postal_code;
            objBook.phone = _phone;
            objHospital.mic_book_appointments.InsertOnSubmit(objBook);
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_book_appointment objDelAppointment = objHospital.mic_book_appointments.Single(x => x.Id == _id);
            objHospital.mic_book_appointments.DeleteOnSubmit(objDelAppointment);
            objHospital.SubmitChanges();
            return true;
        }
    }
}
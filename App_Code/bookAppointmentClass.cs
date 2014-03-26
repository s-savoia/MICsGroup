﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//This page is the bridge between the class pages and the products.dbml file
public class bookAppointmentClass
{

    public IQueryable<mic_book_appointment> getAppointmentDates()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allAppointments = objHospital.mic_book_appointments.OrderBy(x => x.date).Select(x => x);
        return allAppointments;
    }

    public IQueryable<mic_book_appointment> getAppointmentsByID(int _id)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var appointment = objHospital.mic_book_appointments.Where(x => x.Id == _id).Select(x => x);
        return appointment;
    }

    public IQueryable<mic_book_appointment> getAppointmentsByDate(string _date_string)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var appointments = objHospital.mic_book_appointments.Where(x => x.date_string == _date_string).OrderBy(x=> x.date).Select(x => x);
        return appointments;
    }

    public IQueryable<mic_book_appointment> getAppointmentsByDateNotBooked(string _date_string)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var appointments = objHospital.mic_book_appointments.Where(x => x.date_string == _date_string && x.booked == false).OrderBy(x => x.date).Select(x => x);
        return appointments;
    }

    public bool commitInsert(DateTime _date, string _date_string)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_book_appointment objBook = new mic_book_appointment();
            objBook.date = _date;
            objBook.date_string = _date_string;
            objHospital.mic_book_appointments.InsertOnSubmit(objBook);
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _fname, string _lname, string _address, string _city, string _province, string _postal_code, string _phone, string _reason, bool _booked)
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
            objBook.reason = _reason;
            objBook.booked = _booked;
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
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//This page is the bridge between the class pages and the products.dbml file
public class contactClass
{
    public IQueryable<mic_contact> getMessages()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allContact = objHospital.mic_contacts.Select(x => x); // "x" represents all columns
        //var allProducts = from x in objProd.products select x; // This is the other way to write it
        return allContact;
    }

    public IQueryable<mic_contact> getMessageByID(int _id)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allContact = objHospital.mic_contacts.Where(x => x.Id == _id).Select(x => x);
        return allContact;
    }

    public bool commitInsert(string _fname, string _lname, string _email, string _city, string _province, string _subject, string _message)
    {
        hospitalDataContext objContact = new hospitalDataContext();
        using (objContact)
        {
            mic_contact objNewContact = new mic_contact();
            objNewContact.fname = _fname;
            objNewContact.lname = _lname;
            objNewContact.email = _email;
            objNewContact.city = _city;
            objNewContact.province = _province;
            objNewContact.subject = _subject;
            objNewContact.message = _message;
            objContact.mic_contacts.InsertOnSubmit(objNewContact);
            objContact.SubmitChanges();
            return true;
        }
    }
    public bool commitUpdate(int _id, string _fname, string _lname, string _email, string _city, string _province, string _subject, string _message)
    {
        hospitalDataContext objContact = new hospitalDataContext();
        using (objContact)
        {
            mic_contact objUpContact = objContact.mic_contacts.Single(x => x.Id == _id);
            objUpContact.fname = _fname;
            objUpContact.lname = _lname;
            objUpContact.email = _email;
            objUpContact.city = _city;
            objUpContact.province = _province;
            objUpContact.subject = _subject;
            objUpContact.message = _message;
            objContact.mic_contacts.InsertOnSubmit(objUpContact);
            objContact.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        hospitalDataContext objContact = new hospitalDataContext();
        using (objContact)
        {
            mic_contact objDelContact = objContact.mic_contacts.Single(x => x.Id == _id);
            objContact.mic_contacts.DeleteOnSubmit(objDelContact);
            objContact.SubmitChanges();
            return true;
        }
    }
}
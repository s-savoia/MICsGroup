using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class donationClass
{
    //Get All Donation Items
    public IQueryable<mic_donation> getDonation()
    {
        hospitalDataContext objDonation = new hospitalDataContext();
        var allDonation = objDonation.mic_donations.Select(x => x);
        return allDonation;
    }

    //Get Specific Career
    public IQueryable<mic_donation> getDonationByID(int _id)
    {
        hospitalDataContext objDonation = new hospitalDataContext();
        var allDonation = objDonation.mic_donations.Where(x => x.donation_id == _id).Select(x => x);
        return allDonation;
    }

    //Insert Donation Items
    public bool commitInsert(string _fname, string _lname, string _address, string _city, string _province, string _country, string _zip, string _phone, string _email, string _survey, string _comment, int _amount, string _payment_type, string _card_number, int _security_number, string _cardholder_name, string _expiration_month, string _expiration_year)
    {
        hospitalDataContext objDonation = new hospitalDataContext();
        using (objDonation)
        {
            mic_donation objNewDonation = new mic_donation();
            objNewDonation.fname = _fname;
            objNewDonation.lname = _lname;         
            objNewDonation.address = _address;
            objNewDonation.city = _city;
            objNewDonation.province = _province;
            objNewDonation.country = _country;           
            objNewDonation.zip = _zip;
            objNewDonation.phone = _phone;
            objNewDonation.email = _email;
            objNewDonation.survey = _survey;
            objNewDonation.comment = _comment;
            objNewDonation.amount = _amount;
            objNewDonation.payment_type = _payment_type;
            objNewDonation.card_number = _card_number;
            objNewDonation.security_number = _security_number;
            objNewDonation.cardholder_name = _cardholder_name;
            objNewDonation.expiration_month = _expiration_month;
            objNewDonation.expiration_year = _expiration_year;

            objDonation.mic_donations.InsertOnSubmit(objNewDonation);
            objDonation.SubmitChanges();
            return true;
        }
    }

    //Update Donation Item
    public bool commitUpdate(int _id, string _fname, string _lname, string _address, string _city, string _province, string _country, string _zip, string _phone, string _email, string _survey, string _comment, int _amount, string _payment_type, string _card_number, int _security_number, string _cardholder_name, string _expiration_month, string _expiration_year)
    {
        hospitalDataContext objDonation = new hospitalDataContext();
        using (objDonation)
        {
            var objUpDonation = objDonation.mic_donations.Single(x => x.donation_id == _id);
            objUpDonation.fname = _fname;
            objUpDonation.lname = _lname;
            objUpDonation.address = _address;
            objUpDonation.city = _city;
            objUpDonation.province = _province;
            objUpDonation.country = _country;
            objUpDonation.zip = _zip;
            objUpDonation.phone = _phone;
            objUpDonation.email = _email;
            objUpDonation.survey = _survey;
            objUpDonation.comment = _comment;
            objUpDonation.amount = _amount;
            objUpDonation.payment_type = _payment_type;
            objUpDonation.card_number = _card_number;
            objUpDonation.security_number = _security_number;
            objUpDonation.cardholder_name = _cardholder_name;
            objUpDonation.expiration_month = _expiration_month;
            objUpDonation.expiration_year = _expiration_year;
            objDonation.SubmitChanges();
            return true;
        }
    }

    //Delete Donation
    public bool commitDelete(int _id)
    {
        hospitalDataContext objDonation = new hospitalDataContext();
        using (objDonation)
        {
            var objDelDonation = objDonation.mic_donations.Single(x => x.donation_id == _id);
            objDonation.mic_donations.DeleteOnSubmit(objDelDonation);
            objDonation.SubmitChanges();
            return true;
        }
    }
}
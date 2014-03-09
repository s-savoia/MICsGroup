using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for locationsClass
/// </summary>
public class locationsClass
{
    public IQueryable<mic_location> getLocations()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allLocations = objHospital.mic_locations.Select(x => x); // "x" represents all columns
        //var allProducts = from x in objProd.products select x; // This is the other way to write it
        return allLocations;
    }

    public IQueryable<mic_location> getMessageByID(int _id)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var location = objHospital.mic_locations.Where(x => x.Id == _id).Select(x => x);
        return location;
    }

    public bool commitUpdate(int _id, string _name, string _image, string _description, decimal _lat, decimal _lng, string _phone)
    {
        hospitalDataContext objLocation = new hospitalDataContext();
        using (objLocation)
        {
            mic_contact objUpLocation = objLocation.mic_locations.Single(x => x.Id == _id);
            objUpLocation.fname = _name;
            objUpLocation.lname = _image;
            objUpLocation.email = _description;
            objUpLocation.city = _lat;
            objUpLocation.province = _lng;
            objUpLocation.subject = _phone;
            objLocation.mic_contacts.InsertOnSubmit(objUpLocation);
            objLocation.SubmitChanges();
            return true;
        }
    }

}
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
            mic_location objUpLocation = objLocation.mic_locations.Single(x => x.Id == _id);
            objUpLocation.name = _name;
            objUpLocation.image = _image;
            objUpLocation.description = _description;
            objUpLocation.lat = _lat;
            objUpLocation.lng = _lng;
            objUpLocation.phone = _phone;
            objLocation.mic_locations.InsertOnSubmit(objUpLocation);
            objLocation.SubmitChanges();
            return true;
        }
    }

}
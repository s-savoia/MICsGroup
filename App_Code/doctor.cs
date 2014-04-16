using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for doctor
/// </summary>
public class doctor
{
	public doctor()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<mic_location> getLocation()
    {
        hospitalDataContext objLocation = new hospitalDataContext();
        var allLocations = objLocation.mic_locations.Select(x => x);
        return allLocations;
    }

    public bool commitInsert(string _fname, string _lname, string _location, string _specialization, string _contact, string _email)
    {
        hospitalDataContext objDoctor = new hospitalDataContext();
        mic_doctorInformation objNewDoctor = new mic_doctorInformation();
        objNewDoctor.first_name = _fname;
        objNewDoctor.last_name = _lname;
        objNewDoctor.location = _location;
        objNewDoctor.specialization = _specialization;
        objNewDoctor.contact = _contact;
        objNewDoctor.email = _email;
        objDoctor.mic_doctorInformations.InsertOnSubmit(objNewDoctor);
        objDoctor.SubmitChanges();
        return true;
    }
}
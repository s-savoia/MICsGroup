using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for volunteerApplication
/// </summary>
public class volunteerApplication
{
	public volunteerApplication()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public IQueryable<mic_volunteer> getApplications()
    {
        hospitalDataContext objVolunteer = new hospitalDataContext();
        var allApplications = objVolunteer.mic_volunteers.Select(x => x);
        return allApplications;
    }

    public IQueryable<mic_volunteer> getApplicationByID(int _id)
    {
        hospitalDataContext objVolunteer = new hospitalDataContext();
        var application = objVolunteer.mic_volunteers.Where(x => x.Id == _id).Select(x => x);
        return application;
    }



    public bool commitInsert(string _fname, string _lname, string _title, string _dob, string _city, string _province, string _postalCode,
        string _home_phone, string _work_phone, string _personal_phone, string _email, string _emergency_contactName, string _emergency_contact,
        string _education_level, string _skills, string _experience, string _location, string _reason, string _resume)
    {
        hospitalDataContext objVolunteer = new hospitalDataContext();
        mic_volunteer objNewVolunteer = new mic_volunteer();
        objNewVolunteer.fname = _fname;
        objNewVolunteer.lname = _lname;
        objNewVolunteer.title = _title;
        objNewVolunteer.dob = _dob;
        objNewVolunteer.city = _city;
        objNewVolunteer.province = _province;
        objNewVolunteer.postalCode = _postalCode;
        objNewVolunteer.home_phone = _home_phone;
        objNewVolunteer.work_phone = _work_phone;
        objNewVolunteer.personal_phone = _personal_phone;
        objNewVolunteer.email = _email;
        objNewVolunteer.emergency_contactName = _emergency_contactName;
        objNewVolunteer.emergency_contact = _emergency_contact;
        objNewVolunteer.education_level = _education_level;
        objNewVolunteer.skills = _skills;
        objNewVolunteer.experience = _experience;
        objNewVolunteer.location = _location;
        objNewVolunteer.reason = _reason;
        objNewVolunteer.resume = _resume;
        objVolunteer.mic_volunteers.InsertOnSubmit(objNewVolunteer);
        objVolunteer.SubmitChanges();
        return true;
    }
}
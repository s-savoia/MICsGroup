using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class careerApplicationClass
{
    //Get All Careers
    public IQueryable<mic_career_application> getCareer()
    {
        hospitalDataContext objCareer = new hospitalDataContext();
        var allCareer = objCareer.mic_career_applications.Select(x => x);
        return allCareer;
    }

    //Get Specific Career
    public IQueryable<mic_career_application> getItemByID(int _id)
    {
        hospitalDataContext objCareer = new hospitalDataContext();
        var allCareer = objCareer.mic_career_applications.Where(x => x.career_id == _id).Select(x => x);
        return allCareer;
    }

    //Insert Career
    public bool commitInsert(string _fname, string _lname, string _email, string _address, int _country, int _province, string _city, string _zip, string _phone, int _ques_status, int _ques_crime, int _ques_certificate, int _skill_proficiency, int _skill_experience, string _resume, string _coverletter, string _reason, string _comment, int _consent)
    {
        hospitalDataContext objCareer = new hospitalDataContext();
        using (objCareer)
        {
            mic_career_application objNewCareer = new mic_career_application();
            objNewCareer.fname = _fname;
            objNewCareer.lname = _lname;
            objNewCareer.email = _email;
            objNewCareer.address = _address;
            objNewCareer.country = _country;
            objNewCareer.province = _province;
            objNewCareer.city = _city;
            objNewCareer.zip = _zip;
            objNewCareer.phone = _phone;
            objNewCareer.ques_status = _ques_status;
            objNewCareer.ques_crime = _ques_crime;
            objNewCareer.ques_certificate = _ques_certificate;
            objNewCareer.skill_proficiency = _skill_proficiency;
            objNewCareer.skill_experience = _skill_experience;
            objNewCareer.resume = _resume;
            objNewCareer.coverletter = _coverletter;
            objNewCareer.reason = _reason;
            objNewCareer.comment = _comment;
            objNewCareer.consent = _consent;
            objCareer.mic_career_applications.InsertOnSubmit(objNewCareer);
            objCareer.SubmitChanges();
            return true;
        }
    }

    //Update Career
    public bool commitUpdate(int _id, string _fname, string _lname, string _email, string _address, int _country, int _province, string _city, string _zip, string _phone, int _ques_status, int _ques_crime, int _ques_certificate, int _skill_proficiency, int _skill_experience, string _resume, string _coverletter, string _reason, string _comment, int _consent)
    {
        hospitalDataContext objCareer = new hospitalDataContext();
        using (objCareer)
        {
            var objUpCareer = objCareer.mic_career_applications.Single(x => x.career_id == _id);
            objUpCareer.fname = _fname;
            objUpCareer.lname = _lname;
            objUpCareer.email = _email;
            objUpCareer.address = _address;
            objUpCareer.country = _country;
            objUpCareer.province = _province;
            objUpCareer.city = _city;
            objUpCareer.zip = _zip;
            objUpCareer.phone = _phone;
            objUpCareer.ques_status = _ques_status;
            objUpCareer.ques_crime = _ques_crime;
            objUpCareer.ques_certificate = _ques_certificate;
            objUpCareer.skill_proficiency = _skill_proficiency;
            objUpCareer.skill_experience = _skill_experience;
            objUpCareer.resume = _resume;
            objUpCareer.coverletter = _coverletter;
            objUpCareer.reason = _reason;
            objUpCareer.comment = _comment;
            objUpCareer.consent = _consent;
            objCareer.SubmitChanges();
            return true;
        }
    }

    //Delete Career
    public bool commitDelete(int _id)
    {
        hospitalDataContext objCareer = new hospitalDataContext();
        using (objCareer)
        {
            var objDelCareer = objCareer.mic_career_applications.Single(x => x.career_id == _id);
            objCareer.mic_career_applications.DeleteOnSubmit(objDelCareer);
            objCareer.SubmitChanges();
            return true;
        }
    }
}
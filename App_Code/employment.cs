using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for employment
/// </summary>
public class employment
{
	public employment()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<mic_vemployment_history> getEmploymentByID(string _id)
    {
        hospitalDataContext objEmployment = new hospitalDataContext();
        var employment = objEmployment.mic_vemployment_histories.Where(x => x.emp_id == _id).Select(x => x);
        return employment;
    }

    public bool commitInsert(string _emp_id, string _fname, string _lname, string _job_title, string _work_phone, string _ext,
        string _start_date, string _end_date)
    {
        hospitalDataContext objEmployment = new hospitalDataContext();
        mic_vemployment_history objNewEmployment = new mic_vemployment_history();
        objNewEmployment.emp_id = _emp_id;
        objNewEmployment.fname = _fname;
        objNewEmployment.lname = _lname;
        objNewEmployment.job_title = _job_title;
        objNewEmployment.work_phone = _work_phone;
        objNewEmployment.ext = _ext;
        objNewEmployment.start_date = _start_date;
        objNewEmployment.end_date = _end_date;
        objEmployment.mic_vemployment_histories.InsertOnSubmit(objNewEmployment);
        objEmployment.SubmitChanges();
        return true;
    }
}
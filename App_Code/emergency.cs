using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for emergency
/// </summary>
public class emergency
{
	public emergency()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public IQueryable<mic_emergency_time> getDetails()
    {
        hospitalDataContext objemergency = new hospitalDataContext();
        var allDetails = objemergency.mic_emergency_times.Select(x => x);
        return allDetails;
    }

    public IQueryable<mic_emergency_time> getDetails(int _id)
    {
        hospitalDataContext objemergency = new hospitalDataContext();
        var allDetails = objemergency.mic_emergency_times.Where(x => x.Id == _id).Select(x => x);
        return allDetails;
    }

    public bool commitUpdate(int _id, string _location, int _patients)
    {
        hospitalDataContext objemergency = new hospitalDataContext();
        using (objemergency)
        {
            var objUpTime = objemergency.mic_emergency_times.Single(x => x.Id == _id);
            var time = _patients * 20;
            objUpTime.location = _location;
            objUpTime.patients = _patients;
            objUpTime.date = DateTime.Now.AddMinutes(time);
            objUpTime.time = Convert.ToString(objUpTime.date - DateTime.Now);
            objemergency.SubmitChanges();
            return true;
        }
    }
    public bool getDetail()
    {
        hospitalDataContext objemergency = new hospitalDataContext();


        var objUpTime = objemergency.mic_emergency_times.Select(x => x.Id);
        foreach (var x in objUpTime)
        {
            commitUpdateTime(x);
        }
        return true;

    }

    public bool commitUpdateTime(int _id)
    {
        hospitalDataContext objemergency = new hospitalDataContext();
        using (objemergency)
        {
            var objUpTime = objemergency.mic_emergency_times.Single(x => x.Id == _id);
            if (objUpTime.date > DateTime.Now)
            {

                objUpTime.time = (Convert.ToString(objUpTime.date - DateTime.Now)).Remove(8, 8);
                objemergency.SubmitChanges();
            }
            else
            {
                objUpTime.time = "00:00:00";
            }

            return true;
        }
    }

}
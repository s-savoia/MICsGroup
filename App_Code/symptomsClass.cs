using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class symptomsClass
{
    public IQueryable<mic_symptom> getSymptoms()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allSymptoms = objHospital.mic_symptoms.Select(x => x);        
        //var allSymptoms = objHospital.mic_symptoms.Select(s => new { symptom = s.symptom} );
        return allSymptoms;
    }

    public IQueryable<mic_services_bingham> getServicesBingham()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesBingham = objHospital.mic_services_binghams.Select(x => x);
        return allServicesBingham;
    }

    //public bool commitInsert(string _postion, string _location, string _details)   //  INSERT
    //{
    //    hospitalDataContext objJobPosting = new hospitalDataContext();
    //    using (objJobPosting)
    //    {
    //        mic_job_posting objNewJobPosting = new mic_job_posting();
    //        objNewJobPosting.position = _postion;
    //        objNewJobPosting.location = _location;
    //        objNewJobPosting.details = _details;
    //        objJobPosting.mic_job_postings.InsertOnSubmit(objNewJobPosting);
    //        objJobPosting.SubmitChanges();  // will commit change to database
    //        return true;
    //    }
    //}

    //public bool commitUpdate(int _id, string _position, string _location, string _details)
    //{
    //    hospitalDataContext objJobPosting = new hospitalDataContext();
    //    using (objJobPosting)
    //    {
    //        mic_job_posting objNewJobPosting = new mic_job_posting();
    //        var objUpJob = objJobPosting.mic_job_postings.Single(x => x.Id == _id);
    //        objNewJobPosting.position = _position;
    //        objNewJobPosting.location = _location;
    //        objNewJobPosting.details = _details;
    //        objJobPosting.SubmitChanges();
    //        return true;
    //    }
    //}

    //public bool commitDelete(int _id)
    //{
    //    hospitalDataContext objJobPosting = new hospitalDataContext();
    //    using (objJobPosting)
    //    {
    //        mic_job_posting objNewJobPosting = new mic_job_posting();
    //        var objDelJob = objJobPosting.mic_job_postings.Single(x => x.Id == _id);
    //        objJobPosting.mic_job_postings.DeleteOnSubmit(objDelJob);
    //        objJobPosting.SubmitChanges();
    //        return true;
    //    }
    //}
}
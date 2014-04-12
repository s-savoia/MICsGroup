using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// = = = CODED BY: JAMES HONG = = =

// JOB POSTINGS CLASS
public class jobPostingsClass
{
    // GET all job postings
    public IQueryable<mic_job_posting> getJobPostings()  
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allJobPostings = objHospital.mic_job_postings.Select(x => x);
        return allJobPostings;
    }
    // GET a single job posting by Id
    public IQueryable<mic_job_posting> getJobPostingById(int _id)  
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allJobPostings = objHospital.mic_job_postings.Where(x => x.Id == _id).Select(x => x);
        return allJobPostings;
    }
    //  INSERT a job posting into the database
    public bool commitInsert(string _postion, string _location, string _details)   
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_job_posting objNewJobPosting = new mic_job_posting();
            objNewJobPosting.position = _postion;
            objNewJobPosting.location = _location;
            objNewJobPosting.details = _details;
            objHospital.mic_job_postings.InsertOnSubmit(objNewJobPosting);
            objHospital.SubmitChanges();
            return true;
        }
    }
    // UPDATE a job posting
    public bool commitUpdate(int _id, string _position, string _location, string _details)   
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {            
            var objUpJob = objHospital.mic_job_postings.Single(x => x.Id == _id);
            objUpJob.position = _position;
            objUpJob.location = _location;
            objUpJob.details = _details;
            objHospital.SubmitChanges();
            return true;
        }
    }
    // DELETE a job posting
    public bool commitDelete(int _id)  
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {            
            var objDelJob = objHospital.mic_job_postings.Single(x => x.Id == _id);
            objHospital.mic_job_postings.DeleteOnSubmit(objDelJob);
            objHospital.SubmitChanges();
            return true;
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class jobPostingsClass
{
    public IQueryable<mic_job_posting> getJobPostings()  // GET all job postings
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allJobPostings = objHospital.mic_job_postings.Select(x => x);  
        return allJobPostings;
    }

    public IQueryable<mic_job_posting> getJobPostingById(int _id)  // GET a single job posting by Id
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allJobPostings = objHospital.mic_job_postings.Where(x => x.Id == _id).Select(x => x);
        return allJobPostings;
    }

    public bool commitInsert(string _postion, string _location, string _details)   //  INSERT a job posting into the database
    {
        hospitalDataContext objJobPosting = new hospitalDataContext();
        using (objJobPosting)
        {
            mic_job_posting objNewJobPosting = new mic_job_posting();
            objNewJobPosting.position = _postion;
            objNewJobPosting.location = _location;
            objNewJobPosting.details = _details;
            objJobPosting.mic_job_postings.InsertOnSubmit(objNewJobPosting);
            objJobPosting.SubmitChanges(); 
            return true;
        }
    }

    public bool commitUpdate(int _id, string _position, string _location, string _details)   // UPDATE a job posting
    {
        hospitalDataContext objJobPosting = new hospitalDataContext();
        using (objJobPosting)
        {
            mic_job_posting objNewJobPosting = new mic_job_posting();
            var objUpJob = objJobPosting.mic_job_postings.Single(x => x.Id == _id);
            objNewJobPosting.position = _position;
            objNewJobPosting.location = _location;
            objNewJobPosting.details = _details;
            objJobPosting.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)  // DELETE a job posting
    {
        hospitalDataContext objJobPosting = new hospitalDataContext();
        using (objJobPosting)
        {
            mic_job_posting objNewJobPosting = new mic_job_posting();
            var objDelJob = objJobPosting.mic_job_postings.Single(x => x.Id == _id);
            objJobPosting.mic_job_postings.DeleteOnSubmit(objDelJob);
            objJobPosting.SubmitChanges();
            return true;
        }
    }
}
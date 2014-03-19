using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class servicesClass
{
    public IQueryable<mic_services_bingham> getServicesBingham()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesBingham = objHospital.mic_services_binghams.Select(x => x);
        return allServicesBingham;
    }

    public IQueryable<mic_services_anson> getServicesAnson()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesAnson = objHospital.mic_services_ansons.Select(x => x);
        return allServicesAnson;
    }

    public IQueryable<mic_services_lady_minto> getServicesLadyMinto()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesLadyMinto = objHospital.mic_services_lady_mintos.Select(x => x);
        return allServicesLadyMinto;
    }

    //public IQueryable<mic_location> getLocations()
    //{
    //    hospitalDataContext objHospital = new hospitalDataContext();
    //    var allLocations = objHospital.mic_locations.Select(x => x);
    //    return allServicesLadyMinto;
    //}


    //public IQueryable<mic_services_bingham> getServicesBingham()
    //{
    //    hospitalDataContext objHospital = new hospitalDataContext();
    //    var allServicesBingham = objHospital.mic_services_binghams.Select(x => x);
    //    return allServicesBingham;
    //}

    //public IQueryable<mic_job_posting> getJobPostingById(int _id)
    //{
    //    hospitalDataContext objHospital = new hospitalDataContext();
    //    var allJobPostings = objHospital.mic_job_postings.Where(x => x.Id == _id).Select(x => x);
    //    return allJobPostings;
    //}

    ////public IQueryable<product> getProductByName(string _name)
    ////{
    ////    productsDataContext objProd = new productsDataContext();
    ////    var allProducts = objProd.products.Where(x => x.Name == _name).Select(x => x);
    ////    return allProducts;
    ////}

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
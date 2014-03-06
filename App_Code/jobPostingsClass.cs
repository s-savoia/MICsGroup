using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class jobPostingsClass
{
    public IQueryable<mic_job_posting> getJobPostings()
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allJobPostings = objHospital.mic_job_postings.Select(x => x);  
        return allJobPostings;
    }

    public IQueryable<mic_job_posting> getJobPostingById(int _id)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allJobPostings = objHospital.mic_job_postings.Where(x => x.Id == _id).Select(x => x);
        return allJobPostings;
    }

    //public IQueryable<product> getProductByName(string _name)
    //{
    //    productsDataContext objProd = new productsDataContext();
    //    var allProducts = objProd.products.Where(x => x.Name == _name).Select(x => x);
    //    return allProducts;
    //}

    //public bool commitInsert(string _postion, string _location, string _link)   //  INSERT
    //{
    //    hospitalDataContext objJobPosting = new hospitalDataContext();
    //    using (objJobPosting)
    //    {
    //        mic_job_posting objNewJobPosting = new mic_job_posting();
    //        objNewJobPosting.position = _postion;
    //        objNewJobPosting.location = _location;
    //        objNewJobPosting.link = _link;
    //        objNewJobPosting.mic_job_postings.InsertOnSubmit(objNewJobPosting);
    //        objNewJobPosting.SubmitChanges();  // will commit change to database
    //        return true;
    //    }
    //}

    //public bool commitUpdate(int _id, string _name, string _description, decimal _price)
    //{
    //    productsDataContext objProd = new productsDataContext();
    //    using (objProd)
    //    {
    //        var objUpProd = objProd.products.Single(x => x.Id == _id);
    //        objUpProd.Name = _name;
    //        objUpProd.Description = _description;
    //        objUpProd.Price = _price;
    //        objProd.SubmitChanges();
    //        return true;
    //    }
    //}

    //public bool commitDelete(int _id)
    //{
    //    productsDataContext objProd = new productsDataContext();
    //    using(objProd)
    //    {
    //        var objDelProd = objProd.products.Single(x => x.Id == _id);
    //        objProd.products.DeleteOnSubmit(objDelProd);
    //        objProd.SubmitChanges();
    //        return true;
    //    }
    //}
}
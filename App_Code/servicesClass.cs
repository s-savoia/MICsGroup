using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class servicesClass
{
    public IQueryable<mic_services_bingham> getServicesBingham()  // GET all Bingham services
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesBingham = objHospital.mic_services_binghams.Select(x => x);
        return allServicesBingham;
    }

    public IQueryable<mic_services_anson> getServicesAnson()  // GET all Anson services
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesAnson = objHospital.mic_services_ansons.Select(x => x);
        return allServicesAnson;
    }

    public IQueryable<mic_services_lady_minto> getServicesLadyMinto()  // GET all Lady Minto services
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allServicesLadyMinto = objHospital.mic_services_lady_mintos.Select(x => x);
        return allServicesLadyMinto;
    }

    public IQueryable<mic_services_bingham> getServiceBinghamById(int _id)  // GET a single Bingham service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var serviceBingham = objHospital.mic_services_binghams.Where(x => x.id == _id).Select(x => x);
        return serviceBingham;
    }

    public IQueryable<mic_services_anson> getServiceAnsonById(int _id)  // GET a single Anson service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var serviceAnson = objHospital.mic_services_ansons.Where(x => x.id == _id).Select(x => x);
        return serviceAnson;
    }

    public IQueryable<mic_services_lady_minto> getServiceLadyMintoById(int _id)  // GET a single Lady Minto service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var serviceLadyMinto = objHospital.mic_services_lady_mintos.Where(x => x.id == _id).Select(x => x);
        return serviceLadyMinto;
    }


    ////public IQueryable<product> getProductByName(string _name)
    ////{
    ////    productsDataContext objProd = new productsDataContext();
    ////    var allProducts = objProd.products.Where(x => x.Name == _name).Select(x => x);
    ////    return allProducts;
    ////}

    public bool commitInsertBingham(string _service, string _unique, string _location, string _details)   //  INSERT new Bingham service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_bingham objNewService = new mic_services_bingham();
            objNewService.service = _service;
            objNewService.unique = _unique;
            objNewService.location = _location;
            objNewService.details = _details;
            objHospital.mic_services_binghams.InsertOnSubmit(objNewService);
            objHospital.SubmitChanges(); 
            return true;
        }
    }

    public bool commitInsertAnson(string _service, string _unique, string _location, string _details)   //  INSERT new Anson service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_anson objNewService = new mic_services_anson();
            objNewService.service = _service;
            objNewService.unique = _unique;
            objNewService.location = _location;
            objNewService.details = _details;
            objHospital.mic_services_ansons.InsertOnSubmit(objNewService);
            objHospital.SubmitChanges();  
            return true;
        }
    }

    public bool commitInsertLadyMinto(string _service, string _unique, string _location, string _details)   //  INSERT new Lady Minto service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_lady_minto objNewService = new mic_services_lady_minto();
            objNewService.service = _service;
            objNewService.unique = _unique;
            objNewService.location = _location;
            objNewService.details = _details;
            objHospital.mic_services_lady_mintos.InsertOnSubmit(objNewService);
            objHospital.SubmitChanges();  
            return true;
        }
    }

    public bool commitUpdateBingham(int _id, string _service, string _unique, string _location, string _details)   //  UPDATE a  Bingham service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_bingham objService = new mic_services_bingham();
            var objUpServiceBingham = objHospital.mic_services_binghams.Single(x => x.id == _id);
            objService.service = _service;
            objService.unique = _unique;
            objService.location = _location;
            objService.details = _details;            
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdateAnson(int _id, string _service, string _unique, string _location, string _details)   //  UPDATE a  Anson service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_anson objService = new mic_services_anson();
            var objUpServiceAnson = objHospital.mic_services_ansons.Single(x => x.id == _id);
            objService.service = _service;
            objService.unique = _unique;
            objService.location = _location;
            objService.details = _details;
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdateLadyMinto(int _id, string _service, string _unique, string _location, string _details)   //  UPDATE a  Lady Minto service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_lady_minto objService = new mic_services_lady_minto();
            var objUpServiceLadyMinto = objHospital.mic_services_lady_mintos.Single(x => x.id == _id);
            objService.service = _service;
            objService.unique = _unique;
            objService.location = _location;
            objService.details = _details;
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitDeleteBingham(int _id)   //  DELETE a  Bingham service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_bingham objService = new mic_services_bingham();
            var objDelServiceBingham = objHospital.mic_services_binghams.Single(x => x.id == _id);
            objHospital.mic_services_binghams.DeleteOnSubmit(objService);
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitDeleteAnson(int _id)   //  DELETE an  Anson service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_anson objService = new mic_services_anson();
            var objDelServiceAnson = objHospital.mic_services_ansons.Single(x => x.id == _id);
            objHospital.mic_services_ansons.DeleteOnSubmit(objService);
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitDeleteLadyMinto(int _id)   //  DELETE a  Lady Minto service
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_services_lady_minto objService = new mic_services_lady_minto();
            var objDelServiceLadyMinto = objHospital.mic_services_lady_mintos.Single(x => x.id == _id);
            objHospital.mic_services_lady_mintos.DeleteOnSubmit(objService);
            objHospital.SubmitChanges();
            return true;
        }
    }

}
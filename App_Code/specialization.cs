using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for specialization
/// </summary>
public class specialization
{
	public specialization()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<mic_specialization> getSpecialization()
    {
        hospitalDataContext objSpecialization = new hospitalDataContext();
        var allSpecialization = objSpecialization.mic_specializations.Select(x => x);
        return allSpecialization;
    }

    public bool commitInsert(string _sname)
    {
        hospitalDataContext objSpecialization = new hospitalDataContext();
        mic_specialization objNewSpecialization = new mic_specialization();
        objNewSpecialization.specialization = _sname;
        objSpecialization.mic_specializations.InsertOnSubmit(objNewSpecialization);
        objSpecialization.SubmitChanges();
        return true;
    }

    public bool commitDelete(int _id)
    {
        hospitalDataContext objSpecialization = new hospitalDataContext();
        using (objSpecialization)
        {
            var objDelSpecialization = objSpecialization.mic_specializations.Single(x => x.Id == _id);
            objSpecialization.mic_specializations.DeleteOnSubmit(objDelSpecialization);
            objSpecialization.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _sname)
    {
        hospitalDataContext objSpecialization = new hospitalDataContext();
        using (objSpecialization)
        {
            var objUpSpecialization = objSpecialization.mic_specializations.Single(x => x.Id == _id);
            objUpSpecialization.specialization = _sname;
            objSpecialization.SubmitChanges();
            return true;
        }
    }
}
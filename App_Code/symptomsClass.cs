using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class symptomsClass
{
    // = = = SYMPTOMS = = = 
    public IQueryable<mic_symptom> getSymptoms()  // GET all symptoms
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allSymptoms = objHospital.mic_symptoms.Select(x => x);        
        return allSymptoms;
    }

    public bool commitInsertSymptom(string _symptom)   //  INSERT a symptom
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_symptom objNewSymptom = new mic_symptom();
            objNewSymptom.symptom = _symptom;
            objHospital.mic_symptoms.InsertOnSubmit(objNewSymptom);
            objHospital.SubmitChanges();  
            return true;
        }
    }

    public bool commitUpdateSymptom(int _id, string _symptom)   //  UPDATE a symptom
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_symptom objSymptom = new mic_symptom();
            var objUpSymptom = objHospital.mic_symptoms.Single(x => x.id == _id);
            objSymptom.symptom = _symptom;            
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitDeleteSymptom(int _id)   //  DELETE a symptom
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_symptom objSymptom = new mic_symptom();
            var objDelSymptom = objHospital.mic_symptoms.Single(x => x.id == _id);
            objHospital.mic_symptoms.DeleteOnSubmit(objDelSymptom);
            objHospital.SubmitChanges();
            return true;
        }
    }
      
}
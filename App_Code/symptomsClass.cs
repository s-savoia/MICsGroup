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

    // = = = ADVICE = = = 

    public IQueryable<mic_advice> getAdvice()  // GET all advice
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allAdvice = objHospital.mic_advices.Select(x => x);
        return allAdvice;
    }

    public bool commitInsertAdvice(string _advice)   //  INSERT a level of advice
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_advice objAdvice = new mic_advice();
            objAdvice.advice = _advice;
            objHospital.mic_advices.InsertOnSubmit(objAdvice);
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdateAdvice(int _level, string _advice)   //  UPDATE a level of advice
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_advice objAdvice = new mic_advice();
            var objUpAdvice = objHospital.mic_advices.Single(x => x.level == _level);
            objAdvice.advice = _advice;
            objHospital.SubmitChanges();
            return true;
        }
    }

    public bool commitDeleteAdvice(int _level)   //  DELETE a level of advice
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        using (objHospital)
        {
            mic_advice objAdvice = new mic_advice();
            var objDelAdvice = objHospital.mic_advices.Single(x => x.level == _level);
            objHospital.mic_advices.DeleteOnSubmit(objDelAdvice);
            objHospital.SubmitChanges();
            return true;
        }
    }
}
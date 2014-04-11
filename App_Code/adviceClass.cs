using System;
using System.Collections.Generic;
using System.Linq;   
using System.Web;


public class adviceClass
{
    public IQueryable<mic_advice> getAdvice() // GET all advice
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allAdvice = objHospital.mic_advices.Select(x => x);
        return allAdvice;
    }

    public IQueryable<mic_advice> getAdviceByLevel(int _level)
    {
        hospitalDataContext objHospital = new hospitalDataContext();
        var allAdvice = objHospital.mic_advices.Where(x => x.level ==_level).Select(x => x);
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
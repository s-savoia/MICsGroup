using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bill
/// </summary>
public class bill
{
	public bill()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<mic_pay_bill> getTransactions()
    {
        hospitalDataContext objTransaction = new hospitalDataContext();
        var allTransactions = objTransaction.mic_pay_bills.Select(x => x);
        return allTransactions;
    }

    public IQueryable<mic_pay_bill> getTransactiobByID(int _id)
    {
        hospitalDataContext objTransaction = new hospitalDataContext();
        var Transaction = objTransaction.mic_pay_bills.Where(x => x.Id == _id).Select(x => x);
        return Transaction;
    }



    public bool commitInsert(string _fname, string _lname, string _address, string _city, string _province, string _postalCode,
       string _phone, string _email, string _amount)
    {
        hospitalDataContext objTransaction = new hospitalDataContext();
        mic_pay_bill objNewTransaction = new mic_pay_bill();
        objNewTransaction.fname = _fname;
        objNewTransaction.lname = _lname;
        objNewTransaction.address = _address;
        objNewTransaction.city = _city;
        objNewTransaction.province = _province;
        objNewTransaction.zip = _postalCode;
        objNewTransaction.phone = _phone;
        objNewTransaction.email = _email;
        objNewTransaction.amount = _amount;
        objTransaction.mic_pay_bills.InsertOnSubmit(objNewTransaction);
        objTransaction.SubmitChanges();
        return true;
    }

    public bool commitDelete(int _id)
    {
        hospitalDataContext objTransaction = new hospitalDataContext();
        using (objTransaction)
        {
            var objDelTransaction = objTransaction.mic_pay_bills.Single(x => x.Id == _id);
            objTransaction.mic_pay_bills.DeleteOnSubmit(objDelTransaction);
            objTransaction.SubmitChanges();
            return true;
        }
    }
}
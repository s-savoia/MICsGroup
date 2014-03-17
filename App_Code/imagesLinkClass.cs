using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class imagesLinkClass
{
	
    //public IQueryable<hospital> getAlert()
    public IQueryable<mic_slider> getImages()
    {
        //linea 25 o 25 del codigo
        //creating an instance of our LINQ object

        hospitalDataContext objHospitalDC = new hospitalDataContext();

        // methot syntax
        // creating an anonymous variable with its value being the instance of our LINQ object
        var allImages = objHospitalDC.mic_sliders.Select(x=>x);


        //x son todas las columnas
        //return IQueryable<product> for data bound control to bind to

        return allImages;  //return allProducts;
    }

    public IQueryable<mic_slider> getImageByID(int _id)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        var allImages = objHospitalDC.mic_sliders.Where(x => x.Id == _id).Select(x => x);
        return allImages;
    }


    //******** INSERT *******//

    public bool commitInsert(string _img, string _name, string _link)
    {
        // to ensure all data will be disposed when finished

        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {
            //create an instance of the table
            mic_slider objNewImages = new mic_slider();

            //set table columns to new values being pass from *.aspx page

            objNewImages.img = _img;
            objNewImages.name=_name;
            objNewImages.name=_link;


            //insert comand
            objHospitalDC.mic_sliders.InsertOnSubmit(objNewImages);

            //commit insert against database
            objHospitalDC.SubmitChanges();
            return true;

        }
    }

    //******** UPDATE *******//

    public bool commitUpdate(int _id, string _img, string _name, string _link)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {

            var objUPhospital = objHospitalDC.mic_sliders.Single(x => x.Id == _id);

            
            objUPhospital.img = _img;
            objUPhospital.name = _name;
            objUPhospital.link = _link;

            objHospitalDC.SubmitChanges();
            return true;

        }
    }

    //******** DELETE *******//

    public bool commitDelete(int _id)
    {
        hospitalDataContext objHospitalDC = new hospitalDataContext();

        using (objHospitalDC)
        {
            //anonymous
            var objDelHosp = objHospitalDC.mic_sliders.Single(x => x.Id == _id);

            //delete command            
            objHospitalDC.mic_sliders.DeleteOnSubmit(objDelHosp);

            //commit delete against DB
            objHospitalDC.SubmitChanges();
            return true;

        }
    }


}



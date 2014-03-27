using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class symptom : System.Web.UI.Page
{

    symptomsClass objSymptoms = new symptomsClass();
    adviceClass objAdvice = new adviceClass();
        
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bll_advice.DataSource = objAdvice.getAdvice();
            bll_advice.DataBind();

            cbl_symptoms.DataSource = objSymptoms.getSymptoms();  
            cbl_symptoms.DataBind();

            bll_advice.DataSource = objAdvice.getAdvice();
            bll_advice.DataBind();
        }
    }

    protected void sub_admin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "getAdvice":
                int count = 0;
                string advice = "";
                foreach (ListItem item in cbl_symptoms.Items)
                {

                    if (item.Selected)
                    {
                        count++;
                        advice += item + ", ";
                    }

                    switch (count)
                    {
                        case (1):
                            lbl_advice.Text = "1 symptom - " + advice;
                            break;

                        case (2):
                            lbl_advice.Text = "2 symptoms - " + advice;
                            break;

                        case (3):
                            lbl_advice.Text = "3 symptoms - " + advice;
                            break;
                        default:
                            lbl_advice.Text = "many symptoms - " + advice;
                            break;
                    }


                }

                break;

            case "cancel":
                cbl_symptoms.ClearSelection();

                lbl_advice.Text = "cancelled <br />";
                break;
        }
    }


}
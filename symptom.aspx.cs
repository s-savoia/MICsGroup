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

            cbl_symptoms.DataSource = objSymptoms.getSymptoms();
            cbl_symptoms.DataBind();

        }
    }

    protected void sub_admin(object sender, CommandEventArgs e)
    {
        pnl_advice.Visible = true;

        switch (e.CommandName)
        {
            case "getAdvice":
                int count = 0;
                foreach (ListItem symptom in cbl_symptoms.Items)
                {

                    if (symptom.Selected)
                    {
                        count++;
                    }

                    switch (count)
                    {
                        case (1):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            break;

                        case (2):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            break;

                        case (3):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            break;
                        default:
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(4);
                            bll_advice.DataBind();
                            break;
                    }


                }

                break;

            case "clear":
                cbl_symptoms.ClearSelection();

                pnl_advice.Visible = false;
                break;
        }
    }


}
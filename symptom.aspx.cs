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
        
        pnl_symptomsList.Visible = false;

        pnl_buttons.Visible = false;

        int numOfsymptoms = 0;

        foreach (ListItem symptom in cbl_symptoms.Items)
        {
            numOfsymptoms++;
        }

        if (numOfsymptoms != 0)
        {
            pnl_symptomsList.Visible = true;
            pnl_buttons.Visible = true;            
        }
        else
        {
            Label lblUnderConstruction = (Label)udp_symptoms.FindControl("lbl_underConstruction");
            lblUnderConstruction.Visible = true;
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

                    Label lblAdvice = (Label)udp_advice.FindControl("lbl_advice");

                    switch (count)
                    {
                        case (0):                            
                            lblAdvice.Text = "You did not select any symptoms. Please select at least one symptom to receive advice.";
                            bll_advice.Visible = false;
                            break;
                        case (1):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            lblAdvice.Text = "Advice";
                            bll_advice.Visible = true;
                            break;

                        case (2):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            lblAdvice.Text = "Advice";
                            bll_advice.Visible = true;
                            break;

                        case (3):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            lblAdvice.Text = "Advice";
                            bll_advice.Visible = true;
                            break;
                        default:
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(4);
                            bll_advice.DataBind();
                            lblAdvice.Text = "Advice";
                            bll_advice.Visible = true;
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
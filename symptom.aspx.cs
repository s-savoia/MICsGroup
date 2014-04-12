using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// = = = CODED BY: JAMES HONG = = =

public partial class symptom : System.Web.UI.Page
{
    // create instances of two different classes. one for symptoms, and one for advice
    symptomsClass objSymptoms = new symptomsClass();
    adviceClass objAdvice = new adviceClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        // when the page first loads, get all the symptoms data from the mic_symptoms table and bind it to the symptoms checkbox list
        if (!Page.IsPostBack)
        {
            cbl_symptoms.DataSource = objSymptoms.getSymptoms();
            cbl_symptoms.DataBind();           
        }
        // hide the symptoms list
        pnl_symptomsList.Visible = false;

        // hide the buttons to get advice
        pnl_buttons.Visible = false;

        // the number of symptoms starts at zero
        int numOfsymptoms = 0;

        // count each symptom in the symptoms list 
        foreach (ListItem symptom in cbl_symptoms.Items)
        {
            numOfsymptoms++;
        }

        // if there is at least one symptom, show the symptom(s) and the buttons to get advice
        if (numOfsymptoms != 0)
        {
            pnl_symptomsList.Visible = true;
            pnl_buttons.Visible = true;            
        }
        else
        {
            // if there aren't any symptoms in the mic_symptoms table, display a message saying so
            Label lblUnderConstruction = (Label)udp_symptoms.FindControl("lbl_underConstruction");
            lblUnderConstruction.Visible = true;
        }
    }
    // control subroutine for buttons (get advice or clear
    protected void sub_admin(object sender, CommandEventArgs e)
    {
        // display the advice panel
        pnl_advice.Visible = true;

        switch (e.CommandName)
        {
            // if the 'get advice' button was clicked, count the number of selected symptoms in the symptoms list
            case "getAdvice":
                int count = 0;
                foreach (ListItem symptom in cbl_symptoms.Items)
                {

                    if (symptom.Selected)
                    {
                        count++;
                    }

                    Label lblAdvice = (Label)udp_advice.FindControl("lbl_advice");

                    // based on the number of counted symptoms, bind the data from the mic_advice table and display the advice. 
                    switch (count)
                    {
                        case (0):                            
                            lblAdvice.Text = "You did not select any symptoms. Please select at least one symptom to receive advice.";
                            bll_advice.Visible = false;
                            break;
                        case (1):
                            bll_advice.DataSource = objAdvice.getAdviceByLevel(count);
                            bll_advice.DataBind();
                            lblAdvice.Text = "Advice"; // this is just a heading, and not the actual advice
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
            // if the 'clear' button was clicked, clear the symptoms checkbox list and hide the advice panel
            case "clear":
                cbl_symptoms.ClearSelection();

                pnl_advice.Visible = false;
                break;
        }
    }


}
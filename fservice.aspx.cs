using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// = = = CODED BY: JAMES HONG = = =

public partial class Default2 : System.Web.UI.Page
{
    // instace of a class
    servicesClass objService = new servicesClass();

    // when the page load completely, set this page's title
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Humber MICs Group | Find a Service";
    }

    // when a row in the bingdam DetailsView control is bound (same process for when a row in the Anson and Lady Minto DetailsView control is bound)
    protected void dtv_bingham_DataBound(object sender, EventArgs e)
    {

        // This is a pager row
        DetailsViewRow pagerRow = dtv_bingham.BottomPagerRow;


        // These labels display the current page number and the total number of pages.
        Label pageNum = (Label)pagerRow.Cells[0].FindControl("lbl_pageNumber");
        Label totalNum = (Label)pagerRow.Cells[0].FindControl("lbl_totalPages");

        // If there are pages (for services)
        if ((pageNum != null) && (totalNum != null))
        {
            // Page number (page) and total number of pages (count)
            int page = dtv_bingham.DataItemIndex + 1;
            int count = dtv_bingham.DataItemCount;

            // labels for Bingham pager
            pageNum.Text = page.ToString();
            totalNum.Text = count.ToString();
        }
    }
    // same process as Bingham
    protected void dtv_anson_DataBound(object sender, EventArgs e)
    {

        // This is a pager row.
        DetailsViewRow pagerRow = dtv_anson.BottomPagerRow;


        // These labels display the current page number and the total number of pages.
        Label pageNum = (Label)pagerRow.Cells[0].FindControl("lbl_pageNumber");
        Label totalNum = (Label)pagerRow.Cells[0].FindControl("lbl_totalPages");

        if ((pageNum != null) && (totalNum != null))
        {
            // Page number and total number of pages
            int page = dtv_anson.DataItemIndex + 1;
            int count = dtv_anson.DataItemCount;

            pageNum.Text = page.ToString();
            totalNum.Text = count.ToString();
        }
    }

    // same process as Bingham
    protected void dtv_lady_minto_DataBound(object sender, EventArgs e)
    {

        // This is a pager row.
        DetailsViewRow pagerRow = dtv_lady_minto.BottomPagerRow;


        // These labels display the current page number and the total number of pages.
        Label pageNum = (Label)pagerRow.Cells[0].FindControl("lbl_pageNumber");
        Label totalNum = (Label)pagerRow.Cells[0].FindControl("lbl_totalPages");

        if ((pageNum != null) && (totalNum != null))
        {
            // Page number and total number of pages
            int page = dtv_lady_minto.DataItemIndex + 1;
            int count = dtv_lady_minto.DataItemCount;

            pageNum.Text = page.ToString();
            totalNum.Text = count.ToString();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // call this function
        _subRebind();
    }

    // bind the data sources to the hospital DetailsView controls
    private void _subRebind()
    {
        dtv_bingham.DataSource = objService.getServicesBingham();
        dtv_bingham.DataBind();


        dtv_anson.DataSource = objService.getServicesAnson();
        dtv_anson.DataBind();

        dtv_lady_minto.DataSource = objService.getServicesLadyMinto();
        dtv_lady_minto.DataBind();
        
    }
    // control subroutine for changing pages
    public void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            // start the change page process for Bingham
            case "changePageB":

                changePage(e.CommandName, e.CommandArgument.ToString());

                break;
            // start the change page process for Anson
            case "changePageA":

                changePage(e.CommandName, e.CommandArgument.ToString());

                break;
            // start the change page process for Lady Minto
            case "changePageLM":

                changePage(e.CommandName, e.CommandArgument.ToString());

                break;
        }
    }

    // pass control to set the direction of the changing page process (previous page or next page)
    private void changePage(string commandName, string direction)
    {
        switch (commandName)
        {
            case "changePageB":
                setDirection(commandName, direction);
                break;

            case "changePageA":
                setDirection(commandName, direction);
                break;

            case "changePageLM":
                setDirection(commandName, direction);
                break;
        }

    }
    // pass control to set the page of a certain hospital's DetailsView control
    private void setDirection(string commandName, string direction)
    {

        switch (direction)
        {
            case "Prev":

                setDetailsView(direction, commandName);


                //test.Text = page.ToString();
                break;

            case "Next":

                setDetailsView(direction, commandName);

                //test.Text = page.ToString();
                break;
        }
    }
    // depending on the hospital that is changing pages, set the current page (page_, where _ = B, A, or LM) and total page numbers (count_, where _ = B, A, or LM)
    private void setDetailsView(string direction, string commandName)
    {
        switch (commandName)
        {
            case "changePageB":
                int pageB = dtv_bingham.PageIndex;
                int countB= dtv_bingham.DataItemCount;

                setPage(direction, pageB,countB, dtv_bingham);
                break;
            case "changePageA":
                int pageA = dtv_anson.PageIndex;
                int countA = dtv_anson.DataItemCount;

                setPage(direction, pageA,countA, dtv_anson);
                break;
            case "changePageLM":
                int pageLM = dtv_lady_minto.PageIndex;
                int countLM = dtv_lady_minto.DataItemCount;

                setPage(direction, pageLM, countLM, dtv_lady_minto);
                break;
        }
    }

    // set the page to be displayed
    private void setPage(string direction, int page, int count, DetailsView dtv)
    {
        switch (direction)
        {
            case "Prev":
                // if changing to the previous page of page 1, display the last page
                if (page == 0)
                {
                    page = count - 1;
                    dtv.PageIndex = page;

                }
                else
                {
                    // display the previous page
                    dtv.PageIndex--;
                }
                
                break;

            case "Next":
                // if changing to the next page of the last page, display the first page
                if (page == count - 1)
                {
                    page = 0;
                    dtv.PageIndex = page;

                }
                else
                {
                    // display the next page
                    dtv.PageIndex++;
                }
                break;
        }
                
    }
}







using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    servicesClass objService = new servicesClass();

    protected void dtv_bingham_DataBound(object sender, EventArgs e)
    {

        // This is a pager row.
        DetailsViewRow pagerRow = dtv_bingham.BottomPagerRow;


        // These labels display the current page number and the total number of pages.
        Label pageNum = (Label)pagerRow.Cells[0].FindControl("lbl_pageNumber");
        Label totalNum = (Label)pagerRow.Cells[0].FindControl("lbl_totalPages");

        if ((pageNum != null) && (totalNum != null))
        {
            // Page number and total number of pages
            int page = dtv_bingham.DataItemIndex + 1;
            int count = dtv_bingham.DataItemCount;

            pageNum.Text = page.ToString();
            totalNum.Text = count.ToString();
        }
    }

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
        _subRebind();

        //if (!Page.IsPostBack)
        //{
        //    dtv_bingham.PageIndex = 1;
        //    dtv_anson.PageIndex = 1;
        //    dtv_lady_minto.PageIndex = 1;
        //}
    }

    private void _subRebind()
    {
        dtv_bingham.DataSource = objService.getServicesBingham();
        dtv_bingham.DataBind();


        dtv_anson.DataSource = objService.getServicesAnson();
        dtv_anson.DataBind();

        dtv_lady_minto.DataSource = objService.getServicesLadyMinto();
        dtv_lady_minto.DataBind();
        
    }

    public void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "changePageB":

                changePage(e.CommandName, e.CommandArgument.ToString());

                break;

            case "changePageA":

                changePage(e.CommandName, e.CommandArgument.ToString());

                break;

            case "changePageLM":

                changePage(e.CommandName, e.CommandArgument.ToString());

                break;
        }
    }

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

    private void setPage(string direction, int page, int count, DetailsView dtv)
    {
        switch (direction)
        {
            case "Prev":
                if (page == 0)
                {
                    page = count - 1;
                    dtv.PageIndex = page;

                }
                else
                {
                    dtv.PageIndex--;
                }
                
                break;

            case "Next":

                if (page == count - 1)
                {
                    page = 0;
                    dtv.PageIndex = page;

                }
                else
                {
                    dtv.PageIndex++;
                }
                break;
        }
                
    }
}







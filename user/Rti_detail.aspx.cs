﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Rti_detail : System.Web.UI.Page
{
    Utilities ul = new Utilities();
    bl_login bl = new bl_login();
    dl_login dl = new dl_login();
    ReturnClass.ReturnDataTable dt = new ReturnClass.ReturnDataTable();
    protected void Page_PreRender(object sender, EventArgs e)
    {
        ViewState["CheckRefresh"] = Session["CheckRefresh"];
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());

            if (Session["username"] == null)
            {
                Response.Redirect("../LogOut.aspx");
            }
            else
            {
              griddatabind();
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        griddatabind();
    }
    public void griddatabind()
    {
        bl.UserID = Session["username"].ToString();
        dt = dl.Select_Rti_By_User(bl);

        int row = dt.table.Rows.Count;
        int page;
        if (row % 20 == 0)
        {
            page = row / 20;
        }
        else
        {
            page = row / 20;
            page = page + 1;
        }

        lbl_count.Text = "Total Rows = " + row.ToString() + "  and  Total page = " + page.ToString() + "";
        GridView1.DataSource = dt.table;
        GridView1.DataBind();

        //GridView1.DataSource = dt.table;
        //GridView1.DataBind();
       
    }
    //public void grd_rti_dtl_Databind()
    //{
    //    dt = dl.Select_Rti_Action_detail(bl);
    //    grd_rti_dtl.DataSource = dt.table;
    //    grd_rti_dtl.DataBind();

    //}
    protected void lnk_id_Click(object sender, EventArgs e)
    {
        
        string  encrypt_b=  ((LinkButton)sender).CommandArgument.ToString();

        string key = System.Configuration.ConfigurationManager.AppSettings["EncKey"].ToString();
        Utilities ut = new Utilities();
        bl.RTIID   = ut.Encrypt_AES(encrypt_b, key);

        Response.Redirect("Detail_Rti.aspx?rtiid=" + bl.RTIID + "");
      //  grd_rti_dtl_Databind();

    }
    //protected void grd_rti_dtl_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    grd_rti_dtl.PageIndex = e.NewPageIndex;
    //    grd_rti_dtl_Databind();
    //}
}
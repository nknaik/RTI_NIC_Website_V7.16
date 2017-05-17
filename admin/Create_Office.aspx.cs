﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dio_Create_Office : System.Web.UI.Page
{
    dl_Dio dl = new dl_Dio();
    bl_Dio bl = new bl_Dio();
    ReturnClass.ReturnBool rb = new ReturnClass.ReturnBool();
    ReturnClass.ReturnDataTable rd = new ReturnClass.ReturnDataTable();
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
                bl.Userid = Session["username"].ToString();
                bl.Ofc_mappingid = Session["EmpMapID"].ToString();
                rd = dl.select_admin_info(bl);
                if (rd.table.Rows.Count > 0)
                {

                    //  bl.Role = rd.table.Rows[0]["RollID"].ToString();
                    bl.Role = Session["role"].ToString();
                    if (bl.Role == "1")
                    {

                        bl.State = rd.table.Rows[0]["state_id"].ToString();
                        bind_ddl_district();
                        bindgrd_ofc();
                        bind_department();
                        bind_ddl_officelevel();
                        bind_ddl_category();
                    }
                    else if (bl.Role == "4")
                    {
                        bl.District = rd.table.Rows[0]["district_id"].ToString();
                        bl.State = rd.table.Rows[0]["state_id"].ToString();
                        bind_ddl_district();
                        rfv_district.Enabled = false;
                        district.Visible = true;
                        ddl_district.Enabled = false;
                        ddl_district.SelectedValue = bl.District;
                        bindgrd_ofc();
                        bind_department();
                        bind_ddl_officelevel();
                        bind_ddl_category();
                    }
                    else
                    {
                        Utilities.MessageBox_UpdatePanel_Redirect(udp, "You Are Not Authorised For Creating Office", "../admin/loginAdmin.aspx");
                    }
                }
            }
        }
    }
    protected void btn_create_Click(object sender, EventArgs e)
    {
        if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
        {
            Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            if (Page.IsValid)
            {
                bl.Userid = Session["username"].ToString();
                rd = dl.select_admin_info(bl);
                if (rd.table.Rows[0]["RollID"].ToString() == "1")
                {

                    bl.State = rd.table.Rows[0]["state_id"].ToString();
                    bl.District = ddl_district.SelectedValue;
                    bl.Base_department = ddl_department.SelectedValue;
                    bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
                }
                else if (rd.table.Rows[0]["RollID"].ToString() == "4")
                {
                    bl.Officelevelcode = "00";
                    bl.Role = rd.table.Rows[0]["RollID"].ToString();
                    bl.State = rd.table.Rows[0]["state_id"].ToString();
                    bl.District = rd.table.Rows[0]["district_id"].ToString();
                    bl.Base_department = ddl_department.SelectedValue;
                    bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
                }
                bl.Country = "091";
                bl.Office = txt_office.Text;
                bl.Address = txt_address.Text;
                bl.Contact = txt_contact.Text;
                bl.Fax = txt_fax.Text;
                bl.Email = txt_email.Text;
                bl.Url = txt_url.Text;
                bl.Officeid = dl.Max_office_code(bl);
                bl.Category = ddl_category.SelectedValue;
                rb = dl.insert_office(bl);
                bindgrd_ofc();
                if (rb.status == true)
                {
                    txt_address.Text = "";
                    txt_contact.Text = "";
                    txt_email.Text = "";
                    txt_fax.Text = "";
                    txt_office.Text = "";
                    txt_url.Text = "";
                    Utilities.MessageBox_UpdatePanel(udp, "OFFICE CREATION SUCCESFUL");
                }
                else
                {
                    Utilities.MessageBox_UpdatePanel(udp, "office Creation Unsuccessful");
                }

            }
        }
    }
    protected void grd_Office_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_Office.PageIndex = e.NewPageIndex;
        bindgrd_ofc();
    }
    public void bindgrd_ofc()
    {
        bl.Userid = Session["username"].ToString();
        rd = dl.select_admin_info(bl);

        if (rd.table.Rows[0]["RollID"].ToString() == "1")
        {
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = ddl_district.SelectedValue;

        }
        else if (rd.table.Rows[0]["RollID"].ToString() == "4")
        {
            bl.Officelevelcode = "00";
            bl.Role = rd.table.Rows[0]["RollID"].ToString();
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = rd.table.Rows[0]["district_id"].ToString();
        }
        bl.Base_department = ddl_department.SelectedValue;
        bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        bl.Category = ddl_category.SelectedValue;
        rd = dl.Bind_grid(bl);
        int row = rd.table.Rows.Count;
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
        lbl_count.Text = "Total Offices = " + row.ToString() + "  and  Total page = " + page.ToString() + "";
        grd_Office.DataSource = rd.table;
        grd_Office.DataBind();
    }
    protected void ddl_district_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddl_Ofc_Lvl.SelectedValue = "0";
        ddl_department.SelectedValue = "0";
        bindgrd_ofc();

    }
    protected void ddl_department_SelectedIndexChanged(object sender, EventArgs e)
    {

        bind_ddl_officelevel();
        ddl_Ofc_Lvl.SelectedValue = "0";
        bindgrd_ofc();
    }
    protected void ddl_Ofc_Lvl_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgrd_ofc();
    }
    public void bind_ddl_district()
    {
        ddl_district.Items.Clear();
        bl.Userid = Session["username"].ToString();
        rd = dl.select_admin_info(bl);

        if (rd.table.Rows[0]["RollID"].ToString() == "1")
        {
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = ddl_district.SelectedValue;
            bl.Base_department = ddl_department.SelectedValue;
            bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        }
        else if (rd.table.Rows[0]["RollID"].ToString() == "4")
        {
            bl.Officelevelcode = "00";
            bl.Role = rd.table.Rows[0]["RollID"].ToString();
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = rd.table.Rows[0]["district_id"].ToString();
            bl.Base_department = ddl_department.SelectedValue;
            bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        }
        rd = dl.district(bl);
        ddl_district.DataSource = rd.table;
        ddl_district.DataTextField = "District_Name";
        ddl_district.DataValueField = "district_id";
        ddl_district.Items.Add(new ListItem(" Choose District", "0"));
        ddl_district.DataBind();
        bind_ddl_officelevel();


    }
    public void bind_department()
    {
        ddl_department.Items.Clear();
        bl.Userid = Session["username"].ToString();
        rd = dl.select_admin_info(bl);

        if (rd.table.Rows[0]["RollID"].ToString() == "1")
        {
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = ddl_district.SelectedValue;
            bl.Base_department = ddl_department.SelectedValue;
            bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        }
        else if (rd.table.Rows[0]["RollID"].ToString() == "4")
        {
            bl.Officelevelcode = "00";
            bl.Role = rd.table.Rows[0]["RollID"].ToString();
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = rd.table.Rows[0]["district_id"].ToString();
            bl.Base_department = ddl_department.SelectedValue;
            bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        }
        rd = dl.base_department(bl);
        ddl_department.DataSource = rd.table;
        ddl_department.DataTextField = "dept_name";
        ddl_department.DataValueField = "dept_id";
        ddl_department.Items.Add(new ListItem("Choose Department", "0"));
        ddl_department.DataBind();

    }
    public void bind_ddl_officelevel()
    {
        bl.Userid = Session["username"].ToString();
        rd = dl.select_admin_info(bl);

        if (rd.table.Rows[0]["RollID"].ToString() == "1")
        {
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = ddl_district.SelectedValue;
            bl.Base_department = ddl_department.SelectedValue;
            bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        }
        else if (rd.table.Rows[0]["RollID"].ToString() == "4")
        {
            bl.Officelevelcode = "00";
            bl.Role = rd.table.Rows[0]["RollID"].ToString();
            bl.State = rd.table.Rows[0]["state_id"].ToString();
            bl.District = rd.table.Rows[0]["district_id"].ToString();
            bl.Base_department = ddl_department.SelectedValue;
            bl.Officelvl = ddl_Ofc_Lvl.SelectedValue;
        }
        ddl_Ofc_Lvl.Items.Clear();
        rd = dl.office_level(bl);
        ddl_Ofc_Lvl.DataSource = rd.table;
        ddl_Ofc_Lvl.DataTextField = "Office_level";
        ddl_Ofc_Lvl.DataValueField = "olc";
        ddl_Ofc_Lvl.Items.Add(new ListItem(" Choose Office Level", "0"));
        ddl_Ofc_Lvl.DataBind();
    }
    public void bind_ddl_category()
    {
        ddl_category.Items.Clear();
        rd = dl.category(bl);
        ddl_category.DataSource = rd.table;
        ddl_category.DataTextField = "name";
        ddl_category.DataValueField = "code";
        ddl_category.Items.Add(new ListItem("Choose Category", "0"));
        ddl_category.DataBind();
    }
    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgrd_ofc();
    }
}
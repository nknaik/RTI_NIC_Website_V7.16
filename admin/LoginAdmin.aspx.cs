﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class LoginAdmin : System.Web.UI.Page
{
    ReturnClass.ReturnBool rb = new ReturnClass.ReturnBool();
    ReturnClass.ReturnDataTable dt = new ReturnClass.ReturnDataTable();
    blAdmin bl = new blAdmin();
    dlAdmin dl = new dlAdmin();
    Utilities ul = new Utilities();
    dl_Dio dlDio = new dl_Dio();
    bl_Dio blDio = new bl_Dio();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../LogOut.aspx");
                }
                else
                {
                    bl.UserID = Session["username"].ToString();
                    blDio.Userid = Session["username"].ToString();
                    blDio.Ofc_mappingid = Session["EmpMapID"].ToString();
                    blDio.Role = Session["role"].ToString();
                    dt = dlDio.select_admin_info(blDio);
                    if (dt.table.Rows.Count > 0)
                    {
                        lbl_rolename.Text = dt.table.Rows[0]["Name_en"].ToString();
                        if (blDio.Role == "1")
                        {
                            blDio.District = null;
                            blDio.State = null;
                        }
                        else if (blDio.Role == "4" || blDio.Role == "5")
                        {
                            blDio.District = dt.table.Rows[0]["district_id"].ToString();
                            blDio.State = dt.table.Rows[0]["state_id"].ToString();
                            blDio.Officelevelcode = "00";  // Seperate the mantralay and head office
                        }
                        if (blDio.Role == "5")
                        {
                            blDio.Officeid = dt.table.Rows[0]["NewOfficeCode"].ToString();
                        }
                        dt = dl.countEmp(blDio);
                        if (dt.table.Rows.Count > 0)
                        {
                            lbl_employee_count.Text = dt.table.Rows[0]["empcount"].ToString();

                        }
                        dt = dl.countDepartment(bl);
                        if (dt.table.Rows.Count > 0)
                        {
                            lbl_department_count.Text = dt.table.Rows[0]["depcount"].ToString();

                        }
                        dt = dl.countOffice(blDio);
                        if (dt.table.Rows.Count > 0)
                        {
                            lbl_office_count.Text = dt.table.Rows[0]["office_count"].ToString();

                        }
                        dt = dl.countMappedEmp(blDio);
                        if (dt.table.Rows.Count > 0)
                        {
                            lbl_mapEmp_count.Text = dt.table.Rows[0]["office_map_count"].ToString();

                        }


                    }

                }//End of Else session != null

                BindGridView();
            } // End of IsPostBack
        }
        catch (NullReferenceException ex)
        {

        }
    }// End of Page Load


    protected void BindGridView()
    {
        blDio.Ofc_mappingid = Session["EmpMapID"].ToString();
        blDio.Userid = Session["username"].ToString();
        dt = dlDio.select_admin_info(blDio);
        if (dt.table.Rows.Count > 0)
        {
            blDio.Role = dt.table.Rows[0]["RollID"].ToString();
            //lbl_rolename.Text = dt.table.Rows[0]["Name_en"].ToString();
            if (blDio.Role == "1")
            {
                blDio.District = null;
                blDio.State = null;
            }
            else if (blDio.Role == "4")
            {
                blDio.District = dt.table.Rows[0]["district_id"].ToString();
                blDio.State = dt.table.Rows[0]["state_id"].ToString();
                // blDio.Officelevelcode = "00";  // Seperate the mantralay and head office
            }
            if (blDio.Role == "5")
            {
                blDio.Officeid = dt.table.Rows[0]["NewOfficeCode"].ToString();
            }
        }
        dt = dl.GetTotalEmployeeInGrid(blDio);

        int row = dt.table.Rows.Count;
        int page;
        if (row % 10 == 0)
        {
            page = row / 10;
        }
        else
        {
            page = row / 10;
            page = page + 1;
        }

        lbl_count.Text = "Total Rows = " + row.ToString() + "  and  Total page = " + page.ToString() + "";
        GridView1.DataSource = dt.table;
        GridView1.DataBind();

    }
    protected void BindMapEmpView()
    {
        blDio.Userid = Session["username"].ToString();
        blDio.Ofc_mappingid = Session["EmpMapID"].ToString();
        dt = dlDio.select_admin_info(blDio);
        if (dt.table.Rows.Count > 0)
        {
            blDio.Role = dt.table.Rows[0]["RollID"].ToString();
            //lbl_rolename.Text = dt.table.Rows[0]["Name_en"].ToString();
            if (blDio.Role == "1")
            {
                blDio.District = null;
                blDio.State = null;
            }
            else if (blDio.Role == "4")
            {
                blDio.District = dt.table.Rows[0]["district_id"].ToString();
                // blDio.State = dt.table.Rows[0]["state_id"].ToString();
                blDio.Officelevelcode = "00";  // Seperate the mantralay and head office
            }
            if (blDio.Role == "5")
            {

                blDio.Officeid = dt.table.Rows[0]["NewOfficeCode"].ToString();
            }
        }
        dt = dl.GetTotalEmpMapInGrid(blDio);

        int row = dt.table.Rows.Count;
        int page;
        if (row % 10 == 0)
        {
            page = row / 10;
        }
        else
        {
            page = row / 10;
            page = page + 1;
        }

        lbl_count.Text = "Total Rows = " + row.ToString() + "  and  Total page = " + page.ToString() + "";
        GV_MapEmp.DataSource = dt.table;
        GV_MapEmp.DataBind();

    }
    protected void BindDepartmentView()
    {

        dt = dl.GetTotalDepartmentInGrid();

        int row = dt.table.Rows.Count;
        int page;
        if (row % 10 == 0)
        {
            page = row / 10;
        }
        else
        {
            page = row / 10;
            page = page + 1;
        }

        lbl_count.Text = "Total Rows = " + row.ToString() + "  and  Total page = " + page.ToString() + "";
        GV_Department.DataSource = dt.table;
        GV_Department.DataBind();

    }
    protected void BindOfficeView()
    {
        blDio.Ofc_mappingid = Session["EmpMapID"].ToString();
        blDio.Userid = Session["username"].ToString();
        dt = dlDio.select_admin_info(blDio);
        if (dt.table.Rows.Count > 0)
        {
            blDio.Role = dt.table.Rows[0]["RollID"].ToString();
            //lbl_rolename.Text = dt.table.Rows[0]["Name_en"].ToString();
            if (blDio.Role == "1")
            {
                blDio.District = null;
                blDio.State = null;
            }
            else if (blDio.Role == "4")
            {
                blDio.District = dt.table.Rows[0]["district_id"].ToString();
                blDio.State = dt.table.Rows[0]["state_id"].ToString();
                blDio.Officelevelcode = "00";  // Seperate the mantralay and head office
            }
            if (blDio.Role == "5")
            {

                blDio.Officeid = dt.table.Rows[0]["NewOfficeCode"].ToString();
            }

        }
        dt = dl.GetTotalOfficeInGrid(blDio);

        int row = dt.table.Rows.Count;
        int page;
        if (row % 10 == 0)
        {
            page = row / 10;
        }
        else
        {
            page = row / 10;
            page = page + 1;
        }

        lbl_count.Text = "Total Rows = " + row.ToString() + "  and  Total page = " + page.ToString() + "";
        GV_Office.DataSource = dt.table;
        GV_Office.DataBind();

    }
    protected void ShowEmployee_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        lbl_count.Visible = true;
        GV_MapEmp.Visible = false;
        GV_Department.Visible = false;
        GV_Office.Visible = false;
        BindGridView();
    }
    protected void ShowDepartment_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        lbl_count.Visible = true;
        GV_MapEmp.Visible = false;
        GV_Department.Visible = true;
        GV_Office.Visible = false;
        BindDepartmentView();

    }

    protected void ShowOffice_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GV_Department.Visible = false;
        GV_MapEmp.Visible = false;
        lbl_count.Visible = true;
        GV_Office.Visible = true;
        BindOfficeView();
    }

    protected void ShowMapEmp_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GV_Department.Visible = false;
        GV_MapEmp.Visible = true;
        lbl_count.Visible = true;
        GV_Office.Visible = false;
        BindMapEmpView();

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridView();

    }

    protected void GV_MapEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_MapEmp.PageIndex = e.NewPageIndex;
        BindMapEmpView();

    }

    protected void GV_Department_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_Department.PageIndex = e.NewPageIndex;
        BindDepartmentView();

    }
    protected void GV_Office_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_Office.PageIndex = e.NewPageIndex;
        BindOfficeView();

    }

} // End of class


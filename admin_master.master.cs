using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class theme_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["username"].ToString() == null)
            {
                Response.Redirect("../LogOut.aspx");
            }
            else
            {
                if (Session["role"].ToString() == "1")
                {
                    li_add.Visible = true;
                    li_action.Visible = true;
                    li_roll.Visible = true;
                }
                else if(Session["role"].ToString() == "4")
                {
                    li_add.Visible = true; 
                    li_action.Visible = false;
                    li_roll.Visible = false;
                }
                else
                {
                    li_add.Visible = false;
                }
            }

        }catch(NullReferenceException ex)
        {
            Utilities.MessageBoxShow_Redirect("your Session Has been expired Please Login Again","../ LogOut.aspx");
        }
    }
}

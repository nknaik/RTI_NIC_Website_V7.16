using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_employee : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["username"] == null)
            {
                Utilities.MessageBoxShow_Redirect("Your Session is expired......... Please Login Again ..", "../LogOut.aspx");
            }
            else if (Session["role"].ToString() != "3")
            {
                Utilities.MessageBoxShow_Redirect("Your Session is expired......... Please Login Again ..", "../LogOut.aspx");
                //   Response.Redirect("../LogOut.aspx");
            }
            else
            {

            }
        }
        catch (NullReferenceException es)
        {
            Response.Redirect("../LogOut.aspx");
        }

    }
}

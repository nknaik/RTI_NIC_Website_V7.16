using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["language"] != null)
        {
            if (Session["language"].ToString() == "hi-IN")
            {
                hin.Visible = false;
                eng.Visible = true;


            }
            else if (Session["language"].ToString() == "en-US")
            {
                eng.Visible = false;
                hin.Visible = true;
                Session["language"] = "en-US";
            }
        }

        if (!Page.IsPostBack)
        {
           // hin.Attributes.Add("onClick", "return false;");
            if (CultureInfo.CurrentCulture.Name != null)
            {
                Session["language"] = CultureInfo.CurrentCulture.Name;

            }
        
        }

    }


    protected void hin_Click(object sender, EventArgs e)
    {
        hin.Visible = false;
        eng.Visible = true;
        Session["language"] = "hi-IN";


    }
    protected void eng_Click(object sender, EventArgs e)
    {

        eng.Visible = false;
        hin.Visible = true;
        Session["language"] = "en-US";
    }
  
}

using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

public partial class _Login : System.Web.UI.Page
{
    bl_login bl = new bl_login();
    dl_login dl = new dl_login();
    ReturnClass.ReturnBool rb = new ReturnClass.ReturnBool();
    ReturnClass.ReturnDataTable rd = new ReturnClass.ReturnDataTable();
    ReturnClass.ReturnDataTable rd1 = new ReturnClass.ReturnDataTable();
    Utilities ul = new Utilities();
   // dl_Dio dlDio = new dl_Dio();
    bl_Dio blDio = new bl_Dio();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rd = dl.countEmp(blDio);
            if (rd.table.Rows.Count > 0)
            {
                lbl_employee_count.Text = rd.table.Rows[0]["empcount"].ToString();

            }
            rd = dl.countDepartment(blDio);
            if (rd.table.Rows.Count > 0)
            {
                lbl_department_count.Text = rd.table.Rows[0]["depcount"].ToString();

            }
            rd = dl.countOffice(blDio);
            if (rd.table.Rows.Count > 0)
            {
                lbl_office_count.Text = rd.table.Rows[0]["office_count"].ToString();

            }
            //rd = dlDio.countOfficer(blDio);
            //if (rd.table.Rows.Count > 0)
            //{
            //    lbl_officer.Text = rd.table.Rows[0]["officer_count"].ToString();

            //}
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void ValidateCaptcha(object sender, ServerValidateEventArgs e)
    {
        HttpBrowserCapabilities browse = Request.Browser;
        Captcha1.ValidateCaptcha(txt_captcha.Text.Trim());
        e.IsValid = Captcha1.UserValidated;
        if (e.IsValid)

        {
            bl.UserID = txt_usr_id.Text;
            bl.Password = ul.GenerateMd5Hash(txt_pass.Text);
            bl.UserIP = ul.GetClientIpAddress(this.Page);
            bl.UserOS = Utilities.System_Info(this.Page);
            bl.UserAgent = Request.UserAgent.ToString();
            bl.User_browser = browse.Browser;
            bl.Succesful_login = "n";

            // rd = dl.select_user(bl);
            rd = dl.check_login(bl);
            if (rd.table.Rows.Count > 0)
            {
                bl.Succesful_login = "Y";
                rb = dl.insert_logintrail(bl);
                string b = "true";
                Session["checkroll"] = b;
                //Session["username"] = txt_usr_id.Text;
                Session["username"] = rd.table.Rows[0]["UserID"].ToString();
                Session["role"] = rd.table.Rows[0]["Role_id"].ToString();
                Session["EmpMapID"] = rd.table.Rows[0]["office_mapping_id"].ToString();
                //    Session["WelcomePage"] = rd.table.Rows[0]["WelcomePage"].ToString();
                if (rd.table.Rows.Count > 1)
                {
                    string role, rolenew = "";
                    int i = 0;
                    //  rd1 = dl.select_emp(bl);
                   
                    foreach (DataRow row in rd.table.Rows)
                    {
                        if (i == 0)
                        {
                            role = row["role_id"].ToString();
                            rolenew = row["role_id"].ToString();
                            i++;
                        }
                        else
                        {
                            if (rolenew != row["role_id"].ToString())
                            {
                                b = "false";
                                Session["checkroll"] = b;
                            }
                        }
                    }
                    string key = System.Configuration.ConfigurationManager.AppSettings["EncKey"].ToString();
                    Utilities ut = new Utilities();
                    string encrypt_b = ut.Encrypt_AES(b, key);

                    Response.Redirect("employee_erole.aspx?b=" + encrypt_b);
                    
                }
                else
                {
                    Response.Redirect(rd.table.Rows[0]["WelcomePage"].ToString());
                }
                // bl.RollID = rd.table.Rows[0]["RollID"].ToString();
                //if (bl.RollID == "2")
                //{
                //    rd1 = dl.select_role(bl);
                //    if (rd1.table.Rows.Count > 0)
                //    {
                //        Response.Redirect(rd1.table.Rows[0]["WelcomePage"].ToString());
                //    }
                //}
                //else
                //{
                //    Response.Redirect("~/employee_erole.aspx");

                //}

            }
            else
            {

                bl.Succesful_login = "N";

                rb = dl.insert_logintrail(bl);
                Utilities.MessageBoxShow("Check Your Username And Password That You Inserted");
                txt_captcha.Text = "";
                txt_pass.Text = "";
                txt_usr_id.Text = "";

            }

        }
        else
        {
            Utilities.MessageBoxShow("Please Enter Right Text In Captcha Box");
            txt_captcha.Text = "";
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txt_captcha.Text = "";
        txt_pass.Text = "";
        txt_usr_id.Text = "";
    }

    protected void lnk_signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("registration.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    cnn.Open();

                    HttpCookie aCookie = Request.Cookies["UserDetails"];
                    if (aCookie != null)
                    {
                        using (SqlCommand cmd = new SqlCommand(
                   "SELECT [password] FROM [User_Master] where [loginid] = '" + aCookie.Values["Username"].ToString() + "'", cnn))
                        {
                            Response.Cookies["pwd"].Value = cmd.ExecuteScalar().ToString();
                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
            finally
            { }
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtoldpwd.Text.Trim() == "" || txtnewpassword.Text.Trim() == "" || txtconfpassword.Text.Trim() == "")
        {
            _cls.DisplayAJAXMessage(this, "Kindly fill in all the fields before submiting");
        }
        else if (txtoldpwd.Text.Trim() != Request.Cookies["pwd"].Value.ToString())
        {
            _cls.DisplayAJAXMessage(this, "Old Password does not match with system password");
        }
        else if (txtnewpassword.Text.Trim() != txtconfpassword.Text.Trim())
        {
            _cls.DisplayAJAXMessage(this, "Confirm password does not match with new password");
        }
        else
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    cnn.Open();

                    Label lblMasterStatus = (Label)Master.FindControl("lblLoginId");

                    using (SqlCommand command = new SqlCommand(
                   "update [User_Master] set [password] = '" + txtnewpassword.Text + "' where [loginid] = '" + lblMasterStatus.Text.Replace("ID : ", "") + "'", cnn))
                    {
                        int result = command.ExecuteNonQuery();

                        // Check Error
                        if (result < 0)
                            Console.WriteLine("Error changing password!");
                        else
                        {
                            Response.Write("<script>alert('Password Changed Successfully.');</script>");

                            Server.Transfer("login.aspx?lg=L@G)UT");
                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
            finally
            {

            }
        }

    }
}
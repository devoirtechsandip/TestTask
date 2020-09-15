using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    //ConnectDB dbObj = new ConnectDB();
    //SqlDataReader dr;
    //DataSet ds;
    //SqlConnection cnn;
    cls_Common_cls _cls = new cls_Common_cls();
    clsCommon objcls = new clsCommon();

	protected void Page_Load(object sender, EventArgs e)
	{
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["lg"]))
            {
                if (Request.QueryString["lg"] == "L@G)UT")
                {
                    if (Request.Cookies["UserDetails"] != null)
                    {
                        HttpCookie myCookie = new HttpCookie("UserDetails");
                        myCookie.Expires = DateTime.Now.AddDays(-1d);
                        Response.Cookies.Add(myCookie);
                    }
                }
            }

            if (!string.IsNullOrEmpty(Request.QueryString["complainid"]))
            {
                Session["cpid"] = Request.QueryString["complainid"];
            }

            getconfiguration();

            objcls.SendEmail1("Kumaril.Gupta@relianceada.com, dmsahani@gmail.com", DateTime.Now.ToString(), "test", "amol.p.mahajan@relianceada.com, kumbhar.sandip.b@gmail.com");
        }
    }

    private void getconfiguration()
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT [config] ,[value] FROM [Config_Master]", cnn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Response.Cookies[dr["config"].ToString()].Value = dr["value"].ToString();
                        }
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

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        //if (Validation())
        if (true)
        {

            try
            {
                SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
                {
                    cnn.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(
                   "SELECT top 1 * FROM [UserLogin] where [loginid] = '" + txtUserName.Text.Trim() + "'and [password] = '" + txtPassword.Text.Trim() + "'", cnn))
                    {

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            HttpCookie aCookie = Request.Cookies["UserDetails"];
                            if (aCookie != null)
                            {
                                aCookie.Values["Username"] = ds.Tables[0].Rows[0]["loginid"].ToString();
                                aCookie.Values["UserEmail"] = ds.Tables[0].Rows[0]["UserEmail"].ToString(); 
                            }
                            else
                            {
                                // no cookie found, create it
                                aCookie = new HttpCookie("UserDetails");
                                aCookie.Values.Add("Username", ds.Tables[0].Rows[0]["loginid"].ToString());
                                aCookie.Values.Add("UserEmail", ds.Tables[0].Rows[0]["UserEmail"].ToString());
                            } 

                            // overwrite the cookie
                            Response.Cookies.Add(aCookie);

                            Response.Redirect("CreateNewTicketMaster.aspx");
                        }
                        else
                        {
                            _cls.DisplayAJAXMessage(this, "Invalid User Credential.");
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

	private bool Validation()
	{
		if (!allfieldscorrect())
			return false;

		else
			return true;
	}

	private bool allfieldscorrect()
	{
		if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPassword.Text))
			return false;

		else
			return true;
	}
}
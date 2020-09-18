using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.MasterPage
{
    public string Role { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
	{
        lipostreply1.Visible = false;
        liticketlist.Visible = false;
        liticketlist1.Visible = false;
        linewtm.Visible = false;
        Liprep.Visible = false;
        linewtm.Visible = false;


        if (!IsPostBack)
        {
            HttpCookie aCookie = Request.Cookies["UserDetails"];
            if (aCookie["Role"] == "User")

            {
                lipostreply1.Visible = true;
                liticketlist.Visible = true;
                linewtm.Visible = true;
            }
            else if (aCookie["Role"] == "Admin")
            {
                Liprep.Visible = true;
                liticketlist1.Visible = true;
                linewtm.Visible = true;
            }
            //LiCC.Visible = false;
            //LiSC.Visible = false;
            //LiCB.Visible = false;

                //LNFC.Visible = false;
                //LNFV.Visible = false;
                //LNFS.Visible = false;
                //LNFU.Visible = false;
                //         nav_abc.Visible = false;
                //         nav_um.Visible = false;
                //         lireport.Visible = false;

                //Licat.Visible = false;//Licat main.aspx 



                //HttpCookie aCookie = Request.Cookies["UserDetails"];
                //         //if (aCookie != null)
                //         //{
                //         getUserDetails(aCookie.Values["Username"].ToString());

                //	getmenurights();
                //aCookie.Values["Username"] = ds.Tables[0].Rows[0]["Username"].ToString();
                //aCookie.Values["userid"] = ds.Tables[0].Rows[0]["pk"].ToString();
                //aCookie.Values["deptid"] = ds.Tables[0].Rows[0]["deptid"].ToString();
                //aCookie.Values["roleid"] = ds.Tables[0].Rows[0]["roleid"].ToString();
                //}
        }
    }

	private void getUserDetails(string userid)
	{
		try
		{
			using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
			{
				cnn.Open();

				using (SqlDataAdapter da = new SqlDataAdapter("SELECT [pk],[loginid],[password] ,[name] ,[role] ,[dept] FROM [AD_DB].[dbo].[User_Master] where loginid = '" + userid + "'", cnn))
				{

					DataSet ds = new DataSet();
					da.Fill(ds);

					if (ds.Tables[0].Rows.Count > 0)
					{

						lblLoginId.Text = "ID : " + ds.Tables[0].Rows[0]["loginid"].ToString();
						lblName.Text = "Name : " + ds.Tables[0].Rows[0]["name"].ToString();
						lblrole.Text = "Role : " + ds.Tables[0].Rows[0]["role"].ToString();
						lbldept.Text = "Dept : " + ds.Tables[0].Rows[0]["dept"].ToString();

                        //Response.Cookies["UN"].Value = ds.Tables[0].Rows[0]["Username"].ToString();

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

	private void getmenurights()
	{
		try
		{
			HttpCookie aCookie = Request.Cookies["UserDetails"];


			using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
			{
				cnn.Open();

				using (SqlCommand cmd = new SqlCommand("SELECT [rightspk] FROM [Role_Rights_Map] where rolepk = '" + aCookie.Values["roleid"] + "'", cnn))
				{
					SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            //if (dr["rightspk"].ToString() == "1")
                            //{
                            //	//if (aCookie.Values["roleid"] == "6")
                            //	//	LNFC.Visible = true;
                            //	//else
                            //		LiCC.Visible = true;
                            //}
                            //if (dr["rightspk"].ToString() == "2")
                            //{
                            //	//if (aCookie.Values["roleid"] == "6")
                            //	//	LNFS.Visible = true;
                            //	//else
                            //		LiSC.Visible = true;
                            //}
                            //if (dr["rightspk"].ToString() == "5")
                            //{								
                            //		LNFU.Visible = true;

                            //}
                            //if (dr["rightspk"].ToString() == "6")
                            //{
                            //	LiCB.Visible = true;
                            //}

                            //if (dr["rightspk"].ToString() == "1")
                            //{ LiCC.Visible = true; }
                            //if (dr["rightspk"].ToString() == "2")
                            //{ LiSC.Visible = true; }
                            //if (dr["rightspk"].ToString() == "6")
                            //{ LiCB.Visible = true; }
                            //if (dr["rightspk"].ToString() == "7")
                            //{ LNFC.Visible = true; }
                            //if (dr["rightspk"].ToString() == "8")
                            //{ LNFV.Visible = true; }
                            //if (dr["rightspk"].ToString() == "9")
                            //{ LNFS.Visible = true; }
                            //if (dr["rightspk"].ToString() == "10")
                            //{ LNFU.Visible = true; }
                            //if (dr["rightspk"].ToString() == "11")
                            //{ lireport.Visible = true; }
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
}

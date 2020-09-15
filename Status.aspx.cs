using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Status : System.Web.UI.Page
{
    const string pageid = "Status";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
            
        }

    }
    public bool checkuseraccess()
    {
        int RequestStatus = 0;

        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand("procrightmaster", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@roleid", SqlDbType.VarChar).Value = Request.Cookies["usertypeid"].Value;
                    cmd.Parameters.Add("@pageid", SqlDbType.VarChar).Value = pageid;

                    SqlParameter RuturnValue = new SqlParameter("@RequestStatus", SqlDbType.Int);
                    RuturnValue.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(RuturnValue);
                    cmd.ExecuteNonQuery();
                    RequestStatus = (int)cmd.Parameters["@RequestStatus"].Value;


                }
            }


        }
        catch (Exception Ex)
        {
            lblmsg.Text = Ex.Message;
        }
        finally
        {

        }

        if (RequestStatus == 0)
            return false;
        else
            return true;
    }

    private void BindListView()
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {

                if (cnn.State == ConnectionState.Open)
                    cnn.Close();

                cnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {

                    cmd.CommandText = "SELECT [pk],[Status] FROM [Status_Master] where Valid=1";
                    cmd.Connection = cnn;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        lstdc.DataSource = ds;
                        lstdc.DataBind();

                        cnn.Close();
                    }

                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }
    public void clear()
    {
        try
        {
            txtstatus.Text = string.Empty;

        }
        catch (Exception ex)
        { }
    }
    public void InsertCategory()
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
        try
        {
            cnn.Open();
            var query = string.Empty;
            var Status = (string.IsNullOrEmpty(txtstatus.Text.Trim())) ? string.Empty : txtstatus.Text.Trim();
            query = "insert into [Status_Master](Status,Valid)" + "values('" + Status + "',1)";
            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                int result = cmd.ExecuteNonQuery();
            }

            cnn.Close();
            clear();
            BindListView();
        }
        catch (Exception ex)
        {

        }
    }
}
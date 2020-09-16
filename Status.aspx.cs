using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;

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
            lbllmsg.Text = Ex.Message;
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
                        lstdcc.DataSource = ds;
                        lstdcc.DataBind();

                        cnn.Close();
                    }

                }
            }
        }
        catch (Exception ex)
        {
            lbllmsg.Text = ex.Message;
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
    public void InsertStatus()
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

    protected void submit_Click(object sender, EventArgs e)
    {
        InsertStatus();
    }

    protected void lstdcc_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {

                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                //e.Item.Visible = false;
                string Priority = e.CommandArgument.ToString();
                cnn.Open();

                var query = string.Empty;
                //var state1 = (string.IsNullOrEmpty(txtstate.Text)) ? string.Empty : txtstate.Text;
                query = "delete from [Status_Master] where pk ='" + Priority + "'";
                using (SqlCommand cmd = new SqlCommand(query, cnn))
                {
                    int result = cmd.ExecuteNonQuery();
                }
                cnn.Close();

                BindListView();
            }
        }
        if (e.CommandName == "update")
        {
            lbllpk.Text = e.CommandArgument.ToString();

            BindDetailsToEdit();
            BindListView();
        }
    }

    private void BindDetailsToEdit()
    {
        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT [pk],[Status] FROM [Status_Master] where [Valid]='1' and pk='" + lbllpk.Text + "'", cnn);
            cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("pk", lblpk);
            cnn.Open();

            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();

                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtstatus.Text = ds.Tables[0].Rows[0]["Status"].ToString();
                    update.Visible = true;
                    submit.Visible = false;
                }
            }
            //lblpk.Text = string.Empty;
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE [Status_Master] SET [Status] =@Status WHERE pk='" + lbllpk.Text + "'", con))
                {

                    cmd.Parameters.AddWithValue("@Status", txtstatus.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    submit.Visible = true;
                    update.Visible = false;
                    lbllpk.Text = string.Empty;
                }
            }
            BindListView();
            clear();
        }
        catch (Exception ex)
        {

        }
    }

    protected void lstdcc_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {

    }

    protected void lstdcc_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}
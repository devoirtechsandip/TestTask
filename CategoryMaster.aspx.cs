﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CategoryMaster : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
    const string pageid = "CategoryMaster";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (checkuseraccess())
            //{
            BindListView();
            //}
            //else
            //{
            //    Response.Redirect("LogInForm.aspx");
            //}
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

    public void BindListView()
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

                    cmd.CommandText = "SELECT [pk],[Category] FROM [Category_Master] where Valid=1";
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
            txtcategory.Text = string.Empty;
            
        }
        catch (Exception ex)
        { }
    }

    public void InsertCategory()
    {
        try
        {
            cnn.Open();
            var query = string.Empty;
            var Category = (string.IsNullOrEmpty(txtcategory.Text.Trim())) ? string.Empty : txtcategory.Text.Trim();
            query = "insert into [Category_Master](Category,Valid)" + "values('" + Category + "',1)";
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
        InsertCategory();
    }

    protected void lstdc_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {

                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                //e.Item.Visible = false;
                string Category = e.CommandArgument.ToString();
                cnn.Open();

                var query = string.Empty;
                //var state1 = (string.IsNullOrEmpty(txtstate.Text)) ? string.Empty : txtstate.Text;
                query = "delete from [Category_Master] where pk ='" + Category + "'";
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
            lblpk.Text = e.CommandArgument.ToString();

            BindDetailsToEdit();
            BindListView();
        }
    }

    public void BindDetailsToEdit()
    {
        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT [pk],[Category] FROM [Category_Master] where [Valid]='1' and pk='" + lblpk.Text + "'", cnn);
            cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("pk", lblpk);
            cnn.Open();

            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();

                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtcategory.Text = ds.Tables[0].Rows[0]["Category"].ToString();
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

                using (SqlCommand cmd = new SqlCommand("UPDATE [Category_Master] SET [Category] =@Category WHERE pk='" + lblpk.Text + "'", con))
                {

                    cmd.Parameters.AddWithValue("@Category", txtcategory.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    submit.Visible = true;
                    update.Visible = false;
                    lblpk.Text = string.Empty;
                }
            }
            BindListView();
            clear();
        }
        catch (Exception ex)
        {

        }
    }

    protected void lstdc_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {

    }

    protected void lstdc_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}
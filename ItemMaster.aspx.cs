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

public partial class ItemMaster : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getAllitem();

            btnSubmit.Visible = true;
            btndelete.Visible = false;
            btnUpdate.Visible = false;

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();
                _cls.F_BIND_DROPDOWN("SELECT [pk] ,[type] FROM [dbo].[type_master]", ddltype, cnn);
                _cls.F_BIND_DROPDOWN1("SELECT distinct Rtrim(Ltrim(loc)) FROM [dbo].[Inventory_Master]", ddlloc, cnn);
                cnn.Close();
            }

            if (!String.IsNullOrEmpty(Request.QueryString["pk"]))
            {
                String pk = Request.QueryString["pk"].ToString();

                SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                SqlDataReader dr = null;

                string strSql = "SELECT [pk], [MMOPLCode] ,[TIMLCode] ,[Length] ,[Height] ,[Area] ,cast([rate] as decimal(18, 0)) as rate ,[duration] ,[Description] ,[type] ,[subtype] ,[loc] FROM [Inventory_Master] where [MMOPLCode] = '" + pk + "'";
                cnn.Open();
                SqlCommand cmd = new SqlCommand(strSql, cnn);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtMMOPLCode.Text = dr["MMOPLCode"].ToString();
                        txtTIMLCode.Text = dr["TIMLCode"].ToString();
                        txtLength.Text = dr["Length"].ToString();
                        txtHeight.Text = dr["Height"].ToString();
                        txtArea.Text = dr["Area"].ToString();
                        txtrate.Text = dr["rate"].ToString();
                        ddltype.SelectedIndex = ddltype.Items.IndexOf(ddltype.Items.FindByText(Server.HtmlDecode(dr["type"].ToString())));
                        txtDescription.Text = dr["Description"].ToString();
                        ddlloc.SelectedIndex = ddlloc.Items.IndexOf(ddlloc.Items.FindByText(Server.HtmlDecode(dr["loc"].ToString())));
                        txtsubtype.Text = dr["subtype"].ToString();
                        hfpk.Value = dr["pk"].ToString();

                        btnSubmit.Visible = false;
                        btndelete.Visible = true;
                        btnUpdate.Visible = true;
                    }
                }

                cnn.Close();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        //    try
        //    {
        //        if (ddlsecComplaintCategory.SelectedItem.Text != "")
        //        {
        //            addcat_Click(btnSubmit, e);
        //        }
        //    }
        //    catch { }

        //    if (Validation())
        //    //if (true)
        //    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand command = new SqlCommand(
               "INSERT INTO [dbo].[Inventory_Master] ([MMOPLCode] ,[TIMLCode] ,[Length] ,[Height] ,[Area] ,[rate] ,[type] ,[Description], [loc], [subtype]) VALUES ('" + txtMMOPLCode.Text + "' , '" + txtTIMLCode.Text + "', '" + txtLength.Text + "', '" + txtHeight.Text + "', '" + txtArea.Text + "', '" + txtrate.Text + "', '" + ddltype.SelectedItem.Text + "', '" + txtDescription.Text + "', '" + ddlloc.SelectedItem.Text + "', '" + txtsubtype.Text + "')", cnn))
                {
                    int result = command.ExecuteNonQuery();

                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                    else
                    {
                        getAllitem();

                        Response.Write("<script>alert('Data Saved Successfully');</script>");

                        Server.Transfer("ItemMaster.aspx");
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
        //    }

        btnSubmit.Enabled = true;
    }

  
    public void getAllitem()
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT [pk] ,[MMOPLCode] ,[TIMLCode] ,[Description] ,dbo.[udf_NumberToCurrency](cast([rate] as decimal(18, 0))) [rate], [type] , [loc], subtype FROM [Inventory_Master]", cnn))
                {
                    // 3
                    // Use DataAdapter to fill DataTable
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (lvBucket.Items.Count > 0)
                        { lvBucket.Items.Clear(); }

                        lvBucket.DataSource = ds.Tables[0];
                        lvBucket.DataBind();
                    }
                    else
                    {
                        lvBucket.DataSource = null;
                        lvBucket.DataBind();
                    }
                }
                cnn.Close();
            }
        }
        catch (Exception Ex)
        {

        }
        finally
        {
        }
    }

    protected void txtLength_TextChanged(object sender, EventArgs e)
    {
        if (txtLength.Text == "")
        {
            txtLength.Text = "0";
        }
        if (txtHeight.Text == "")
        {
            txtHeight.Text = "0";
        }

        txtArea.Text = (Double.Parse(txtLength.Text) * Double.Parse(txtHeight.Text)).ToString("#.##");
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "viewdata"))
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            SqlDataReader dr = null;

            string strSql = "SELECT [MMOPLCode] ,[TIMLCode] ,[Length] ,[Height] ,[Area] ,cast([rate] as decimal(18, 0)) as rate ,[duration] ,[Description] ,[type] ,[subtype] ,[loc] FROM [Inventory_Master] where [pk] = '" + e.CommandArgument.ToString() + "'";
            cnn.Open();
            SqlCommand cmd = new SqlCommand(strSql, cnn);
            dr = cmd.ExecuteReader();

            if(dr.HasRows)
            {
                while (dr.Read())
                {
                    txtMMOPLCode.Text = dr["MMOPLCode"].ToString();
                    txtTIMLCode.Text = dr["TIMLCode"].ToString();
                    txtLength.Text = dr["Length"].ToString();
                    txtHeight.Text = dr["Height"].ToString();
                    txtArea.Text = dr["Area"].ToString();
                    txtrate.Text = dr["rate"].ToString();
                    ddltype.SelectedIndex = ddltype.Items.IndexOf(ddltype.Items.FindByText(Server.HtmlDecode(dr["type"].ToString())));
                    txtDescription.Text = dr["Description"].ToString();
                    ddlloc.SelectedIndex = ddlloc.Items.IndexOf(ddlloc.Items.FindByText(Server.HtmlDecode(dr["loc"].ToString())));
                    txtsubtype.Text = dr["subtype"].ToString();
                    hfpk.Value = e.CommandArgument.ToString();

                    btnSubmit.Visible = false;
                    btndelete.Visible = true;
                    btnUpdate.Visible = true;
                }
            }

            cnn.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand command = new SqlCommand(
               "UPDATE [dbo].[Inventory_Master] SET [MMOPLCode] = '" + txtMMOPLCode.Text + "' ,[TIMLCode] = '" + txtTIMLCode.Text + "' ,[Length] = '" + txtLength.Text + "' ,[Height] = '" + txtHeight.Text + "' ,[Area] = '" + txtArea.Text + "' ,[rate] = '" + txtrate.Text + "' ,[Description] = '" + txtDescription.Text + "' ,[type] = '" + ddltype.SelectedItem.Text + "' ,[subtype] = '" + txtsubtype.Text + "' ,[loc] = '" + ddlloc.SelectedItem.Text + "' WHERE pk = '" + hfpk.Value + "'", cnn))
                {
                    int result = command.ExecuteNonQuery();

                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                    else
                    {
                        getAllitem();

                        Response.Write("<script>alert('Data Updated Successfully');</script>");

                        Server.Transfer("ItemMaster.aspx");
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
        //    }

        btnSubmit.Enabled = true;

    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand command = new SqlCommand(
               "delete [dbo].[Inventory_Master] WHERE pk = '" + hfpk.Value + "'", cnn))
                {
                    int result = command.ExecuteNonQuery();

                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                    else
                    {
                        getAllitem();

                        Response.Write("<script>alert('Data Deleted Successfully');</script>");

                        Server.Transfer("ItemMaster.aspx");
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
        //    }

        btnSubmit.Enabled = true;
    }

    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
        {
            cnn.Open();
            _cls.F_BIND_DROPDOWN1("SELECT distinct loc FROM [dbo].[Inventory_Master] where [type] = '"+ddltype.SelectedItem.Text+"'", ddlloc, cnn);
            cnn.Close();
        }
    }
}
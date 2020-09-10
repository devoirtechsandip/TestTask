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

public partial class PackageMaster : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getAllpackage();

            btnSubmit.Visible = true;
            btndelete.Visible = false;
            btnUpdate.Visible = false;
            hfpk.Value = "";
            //divdatetime.Visible = false;
            try
            {
                using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    cnn.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(
                   "SELECT cast([pk] as nvarchar(50))+'-I' as pk,[MMOPLCode] as [name] FROM [Inventory_Master] union all SELECT cast([pk] as nvarchar(50))+'-P' as pk,[packagename] as [name] FROM [package_master]", cnn))
                    {
                        // 3
                        // Use DataAdapter to fill DataTable
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dditem.DataSource = ds.Tables[0];
                            dditem.DataTextField = "name";
                            dditem.DataValueField = "pk";
                            dditem.DataBind();
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
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> lstitem = new List<string>();
            string itemnm = "";

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand command = new SqlCommand(
                  "INSERT INTO [dbo].[package_master] ([packagename] ,[remarks]) VALUES ('" + txtName.Text + "' ,'" + txtUserComments.Text + "')", cnn))
                {
                    int result = command.ExecuteNonQuery();
                }

                foreach (ListItem ddlobj in dditem.Items)
                {
                    if (ddlobj.Selected)
                    {
                        string[] item = ddlobj.Value.Split('-');

                        if (item[1] == "I")
                        {
                            using (SqlCommand command = new SqlCommand(
                   "INSERT INTO [dbo].[Sub_package] ([package_id] ,[Inventory_id]) VALUES ((SELECT [pk] FROM [package_master] where [packagename] = '" + txtName.Text + "') ,'" + item[0] + "')", cnn))
                            {
                                int result = command.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            using (SqlCommand command = new SqlCommand(
                   "INSERT INTO [dbo].[Sub_package] ([package_id] ,[Inventory_id]) (select (SELECT [pk] FROM [package_master] where [packagename] = '" + txtName.Text + "') ,[Inventory_id] FROM [dbo].[Sub_package] where package_id = '" + item[0] + "')", cnn))
                            {
                                int result = command.ExecuteNonQuery();
                            }
                        }
                    }
                }
                
                Response.Write("<script>alert('Data Saved Successfully');</script>");

                Server.Transfer("PackageMaster.aspx");
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
    
    public void getAllpackage()
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "select pk, [packagename], stuff(( select ', ' + im.[MMOPLCode] from [package_master] t left join Sub_package sp on t.pk = sp.[package_id] left join [Inventory_Master] im on im.pk = sp.[Inventory_id]  where t.[packagename] = [package_master].[packagename] order by im.[MMOPLCode] for xml path('') ),1,1,'') as [Inventory] from [package_master] group by [packagename], pk", cnn))
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

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "viewdata"))
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            SqlDataReader dr = null;
            List<string> subitem = new List<string>();

            string strSql = "SELECT [packagename], [remarks] ,cast([Inventory_id] as nvarchar(50))+'-I' [intid] FROM [package_master] pm left join [Sub_package] sp on pm.pk = sp.package_id where pm.[pk] = '" + e.CommandArgument.ToString() + "'";
            cnn.Open();
            SqlCommand cmd = new SqlCommand(strSql, cnn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtName.Text = dr["packagename"].ToString();
                    txtUserComments.Text = dr["remarks"].ToString();
                    subitem.Add(dr["intid"].ToString());
                    hfpk.Value = e.CommandArgument.ToString();

                    btnSubmit.Visible = false;
                    btndelete.Visible = true;
                    btnUpdate.Visible = true;


                }
            }


            var names = subitem;

            foreach (ListItem item in dditem.Items)
            {
                if (names.Contains(item.Value))
                    item.Selected = true;
            }

            cnn.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> lstitem = new List<string>();
            string itemnm = "";

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand command = new SqlCommand(
                  "update [dbo].[package_master] set [packagename] = '" + txtName.Text + "', [remarks] = '" + txtUserComments.Text + "' where pk = '" + hfpk.Value + "'   delete from Sub_package where package_id = '" + hfpk.Value + "'", cnn))
                {
                    int result = command.ExecuteNonQuery();
                }

                foreach (ListItem ddlobj in dditem.Items)
                {
                    if (ddlobj.Selected)
                    {
                        string[] item = ddlobj.Value.Split('-');

                        if (item[1] == "I")
                        {
                            using (SqlCommand command = new SqlCommand(
                   "INSERT INTO [dbo].[Sub_package] ([package_id] ,[Inventory_id]) VALUES ('" + hfpk.Value + "' ,'" + item[0] + "')", cnn))
                            {
                                int result = command.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            using (SqlCommand command = new SqlCommand(
                   "INSERT INTO [dbo].[Sub_package] ([package_id] ,[Inventory_id]) (select '" + hfpk.Value + "' ,[Inventory_id] FROM [dbo].[Sub_package] where package_id = '" + item[0] + "')", cnn))
                            {
                                int result = command.ExecuteNonQuery();
                            }
                        }
                    }
                }

                Response.Write("<script>alert('Data Updated Successfully');</script>");

                Server.Transfer("PackageMaster.aspx");
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
               "delete [dbo].[package_master] WHERE pk = '" + hfpk.Value + "'  delete [Sub_package] where [package_id] = '" + hfpk.Value + "'", cnn))
                {
                    int result = command.ExecuteNonQuery();

                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                    else
                    {
                        Response.Write("<script>alert('Data Deleted Successfully');</script>");

                        Server.Transfer("PackageMaster.aspx");
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


    protected void btndetails_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT [pk] ,[MMOPLCode] ,[TIMLCode] ,[Description] ,cast([rate] as nvarchar(50)) [rate], [type] , [loc] FROM [Inventory_Master]", cnn))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (ListView2.Items.Count > 0)
                        { ListView2.Items.Clear(); }

                        ListView2.DataSource = ds.Tables[0];
                        ListView2.DataBind();

                        ModalPopupExtender3.Show();
                    }
                    else
                    {
                        ListView2.DataSource = null;
                        ListView2.DataBind();
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

    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "viewdata"))
        {
            List<string> subitem = new List<string>();
            subitem.Add(e.CommandArgument.ToString() + "-I");
            var names = subitem;

            foreach (ListItem item in dditem.Items)
            {
                if (names.Contains(item.Value))
                    item.Selected = true;
            }

            ModalPopupExtender3.Hide();
        }
    }
}
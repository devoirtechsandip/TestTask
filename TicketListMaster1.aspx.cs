﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;
using System.Web.UI.HtmlControls;
using System.Configuration;
using AjaxControlToolkit;

public partial class TicketListMaster1 : System.Web.UI.Page
{
    cls_Common_cls cls = new cls_Common_cls();
    private string action;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            BindListView();
            BindDDLPriority();
            BindDDlStatus();
        }
    }

    private void BindDDlStatus()
    {
        try
        {

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {

                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                cnn.Open();
                cls.F_BIND_DROPDOWN("SELECT [pk],[Status] FROM [Status_Master] where Valid='1'", ddlstatus, cnn);
                cnn.Close();
            }


        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }

    private void BindDDLPriority()
    {
        try
        {

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {

                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                cnn.Open();
                cls.F_BIND_DROPDOWN("SELECT [pk],[Priority] FROM [Priority_Master] where Valid='1'", ddlPriority, cnn);
                cnn.Close();
            }


        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
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

                    cmd.CommandText = "SELECT [pk],[Subject],[Description],[CategoryId],[PriorityId],[Status],[DateUpdated],[UserName], case when Status = 'Open' then 'bg-red' else case when Status = 'Pending' then 'bg-yellow' else 'bg-green' end end [stat] , case when PriorityId = 'High' then 'bg-red' else case when PriorityId = 'Medium' then 'bg-yellow' else 'bg-green' end end [prior] from [CreateNewTicket_Master] where Valid=1 and DeleteIt = 'N' ";
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //to search text of txtSearchMaster on click of search button
        DataSet ds = Bind();
        if (txtSearchMaster.Text.Trim() != String.Empty)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtSearchMaster.Text = " ";
            }
        }
        else BindListView();
        lstdc.DataBind();
    }

    private DataSet Bind()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from CreateNewTicket_Master where  Valid=1 and Subject like'" + txtSearchMaster.Text.Trim() + "%'", cnn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lstdc.DataSource = ds.Tables[0];
                lstdc.DataBind();
            }
        }
        return ds;
    }
    protected void btopen_Click(object sender, EventArgs e)
    {
        Response.Redirect("PostReply.aspx");
    }

    protected void btnchangestatus_Click(object sender, EventArgs e)
    {
        mpechangestatus.Show();
    }


    protected void btnupdate_Click(object sender, EventArgs e)
    { // For changing status nd priority
        foreach (ListViewDataItem item in lstdc.Items)
        {
            var chkpk = item.FindControl("chkpk") as System.Web.UI.HtmlControls.HtmlInputCheckBox;
            if (chkpk != null && chkpk.Checked)
            {
                int value = Convert.ToInt32(chkpk.Value);
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("UPDATE [CreateNewTicket_Master] SET [PriorityId] =@PriorityId, [Status] = @Status WHERE pk='" + value + "'", con))
                    {

                        cmd.Parameters.AddWithValue("@PriorityId", ddlPriority.SelectedItem.Text.Trim());
                        cmd.Parameters.AddWithValue("@Status", ddlstatus.SelectedItem.Text.Trim());
                        cmd.ExecuteNonQuery();
                        con.Close(); 
                    }
                }
                BindListView();
               // clear();
            }
        }
    }
    //public void clear()
    //{
    //    try
    //    {
    //        ddlPriority.Text = string.Empty;
    //        ddlstatus.Text = string.Empty;

    //    }
    //    catch (Exception ex)
    //    { }
    //}

    protected void btndelete_Click(object sender, EventArgs e)
    {
         foreach (ListViewDataItem item in lstdc.Items)
        {
            var chkpk = item.FindControl("chkpk") as System.Web.UI.HtmlControls.HtmlInputCheckBox;
            if (chkpk != null && chkpk.Checked)
            {
                int value = Convert.ToInt32(chkpk.Value);
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("UPDATE [CreateNewTicket_Master] SET [DeleteIt] =@DeleteIt WHERE pk='" + value + "'", con))
                    {
                        cmd.Parameters.AddWithValue("@DeleteIt", "Y");
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                BindListView();
                // clear();
            }
        }

    }
}
   
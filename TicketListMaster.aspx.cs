using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TicketListMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindListView();
            //}
            //else
            //{
            //    Response.Redirect("LogInForm.aspx");
            //}
        }
        //    if (!String.IsNullOrEmpty(Request.QueryString["srch"]))
        //{
        //        //perform search and display results
        //    }


    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //var searchText = Server.UrlEncode(txtSearchMaster.Text); // URL encode in case of special characters
        //Response.Redirect("~/CreateNewTicketMaster.aspx?srch=" + searchText);
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

                    cmd.CommandText = "SELECT * FROM [CreateNewTicket_Master] where Valid=1";
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



    protected void btopen_Click(object sender, EventArgs e)
    {
        Response.Redirect("PostReply.aspx");
    }
}
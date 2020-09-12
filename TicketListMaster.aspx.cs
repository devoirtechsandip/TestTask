using System;
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

    public DataSet Bind()
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
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostReply1 : System.Web.UI.Page
{
    private string path = @"C:\Users\Hp\Downloads\Application\Application - 1.1\Files\";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["pk"] != null)
        {
            lblTicketId.Text = Request.QueryString["pk"];
        }
        loadAttachment();
        loadReply(); 
        loadTicketStatus();
    }

    private void loadTicketStatus()
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

                    cmd.CommandText = "SELECT * from [CreateNewTicket_Master] where pk=" + Convert.ToInt32(lblTicketId.Text);
                    cmd.Connection = cnn;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        lblstatus.Text= ds.Tables[0].Rows[0]["Status"].ToString();
                        if (ds.Tables[0].Rows[0]["Status"].ToString() == "Open") lblstatus.BackColor = System.Drawing.Color.Red;
                        if (ds.Tables[0].Rows[0]["Status"].ToString() == "Pending") lblstatus.BackColor = System.Drawing.Color.Yellow;
                        if (ds.Tables[0].Rows[0]["Status"].ToString() == "Close") lblstatus.BackColor = System.Drawing.Color.Green;
                        lblcategory.Text = ds.Tables[0].Rows[0]["CategoryId"].ToString();
                        lblpriority.Text = ds.Tables[0].Rows[0]["PriorityId"].ToString();
                        if (ds.Tables[0].Rows[0]["PriorityId"].ToString() == "High") lblpriority.BackColor = System.Drawing.Color.Red;
                        if (ds.Tables[0].Rows[0]["PriorityId"].ToString() == "Medium") lblpriority.BackColor = System.Drawing.Color.Yellow;
                        if (ds.Tables[0].Rows[0]["PriorityId"].ToString() == "Low") lblpriority.BackColor = System.Drawing.Color.Green;
                        cnn.Close();
                    }

                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    private void loadAttachment()
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

                    cmd.CommandText = "SELECT [pk],[FileName] FROM [TicketFile_Master] where TicketId=" + Convert.ToInt32(lblTicketId.Text);
                    cmd.Connection = cnn;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        gridAttachment.DataSource = ds;
                        gridAttachment.DataBind();

                        cnn.Close();
                    }

                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    private void loadReply()
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

                    cmd.CommandText = "SELECT a.[pk],b.[Username],b.[Subject],a.[ReplyMessage],a.[BCC],a.[DatePosted],a.[TicketId] " +
                        "FROM [PostReply_Master] a join CreateNewTicket_Master b on a.TicketId = b.pk where a.TicketId=" + Convert.ToInt32(lblTicketId.Text);
                    cmd.Connection = cnn;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        lstReply.DataSource = ds;
                        lstReply.DataBind();
                        lblSubject.Text= ds.Tables[0].Rows[0]["Subject"].ToString();
                        cnn.Close();
                    }

                }
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnCloseTicket_Click(object sender, EventArgs e)
    {

    }

    protected void btnPosteRply_Click(object sender, EventArgs e)
    {
        pnlPostRply.Visible = true;
    }
    public void clear()
    {
        try
        {
            txtReply.Text = string.Empty;
            txtBCC.Text = string.Empty;
        }
        catch (Exception ex)
        { }
    }
    protected void btnSubmitReply_Click(object sender, EventArgs e)
    {
        InsertRole();
    }
    public void InsertRole()
    {
        try
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
            cnn.Open();
            var query = string.Empty;
            var rply = (string.IsNullOrEmpty(txtReply.Text.Trim())) ? string.Empty : txtReply.Text.Trim();
            var bcc = (string.IsNullOrEmpty(txtBCC.Text.Trim())) ? string.Empty : txtBCC.Text.Trim();
            query = "insert into [PostReply_Master](ReplyMessage,BCC,DatePosted,TicketId)" + "values('" + rply + "','" + bcc + "','" + DateTime.Now + "','" + Convert.ToInt32(lblTicketId.Text) + "')";
            //query = "insert into [PostReply1_Master](Username,ReplyMessage,BCC,DatePosted,TicketId)" + "values('" + "Deepak" + "','" + rply + "','" + bcc + "','" + DateTime.Now + "','" + Convert.ToInt32(lblTicketId.Text) + "')";
            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                int result = cmd.ExecuteNonQuery();
            }

            cnn.Close();
            clear();
            loadReply();
        }
        catch (Exception ex)
        {

        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlPostRply.Visible = false;
    }

    protected void lnkDownload_Click(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        string fileName = null;
        string constr = ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {

            string query = "SELECT pk, Filename, TicketId FROM TicketFile_Master where pk=" + id;
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows) fileName = dr.ItemArray[1].ToString();

        }
        string file = "~/Files/" + fileName.ToString();
        string strURL = file;
        WebClient req = new WebClient();
        HttpResponse response = HttpContext.Current.Response;
        response.Clear();
        response.ClearContent();
        response.ClearHeaders();
        response.Buffer = true;
        response.AddHeader("Content-Disposition", "attachment;filename=\"" + Server.MapPath(strURL) + "\"");
        byte[] data = req.DownloadData(Server.MapPath(strURL));
        response.BinaryWrite(data);
        response.End();
    }
}
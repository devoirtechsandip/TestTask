using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class PostReply : System.Web.UI.Page
{
    private string path = @"C:\Users\Hp\Downloads\Application\Application - 1.1\Files\";

    protected void Page_Load(object sender, EventArgs e)
    {
        lblTicketId.Text = "1";
        if (!Page.IsPostBack)
        {
            DirectoryInfo di = new DirectoryInfo(path);
            FileInfo[] fi = di.GetFiles();


            foreach (FileInfo file in fi)
            {
                //ListBox1.Items.Add(file.Name);
            }
        }
        loadAttachment();
        loadReply();

    }
    //protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    WebClient client = new WebClient();
    //    Byte[] buffer = client.DownloadData(path + ListBox1.SelectedValue);
    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("content-length", buffer.Length.ToString());
    //    Response.BinaryWrite(buffer);
    //}

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

                    cmd.CommandText = "SELECT [pk],[Username],[ReplyMessage],[BCC],[DatePosted],[TicketId] FROM [PostReply_Master] where TicketId=" + Convert.ToInt32(lblTicketId.Text);
                    cmd.Connection = cnn;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        lstReply.DataSource = ds;
                        lstReply.DataBind();

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

    protected void btnSubmitReply_Click(object sender, EventArgs e)
    {
        InsertRole();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

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
    public void InsertRole()
    {
        try
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
            cnn.Open();
            var query = string.Empty;
            var rply = (string.IsNullOrEmpty(txtReply.Text.Trim())) ? string.Empty : txtReply.Text.Trim();
            var bcc = (string.IsNullOrEmpty(txtBCC.Text.Trim())) ? string.Empty : txtBCC.Text.Trim();
            query = "insert into [PostReply_Master](Username,ReplyMessage,BCC,DatePosted,TicketId)" + "values('" + "Deepak" + "','" + rply + "','" + bcc + "','" + DateTime.Now + "','" + Convert.ToInt32(lblTicketId.Text) + "')";
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
}

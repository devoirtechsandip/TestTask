using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CreateNewTicketMaster : System.Web.UI.Page
{
    cls_Common_cls cls = new cls_Common_cls();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDDLCategory();
            BindDDLPriority();
            FillCapctha();
        }
    }
    void FillCapctha()
    {

        try

        {

            Random random = new Random();

            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

            StringBuilder captcha = new StringBuilder();

            for (int i = 0; i < 6; i++)
            {

                captcha.Append(combination[random.Next(combination.Length)]);

                Session["captcha"] = captcha.ToString();

                imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();

            }
        }

        catch

        {

            throw;

        }
    }
    public void BindDDLCategory()
    {
        try
        {

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString))
            {

                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                cnn.Open();
                cls.F_BIND_DROPDOWN("SELECT [pk],[Category] FROM [Category_Master] where Valid='1'", ddlCategory, cnn);
                cnn.Close();
            }


        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }
    public void BindDDLPriority()
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

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtsubject.Text = "";
        txtTextArea.Value = "";
        ddlPriority.SelectedIndex = 0;
        ddlCategory.SelectedValue = "1";
        //CheckBox1.Checked = false;
        FileUpload1.Dispose();
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            if (Session["captcha"].ToString() != txtCaptcha.Text)
            {
                lblErrorMsg.Text = "Invalid Captcha Code";
            }
            else
            {
                ViewState["TicketId"] = null;
                InsertTicket();
                InsertFile();
                InsertPostReply();
                HttpCookie aCookie = Request.Cookies["UserDetails"];
                //redirected page according to role
                if (aCookie != null)
                {
                    if (aCookie["Role"] == "User") Response.Redirect("TicketListMaster.aspx");
                    else if (aCookie["Role"] == "Admin") Response.Redirect("TicketListMaster1.aspx");
                }
            }
        }
        else return;
    }

    protected void InsertTicket()
    {
        try
        {
            HttpCookie aCookie = Request.Cookies["UserDetails"];
            string Role = null; //took variable to store role
            string UserName = null; //took variable for every admin to store UserName
            if (aCookie != null)
            {
                Role = aCookie["Role"];
                UserName = aCookie["Username"];
            }
           
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
            string query = "sp_InsertCreateNewTicket";         //Stored Procedure name   
            SqlCommand com = new SqlCommand(query, cnn);  //creating  SqlCommand  object  
            com.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure  

            //adding paramerters to  SqlCommand below  
            com.Parameters.AddWithValue("@Subject ", txtsubject.Text.ToString());
            com.Parameters.AddWithValue("@PriorityId ", ddlPriority.SelectedItem.ToString());
            com.Parameters.AddWithValue("@CategoryId ", ddlCategory.SelectedItem.ToString());
            com.Parameters.AddWithValue("@Status", "Open");
            com.Parameters.AddWithValue("@DateUpdated", DateTime.Now);
            com.Parameters.AddWithValue("@pk", System.DBNull.Value);
            com.Parameters.AddWithValue("@DeleteIt", "N");
            com.Parameters.AddWithValue("@Role", Role);
            com.Parameters.AddWithValue("@UserName", UserName);
            cnn.Open();
            com.ExecuteNonQuery(); //executing the sqlcommand  
            string query2 = "Select @@Identity as insertedID from CreateNewTicket_Master";
            com.CommandText = query2;
            com.CommandType = CommandType.Text;
            com.Connection = cnn; 
            int insertedID = Convert.ToInt32(com.ExecuteScalar());
            ViewState.Add("TicketId", insertedID);
            cnn.Close(); 
        }
        catch (Exception ex) { }
      
    }

    protected void InsertFile()
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
        foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
        {
            string folderPath = Server.MapPath("~/Files/");
            string filename = System.DateTime.Now.ToString("ddMMyyyyHHmmss") + Path.GetExtension(postedFile.FileName);

            postedFile.SaveAs(Path.Combine(folderPath, filename));



            using (Stream fs = postedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string query = "sp_InsertTicketFileMaster";         //Stored Procedure name   
                    SqlCommand com = new SqlCommand(query, cnn);  //creating  SqlCommand  object  
                    com.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure  

                    //adding paramerters to  SqlCommand below 
                    com.Parameters.AddWithValue("@FileName", filename);
                    com.Parameters.AddWithValue("@TicketId ", Convert.ToInt32(ViewState["TicketId"]));
                    com.Parameters.AddWithValue("@pk", System.DBNull.Value);
                    cnn.Open();
                    com.ExecuteNonQuery();                     //executing the sqlcommand  
                    cnn.Close();
                }
            }
        }
    }

    private void InsertPostReply()
    {
        try
        {
            HttpCookie aCookie = Request.Cookies["UserDetails"];
            string Role = null; //took variable to store role
            string UserName = null; //took variable for every admin to store UserName 
            if (aCookie != null)
            {
                Role = aCookie["Role"];
                UserName = aCookie["Username"]; 
            }

            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);
            string query = "sp_InsertPostReply";         //Stored Procedure name   
            SqlCommand com = new SqlCommand(query, cnn);  //creating  SqlCommand  object  
            com.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure  

            //adding paramerters to  SqlCommand below 
            com.Parameters.AddWithValue("@pk", System.DBNull.Value);
            com.Parameters.AddWithValue("@ReplyMessage ", txtTextArea.Value.ToString());
            com.Parameters.AddWithValue("@BCC ", System.DBNull.Value);
            com.Parameters.AddWithValue("@PostedUser ", UserName);
            com.Parameters.AddWithValue("@DatePosted ", DateTime.Now);
            com.Parameters.AddWithValue("@TicketId ", Convert.ToInt32(ViewState["TicketId"]));
            
            cnn.Open();
            com.ExecuteNonQuery();                     //executing the sqlcommand  
            cnn.Close();
        }
        catch (Exception ex) { }

    } 
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }
}
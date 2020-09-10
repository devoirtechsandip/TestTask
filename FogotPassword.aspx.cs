using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class FogotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String temppwd = RandomPassword();
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT [email] FROM [User_Master] where [loginid] = '" + txtUserName.Text.Trim() + "'  Update [User_Master] set [password] = '" + temppwd + "' where [loginid] = '" + txtUserName.Text.Trim() + "'", cnn))
                {

                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        SendEmail(ds.Tables[0].Rows[0]["email"].ToString(), temppwd);

                        Response.Write("<script>alert('Password send to Email.');</script>");

                        Server.Transfer("login.aspx");
                    }
                }
            }
        }
        catch (Exception Ex)
        {

        }
        finally
        { }
    }

    public void SendEmail(string email, string topassword)
    {
        if (txtUserName.Text != "")
        {
            try
            {
                var from = HttpContext.Current.Request.Cookies["smtpuser"].Value.ToString();
                string fromPassword = HttpContext.Current.Request.Cookies["smtppwd"].Value.ToString();

                string subject = "Metro Care Password";
                string body = "Dear User,<br /><br />Password for your CRM user id " + txtUserName.Text + " has been reset to " + topassword + "<br />Please login with the above password and change password by selecting “Change Password” tab on the left hand side in system.<br /><br /><br />Regards,<br />Team - Customer Care";

                MailMessage message = new MailMessage(HttpContext.Current.Request.Cookies["senderid"].Value.ToString(), email);

                message.IsBodyHtml = true;
                message.Body = body;
                message.Subject = subject;

                var smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = HttpContext.Current.Request.Cookies["smtpserver"].Value.ToString();
                smtp.Port = Convert.ToInt32(HttpContext.Current.Request.Cookies["smtpport"].Value.ToString());
                smtp.EnableSsl = Convert.ToBoolean(HttpContext.Current.Request.Cookies["smtpssl"].Value.ToString());
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(from, fromPassword);

                smtp.Send(message);
            }
            catch (Exception ex)
            {
            }
        }
    }

    public string RandomPassword()
    {
        StringBuilder builder = new StringBuilder();
        builder.Append(RandomString(2, true));
        builder.Append(RandomNumber(10, 99));
        builder.Append(RandomString(2, false));
        return builder.ToString();
    }

    public string RandomString(int size, bool lowerCase)
    {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }
        if (lowerCase)
            return builder.ToString().ToLower();
        return builder.ToString();
    }

    public int RandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }


}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

/// <summary>
/// Summary description for CommonCls
/// </summary>
public class clsCommon
{
    ConnectDB ObjCon;
    SqlCommand cmd;
    DataTable dt;
    SqlDataReader dr;
    public string strDateFormat;
    public clsCommon()
    {
        //
        // TODO: Add constructor logic here
        //
        strDateFormat = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
    }

    public DataTable getDataTable(string query)
    {
        dt = new DataTable();

        ObjCon = new ConnectDB();
        cmd = new SqlCommand(query, ObjCon.con);

        using (SqlDataAdapter a = new SqlDataAdapter(cmd))
        {
            a.Fill(dt);
        }
        return dt;
    }

    public async Task SendEmail(string toemail, string msg, string sub, string cc, string att="")
    {
        if (toemail != "")
        {
            try
            {
                var from = HttpContext.Current.Request.Cookies["smtpuser"].Value.ToString();
                string fromPassword = HttpContext.Current.Request.Cookies["smtppwd"].Value.ToString();

                string subject = sub;
                string body = msg;
                //"CRM_Notification@reliancemumbaimetro.com"
                MailMessage message = new MailMessage(HttpContext.Current.Request.Cookies["senderid"].Value.ToString(), toemail);
                if (cc != "")
                {
                    message.CC.Add(cc);
                }

                message.Bcc.Add("mmcrmmmopl@gmail.com");

                if (att != "")
                {
                    string[] at = att.Split(',');
                    foreach (var atobj in at)
                    {
                        if (atobj != "")
                        {
                            Attachment attachment = new Attachment(atobj);
                            message.Attachments.Add(attachment);
                        }
                    }
                }
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

                smtp.SendMailAsync(message);
            }
            catch (Exception ex)
            {
            }
        }
    }

    public void SendEmail1(string toemail, string msg, string sub, string cc, string att = "")
    {
        if (toemail != "")
        {
            try
            {
                //var from = HttpContext.Current.Request.Cookies["smtpuser"].Value.ToString();
                string fromPassword = HttpContext.Current.Request.Cookies["smtppwd"].Value.ToString();

                string subject = sub;
                string body = msg;
                //"CRM_Notification@reliancemumbaimetro.com"
                MailMessage message = new MailMessage(HttpContext.Current.Request.Cookies["senderid"].Value.ToString(), toemail);
                if (cc != "")
                {
                    message.CC.Add(cc);
                }

                message.Bcc.Add("mmcrmmmopl@gmail.com");

                if (att != "")
                {
                    string[] at = att.Split(',');
                    foreach (var atobj in at)
                    {
                        if (atobj != "")
                        {
                            Attachment attachment = new Attachment(atobj);
                            message.Attachments.Add(attachment);
                        }
                    }
                }
                message.IsBodyHtml = true;
                message.Body = body;
                message.Subject = subject;

                var smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = HttpContext.Current.Request.Cookies["smtpserver"].Value.ToString();
                smtp.Port = Convert.ToInt32(HttpContext.Current.Request.Cookies["smtpport"].Value.ToString());
                smtp.EnableSsl = Convert.ToBoolean(HttpContext.Current.Request.Cookies["smtpssl"].Value.ToString());
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
               // smtp.Credentials = new NetworkCredential(from, fromPassword);

                smtp.Send(message);
            }
            catch (Exception ex)
            {
            }
        }
    }

    public void SendSMS(string mobileno, string msg)
    {
        if (mobileno != "")
        {
            try
            {
                String url = string.Format(HttpContext.Current.Request.Cookies["smsgatewayurl"].Value.ToString(), mobileno, msg);
                HttpWebRequest myReq =  (HttpWebRequest)WebRequest.Create(url);
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }

    public string ToEmailListGenerator(string actionid, string dept)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                string strquery = "declare @tmp nvarchar(max) SET @tmp = '' select @tmp = @tmp +  um.email + ', ' FROM [Action_Email_Map] aem left join [dbo].[User_Dept_Role_Map] udrm on aem.roleid = udrm.roleid left join User_Master um on um.pk = udrm.userpk where actionid = '" + actionid + "' and deptid like case when (udrm.roleid = 1010 or udrm.roleid = 5) then '" + dept + "' else '%%' end and type = 'To' GROUP BY um.email select SUBSTRING(@tmp, 0, LEN(@tmp))";

                using (SqlCommand cmd = new SqlCommand(strquery, cnn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            return dr[0].ToString();
                        }
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
        return "";
    }

    public string CcEmailListGenerator(string actionid, string dept)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                string strquery = "declare @tmp nvarchar(max) SET @tmp = '' select @tmp = @tmp +  um.email + ', ' FROM [Action_Email_Map] aem left join [dbo].[User_Dept_Role_Map] udrm on aem.roleid = udrm.roleid left join User_Master um on um.pk = udrm.userpk where actionid = '" + actionid + "' and deptid like case when (udrm.roleid = 1010 or udrm.roleid = 5) then '" + dept + "' else '%%' end and type = 'Cc' GROUP BY um.email select SUBSTRING(@tmp, 0, LEN(@tmp))";

                using (SqlCommand cmd = new SqlCommand(strquery, cnn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            return dr[0].ToString();
                        }
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
        return "";
    }

    public string SMSListGenerator(string actionid, string dept)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                string strquery = "declare @tmp nvarchar(max) SET @tmp = '' select @tmp = @tmp +  um.mobile + ',' FROM [Action_Email_Map] aem left join [dbo].[User_Dept_Role_Map] udrm on aem.roleid = udrm.roleid left join User_Master um on um.pk = udrm.userpk where actionid = '" + actionid + "' and deptid like case when (udrm.roleid = 1010 or udrm.roleid = 5) then '" + dept + "' else '%%' end and type = 'SMS' GROUP BY um.mobile select SUBSTRING(@tmp, 0, LEN(@tmp))";

                using (SqlCommand cmd = new SqlCommand(strquery, cnn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            return dr[0].ToString();
                        }
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
        return "";
    }

    public string ApprovalEmailList(string actionid, string dept)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                string strquery = "declare @tmp nvarchar(max) SET @tmp = '' select @tmp = @tmp +  um.email + ', ' FROM [Action_Approval_matrix] aem left join [dbo].[User_Dept_Role_Map] udrm on aem.[approverrole] = udrm.roleid left join User_Master um on um.pk = udrm.userpk where actionid = '" + actionid + "' and deptid like case when (udrm.roleid = 1010 or udrm.roleid = 5) then '" + dept + "' else '%%' end and aem.type = 'Email' group by um.email select SUBSTRING(@tmp, 0, LEN(@tmp))";

                using (SqlCommand cmd = new SqlCommand(strquery, cnn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            return dr[0].ToString();
                        }
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
        return "";
    }

    public string ApprovalSMSList(string actionid, string dept)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                string strquery = "declare @tmp nvarchar(max) SET @tmp = '' select @tmp = @tmp +  um.mobile + ',' FROM [Action_Approval_matrix] aem left join [dbo].[User_Dept_Role_Map] udrm on aem.[approverrole] = udrm.roleid left join User_Master um on um.pk = udrm.userpk where actionid = '" + actionid + "' and deptid like case when (udrm.roleid = 1010 or udrm.roleid = 5) then '" + dept + "' else '%%' end and aem.type = 'SMS' group by um.mobile select SUBSTRING(@tmp, 0, LEN(@tmp))";

                using (SqlCommand cmd = new SqlCommand(strquery, cnn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            return dr[0].ToString();
                        }
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
        return "";
    }
}
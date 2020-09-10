using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InventoryAvailabilityReport : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtstartdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtEndDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

            btnGenerate_Click(btnGenerate, e);
        }
    }
    
    protected void btndownload_Click(object sender, EventArgs e)
    {
        try
        {
            string Path = "Availability Report.xls";
            FileInfo FI = new FileInfo(Path);
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWriter);

            lstdc.RenderControl(htmlWrite);

            System.IO.StreamWriter vw = new System.IO.StreamWriter(Server.MapPath(Path), true);
            stringWriter.ToString().Normalize();
            vw.Write(stringWriter.ToString());
            vw.Flush();
            vw.Close();
            WriteAttachment(FI.Name, "application/vnd.ms-excel", stringWriter.ToString());
        }
        catch (Exception Ex)
        {  }
        finally
        { }
    }

    public static void WriteAttachment(string FileName, string FileType, string content)
    {
        HttpResponse Response = System.Web.HttpContext.Current.Response;
        Response.ClearHeaders();
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName);
        Response.ContentType = FileType;
        Response.Write(content);
        Response.End();
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                HttpCookie aCookie = Request.Cookies["UserDetails"];
                String str = "exec getavailableInventory '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "', '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "'";
                
                using (SqlDataAdapter da = new SqlDataAdapter(str, cnn))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lstdc.DataSource = ds.Tables[0];
                        lstdc.DataBind();
                    }
                    else
                    {
                        lstdc.DataSource = null;
                        lstdc.DataBind();
                    }
                }
            }
        }
        catch (Exception Ex)
        { }
        finally
        { }
    }
}
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

public partial class DailyReport : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtstartdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtEndDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }
    
    protected void btndownload_Click(object sender, EventArgs e)
    {
        try
        {
            string Path = "Daily Report.xls";
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
                String str = "";

                if (ddlorderstatus.SelectedItem.Text == "All")
                {
                    str = "SELECT ROW_NUMBER() OVER(ORDER BY bookingid) AS [Row_Number],  [pk],[bookingid],(select [type] from [type_master] where pk = [bookingtype]) [bookingtype],convert(varchar, [startdate], 103) [startdate],convert(varchar, [enddate], 103) [enddate],[agency] ,[brand] ,[client] ,[pono] ,[code] ,[codeid] ,case when [type] = 'I' then 'Inventory' else 'Package' end [type] ,dbo.[udf_NumberToCurrency](cast([cardrate] as decimal(18, 0))) [cardrate], dbo.[udf_NumberToCurrency](cast([sellingrate] as decimal(18, 0))) [sellingrate], dbo.[udf_NumberToCurrency] (cast([premiunrate] as decimal (18, 0))) [premiunrate] FROM [AD_DB].[dbo].[Sales_Master] where (startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') or (enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') or (startdate<= '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and enddate >= '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "')";
                }
                else if (ddlorderstatus.SelectedItem.Text == "Complete")
                {
                    str = "SELECT ROW_NUMBER() OVER(ORDER BY bookingid) AS [Row_Number],  [pk],[bookingid],(select [type] from [type_master] where pk = [bookingtype]) [bookingtype],convert(varchar, [startdate], 103) [startdate],convert(varchar, [enddate], 103) [enddate],[agency] ,[brand] ,[client] ,[pono] ,[code] ,[codeid] ,case when [type] = 'I' then 'Inventory' else 'Package' end [type] ,dbo.[udf_NumberToCurrency](cast([cardrate] as decimal(18, 0))) [cardrate], dbo.[udf_NumberToCurrency](cast([sellingrate] as decimal(18, 0))) [sellingrate], dbo.[udf_NumberToCurrency] (cast([premiunrate] as decimal (18, 0))) [premiunrate] FROM [AD_DB].[dbo].[Sales_Master] where ([agency] != '' and [brand] != '' and [client] != '' and [pono] != '') and ((startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') or (enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') or (startdate<= '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and enddate >= '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "'))";
                }
                else
                {
                    str = "SELECT ROW_NUMBER() OVER(ORDER BY bookingid) AS [Row_Number],  [pk],[bookingid],(select [type] from [type_master] where pk = [bookingtype]) [bookingtype],convert(varchar, [startdate], 103) [startdate],convert(varchar, [enddate], 103) [enddate],[agency] ,[brand] ,[client] ,[pono] ,[code] ,[codeid] ,case when [type] = 'I' then 'Inventory' else 'Package' end [type] ,dbo.[udf_NumberToCurrency](cast([cardrate] as decimal(18, 0))) [cardrate], dbo.[udf_NumberToCurrency](cast([sellingrate] as decimal(18, 0))) [sellingrate], dbo.[udf_NumberToCurrency] (cast([premiunrate] as decimal (18, 0))) [premiunrate] FROM [AD_DB].[dbo].[Sales_Master] where ([agency] = '' or [brand] = '' or [client] = '' or [pono] = '') and ((startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') or (enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') or (startdate<= '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and enddate >= '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "'))";
                }

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
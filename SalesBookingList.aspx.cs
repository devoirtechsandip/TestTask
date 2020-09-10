using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SalesBookingList : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getAllpackage();
        }
    }

    public void getAllpackage()
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT [bookingid] ,(SELECT [type] FROM [dbo].[type_master] where pk = bookingtype) as [bookingtype] ,convert(varchar, [startdate], 103) [startdate] ,convert(varchar, [enddate], 103) [enddate] ,[agency] ,[brand] ,[client], [creativeapp], [pono] ,[code] ,dbo.[udf_NumberToCurrency](cast([cardrate] as decimal(18, 0))) [cardrate] ,dbo.[udf_NumberToCurrency](cast([sellingrate] as decimal(18, 0))) [sellingrate] ,dbo.[udf_NumberToCurrency](cast([premiunrate] as decimal(18, 0))) [premiunrate] FROM [dbo].[Sales_Master]", cnn))
                {
                    // 3
                    // Use DataAdapter to fill DataTable
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (lvBucket.Items.Count > 0)
                        { lvBucket.Items.Clear(); }

                        lvBucket.DataSource = ds.Tables[0];
                        lvBucket.DataBind();
                    }
                    else
                    {
                        lvBucket.DataSource = null;
                        lvBucket.DataBind();
                    }
                }
                cnn.Close();
            }
        }
        catch (Exception Ex)
        {

        }
        finally
        {
        }
    }



    protected void lvBucket_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "viewdata"))
        {
            Response.Redirect("SalesBooking.aspx?pk=" + e.CommandArgument.ToString());
        }
    }
}
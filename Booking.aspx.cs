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

public partial class Booking : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.EventStartDateColumnName = "EventStartDate";
            Calendar1.EventEndDateColumnName = "EventEndDate";
            Calendar1.EventDescriptionColumnName = "EventDescription";
            Calendar1.EventHeaderColumnName = "EventHeader";
            Calendar1.EventBackColorName = "EventBackColor";
            Calendar1.EventForeColorName = "EventForeColor";


            Calendar1.EventSource = GetEvents();
        }
    }

    private DataTable GetEvents()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Id", Type.GetType("System.Int32"));
        dt.Columns.Add("EventStartDate", Type.GetType("System.DateTime"));
        dt.Columns.Add("EventEndDate", Type.GetType("System.DateTime"));
        dt.Columns.Add("EventHeader", Type.GetType("System.String"));
        dt.Columns.Add("EventDescription", Type.GetType("System.String"));
        dt.Columns.Add("EventForeColor", Type.GetType("System.String"));
        dt.Columns.Add("EventBackColor", Type.GetType("System.String"));

        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                String str = "SELECT pk  as [Id] ,[bookingid] as [EventHeader] ,(SELECT [type] FROM [dbo].[type_master] where pk = [bookingtype]) +'\x0A' +[agency] +'\x0A' +[brand] +'\x0A' + [client]  as [EventDescription] ,[startdate] as [EventStartDate] ,[enddate] as  [EventEndDate] , 'White' as [EventForeColor], 'Navy' as 'EventBackColor' FROM [dbo].[Sales_Master]";

                using (SqlDataAdapter da = new SqlDataAdapter(str, cnn))
                {
                    da.Fill(dt);
                }
            }
        }
        catch (Exception Ex)
        { }
        finally
        { }

        return dt;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //SelectedDatesCollection theDates = Calendar1.SelectedDates;
        //DataTable dtSelectedDateEvents = Calendar1.EventSource.Clone();
        //DataTable dt = new DataTable();
        //dt.Columns.Add("ID", Type.GetType("System.Int32"));
        //dt.Columns.Add("Trip Start Date", Type.GetType("System.String"));
        //dt.Columns.Add("Trip End Date", Type.GetType("System.String"));
        //dt.Columns.Add("Description", Type.GetType("System.String"));

        //foreach (DataRow drEvent in Calendar1.EventSource.Rows)
        //    foreach (DateTime selectedDate in theDates)
        //        if (selectedDate.Date >= (Convert.ToDateTime(drEvent[Calendar1.EventStartDateColumnName])).Date
        //            && selectedDate.Date <= (Convert.ToDateTime(drEvent[Calendar1.EventEndDateColumnName])).Date)
        //        {
        //            // This Condition is just to ensure that Every Event Details are added just only once
        //            // irrespective of the number of days for which the event occurs.
        //            if (dtSelectedDateEvents.Select("Id= " + Convert.ToInt32(drEvent["Id"])).Length > 0)
        //                continue;

        //            DataRow dr = dt.NewRow();


        //            dr["ID"] = drEvent["Id"];
        //            dr["Trip Start Date"] = DateTime.ParseExact(drEvent[Calendar1.EventStartDateColumnName].ToString(), "MM/dd/yyyy hh:mm:ss tt", null).ToString("dd/MM/yyyy");
        //            dr["Trip End Date"] = DateTime.ParseExact(drEvent[Calendar1.EventEndDateColumnName].ToString(), "MM/dd/yyyy hh:mm:ss tt", null).ToString("dd/MM/yyyy");
        //            dr["Description"] = drEvent[Calendar1.EventDescriptionColumnName];
        //            //dr[Calendar1.EventDescriptionColumnName] = drEvent[Calendar1.EventDescriptionColumnName];

        //            //dr[Calendar1.EventForeColorName] = drEvent[Calendar1.EventForeColorName];
        //            //dr[Calendar1.EventBackColorName] = drEvent[Calendar1.EventBackColorName];

        //            dt.Rows.Add(dr);
        //        }

        //GridView1.DataSource = dt;
        //GridView1.DataBind();

        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT [bookingid] ,(SELECT [type] FROM [dbo].[type_master] where pk = bookingtype) as [bookingtype] ,convert(varchar, [startdate], 103) [startdate] ,convert(varchar, [enddate], 103) [enddate] ,[agency] ,[brand] ,[client], [pono] FROM [dbo].[Sales_Master] where '" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "' between startdate and enddate", cnn))
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

    protected void lstsubinventory_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            //Response.Cookies["Compid"].Value = ;
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT ROW_NUMBER() OVER (ORDER BY code) row_num, [code] ,[cardrate] ,[sellingrate] ,[premiumdisc] FROM [dbo].[sub_Sales] where [salesid] = '" + e.CommandArgument.ToString() + "'", cnn))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lstdetails.DataSource = ds.Tables[0];
                        lstdetails.DataBind();
                    }
                }
                ModalPopupExtender1.Show();
            }
        }
    }
}
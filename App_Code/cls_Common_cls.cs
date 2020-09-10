using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
/// Summary description for cls_Common_cls
/// </summary>
public class cls_Common_cls
{
    public cls_Common_cls()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    //public const String g_ConStrName = "Server=DRBHOSQLDEV;uid=sa;pwd=sa1985;database=Drbatrasdb";
    


    //Delete Flag 
    public const int Bill_Flag = 1;
    public const int Receipt_Flag = 2;
    public const int Patient_Reg_Flag = 3;
    public const int Enquiry_Del_Flag = 4;




    //Update Flag 
    public const int Bill_Update_Flag = 11;
    public const int Receipt_Update_Flag = 12;
    public const int Patient_Plan_Update_Flag = 13;
    public const int Patient_Status_Update_Flag = 14;
    public const int Waiting_Pat_Update_Flag = 15;



    //public const String g_ConStrName = "ConfigurationSettings.AppSettings["+cls_Common_cls.g_Conn+"]";



    #region"Pankaj"




    #region"FUNCTIONS"

    public string F_TODAYS_DATE()
    {
        string get_todays_date;
        string get_date = DateTime.Now.ToShortDateString();
        string get_day = DateTime.Now.Day.ToString();
        string get_month = DateTime.Now.Month.ToString();
        string get_year = DateTime.Now.Year.ToString();
        get_todays_date = get_month + "/" + get_day + "/" + get_year;
        return get_todays_date;
    }

    public string F_DATE_FORMAT_MM_dd_yyyy(string txt_dt)
    {


        if (txt_dt == "")
            return txt_dt;
        else
        {

            string date;
            string[] dtsplit = new string[3];
            dtsplit = txt_dt.Split('/');
            date = dtsplit[0] + "/" + dtsplit[1] + "/" + dtsplit[2];
            //dt = Convert.ToDateTime(txt_dt);
            //dt = Convert.ToDateTime(txt_dt);
            //ret_val = dt.ToString("dd/MM/yyyy");
            return date;

        }
    }

    public string F_DATE_FORMAT_dd_MM_yyyy(string txt_dt)
    {


        if (txt_dt == "")
            return txt_dt;
        else
        {

            string date;
            string[] dtsplit = new string[3];
            dtsplit = txt_dt.Split('/');
            date = dtsplit[1] + "/" + dtsplit[0] + "/" + dtsplit[2];
            //dt = Convert.ToDateTime(txt_dt);
            //dt = Convert.ToDateTime(txt_dt);
            //ret_val = dt.ToString("dd/MM/yyyy");
            return date;

        }
    }

    public void MSGBOX(String msg, System.Web.UI.Page pg)
    {
        msg = msg.Replace("'", "\\\'");
        msg = msg.Replace("\n", "\\\n");
        msg = msg.Replace("\r", "\\\r");
        msg = @"<script>alert('" + msg + "');</script>";
        pg.RegisterStartupScript(@"Startup", msg);
        //Page.RegisterClientScriptBlock(@"MsggBox", msg);
    }


    public void DisplayAJAXMessage(System.Web.UI.Control page, string msg)
    {
        string myScript = String.Format("alert('{0}');", msg);
        ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
    }

    public void DisplayAJAXMessageRedirect(System.Web.UI.Control page, string msg, string redirecturl)
    {
        string myScript = String.Format("alert('{0}');window.location='{1}';", msg, redirecturl);
        ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
    }

    #endregion

    #region"DB_FUN"

    public DataSet F_GETDATASET(String strQuery, SqlConnection cnn)
    {
        //DS = null;
        DataSet DS = new DataSet();
        if (cnn.State == ConnectionState.Closed)
        {
            cnn.Open();
        }
        try
        {
            string sp;
            //sp = "EXEC [SP_GET_TASK]";
            SqlCommand cmd = new SqlCommand(strQuery, cnn);
            cmd.CommandTimeout = 0;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(DS);
            cnn.Close();
            //cnn.Dispose();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
        return DS;
    }

    public DataSet F_BIND_GRID(string strQuery, GridView grdName, Label lblAlert, SqlConnection cnn)
    {
        DataSet DS_G = new DataSet();
        try
        {

            DS_G = F_GETDATASET(strQuery, cnn);

            if (DS_G.Tables[0].Rows.Count > 0)
            {
                lblAlert.Style["display"] = "none";
                grdName.Style["display"] = "inline";
                grdName.DataSource = DS_G;
                grdName.DataBind();
                //ViewState["ds"] = DS;
            }
            else
            {
                grdName.Style["display"] = "none";
                lblAlert.Style["display"] = "inline";
                lblAlert.Text = "No Records Found...";

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
        return DS_G;




    }
    public DataSet F_BIND_GRID(string strQuery, GridView grdName, SqlConnection cnn)
    {
        DataSet DS_G = new DataSet();
        //DS = null;
        try
        {

            DS_G = F_GETDATASET(strQuery, cnn);

            if (DS_G.Tables[0].Rows.Count > 0)
            {
                grdName.DataSource = DS_G;
                grdName.DataBind();
                //ViewState["ds"] = DS;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
        return DS_G;




    }
    public DataSet F_BIND_DATAGRID(string strQuery, DataGrid grdName, SqlConnection cnn)
    {
        DataSet DS_G = new DataSet();
        //DS = null;
        try
        {

            DS_G = F_GETDATASET(strQuery, cnn);

            if (DS_G.Tables[0].Rows.Count > 0)
            {
                grdName.DataSource = DS_G;
                grdName.DataBind();
                //ViewState["ds"] = DS;
                grdName.Visible = true;
            }
            else
            {
                grdName.Visible = false;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
        return DS_G;




    }

    public void F_BIND_DROPDOWN(String strQuery, DropDownList get_drpid, SqlConnection cnn)
    {
        //0- TEXT, 1- VALUE

        try
        {

            DataSet DS_DDL = new DataSet();
            DS_DDL = F_GETDATASET(strQuery, cnn);
            if (DS_DDL.Tables[0].Rows.Count > 0)
            {
                get_drpid.DataSource = DS_DDL;
                get_drpid.DataTextField = DS_DDL.Tables[0].Columns[1].ToString();
                get_drpid.DataValueField = DS_DDL.Tables[0].Columns[0].ToString();
                get_drpid.DataBind();
                get_drpid.Items.Insert(0, "Please Select");

            }
            else
            {
                get_drpid.Items.Clear();
                get_drpid.Items.Insert(0, "Please Select");
            }

        }
        catch (Exception ex)
        {


        }
        finally
        {

        }

    }

    public void F_EXCENONQUERY(String sqlStr, SqlConnection cnn)
    {
        try
        {
            string sp;
            //sp = "EXEC [SP_GET_TASK]";
            SqlCommand cmd = new SqlCommand(sqlStr, cnn);
            cmd.CommandTimeout = 0;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            cnn.Dispose();
            //DataSet DS = new DataSet();


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }

    }

    public object F_EXCESCALAR(String sqlStr, SqlConnection cnn)
    {
        Object ObjValue;
        
        try
        {
            string sp;
            //sp = "EXEC [SP_GET_TASK]";
            SqlCommand cmd = new SqlCommand(sqlStr, cnn);
            cnn.Open();
            cmd.CommandTimeout = 0;
            ObjValue = cmd.ExecuteScalar();
            cnn.Close();
            cnn.Dispose();
            //DataSet DS = new DataSet();


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
        return ObjValue;

    }


    public bool EventLog(String strSession, int Bill_Receipt_ID, int Flag, int Patient_ID, SqlConnection cnn)
    {
        String sp = "EXEC [A_SP_Eventlog] '" + strSession + "'," + Bill_Receipt_ID + "," + Flag + "," + Patient_ID + " ";
        F_EXCENONQUERY(sp, cnn);

        return true;
    }

    public void F_BIND_DROPDOWN1(String strQuery, DropDownList get_drpid, SqlConnection cnn)
    {
        //0- TEXT, 1- VALUE

        try
        {

            DataSet DS_DDL = new DataSet();
            DS_DDL = F_GETDATASET(strQuery, cnn);
            if (DS_DDL.Tables[0].Rows.Count > 0)
            {
                get_drpid.DataSource = DS_DDL;
                get_drpid.DataTextField = DS_DDL.Tables[0].Columns[0].ToString();
                get_drpid.DataValueField = DS_DDL.Tables[0].Columns[0].ToString();
                get_drpid.DataBind();
                get_drpid.Items.Insert(0, "Please Select");
            }
            else
            {
                get_drpid.Items.Clear();
                get_drpid.Items.Insert(0, "Please Select");
            }
        }
        catch (Exception ex)
        {
        }
        finally
        {

        }
    }

    public void F_BIND_DROPDOWNH(String strQuery, DropDownList get_drpid, SqlConnection cnn)
    {
        //0- TEXT, 1- VALUE

        try
        {

            DataSet DS_DDL = new DataSet();
            DS_DDL = F_GETDATASET(strQuery, cnn);
            if (DS_DDL.Tables[0].Rows.Count > 0)
            {
                get_drpid.DataSource = DS_DDL;
                get_drpid.DataTextField = DS_DDL.Tables[0].Columns[0].ToString();
                get_drpid.DataValueField = DS_DDL.Tables[0].Columns[0].ToString();
                get_drpid.DataBind();
                get_drpid.Items.Insert(0, "Please Select");
                get_drpid.Items.Insert(1, "Entire Site");
            }
            else
            {
                get_drpid.Items.Clear();
                get_drpid.Items.Insert(0, "Please Select");
            }
        }
        catch (Exception ex)
        {
        }
        finally
        {

        }
    }
    #endregion

    #endregion


}

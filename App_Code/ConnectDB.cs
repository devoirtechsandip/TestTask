using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public class ConnectDB
{
    public SqlCommand cmd;
    public SqlDataReader dr;
    public SqlTransaction ts;
    public string pk = "0";

    int refNo = 0;
    bool b = false;
  public  SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    public ConnectDB()
    {
        cmd = new SqlCommand();
        con.Open();
    }

    public SqlDataReader getData(string command)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            cmd = con.CreateCommand();

            dr = null;
            cmd.CommandText = command;
            cmd.Transaction = this.ts;

            dr = cmd.ExecuteReader();

            return dr;
        }

        catch (SqlException se)
        {

            con.Close();
            return null;
        }
    }

    public int affect(string command)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            cmd = con.CreateCommand();

            cmd.CommandText = command;
            cmd.Transaction = this.ts;

            int rowsAffected = cmd.ExecuteNonQuery();

            return rowsAffected;
        }

        catch (SqlException se)
        {

            con.Close();
            return 0;
        }
    }

    public int getRefNo(string query)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            dr = getData(query);

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    refNo = Convert.ToInt32(dr["Ref_no"]);
                }
            }

            return refNo;
        }

        catch (SqlException se)
        {
            con.Close();
            con.Dispose();
            return 0;
        }
    }


    public SqlConnection getConObj()
    {
        return con;
    }

    public void setSqlTran(SqlTransaction ts)
    {
        this.ts = ts;
    }

    public void releaseResources()
    {
        cmd.Dispose();
        con.Close();
    }

    public void MSGBOX(String msg, System.Web.UI.Page pg)
    {
        msg = msg.Replace("'", "\\\'");
        msg = msg.Replace("\n", "\\\n");
        msg = msg.Replace("\r", "\\\r");
        msg = @"<script>alert('" + msg + "');</script>";
        pg.RegisterStartupScript(@"Startup", msg);
       
    }


    public void DisplayAJAXMessage(System.Web.UI.Control page, string msg)
    {
        string myScript = String.Format("alert('{0}');", msg);
        ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
    }
}
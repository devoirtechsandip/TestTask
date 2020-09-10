using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SalesBooking : System.Web.UI.Page
{
    cls_Common_cls _cls = new cls_Common_cls();
    clsCommon cls = new clsCommon();
    static string emailcc = "khyati.tibrewal@relianceada.com, rohit.yajnik@relianceada.com";
    //static string emailcc = "kumbhar.sandip.b@gmail.com";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnSubmit.Visible = true;
            btndelete.Visible = false;
            btnUpdate.Visible = false;
            hfpk.Value = "";

            //divdatetime.Visible = false;
            try
            {
                using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    cnn.Open();
                    _cls.F_BIND_DROPDOWN("SELECT [pk] ,[type] FROM [dbo].[type_master]", ddlbookingtype, cnn);
                    cnn.Close();
                }
            }
            catch (Exception Ex)
            {

            }
            finally
            {

            }

            if (!String.IsNullOrEmpty(Request.QueryString["pk"]))
            {
                String pk = Request.QueryString["pk"].ToString();

                SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                SqlDataReader dr = null;
                List<string> subitem = new List<string>();

                string strSql = "SELECT [bookingid] ,[bookingtype] ,convert(varchar, [startdate], 103) [startdate] ,convert(varchar, [enddate], 103) [enddate] ,[agency] ,[brand] ,[client] ,[pono] ,[code] ,[codeid]+'-'+[type] as [it] ,cast([cardrate] as decimal(18, 2)) [cardrate],cast([sellingrate] as decimal(18, 2))[sellingrate] ,cast([premiunrate] as decimal(18, 2)) [premiunrate], remarks, creativeapp, [emailto] FROM [dbo].[Sales_Master] where [bookingid] = '" + pk + "'";
                cnn.Open();
                SqlCommand cmd = new SqlCommand(strSql, cnn);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblbookingid.Text = "Booking Id: " + dr["bookingid"].ToString();
                        ddlbookingtype.SelectedIndex = ddlbookingtype.Items.IndexOf(ddlbookingtype.Items.FindByValue(Server.HtmlDecode(dr["bookingtype"].ToString())));

                        txtstartdate.Text = dr["startdate"].ToString();
                        txtEndDate.Text = dr["enddate"].ToString();

                        txtAgency.Text = dr["agency"].ToString();
                        txtBrand.Text = dr["brand"].ToString();
                        txtClient.Text = dr["client"].ToString();

                        txtPONo.Text = dr["pono"].ToString();

                        dditem.SelectedValue = (string.IsNullOrEmpty(dr["it"].ToString())) ? "0" : dr["it"].ToString();
                        txtCardRate.Text = dr["cardrate"].ToString();
                        txtSellingRate.Text = dr["sellingrate"].ToString();
                        txtPremimumDiscount.Text = dr["premiunrate"].ToString();
                        txtUserComments.Text = dr["remarks"].ToString();

                        ddlcreativeapp.SelectedIndex = ddlcreativeapp.Items.IndexOf(ddlcreativeapp.Items.FindByText(Server.HtmlDecode(dr["creativeapp"].ToString())));

                        txtemailto.Text = dr["emailto"].ToString();
                        hfpk.Value = pk;

                        btnSubmit.Visible = false;
                        btndelete.Visible = true;
                        btnUpdate.Visible = true;
                    }
                }

                cnn.Close();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ddlbookingtype.SelectedItem.Text == "Please Select")
        {
            _cls.DisplayAJAXMessage(this, "Kindly Select booking type.");
        }
        else
        {
            if (ddlcreativeapp.SelectedItem.Text == "Yes")
            {
                if (validate2())
                //if (true)
                {
                    try
                    {
                        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                        {
                            cnn.Open();

                            string[] item = dditem.SelectedItem.Value.Split('-');

                            string complainid = getComplaintIdFromDb();

                            using (SqlCommand command = new SqlCommand(
                              "INSERT INTO [dbo].[Sales_Master] ([bookingid] ,[bookingtype] ,[startdate] ,[enddate] ,[agency] ,[brand] ,[client] ,[pono] ,[enterby], [code], [codeid] ,[type] ,[cardrate] ,[sellingrate] ,[premiunrate], [remarks], creativeapp, [emailto], [emailcc]) VALUES ('" + complainid + "' ,'" + ddlbookingtype.SelectedItem.Value + "' ,'" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' ,'" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' ,'" + txtAgency.Text + "' ,'" + txtBrand.Text + "' ,'" + txtClient.Text + "' ,'" + txtPONo.Text + "' ,'" + Request.Cookies["UserDetails"]["Username"] + "', '" + dditem.SelectedItem.Text + "', '" + item[0] + "','" + item[1] + "', '" + txtCardRate.Text + "', '" + txtSellingRate.Text + "', '" + txtPremimumDiscount.Text + "', '" + txtUserComments.Text + "', '" + ddlcreativeapp.SelectedItem.Text + "', '" + txtemailto.Text + "', '" + emailcc + "')", cnn))
                            {
                                int result = command.ExecuteNonQuery();
                            }

                            CultureInfo CInfo = new CultureInfo("hi-IN");
                            
                            

                            String htmlbody = "Please note that the following advertising campaign has been approved with reference no. " + complainid + ".<br />" +
                                "Brand: " + txtBrand.Text + "<br />" +
                                "Client: " + txtClient.Text + "<br />" +
                                "Start Date: " + txtstartdate.Text + "<br />" +
                                "End Date: " + txtEndDate.Text + "<br />" +
                                "PO No: " + txtPONo.Text + "<br />" +
                                "Inventory / Package Code: " + dditem.SelectedItem.Text + "<br />" +
                                "Selling Rate: " + Convert.ToDecimal(txtSellingRate.Text).ToString("c0", CInfo) + "<br />" +
                                "Remarks: " + txtUserComments.Text + "<br /><br />" +
                                "Thank you.<br />" +
                                "Mumbai Metro One Advertising Team";

                            cls.SendEmail(txtemailto.Text, htmlbody, "Advertising Campaign Approved - " + txtBrand.Text + "", emailcc);

                            Response.Write("<script>alert('Data Saved Successfully');</script>");

                            Server.Transfer("SalesBooking.aspx");
                        }
                    }
                    catch (Exception Ex)
                    { }
                    finally
                    { }
                }
            }
            else
            {
                _cls.DisplayAJAXMessage(this, "Kindly Approve Creative before submit.");
            }

        }
        btnSubmit.Enabled = true;
    }

    private string getComplaintIdFromDb()
    {
        string cid = string.Empty;
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter("select dbo.[fnx_CID]('" + DateTime.Now.ToString("MM/dd/yyyy") + "')", cnn))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        cid = ds.Tables[0].Rows[0][0].ToString();
                    }
                    else
                    {

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

        return cid;
    }
    
    protected void dditem_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtstartdate.Text != "" && txtEndDate.Text != "")
            {
                if (validate2())
                {
                    string[] item = dditem.SelectedItem.Value.Split('-');
                    double rate = 0;

                    if (item[1] == "I")
                    {
                        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                        {
                            cnn.Open();

                            using (SqlCommand cmd = new SqlCommand(
                           "SELECT [rate] FROM [Inventory_Master] where pk = '" + item[0] + "'", cnn))
                            {
                                rate = Convert.ToDouble(cmd.ExecuteScalar());
                            }

                            cnn.Close();
                        }
                    }
                    else
                    {
                        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                        {
                            cnn.Open();

                            using (SqlCommand cmd = new SqlCommand(
                           "SELECT sum(im.rate) FROM Sub_package sp left join [Inventory_Master] im on sp.[Inventory_id] =im.[pk] where sp.package_id = '" + item[0] + "'", cnn))
                            {
                                rate = Convert.ToDouble(cmd.ExecuteScalar());
                            }

                            cnn.Close();
                        }
                    }

                    DateTime stdt = DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null);
                    DateTime endt = DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null);

                    TimeSpan ts = endt - stdt;

                    //txtCardRate.Text = rate.ToString("#.##");
                    txtCardRate.Text = (rate * (ts.TotalDays + 1)).ToString("#.##");

                }
                //else
                //{
                //    _cls.DisplayAJAXMessage(this, "Kindly enter start date and end date before procedding");
                //}
            }

        }
        catch { }
    }

    public bool validate2()
    {
        //if (item[1] == "I")
        try
        {
            string[] item = dditem.SelectedItem.Value.Split('-');
            List<string> allitem = new List<string>();

            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();
                DataSet ds = new DataSet();

                string str = "";

                if (hfpk.Value == "")
                {
                    str = "SELECT im.[pk] FROM [Sales_Master] sm left join [Inventory_Master] im on im.pk = sm.codeid where sm.type = 'I' and(sm.startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' or sm.enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') union all SELECT im.[pk] FROM [Sales_Master] sm left join[Sub_package] sp on sp.[package_id] = sm.codeid  left join [Inventory_Master] im on im.pk = sp.[Inventory_id] where sm.type = 'P' and(sm.startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' or sm.enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "')";
                }
                else
                {
                    str = "SELECT im.[pk] FROM [Sales_Master] sm left join [Inventory_Master] im on im.pk = sm.codeid where sm.[bookingid] != '" + hfpk.Value + "' and sm.type = 'I' and(sm.startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' or sm.enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') union all SELECT im.[pk] FROM [Sales_Master] sm left join[Sub_package] sp on sp.[package_id] = sm.codeid  left join [Inventory_Master] im on im.pk = sp.[Inventory_id] where sm.[bookingid] != '" + hfpk.Value + "' and sm.type = 'P' and(sm.startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' or sm.enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "')";
                }
                using (SqlDataAdapter da = new SqlDataAdapter(str, cnn))
                {
                    da.Fill(ds);
                }

                if (item[1] == "I")
                {
                    foreach (DataRow pk in ds.Tables[0].Rows)
                    {
                        if (item[0] == pk[0].ToString())
                        {
                            _cls.DisplayAJAXMessage(this, "Item " + dditem.SelectedItem.Text + " is not available for the selected date.");


                            return false;
                        }
                    }
                }
                else if (item[1] == "P")
                {
                    using (SqlCommand cmd = new SqlCommand(
                   "SELECT im.[pk], im.[MMOPLCode] from Inventory_Master im left join Sub_package sp on sp.[Inventory_id] = im.[pk] where sp.package_id = '" + item[0] + "'", cnn))
                    {
                        SqlDataReader dr = null;
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                foreach (DataRow pk in ds.Tables[0].Rows)
                                {
                                    if (dr[0].ToString() == pk[0].ToString())
                                    {
                                        _cls.DisplayAJAXMessage(this, "Item " + dr[1].ToString() + " of Package " + dditem.SelectedItem.Text + " is not available for the selected date.");
                                        return false;
                                    }
                                }
                            }
                        }
                    }

                    cnn.Close();
                }
            }
        }
        catch (Exception Ex)
        {

        }
        finally
        {

        }

        return true;
    }

    public bool validate3()
    {
        string[] item = dditem.SelectedItem.Value.Split('-');
        List<string> allitem = new List<string>();
        //if (item[1] == "I")
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();
                DataSet ds = new DataSet();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT im.[pk] FROM [Sales_Master] sm left join [Inventory_Master] im on im.pk = sm.codeid where sm.[bookingid] != '" + hfpk.Value + "' and sm.type = 'I' and(sm.startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' or sm.enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "') union all SELECT im.[pk] FROM [Sales_Master] sm left join[Sub_package] sp on sp.[package_id] = sm.codeid  left join [Inventory_Master] im on im.pk = sp.[Inventory_id] where sm.[bookingid] != '" + hfpk.Value + "' and sm.type = 'P' and(sm.startdate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' or sm.enddate between '" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' and '" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "')", cnn))
                {
                    da.Fill(ds);
                }

                if (item[1] == "I")
                {
                    foreach (DataRow pk in ds.Tables[0].Rows)
                    {
                        if (item[0] == pk[0].ToString())
                        {
                            _cls.DisplayAJAXMessage(this, "Item " + dditem.SelectedItem.Text + " is not available for the selected date.");


                            return false;
                        }
                    }
                }
                else if (item[1] == "P")
                {
                    using (SqlCommand cmd = new SqlCommand(
                   "SELECT im.[pk], im.[MMOPLCode] from Inventory_Master im left join Sub_package sp on sp.[Inventory_id] = im.[pk] where sp.package_id = '" + item[0] + "'", cnn))
                    {
                        SqlDataReader dr = null;
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                foreach (DataRow pk in ds.Tables[0].Rows)
                                {
                                    if (dr[0].ToString() == pk[0].ToString())
                                    {
                                        _cls.DisplayAJAXMessage(this, "Item " + dr[1].ToString() + " of Package " + dditem.SelectedItem.Text + " is not available for the selected date.");
                                        return false;
                                    }
                                }
                            }
                        }
                    }

                    cnn.Close();
                }
            }
        }
        catch (Exception Ex)
        {

        }
        finally
        {

        }

        return true;
    }

   
    //protected void btnRun_Click(object sender, EventArgs e)
    //{
    //    string[] item = dditem.SelectedItem.Value.Split('-');
    //    double rate = 0;

    //    if (item[1] == "P")
    //    {
    //        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
    //        {
    //            cnn.Open();

    //            using (SqlDataAdapter da = new SqlDataAdapter(
    //           "SELECT ROW_NUMBER() OVER (ORDER BY MMOPLCode) row_num, [MMOPLCode] ,[TIMLCode] ,[rate] ,[Description] from Inventory_Master im left join Sub_package sp on sp.[Inventory_id] = im.[pk] where sp.package_id = '" + item[0] + "'", cnn))
    //            {
    //                DataSet ds = new DataSet();
    //                da.Fill(ds);

    //                if (ds.Tables[0].Rows.Count > 0)
    //                {
    //                    lstdetails.DataSource = ds.Tables[0];
    //                    lstdetails.DataBind();

    //                    ModalPopupExtender1.Show();
    //                }
    //            }

    //            cnn.Close();
    //        }
    //    }
    //}

    protected void txtSellingRate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtPremimumDiscount.Text = (Double.Parse(txtSellingRate.Text) - Double.Parse(txtCardRate.Text)).ToString("#.##");

            if(txtPremimumDiscount.Text == "")
            {
                txtPremimumDiscount.Text = "0.00";
            }
        }
        catch { }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (validate3())
        {
            try
            {
                List<string> lstitem = new List<string>();
                string itemnm = "";

                using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    cnn.Open();

                    string[] item = dditem.SelectedItem.Value.Split('-');

                    using (SqlCommand command = new SqlCommand(
                      "update [dbo].[Sales_Master] set [bookingtype] ='" + ddlbookingtype.SelectedItem.Value + "' ,[startdate] ='" + DateTime.ParseExact(txtstartdate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' ,[enddate] ='" + DateTime.ParseExact(txtEndDate.Text, "dd/MM/yyyy", null).ToString("MM/dd/yyyy") + "' ,[agency] ='" + txtAgency.Text + "' ,[brand] ='" + txtBrand.Text + "',[client] ='" + txtClient.Text + "' ,[pono] ='" + txtPONo.Text + "', [code] = '" + dditem.SelectedItem.Text + "', [codeid] ='" + item[0] + "' ,[type] ='" + item[1] + "',[cardrate] ='" + txtCardRate.Text + "',[sellingrate] ='" + txtSellingRate.Text + "' ,[premiunrate] ='" + txtPremimumDiscount.Text + "', [remarks] = '" + txtUserComments.Text + "', [creativeapp] = '" + ddlcreativeapp.SelectedItem.Text + "' where [bookingid] = '" + hfpk.Value + "'", cnn))
                    {
                        int result = command.ExecuteNonQuery();
                    }

                    _cls.DisplayAJAXMessageRedirect(this, "Data Updated Successfully", "SalesBookingList.aspx");
                }
            }
            catch (Exception Ex)
            {

            }

            finally
            {

            }
            //    }
        }
        btnSubmit.Enabled = true;
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlCommand command = new SqlCommand(
               "delete [dbo].[Sales_Master] WHERE [bookingid] = '" + hfpk.Value + "'", cnn))
                {
                    int result = command.ExecuteNonQuery();

                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                    else
                    {
                        _cls.DisplayAJAXMessageRedirect(this, "Data Deleted Successfully", "SalesBookingList.aspx");
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
        //    }

        btnSubmit.Enabled = true;
    }

    protected void btndetails_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                cnn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(
               "SELECT [pk] ,[MMOPLCode] ,[TIMLCode] ,[Description] ,cast([rate] as nvarchar(50)) [rate], [type] , [loc] FROM [Inventory_Master]", cnn))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (ListView2.Items.Count > 0)
                        { ListView2.Items.Clear(); }

                        ListView2.DataSource = ds.Tables[0];
                        ListView2.DataBind();

                        ModalPopupExtender3.Show();
                    }
                    else
                    {
                        ListView2.DataSource = null;
                        ListView2.DataBind();
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

    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "viewdata"))
        {
            dditem.SelectedIndex = dditem.Items.IndexOf(dditem.Items.FindByValue(Server.HtmlDecode(e.CommandArgument.ToString() + "-I")));
            dditem_SelectedIndexChanged(ListView2, e);
            ModalPopupExtender3.Hide();
        }
    }

    protected void txtstartdate_TextChanged(object sender, EventArgs e)
    {
        dditem_SelectedIndexChanged(ListView2, e);
    }

    protected void ddlbookingtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
        {
            cnn.Open();

            using (SqlDataAdapter da = new SqlDataAdapter(
           "SELECT cast([pk] as nvarchar(50))+'-I' as pk,[MMOPLCode] as [name] FROM [Inventory_Master] where [type] = '" + ddlbookingtype.SelectedItem.Text + "' union all SELECT distinct cast(pm.[pk] as nvarchar(50))+'-P' as pk,[packagename] as [name] FROM [package_master] pm left join Sub_package spm on pm.pk = spm.package_id left join Inventory_Master im on im.pk = spm.Inventory_id where im.type = '" + ddlbookingtype.SelectedItem.Text + "'", cnn))
            {
                // 3
                // Use DataAdapter to fill DataTable
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    dditem.DataSource = ds.Tables[0];
                    dditem.DataTextField = "name";
                    dditem.DataValueField = "pk";
                    dditem.DataBind();
                }
            }

            cnn.Close();
        }
    }
}
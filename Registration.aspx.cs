using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ESSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        //Email is already Exist  
        var isExist = IsUserNameExist(txtEmail.Text);
        if (isExist)
        {
            lblErrormessage.Text = "User Name is already exist";
            return;
        }
        conn.Open();
        string insertEmp = "insert into User_Master(loginid, FirstName, LastName, EmailID, Password, DateAdded, Valid) values " +
            "('" + txtUserName.Text + "','" + txtFName.Text + "','" + txtLName.Text + "','" + txtEmail.Text + "','" + txtcpassword.Text + "','" + DateTime.Today + "','" + "1" + "')";
        SqlCommand cmd = new SqlCommand(insertEmp, conn);
        int m = cmd.ExecuteNonQuery();
        if (m == 1)
        {

            Response.Redirect("Login.aspx");
        }
        else
        {
            lblErrormessage.Text = "Data is not saved. Something went wrong!!!";
        }
        conn.Close();
    }
                            
    private bool IsUserNameExist(string text)
    {
        conn.Open();
        string query = "select UserName from User_Master where UserName= '" + txtUserName + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        conn.Close();
        string email = "";
        foreach (DataRow dr in dt.Rows) email = dr.ItemArray[0].ToString();
        if (email != "") return true;
        else return false;
    }
}
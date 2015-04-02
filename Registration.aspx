using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;


namespace CarPooling
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            if (TextBox3.Text != TextBox4.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password Doesnt match!')", true);
            }

            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/admin/Documents/CarpoolDb.accdb";
            OleDbConnection conn = new OleDbConnection(connect);
            conn.Open();
            string q = "select uname,pwd from UserDetails where uname= '" + TextBox1.Text + "' ";
            OleDbCommand com = new OleDbCommand(q, conn);
            OleDbDataReader data = com.ExecuteReader();
            data.Read();
            if (data.HasRows)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('username or password already exist!')", true);
            }
            else
            {

                string query = "INSERT INTO UserDetails(uname,pwd,mobileno,mailid) VALUES ('" + TextBox1.Text + "' , '" + TextBox3.Text + "' , '" + TextBox5.Text + "' , '" + TextBox2.Text + "')";
                OleDbCommand cmd = new OleDbCommand(query, conn);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registered Successfull !')", true);
             //   Response.Redirect("Login.aspx");
            }

              
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            
            Response.Redirect("Login.aspx");

        }
    }
}

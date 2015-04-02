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
    public partial class owner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connetionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/admin/Documents/CarpoolDb.accdb";
            string user = Session["user"].ToString();
            string sql = "SELECT * FROM OfferRide where users= '" + user + "' ";
            OleDbConnection connection = new OleDbConnection(connetionString);
            OleDbDataAdapter dataadapter = new OleDbDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
          GridView1.DataSource = ds;
            dataadapter.Fill(ds, "OfferRide");
            GridView1.DataBind();
            GridView1.DataMember = "OfferRide";
            connection.Close();
        }

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connection= "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/admin/Documents/CarpoolDb.accdb";
            OleDbConnection conn = new OleDbConnection(connection);
            conn.Open();
            string user = Session["user"].ToString();
            string query = "INSERT INTO OfferRide(startpt,destinationpt,via,seatsavail,contactno,vehicleno,ridetime,vehicle,ridedate,users,Amount) VALUES ('" + TextBox2.Text + "' , '" + TextBox3.Text + "' , '" + TextBox4.Text + "' , '" + TextBox6.Text + "' , '" + TextBox12.Text + "' , '" + TextBox11.Text + "' , '" + TextBox10.Text + "' , '" + RadioButtonList2.Text + "' , '" + TextBox7.Text + "' ,'" + user + "' , '" + TextBox14.Text + "' )";
            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registered Successfull !')", true);
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox14.Text = "";

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox14_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
         

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }

        protected void TextBox12_TextChanged(object sender, EventArgs e)
        {

        }

      
    }
}

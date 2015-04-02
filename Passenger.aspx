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
/*using System.Data.OleDb.OleDbDataAdapter;
using System.Data.OleDb.OleDbCommandBuilder;
using System.Data.OleDb.Dataset;*/


namespace CarPooling
{
    public partial class Passenger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connetionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/admin/Documents/CarpoolDb.accdb";
            
            string sql = "SELECT * FROM OfferRide where startpt= '" + TextBox1.Text + "' AND destinationpt= '" + TextBox2.Text + "' AND via= '" +TextBox3.Text + "' ";
            OleDbConnection connection = new OleDbConnection(connetionString);
            connection.Open();
            OleDbCommand com = new OleDbCommand(sql, connection );
            OleDbDataReader data = com.ExecuteReader();
            data.Read();
            if (data.HasRows== false )
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('no rides are available!')", true);
            }
            else
            {
                OleDbDataAdapter dataadapter = new OleDbDataAdapter(sql, connection);
                DataSet ds = new DataSet();

                GridView1.DataSource = ds;
                dataadapter.Fill(ds, "OfferRide");
                GridView1.DataBind();
                GridView1.DataMember = "OfferRide";
                connection.Close();
                Button2.Visible = true;
            }
        }

        private void OleDbDataAdapter(OleDbCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataGrid1_SelectedIndexChanged1(object sender, EventArgs e)
        {
          
        }

        protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button2.Visible = true;
            if (GridView1.SelectedRow != null)
            {
                Server.Transfer("~/transaction.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a row.')", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("cancelgrid.aspx");
        }
    }
}

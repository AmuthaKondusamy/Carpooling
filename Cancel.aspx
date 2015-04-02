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
    public partial class cancelgrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/admin/Documents/CarpoolDb.accdb";
            string user = Session["user"].ToString();
            string sql = "SELECT * FROM BookedDetails where passenger= '" + user + "' ";
            OleDbConnection connection = new OleDbConnection(connetionString);
            connection.Open();

            OleDbCommand com = new OleDbCommand(sql, connection);

            OleDbDataReader data = com.ExecuteReader();
            data.Read();
            if (data.HasRows==false )
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No rides are Booked!')", true);
            }
            else
            {

                OleDbDataAdapter dataadapter = new OleDbDataAdapter(sql, connection);
                DataSet ds = new DataSet();
              
                GridView1.DataSource = ds;
                dataadapter.Fill(ds, "BookedDetails");
                GridView1.DataBind();
                GridView1.DataMember = "BookedDetails";
                connection.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (GridView1.SelectedRow != null)
            {
                Server.Transfer("~/cancel.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a row.')", true);
            }
        }
    }
}

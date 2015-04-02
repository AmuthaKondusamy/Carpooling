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
    public partial class transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.PreviousPage != null)
            {
                GridView GridView1 = (GridView)this.Page.PreviousPage.FindControl("GridView1");
                GridViewRow selectedRow = GridView1.SelectedRow;
                TextBox1.Text = selectedRow.Cells[1].Text;
                 TextBox2.Text= selectedRow.Cells[2].Text;
               TextBox3.Text= selectedRow.Cells[3].Text;
              
               TextBox5.Text = selectedRow.Cells[5].Text;
               TextBox6.Text = selectedRow.Cells[6].Text;
               TextBox7.Text = selectedRow.Cells[7].Text;
               TextBox8.Text = selectedRow.Cells[8].Text;
               TextBox9.Text = selectedRow.Cells[9].Text;
               TextBox10.Text = selectedRow.Cells[10].Text;
               TextBox11.Text = selectedRow.Cells[11].Text;
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/admin/Documents/CarpoolDb.accdb";
            OleDbConnection conn = new OleDbConnection(connect);
            conn.Open();
            string user = Session["user"].ToString();
            string query = "INSERT INTO BookedDetails(start,destination,via,contactno,vehicleno,ridetime,vehicle,ridedate,owner,amount,passenger) VALUES ('" + TextBox1.Text + "' , '" + TextBox2.Text + "' , '" + TextBox3.Text + "' , '" + TextBox5.Text + "' , '" + TextBox6.Text + "' , '" + TextBox7.Text + "' , '" + TextBox9.Text + "' , '" + TextBox8.Text + "' , '" + TextBox10.Text + "' ,'" + TextBox11.Text + "' , '" +user +"' )";
          
            OleDbCommand cmd = new OleDbCommand(query, conn);
            cmd.ExecuteNonQuery();
          
            string update1 = "Update OfferRide set seatsavail=seatsavail-1 where users= '" + user + "' AND vehicleno= '" + TextBox6.Text + "' ";
            
            OleDbCommand cmd1 = new OleDbCommand(update1, conn);

            cmd1.ExecuteNonQuery();
            

          Response.Redirect("Payment.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }
    }
}

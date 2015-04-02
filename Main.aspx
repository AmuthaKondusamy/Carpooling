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

namespace CarPooling
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Session["user"].ToString();
            Label9.Text = Label9.Text + " " +  user;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Response.Redirect("owner.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("passenger.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}

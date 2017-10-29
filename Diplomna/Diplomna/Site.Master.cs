using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Diplomna
{
	public partial class Site : System.Web.UI.MasterPage
	{
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DiplomnaConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
		{
            var ID = Session["ID"];
            var Type = Session["Type"];
            var FirstName = Session["FirstName"];
            var LastName = Session["LastName"];
            if (ID != null && Type != null && FirstName != null && LastName != null)
            {
                welcomeLabel.Text = "Добре дошъл, "+ FirstName.ToString() + " " + LastName.ToString() + "!";
                ButtonLogOut.Visible = true;
                HyperLink1.Visible = false;
                HyperLink3.Visible = true;
                HyperLink4.Visible = true;
            }

            //Визуализиране на активните застрахователни компании
            connection.Open();
            SqlCommand cmd = connection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT Name, WebAddress, Logo FROM Companies WHERE (Status = 1)";
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();

            connection.Close();

        }

        protected void ButtonLogOut_Click1(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}
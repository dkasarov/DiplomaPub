using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Diplomna.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DiplomnaConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            var ID = Session["ID"];
            var Type = Session["Type"];
            var FirstName = Session["FirstName"];
            var LastName = Session["LastName"];
            if (ID == null && Type == null && FirstName == null && LastName == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else if (int.Parse(Type.ToString()) == 1)
            {
                MenuTypeOne.Visible = true;
            }
            else if (int.Parse(Type.ToString()) == 2)
            {
                MenuTypeTwo.Visible = true;
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
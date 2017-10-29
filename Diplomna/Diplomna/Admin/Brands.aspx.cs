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
    public partial class Brands : System.Web.UI.Page
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
            else if (int.Parse(Type.ToString()) != 1)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void ButtonAddBrand_Click1(object sender, EventArgs e)
        {
            SqlDataSourceBrands.DataBind();
            DataView dview = (DataView)SqlDataSourceBrands.Select(DataSourceSelectArguments.Empty);

            if (dview.Count >= 1)
            {
                errorLabel3.Text = "Въведената стойност вече съществува!";
                errorLabel3.Visible = true;
            }
            else if (dview.Count == 0)
            {
                var procedure = "CreateBrand";
                connection.Open();

                SqlCommand comm = new SqlCommand(procedure, connection);
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.AddWithValue("@name", TextBoxBrandName.Text);

                comm.ExecuteNonQuery();
                connection.Close();

                errorLabel3.Visible = false;

                this.GridView1.PageIndex = this.GridView1.PageCount - 1;
            }
        }
    }
}
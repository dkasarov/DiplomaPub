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
    public partial class Models1 : System.Web.UI.Page
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

        protected void ButtonAddModel_Click(object sender, EventArgs e)
        {
            SqlDataSourceModels.DataBind();
            DataView dview = (DataView)SqlDataSourceModels.Select(DataSourceSelectArguments.Empty);

            if (dview.Count >= 1)
            {
                errorLabel.Text = "Въведеният модел вече съществува!";
                errorLabel.Visible = true;
            }
            else
            {
                var proceduce = "CreateModel";
                connection.Open();
                SqlCommand comm = new SqlCommand(proceduce, connection);
                comm.CommandType = CommandType.StoredProcedure;

                comm.Parameters.AddWithValue("@BrandID", DropDownListBrand.SelectedItem.Value);
                comm.Parameters.AddWithValue("@Name", TextBoxName.Text);

                comm.ExecuteNonQuery();
                connection.Close();

                errorLabel.Visible = false;

                this.GridView1.PageIndex = this.GridView1.PageCount - 1;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace Diplomna.Admin
{
    public partial class Admins : System.Web.UI.Page
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

        protected void ButtonAdduser_Click(object sender, EventArgs e)
        {
            SqlDataSourceCompany.DataBind();
            DataView dview = (DataView)SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty);

            if (dview.Count == 0)
            {
                errorLabel.Text = "Въведеният администратор вече съществува!";
                errorLabel.Visible = true;
            }
            else if (Convert.ToString(TextBoxPassword.Text) != Convert.ToString(TextBoxPasswordRepeat.Text))
            {
                errorLabel.Text = "Паролите не съвпадат";
                errorLabel.Visible = true;
            }
            else
            {
                HashPass HashPass = new HashPass();
                TextBoxPasswordRepeat.Text = HashPass.HashPassword(TextBoxPasswordRepeat.Text);

                var procedure = "CreateUser";
                connection.Open();
                SqlCommand comm = new SqlCommand(procedure, connection);
                comm.CommandType = CommandType.StoredProcedure;

                comm.Parameters.AddWithValue("@Username", TextBoxUsername.Text);
                comm.Parameters.AddWithValue("@Password", TextBoxPasswordRepeat.Text);
                comm.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                comm.Parameters.AddWithValue("@FirstName", TextBoxFirstName.Text);
                comm.Parameters.AddWithValue("@LastName", TextBoxLastName.Text);
                comm.Parameters.AddWithValue("@CompanyID", DropDownListCompany.SelectedItem.Value);

                comm.ExecuteNonQuery();
                connection.Close();

                errorLabel.Visible = false;


                this.GridView1.PageIndex = this.GridView1.PageCount - 1;
            }
        }
    }
}
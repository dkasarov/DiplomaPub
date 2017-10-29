using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Diplomna.Admin
{
    public partial class Settings : System.Web.UI.Page
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
        }

        protected void ButtonNewPassword_Click(object sender, EventArgs e)
        {
            HashPass HashPass = new HashPass();
            TextBoxOldPass.Text = HashPass.HashPassword(TextBoxOldPass.Text);
            TextBoxNewPass.Text = HashPass.HashPassword(TextBoxNewPass.Text);
            TextBoxRepeatNewPass.Text = HashPass.HashPassword(TextBoxRepeatNewPass.Text);
            
            SqlDataSourceCheckOldPass.DataBind();
            DataView dview = (DataView)SqlDataSourceCheckOldPass.Select(DataSourceSelectArguments.Empty);
            
            if (dview.Count != 1)
            {
                errorLabel.Text = "Старата парола е грешна!";
                errorLabel.Visible = true;
            }
            else if (Convert.ToString(TextBoxNewPass.Text) != Convert.ToString(TextBoxRepeatNewPass.Text))
            {
                errorLabel.Text = "Паролите не съвпадат";
                errorLabel.Visible = true;
            }
            else
            {
                var procedure = "NewPassword";
                connection.Open();
                SqlCommand comm = new SqlCommand(procedure, connection);
                comm.CommandType = CommandType.StoredProcedure;

                comm.Parameters.AddWithValue("@UserID", Session["ID"]);
                comm.Parameters.AddWithValue("@NewPassword", TextBoxRepeatNewPass.Text);

                comm.ExecuteNonQuery();
                connection.Close();

                errorLabel.Visible = false;
                successLabel.Text = "Паролата е променена успешно!";
                successLabel.Visible = true;
                
            }

        }
    }
}
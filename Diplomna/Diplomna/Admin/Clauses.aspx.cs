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
    public partial class Clauses : System.Web.UI.Page
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

        protected void ButtonWriteClause_Click(object sender, EventArgs e)
        {
            SqlDataSourceClause.DataBind();
            DataView dview = (DataView)SqlDataSourceClause.Select(DataSourceSelectArguments.Empty);

            if (dview.Count >= 1)
            {
                errorLabel.Text = "Въведената застраховка вече съществува!";
                errorLabel.Visible = true;
            }
            else if (Convert.ToInt32(TextBoxMimNum.Text) > Convert.ToInt32(TextBoxMaxNum.Text))
            {
                errorLabel.Text = "Минималната стойност е по-голяма от максималната!";
                errorLabel.Visible = true;
            }
            else if (dview.Count == 0)
            {

                var procedure = "CreateClause";
                connection.Open();

                SqlCommand comm = new SqlCommand(procedure, connection);
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.AddWithValue("@name", TextBoxClauseName.Text);
                comm.Parameters.AddWithValue("@minnum", TextBoxMimNum.Text);
                comm.Parameters.AddWithValue("@maxnum", TextBoxMaxNum.Text);
                comm.ExecuteNonQuery();
                connection.Close();

                errorLabel.Visible = false;
                this.GridView1.PageIndex = this.GridView1.PageCount - 1;

            }
        }

       
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Diplomna.Admin
{
    public partial class Increases : System.Web.UI.Page
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
            else if (int.Parse(Type.ToString()) != 2)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void ButtonAddIncrease_Click(object sender, EventArgs e)
        {
            var CompanyID = Session["CompanyID"];
            SqlDataSourceCheckIncrease.DataBind();
            DataView dview = (DataView)SqlDataSourceCheckIncrease.Select(DataSourceSelectArguments.Empty);

            if(dview.Count >= 1)
            {
                errorLabel.Text = "Вече има въведена стойност за този риск!";
                errorLabel.Visible = true;
            }
            else
            {
                var procedure = "AddIncrease";
                connection.Open();

                SqlCommand comm = new SqlCommand(procedure, connection);
                comm.CommandType = CommandType.StoredProcedure;

                comm.Parameters.AddWithValue("@CompanyID", CompanyID.ToString());
                comm.Parameters.AddWithValue("@RiskID", DropDownListRisk.SelectedItem.Value);
                comm.Parameters.AddWithValue("@Value", TextBoxValue.Text);
                comm.Parameters.AddWithValue("@PosNeg", DropDownListPosNeg.SelectedItem.Value);
                comm.Parameters.AddWithValue("@TypeValues", DropDownListTypeValue.SelectedItem.Value);

                comm.ExecuteNonQuery();
                connection.Close();
                errorLabel.Visible = false;
                this.GridView1.PageIndex = this.GridView1.PageCount - 1;

            }
        }
    }
}
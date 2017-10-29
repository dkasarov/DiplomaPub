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
    public partial class TariffNumbers : System.Web.UI.Page
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

        protected void ButtonAddTariffNumber_Click(object sender, EventArgs e)
        {
            var CompanyID = Session["CompanyID"];
            SqlDataSourceCheckTariff.DataBind();
            DataView dviewcheck = (DataView)SqlDataSourceCheckTariff.Select(DataSourceSelectArguments.Empty);

            if(dviewcheck.Count >= 1)
            {
                errorLabel.Text = "Вече има въведена стойност за тази клауза!";
                errorLabel.Visible = true;
            }
            else
            {
                SqlDataSourceTariffNumbers.DataBind();
                DataView dview = (DataView)SqlDataSourceTariffNumbers.Select(DataSourceSelectArguments.Empty);

                int Min = (int)dview.Table.Rows[0]["MinNumber"];
                int Max = (int)dview.Table.Rows[0]["MaxNumber"];

                int Value = int.Parse(TextBoxValue.Text);

                if (Value < Min || Value > Max)
                {
                    errorLabel.Text = "Стойноста не е в определения диапазон!";
                    errorLabel.Visible = true;
                }
                else
                {
                    var procedure = "AddTariffNumber";
                    connection.Open();

                    SqlCommand comm = new SqlCommand(procedure, connection);
                    comm.CommandType = CommandType.StoredProcedure;

                    comm.Parameters.AddWithValue("@CompanyID", CompanyID.ToString());
                    comm.Parameters.AddWithValue("@TypeInsurance", DropDownListTypeInsurance.SelectedItem.Value);
                    comm.Parameters.AddWithValue("@Value", TextBoxValue.Text);

                    comm.ExecuteNonQuery();
                    connection.Close();

                    errorLabel.Visible = false;
                    this.GridView1.PageIndex = this.GridView1.PageCount - 1;
                }
            }

            
        }
    }
}
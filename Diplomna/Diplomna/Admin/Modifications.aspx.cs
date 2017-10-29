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
    public partial class Models : System.Web.UI.Page
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

        protected void ButtonAddModel_Click1(object sender, EventArgs e)
        {
            SqlDataSourceModification.DataBind();
            DataView dview = (DataView)SqlDataSourceModification.Select(DataSourceSelectArguments.Empty);

            if (dview.Count >= 1)
            {
                errorLabel.Text = "Въведената модификация вече съществува!";
                errorLabel.Visible = true;
            }
            else if(Convert.ToInt32(TextBoxProduceFrom.Text) > Convert.ToInt32(TextBoxProduceTo.Text))
            {
                errorLabel.Text = "Началната дата е по-голяма от крайната!";
                errorLabel.Visible = true;
            }
            else
            {
                var proceduce = "CreateModification";
                connection.Open();
                SqlCommand comm = new SqlCommand(proceduce, connection);
                comm.CommandType = CommandType.StoredProcedure;

                comm.Parameters.AddWithValue("@ModelID", DropDownListModel.SelectedItem.Value);
                comm.Parameters.AddWithValue("@Name", TextBoxName.Text);
                comm.Parameters.AddWithValue("@EngineVolume", TextBoxVolume.Text);
                comm.Parameters.AddWithValue("@EnginePower", TextBoxPower.Text);
                comm.Parameters.AddWithValue("@EngineFuel", DropDownListFuel.SelectedItem.Value);
                comm.Parameters.AddWithValue("@Doors", DropDownListDoors.SelectedItem.Value);
                comm.Parameters.AddWithValue("@ProduceFrom", TextBoxProduceFrom.Text);
                comm.Parameters.AddWithValue("@ProduceTo", TextBoxProduceTo.Text);
                comm.Parameters.AddWithValue("@InsuranceValue", TextBoxInsuranceValue.Text);

                comm.ExecuteNonQuery();
                connection.Close();

                errorLabel.Visible = false;

                this.GridView1.PageIndex = this.GridView1.PageCount - 1;
            }
        }
    }
}
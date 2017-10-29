using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Diplomna.Admin
{
	public partial class Login : System.Web.UI.Page
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
                Response.Redirect("~/Admin/");
            }
        }
        

        protected void ButtonLogIn_Click(object sender, EventArgs e)
        {
            HashPass HashPass = new HashPass();
            TextBoxPassword.Text = HashPass.HashPassword(TextBoxPassword.Text);

            SqlDataSource1.DataBind();
            DataView dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            
            if(dview.Count == 0)
            {
                errorLabel.Text = "Неправилни потребителско име или парола!";
                errorLabel.Visible = true;
            }
            else if(dview.Count == 1)
            {
                
                int ID = (int)dview.Table.Rows[0]["ID"];
                int type = (int)dview.Table.Rows[0]["Type"];
                var Firstname = (string)dview.Table.Rows[0]["FirstName"];
                var Lastname = (string)dview.Table.Rows[0]["LastName"];

                if (int.Parse(type.ToString()) == 2)
                {
                    int CompanyID = (int)dview.Table.Rows[0]["Companies_ID"];
                    Session["CompanyID"] = CompanyID.ToString();
                }

                Session["ID"] = ID.ToString();
                Session["Type"] = type.ToString();
                Session["FirstName"] = Firstname.ToString();
                Session["LastName"] = Lastname.ToString();
                    
                Response.Redirect("~/Admin/");
                
            }



        }
        
        
    }
}
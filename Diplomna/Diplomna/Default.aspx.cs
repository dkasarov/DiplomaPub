using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using AjaxControlToolkit;
using System.Windows.Forms;
using System.Text;

namespace Diplomna
{
	public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sRisks = string.Empty;

            foreach(ListItem risks in CheckBoxListRisks.Items)
            {
                if (risks.Selected)
                {
                    sRisks += string.Format("{0}<br/>", risks.Value);
                }
            }

            string message = "Model: " + DropDownListDoors.SelectedItem.Value + "\n"
            + "Clause id;name:" + RadioButtonListClause.SelectedItem.Value + ";" + RadioButtonListClause.SelectedItem.Text
            + "/nRisks: " + sRisks.ToString();
            

            Label1.Text = message.ToString();
            
            
        }
    }
}
using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Diplomna.Services
{
    [System.Web.Script.Services.ScriptService]
    public class Modification : System.Web.Services.WebService
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DiplomnaConnectionString"].ToString());

        [WebMethod]
        public CascadingDropDownNameValue[] GetBrands(string knownCategoryValues, string category)
        {
            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT Brands.ID, Brands.Name FROM Brands LEFT JOIN Models ON Brands.ID=Models.Brands_ID WHERE Brands.ID IN (SELECT Brands_ID FROM Models) AND (Brands.Status = 1) ORDER BY Brands.Name", connection);
            SqlDataReader dr = comm.ExecuteReader();
            List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
            while (dr.Read())
            {
                l.Add(new CascadingDropDownNameValue(dr["Name"].ToString(), dr["ID"].ToString()));
            }
            connection.Close();
            return l.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetModels(string knownCategoryValues, string category)
        {
            int BrandID;
            CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            if (!kv.ContainsKey("Brands") || !Int32.TryParse(kv["Brands"], out BrandID))
            {
                throw new ArgumentException("Couldn't find brand.");
            }

            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT ID, Name FROM Models WHERE (Brands_ID = @brandID) AND Status=1 ORDER BY Name", connection);
            comm.Parameters.AddWithValue("@brandID", BrandID);
            SqlDataReader dr = comm.ExecuteReader();
            List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
            while (dr.Read())
            {
                l.Add(new CascadingDropDownNameValue(dr["Name"].ToString(), dr["ID"].ToString()));
            }
            connection.Close();
            return l.ToArray();
        }
    }
}

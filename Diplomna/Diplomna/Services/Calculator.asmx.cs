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
    public class Calculator : System.Web.Services.WebService
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DiplomnaConnectionString"].ToString());
        [WebMethod]
        public CascadingDropDownNameValue[] GetBrands(string knownCategoryValues, string category)
        {
            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT Brands.ID,Brands.Name FROM Brands LEFT JOIN Models ON Brands.ID=Models.Brands_ID LEFT JOIN Modifications ON Models.ID=Modifications.Models_ID WHERE Brands.Status=1 AND (Modifications.InsuranceValue IS NOT NULL) ORDER BY Name ASC", connection);
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
            SqlCommand comm = new SqlCommand("SELECT DISTINCT Models.ID, Models.Name FROM Models LEFT JOIN Modifications ON Models.ID=Modifications.Models_ID WHERE Brands_ID=@BrandID AND Modifications.Status=1 AND (Modifications.InsuranceValue IS NOT NULL)", connection);
            comm.Parameters.AddWithValue("@BrandID", BrandID);
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
        public CascadingDropDownNameValue[] GetYears(string knownCategoryValues, string category)
        {
            int ModelID;
            CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            if (!kv.ContainsKey("Models") || !Int32.TryParse(kv["Models"], out ModelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }

            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT CONCAT(ProduceFrom, ' - ', ProduceTo) AS TextColumns, CONCAT(ProduceFrom,NULL, ProduceTo) AS ValueColumns FROM Modifications WHERE Models_ID=@ModelID AND Status=1", connection);
            comm.Parameters.AddWithValue("@ModelID",ModelID);
            SqlDataReader dr = comm.ExecuteReader();
            List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
            while(dr.Read())
            {
                l.Add(new CascadingDropDownNameValue(dr["TextColumns"].ToString(), dr["ValueColumns"].ToString()));
            }
            connection.Close();
            return l.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetFuel(string knownCategoryValues, string category)
        {
            CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

            int Year;
            if (!kv.ContainsKey("Years") || !Int32.TryParse(kv["Years"], out Year))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int ModelID;
            if (!kv.ContainsKey("Models") || !Int32.TryParse(kv["Models"], out ModelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }

            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT Fuel.ID,Fuel.Name FROM Fuel LEFT JOIN Modifications ON Fuel.ID=Modifications.EngineFuel WHERE Modifications.ProduceTo=@ToYear AND Modifications.Models_ID=@ModelID AND Modifications.Status=1", connection);
            //comm.Parameters.AddWithValue("@FromYear", ProduceFrom.ToString());
            comm.Parameters.AddWithValue("@ToYear", Year%10000);
            comm.Parameters.AddWithValue("@ModelID", ModelID);

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
        public CascadingDropDownNameValue[] GetVolume(string knownCategoryValues, string category)
        {
            CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

            int Year;
            if (!kv.ContainsKey("Years") || !Int32.TryParse(kv["Years"], out Year))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int FuelID;
            if (!kv.ContainsKey("Fuel") || !Int32.TryParse(kv["Fuel"], out FuelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }

            int ModelID;
            if (!kv.ContainsKey("Models") || !Int32.TryParse(kv["Models"], out ModelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }

            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT EngineVolume FROM Modifications WHERE ProduceTo=@ProduceTo AND EngineFuel=@Fuel AND Models_ID=@ModelID AND Status=1",connection);
            comm.Parameters.AddWithValue("@ProduceTo", Year % 10000);
            comm.Parameters.AddWithValue("@Fuel", FuelID);
            comm.Parameters.AddWithValue("@ModelID",ModelID);

            SqlDataReader dr = comm.ExecuteReader();
            List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
            while (dr.Read())
            {
                l.Add(new CascadingDropDownNameValue(dr["EngineVolume"].ToString(), dr["EngineVolume"].ToString()));
            }
            connection.Close();
            return l.ToArray();

        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetPower(string knownCategoryValues, string category)
        {
            CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            int Volume;
            if (!kv.ContainsKey("Volume") || !Int32.TryParse(kv["Volume"], out Volume))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int Year;
            if (!kv.ContainsKey("Years") || !Int32.TryParse(kv["Years"], out Year))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int FuelID;
            if (!kv.ContainsKey("Fuel") || !Int32.TryParse(kv["Fuel"], out FuelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }
            int ModelID;
            if (!kv.ContainsKey("Models") || !Int32.TryParse(kv["Models"], out ModelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }

            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT EnginePower FROM Modifications WHERE ProduceTo=@ProduceTo AND EngineFuel=@Fuel AND Models_ID=@ModelID AND EngineVolume=@Volume AND Status=1", connection);
            comm.Parameters.AddWithValue("@ProduceTo", Year % 10000);
            comm.Parameters.AddWithValue("@Fuel", FuelID);
            comm.Parameters.AddWithValue("@ModelID", ModelID);
            comm.Parameters.AddWithValue("@Volume",Volume);

            SqlDataReader dr = comm.ExecuteReader();
            List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
            while (dr.Read())
            {
                l.Add(new CascadingDropDownNameValue(dr["EnginePower"].ToString(), dr["EnginePower"].ToString()));
            }
            connection.Close();
            return l.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetDoors(string knownCategoryValues, string category)
        {
            CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            int Power;
            if (!kv.ContainsKey("Power") || !Int32.TryParse(kv["Power"], out Power))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int Volume;
            if (!kv.ContainsKey("Volume") || !Int32.TryParse(kv["Volume"], out Volume))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int Year;
            if (!kv.ContainsKey("Years") || !Int32.TryParse(kv["Years"], out Year))
            {
                throw new ArgumentException("Couldn't find modification.");
            }

            int FuelID;
            if (!kv.ContainsKey("Fuel") || !Int32.TryParse(kv["Fuel"], out FuelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }
            int ModelID;
            if (!kv.ContainsKey("Models") || !Int32.TryParse(kv["Models"], out ModelID))
            {
                throw new ArgumentException("Couldn't find model.");
            }

            connection.Open();
            SqlCommand comm = new SqlCommand("SELECT DISTINCT Doors, Name FROM Modifications WHERE ProduceTo=@ProduceTo AND EngineFuel=@Fuel AND Models_ID=@ModelID AND EngineVolume=@Volume AND EnginePower=@Power AND Status=1", connection);
            comm.Parameters.AddWithValue("@ProduceTo", Year % 10000);
            comm.Parameters.AddWithValue("@Fuel", FuelID);
            comm.Parameters.AddWithValue("@ModelID", ModelID);
            comm.Parameters.AddWithValue("@Volume", Volume);
            comm.Parameters.AddWithValue("@Power", Power);

            SqlDataReader dr = comm.ExecuteReader();
            List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
            while (dr.Read())
            {
                l.Add(new CascadingDropDownNameValue(dr["Doors"].ToString(), dr["Name"].ToString()));
            }
            connection.Close();
            return l.ToArray();
        }
    }
}

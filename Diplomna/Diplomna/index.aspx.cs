using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

namespace Diplomna
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        public static string HashString(string value)
        {
            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] data = Encoding.ASCII.GetBytes(value);
            data = x.ComputeHash(data);
            StringBuilder ret = new StringBuilder();
            for (int i = 0; i < data.Length; i++) ret.Append(data[i].ToString("x2").ToLower());
            return ret.ToString();

        }

        protected void button_Click(object sender, EventArgs e)
        {

            

            label.Text = HashString(pass.Text);
        }
    }
}
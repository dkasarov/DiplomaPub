using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Diplomna
{
    public class Class1
    {
        
    }

    public class HashPass
    {
        public static string HashPassword(string value)
        {
            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] data = Encoding.ASCII.GetBytes(value);
            data = x.ComputeHash(data);
            StringBuilder ret = new StringBuilder();
            for (int i = 0; i < data.Length; i++) ret.Append(data[i].ToString("x2").ToLower());
            return ret.ToString();
        }
    }
}
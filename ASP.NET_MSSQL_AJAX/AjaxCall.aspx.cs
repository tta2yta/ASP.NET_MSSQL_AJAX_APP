using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_MSSQL_AJAX
{
    public partial class AjaxCall : System.Web.UI.Page
    {

        public class EduDesc
        {
            public string msg { get; set; }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
        public static string GetData()
        {
            Dictionary<string, string> name = new Dictionary<string, string>();
            name.Add("1", "Sourav Kayal");
            name.Add("2", "Ram mishra");
            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;
        }
    }
}
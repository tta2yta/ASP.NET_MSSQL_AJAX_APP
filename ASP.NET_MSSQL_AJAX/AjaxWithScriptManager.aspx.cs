using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_MSSQL_AJAX
{
    public partial class AjaxWithScriptManager : System.Web.UI.Page
    {
        public class EduDesc
        {
            public string msg { get; set; }
           
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
        public static string GetCurrentTime(string name)
        {
            EduDesc obj = new EduDesc() { msg = "good" };
            //return "Hello " + name + Environment.NewLine + "The Current Time is: "
            // + DateTime.Now.ToString();
            Console.WriteLine(JsonConvert.SerializeObject(obj));

            return JsonConvert.SerializeObject(obj);
        }
    }
}
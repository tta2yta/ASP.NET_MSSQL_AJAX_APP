using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_MSSQL_AJAX
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void addajax_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = @"Data Source=WIN-50GP30FGO75;Initial Catalog=Demodb ;User ID=sa;Password=demol23";

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            Response.Write("Connection MAde");
            cnn.Close();

        }
    }
}
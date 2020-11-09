using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
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

            connetionString = @"Data Source=DESKTOP-6PQ3QDE\SQLEXPRESS;Initial Catalog=Sales_Db;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
           
            cnn = new SqlConnection(connetionString);

            cnn.Open();

            Response.Write("Connection MAde");
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = "";

            // sql = "Insert into SalesManager(Name) values('"+ txtname.Text+"')";
            sql = "Insert into SalesManager(Name) values(@name)";
            
           
          
            command = new SqlCommand(sql, cnn);
            
            //adapter.InsertCommand = new SqlCommand(sql, cnn);
            //adapter.InsertCommand.ExecuteNonQuery();

            command.Parameters.AddWithValue("@name", SqlDbType.VarChar);
            command.Parameters["@name"].Value = txtname.Text;
            command.ExecuteNonQuery();

            command.Dispose(); 
	    	cnn.Close();

        }
        [WebMethod]
        public static string method()
        {
            return "Ted";
        }
    }
}
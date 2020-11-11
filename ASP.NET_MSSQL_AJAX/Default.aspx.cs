using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_MSSQL_AJAX
{
    public partial class _Default : Page
    {
        public class SalesManager
        {
            public string name { get; set; }
            public int age { get; set; }
            public DateTime dob { get; set; }
            public decimal money { get; set; }
            public string msg { get; set; }

        }
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
        /*  public static string method(SalesManager salesManager)
          {*/
        public static List<SalesManager> method(SalesManager salesManager)
        {
            //salesManager.age.ToString()
            if (!Regex.IsMatch(salesManager.age.ToString(), @"^\d+$") || salesManager.name=="")
            {
                List<SalesManager> obj = new List<SalesManager>();
                obj.Add(new SalesManager() { msg = "Please Try Again" });
;               return obj;
            }
            try
            {
                string connetionString;
                SqlConnection cnn;

                connetionString = @"Data Source=DESKTOP-6PQ3QDE\SQLEXPRESS;Initial Catalog=Sales_Db;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

                cnn = new SqlConnection(connetionString);

                cnn.Open();

                // Response.Write("Connection MAde");
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                String sql = "";

                // sql = "Insert into SalesManager(Name) values('"+ txtname.Text+"')";
                sql = "Insert into SalesManager(Name,Age,Dob,Income) values(@name, @age, @dob, @income)";
                command = new SqlCommand(sql, cnn);

                //adapter.InsertCommand = new SqlCommand(sql, cnn);
                //adapter.InsertCommand.ExecuteNonQuery();

                command.Parameters.AddWithValue("@name", SqlDbType.VarChar);
                command.Parameters["@name"].Value = salesManager.name;
                command.Parameters.AddWithValue("@age", SqlDbType.Int);
                command.Parameters["@age"].Value = salesManager.age;
                command.Parameters.AddWithValue("@dob", SqlDbType.Date);
                command.Parameters["@dob"].Value = salesManager.dob;
                command.Parameters.AddWithValue("@income", SqlDbType.Money);
                command.Parameters["@income"].Value = salesManager.money;
                command.ExecuteNonQuery();

                string sql1= "select * from SalesManager";
                SqlCommand command1 = new SqlCommand(sql1, cnn);
                SqlDataReader dr = command1.ExecuteReader();
                
                
                List<SalesManager> salesManagers = new List<SalesManager>();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        salesManagers.Add(new SalesManager()
                        {
                            name = dr.GetString(1),
                            age = dr.GetInt32(2),
                            dob = dr.GetDateTime(3),
                            money = dr.GetDecimal(4)
                        });
                    }
                }
                command1.Dispose();
                command.Dispose();
                cnn.Close();

                //return "Record Inserted Successfully";
                return salesManagers;


            }

            catch (Exception ex)
            {
                List<SalesManager> obj = new List<SalesManager>();
                obj.Add(new SalesManager() { msg = "Please Try Again" });
                 return obj;
            }
           
        }

[System.Web.Services.WebMethod]

        public static bool IsLeapYear(int year)

        {

            return DateTime.IsLeapYear(year);

        }
    }
}
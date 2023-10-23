using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace LoginGrocery.Models
{
    public class Functions
    {
        private SqlConnection Con;
        private SqlCommand cmd;
        private DataTable dt;
        private string ConnString;

        public Functions()
        {
            ConnString =ConfigurationManager.ConnectionStrings["con"].ConnectionString;/*"Data Source=desktop-kqqhhp5\\sqlexpress;Initial Catalog=Gro;Integrated Security=True";*/

            Con = new SqlConnection(ConnString);
            cmd = new SqlCommand();
            cmd.Connection = Con;
        }

        public DataTable GetData(string Query)
        {
            dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(Query, ConnString);
            sda.Fill(dt);
            return dt;
        }

        public int SetData(string Query)
        {
            int Cnt = 0;
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            cmd.CommandText = Query;
            Cnt = cmd.ExecuteNonQuery();
            Con.Close();
            return Cnt;
        }

        public DataTable GetDataWithParameters(string query, List<SqlParameter> parameters)
        {
            // Retrieve the connection string from the web.config
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddRange(parameters.ToArray());
                    DataTable dt = new DataTable();

                    try
                    {
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(dt);
                        }
                        return dt;
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions here (e.g., log the error)
                        return null;
                    }
                }
            }
        }

    }
}

    

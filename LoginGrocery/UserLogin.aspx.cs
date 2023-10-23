using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using LoginGrocery.Models;
namespace LoginGrocery
{
    
    public partial class UserLogin : System.Web.UI.Page
    {
       
        //string conStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Functions functions = new Functions();  // Initialize Functions class

                string query = $"SELECT * FROM UserRegistration WHERE UserId = '{UserId.Text.Trim()}' AND Password = '{Password.Text.Trim()}'";
                DataTable dt = functions.GetData(query);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    Response.Write("<script>alert('Login Successful');</script>");
                    Session["UserName"] = dr[0].ToString();
                    Session["UserId"] = dr[5].ToString();
                    Session["role"] = "user";

                    // Redirect after successful login
                    Response.Redirect("~/Buyer/Dash.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid User')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

    }
}

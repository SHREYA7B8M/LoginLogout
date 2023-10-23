using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginGrocery
{
    public partial class SignUp : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Button Click');</script>");
            if (CheckUserExists())
            {
                Response.Write("<script>alert('User Id already Exists');</script>");
            }
            else if (CheckContactNumberExists())
            {
                Response.Write("<script>alert('Contact Number already Exists');</script>");
            }
            else
            {
                NewSignUp();
            }
        }
        bool CheckContactNumberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(conStr);

                //The connection of the database will open if its closed
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select ContactNumber from UserRegistration where ContactNumber='" + ContactNumber.Text.Trim() + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);  //Disconnected Architecture
                DataTable dt = new DataTable();    //Inbuilt datatable in C#

                da.Fill(dt);     //Used to fill the datatable

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        bool CheckUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(conStr);

                //The connection of the database will open if its closed
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from UserRegistration where UserId='" + UserId.Text.Trim() + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);  //Disconnected Architecture
                DataTable dt = new DataTable();    //Inbuilt datatable in C#

                da.Fill(dt);     //Used to fill the datatable

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }

        void NewSignUp()
        {
            try
            {
                SqlConnection con = new SqlConnection(conStr);

                //The connection of the database will open if its closed
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO UserRegistration (FirstName, LastName, ContactNumber, EmailID, DateOfBirth, UserId, Password, ConfirmPassword) values (@fn, @ln, @contact, @emailId, @dob, @userId, @pwd, @cpwd)", con);
                cmd.Parameters.AddWithValue("@fn", FirstName.Text.Trim());  //Trim is used to remove the spaces in front and back
                cmd.Parameters.AddWithValue("@ln", LastName.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", ContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@emailId", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", Dob.Text.Trim());
                cmd.Parameters.AddWithValue("@userId", UserId.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", Password.Text.Trim());
                cmd.Parameters.AddWithValue("@cpwd", ConfirmPassword.Text.Trim());

                cmd.ExecuteNonQuery();  //If there is nothing to return then we have to use this method
                con.Close();

                Response.Write("<script>alert('User Registration Successful');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

    }
}


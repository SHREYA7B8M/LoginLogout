using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginGrocery
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true;   // UserLogin
                    LinkButton2.Visible = true;  // Sign up
                    //LinkButton6.Visible = true; //Logout
                }

                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; // UserLogin
                    LinkButton2.Visible = false; // Sign up
                    //LinkButton6.Visible = false;  //Logout
                }

                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; // UserLogin
                    LinkButton2.Visible = false; // Sign up
                    //LinkButton3.Visible = true; // Logout
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }



        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("HomePage.aspx");
        }

    }
}


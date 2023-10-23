using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginGrocery
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["role"] == null || Session["role"].Equals(""))
                {
                    LinkButton6.Visible = false; // Logout

                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton6.Visible = true; //Logout
                }

                else if (Session["role"].Equals("admin"))
                {
                    LinkButton6.Visible = true; //Logout
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                        string userName = Session["UserName"].ToString();
                        WelcomeLabel.Text = "Hello " + userName;
                }
                  else if (Session["UserId"] != null)
                  {
                        string userId = Session["UserId"].ToString();
                        WelcomeLabel.Text = "Hello " + userId;
                  }
            }
       
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Homepage1.aspx");
        }

        
    }
}
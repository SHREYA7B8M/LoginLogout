using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginGrocery
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated)
            {
                string userId = User.Identity.Name; 
                System.Web.UI.HtmlControls.HtmlGenericControl aspnetTitle = (System.Web.UI.HtmlControls.HtmlGenericControl)FindControl("aspnetTitle");

                if (aspnetTitle != null)
                {
                    aspnetTitle.InnerText = "Hello " + userId;
                }
            }
        }
     }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoginGrocery.Models;
namespace LoginGrocery.Buyer
{
    public partial class Products : System.Web.UI.Page
    {
        private Functions Con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Con = new Models.Functions();
                BindCategories();
                BindProducts();
            }
        }

        protected void BindCategories()
        {
            string query = "SELECT * FROM Categories";
            CategoryDropDown.DataSource = Con.GetData(query);
            CategoryDropDown.DataTextField = "CategoryName";
            CategoryDropDown.DataValueField = "CategoryId";
            CategoryDropDown.DataBind();
            CategoryDropDown.Items.Insert(0, new ListItem("Select Category", "0"));
        }

        protected void CategoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts(CategoryDropDown.SelectedValue);
        }

        protected void BindProducts(string categoryId = null)
        {
            if (Con == null)
            {
                Con = new Models.Functions();
            }

            string query = string.IsNullOrEmpty(categoryId)
                ? "SELECT * FROM Products"
                : $"SELECT * FROM Products WHERE CategoryId = {categoryId}";

            ProductRepeater.DataSource = Con.GetData(query);
            ProductRepeater.DataBind();
        }

        // Add this method to get the UserId or UserName
        private string GetUserIdOrName()
        {
            if (Session["UserId"] != null)
            {
                return Session["UserId"].ToString();
            }
            else if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                return HttpContext.Current.User.Identity.Name;
            }
            else
            {
                // If user is not authenticated and session does not have UserId, use a placeholder value or handle as needed
                return "Guest";
            }
        }



        private void AddToCart(int productId, string UserId)
        {
            try
            {
                if (Con == null)
                {
                    Con = new Models.Functions();
                }

                // Check if the product is already in the cart
                string checkQuery = $"SELECT COUNT(*) FROM Cart WHERE ProductId = {productId} AND UserId = '{UserId}'";
                int existingItemCount = Convert.ToInt32(Con.GetData(checkQuery).Rows[0][0]);

                if (existingItemCount > 0)
                {
                    // Product already exists in the cart, update quantity and total cost
                    string updateQuery = $"UPDATE Cart SET Quantity = Quantity + 1, TotalCost = TotalCost + (SELECT Price FROM Products WHERE ProductId = {productId}) " +
                                         $"WHERE ProductId = {productId} AND UserId = '{UserId}'";
                    int rowsAffected = Con.SetData(updateQuery);

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Item quantity updated in cart');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to update item quantity in cart');</script>");
                    }
                }
                else
                {
                    // Product is not in the cart, insert a new entry
                    string insertQuery = $"INSERT INTO Cart (ProductId, Quantity, TotalCost, UserId) " +
                                         $"VALUES ({productId}, 1, (SELECT Price FROM Products WHERE ProductId = {productId}), '{UserId}')";

                    int rowsAffected = Con.SetData(insertQuery);

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Item added to cart');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to add item to cart');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
            }
        }


        protected void ProductRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                AddToCart(productId, GetUserIdOrName());
            }
        }

    }
}
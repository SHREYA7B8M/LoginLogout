using LoginGrocery.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginGrocery.Buyer
{
    public partial class Cart : System.Web.UI.Page
    {
        private Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Con = new Models.Functions();
                BindCartItems();
            }
        }

        protected void CartGridView_RowCommand(object source, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveFromCart")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                RemoveFromCart(cartId);
            }
            else if (e.CommandName == "AdjustQuantity")
            {
                string[] args = e.CommandArgument.ToString().Split('_');
                if (args.Length == 2 && args[0] == "Increase" || args[0] == "Decrease")
                {
                    int cartId = Convert.ToInt32(args[1]);
                    TextBox quantityTextBox = (TextBox)CartGridView.Rows[cartId].FindControl("QuantityTextBox");
                    int currentQuantity = Convert.ToInt32(quantityTextBox.Text);

                    int adjustment = args[0] == "Increase" ? 1 : -1;
                    currentQuantity += adjustment;

                    if (currentQuantity < 1)
                    {
                        currentQuantity = 1;
                    }

                    quantityTextBox.Text = currentQuantity.ToString();

                    UpdateCartQuantity(cartId, currentQuantity);
                }
            }

            BindCartItems();
        }


        private void BindCartItems()
        {
            string userId = Session["UserId"].ToString();
            DataTable cartItems = GetCartItems(userId);
            CartGridView.DataSource = cartItems;
            CartGridView.DataBind();
        }

        private void UpdateCartQuantity(int rowIndex, int newQuantity)
        {
            try
            {
                if (Con == null)
                {
                    Con = new Models.Functions();
                }
                int cartId = Convert.ToInt32(CartGridView.DataKeys[rowIndex].Value);
                string query = $"UPDATE Cart SET Quantity = {newQuantity} WHERE CartId = {cartId}";
                int rowsAffected = Con.SetData(query);

                if (rowsAffected > 0)
                {
                    // Quantity updated successfully
                }
                else
                {
                    // Failed to update quantity
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }


        private void RemoveFromCart(int cartId)
        {
            try
            {
                if (Con == null)
                {
                    Con = new Models.Functions();
                }

                string query = $"DELETE FROM Cart WHERE CartId = {cartId}";
                int rowsAffected = Con.SetData(query);

                if (rowsAffected > 0)
                {
                    // Item removed successfully
                }
                else
                {
                    // Failed to remove item
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions here
            }
        }

        private DataTable GetCartItems(string userId)
        {
            Functions functions = new Functions();

            try
            {
                string query = $"SELECT Products.ProductImage, Products.ProductName, Products.Price, Cart.Quantity, (Cart.Quantity * Products.Price) as TotalCost, Cart.CartId " +
                               $"FROM Products " +
                               $"INNER JOIN Cart ON Products.ProductId = Cart.ProductId " +
                               $"WHERE Cart.UserId = '{userId}'"; // Notice the single quotes around {userId}

                return functions.GetData(query);
            }
            catch (Exception ex)
            {
                // Handle any exceptions here (e.g., log the error)
                return null; // Or an empty DataTable, depending on your preference
            }
        }

        protected void CartGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the user's ID from the session
            string userId = Session["UserId"].ToString();

            // Get the cart items for the user
            DataTable cartItems = GetCartItems(userId);

            if (cartItems.Rows.Count == 0)
            {
                // Display a message that the cart is empty
                // Example using a JavaScript alert:
                string alertScript = "alert('Your cart is empty.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmptyCartAlert", alertScript, true);
                
            }
            else
            {
                Response.Redirect("Orders.aspx");

            }

            // Display a success message using a JavaScript alert
            string successScript = "<script>alert('Order Placed');</script>";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "OrderSuccessAlert", successScript, true);
        }

        
        

        protected void PlaceOrderButton_Click1(object sender, EventArgs e)
        {
            // Get the user's ID from the session
            string userId = Session["UserId"].ToString();

            // Get the cart items for the user
            DataTable cartItems = GetCartItems(userId);

            if (cartItems.Rows.Count == 0)
            {
                // Display a message that the cart is empty
                // Example using a JavaScript alert:
                string alertScript = "alert('Your cart is empty.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmptyCartAlert", alertScript, true);
                
            }
            else
            {
                Response.Redirect("Orders.aspx");

            }

            //// Display a success message using a JavaScript alert
            //string successScript = "<script>alert('Order Placed');</script>";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "OrderSuccessAlert", successScript, true);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the user's ID from the session
            string userId = Session["UserId"].ToString();

            // Get the cart items for the user
            DataTable cartItems = GetCartItems(userId);

            if (cartItems.Rows.Count == 0)
            {
                // Display a message that the cart is empty
                // Example using a JavaScript alert:
                string alertScript = "alert('Your cart is empty.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmptyCartAlert", alertScript, true);

            }
            else
            {
                Response.Redirect("Orders.aspx");

            }



            //    // Display a success message using a JavaScript alert
            //    string successScript = "<script>alert('Order Placed');</script>";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "OrderSuccessAlert", successScript, true);
            //}

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //Get the user's ID from the session
                string userId = Session["UserId"].ToString();

            // Get the cart items for the user
            DataTable cartItems = GetCartItems(userId);

            if (cartItems.Rows.Count == 0)
            {
                // Display a message that the cart is empty
                // Example using a JavaScript alert:
                string alertScript = "alert('Your cart is empty.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmptyCartAlert", alertScript, true);
            }
            else
            {
                Response.Redirect("Orders.aspx");

            }

            // Display a success message using a JavaScript alert
            string successScript = "<script>alert('Order Placed');</script>";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "OrderSuccessAlert", successScript, true);

        }
    }
}

    

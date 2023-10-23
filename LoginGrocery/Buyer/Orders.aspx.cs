using LoginGrocery.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginGrocery.Buyer
{
    public partial class Orders : System.Web.UI.Page
    {
        private Functions Con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Con = new Functions();
                BindOrderData();
            }
        }

        

        private void BindOrderData()
        {
            // Your logic to fetch and bind order data to the GridView
            string userId = Session["UserId"].ToString();
            DataTable orderData = GetOrderData(userId);

            OrderGridView.DataSource = orderData;
            OrderGridView.DataBind();
        }

        private DataTable GetOrderData(string userId)
        {
            Functions functions = new Functions();
            try
            {
                string query = "SELECT OrderId, ProductId, TotalCost FROM Orders WHERE UserId = @UserId";
                // Create a parameter for UserId to prevent SQL injection
                var parameters = new List<SqlParameter>
                {
                    new SqlParameter("@UserId", userId)
                };

                return functions.GetDataWithParameters(query, parameters);
            }
            catch (Exception ex)
            {
                // Handle any exceptions here (e.g., log the error)
                return null; // Or an empty DataTable, depending on your preference
            }
        }

        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            // Get the user's ID from the session
            string userId = Session["UserId"].ToString();

            // Get the order items for the user
            DataTable orderData = GetOrderData(userId);

            if (orderData.Rows.Count == 0)
            {
                // Display a message that the order is empty
                // Example using a JavaScript alert:
                string alertScript = "alert('Your order is empty.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmptyOrderAlert", alertScript, true);
                return;
            }

            int orderId = InsertOrderIntoDatabase(userId, orderData);

            if (orderId > 0)
            {
                // Display a success message using a JavaScript alert
                string successScript = $@"alert('Order Placed successfully. Order ID: {orderId}');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OrderSuccessAlert", successScript, true);
            }
            else
            {
                // Handle the case where the order insertion failed
                // You can display an error message or log the error.
            }
        }

        private int InsertOrderIntoDatabase(string userId, DataTable orderData)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlTransaction transaction = connection.BeginTransaction())
                    {
                        try
                        {
                            int orderId = -1; // Initialize with an error value

                            foreach (DataRow row in orderData.Rows)
                            {
                                int productId = Convert.ToInt32(row["ProductId"]);
                                decimal totalCost = Convert.ToDecimal(row["TotalCost"]);

                                // Create the SQL command to insert the order
                                string insertQuery = "INSERT INTO Orders (ProductId, TotalCost) VALUES (@ProductId, @TotalCost); SELECT SCOPE_IDENTITY();";

                                using (SqlCommand command = new SqlCommand(insertQuery, connection, transaction))
                                {
                                    command.Parameters.AddWithValue("@ProductId", productId);
                                    command.Parameters.AddWithValue("@TotalCost", totalCost);

                                    // Execute the command and get the inserted order's ID
                                    orderId = Convert.ToInt32(command.ExecuteScalar());
                                }
                            }

                            // If everything was successful, commit the transaction
                            transaction.Commit();
                            return orderId;
                        }
                        catch (Exception ex)
                        {
                            // Handle any exceptions here
                            // You can log the error, display an error message, or take appropriate action
                            transaction.Rollback(); // Rollback the transaction in case of an error
                            return -1; // Return an error value
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle connection-related exceptions
                return -1; // Return an error value
            }
        }

        protected void OrderGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Check if a row is selected
            if (OrderGridView.SelectedIndex != -1)
            {
                // Get the selected row data
                GridViewRow selectedRow = OrderGridView.SelectedRow;
                int orderId = int.Parse(selectedRow.Cells[1].Text); // Assuming the OrderId is in the first cell

                // Display a success message using a JavaScript alert
                string successScript = $@"alert('Order Placed successfully. Order ID: {orderId}');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OrderSuccessAlert", successScript, true);
            }
        }
    }
}

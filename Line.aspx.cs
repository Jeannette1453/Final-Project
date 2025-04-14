using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebProjectAssignment
{
    public partial class RouteRegistration : Page
    {
        protected void btnRegisterRoute_Click(object sender, EventArgs e)
        {
            string startLocation = txtStartLocation.Text.Trim();
            string endLocation = txtEndLocation.Text.Trim();
            string distanceText = txtDistance.Text.Trim();
            string estimatedTime = txtEstimatedTime.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(startLocation) || string.IsNullOrEmpty(endLocation) || string.IsNullOrEmpty(distanceText) || string.IsNullOrEmpty(estimatedTime))
            {
                lblMessage.Text = "All fields are required!";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            if (!decimal.TryParse(distanceText, out decimal distance))
            {
                lblMessage.Text = "Distance must be a valid number.";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            // Connection to the database
            string connectionString = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Route (StartLocation, EndLocation, Distance, EstimatedTime) VALUES (@StartLocation, @EndLocation, @Distance, @EstimatedTime)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@StartLocation", startLocation);
                    cmd.Parameters.AddWithValue("@EndLocation", endLocation);
                    cmd.Parameters.AddWithValue("@Distance", distance);
                    cmd.Parameters.AddWithValue("@EstimatedTime", estimatedTime);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Route registration successful!";
                        lblMessage.CssClass = "text-success";
                        lblMessage.Visible = true;
                    }
                    catch (SqlException ex)
                    {
                        lblMessage.Text = "Database error: " + ex.Message;
                        lblMessage.CssClass = "text-danger";
                        lblMessage.Visible = true;
                    }
                }
            }
        }
    }
}

using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebProjectAssignment
{
    public partial class VehicleRegistration : Page
    {
        protected void btnRegisterVehicle_Click(object sender, EventArgs e)
        {
            string vehicleNumber = txtVehicleNumber.Text.Trim();
            string model = txtModel.Text.Trim();
            string type = txtType.Text.Trim();
            string capacityText = txtCapacity.Text.Trim();
            string line = txtline.Text.Trim();
            bool isAvailable = chkAvailable.Checked;

            // Validate inputs
            if (string.IsNullOrEmpty(vehicleNumber) || string.IsNullOrEmpty(model) || string.IsNullOrEmpty(type) || string.IsNullOrEmpty(capacityText) || string.IsNullOrEmpty(line))
            {
                lblMessage.Text = "All fields are required!";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            if (!int.TryParse(capacityText, out int capacity))
            {
                lblMessage.Text = "Capacity must be a valid number.";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            // Connection to database
            string connectionString = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Vehicle (vehicle_number, model, type, capacity, ELocation,available) VALUES (@VehicleNumber, @Model, @Type, @Capacity, @Line,@Available)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
                    cmd.Parameters.AddWithValue("@Model", model);
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Capacity", capacity);
                    cmd.Parameters.AddWithValue("@Line", line);
                    cmd.Parameters.AddWithValue("@Available", isAvailable);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Vehicle registration successful!";
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

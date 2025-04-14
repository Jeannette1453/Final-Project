using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LandTransportManagementSystem
{
    public partial class PassengerOg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string connectionString = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // First, check if the email already exists
                string checkEmailQuery = "SELECT COUNT(*) FROM Passenger WHERE email = @Email";
                SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, con);
                checkEmailCmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                try
                {
                    con.Open();

                    // Execute the query to check if the email exists
                    int emailCount = (int)checkEmailCmd.ExecuteScalar();

                    if (emailCount > 0)
                    {
                        // If email exists, display an error message
                        lblMessage.Text = "The email address is already registered!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        // If email doesn't exist, proceed with the insert operation
                        string insertQuery = "INSERT INTO Passenger (first_name, last_name, email, phone_number) " +
                                             "VALUES (@FirstName, @LastName, @Email, @Phone)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        insertCmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        insertCmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                        insertCmd.ExecuteNonQuery();
                        lblMessage.Text = "Passenger inserted successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }




        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string connectionString = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Passenger SET first_name=@FirstName, last_name=@LastName, " +
                               "email=@Email, phone_number=@Phone WHERE passenger_id=@PassengerID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@PassengerID", txtPassengerId.Text);

                try
                {
                    con.Open();
                    int rows = cmd.ExecuteNonQuery();
                    lblMessage.Text = rows > 0 ? "Passenger updated successfully!" : "Passenger not found.";
                    lblMessage.ForeColor = rows > 0 ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void btnBookTicket_Click(object sender, EventArgs e)
        {
            // Redirect to Danny.aspx
            Response.Redirect("Booking.aspx");
        }
        protected void btnProfile(object sender, EventArgs e)
        {
            // Redirect to Danny.aspx
            Response.Redirect("PassProfile.aspx");
        }
    }
}

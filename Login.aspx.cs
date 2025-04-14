using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace WebProjectAssignment
{
    public partial class LOGIN : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text.Trim();  // Using email for login
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both email and password!";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            string hashedPassword = HashPassword(password);
            string connectionString = Data Source = QUEEN\SQLEXPRESS; Initial Catalog = TransportManagentSystemDB; Integrated Security = True; TrustServerCertificate = True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Role FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                    try
                    {
                        con.Open();
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            string role = result.ToString().ToLower(); // Make lowercase for consistent comparison

                            // Store session if needed
                            Session["UserEmail"] = email;
                            Session["UserRole"] = role;

                            // Role-based redirection
                            if (role == "admin")
                            {
                                Response.Redirect("AdminDash.aspx");
                            }
                            else if (role == "passenger")
                            {
                                Response.Redirect("PassengerOg.aspx");
                            }
                            else if (role == "driver")
                            {
                                Response.Redirect("Driver.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "Unrecognized role. Please contact support.";
                                lblMessage.CssClass = "text-danger";
                                lblMessage.Visible = true;
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Invalid email or password!";
                            lblMessage.CssClass = "text-danger";
                            lblMessage.Visible = true;
                        }
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

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}

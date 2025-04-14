using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace FinalProject  // Ensure this matches your ASPX page namespace
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            lblMessage.Visible = true;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "Please fill all fields!";
                lblMessage.CssClass = "text-danger";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                lblMessage.CssClass = "text-danger";
                return;
            }

            try
            {
                // Hash the new password
                string hashedPassword = HashPassword(newPassword);

                string connectionString = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if the email exists
                    string checkEmailQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkEmailQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int userExists = (int)checkCmd.ExecuteScalar();

                        if (userExists == 0)
                        {
                            lblMessage.Text = "Email not found!";
                            lblMessage.CssClass = "text-danger";
                            return;
                        }
                    }

                    // Update password if email exists
                    string updateQuery = "UPDATE Users SET PasswordHash = @Password WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);
                        cmd.Parameters.AddWithValue("@Email", email);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Password reset successful!";
                            lblMessage.CssClass = "text-success";
                        }
                        else
                        {
                            lblMessage.Text = "Password reset failed!";
                            lblMessage.CssClass = "text-danger";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
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

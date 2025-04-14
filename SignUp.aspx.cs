using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace WebProjectAssignment
{
    public partial class SignUp : Page
    {
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string role = ddlRole.SelectedItem.Value; // Corrected line to get selected value

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                lblMessage.Text = "All fields are required!";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            string hashedPassword = HashPassword(password);
            string connectionString = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Email, PasswordHash, Role) VALUES (@Username, @Email, @PasswordHash, @Role)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                    cmd.Parameters.AddWithValue("@Role", role);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Registration successful! You can now log in.";
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

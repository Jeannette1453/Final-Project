using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LandTransportManagementSystem
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentData(null); // Load all data initially
            }
        }

        protected void btnLoadData_Click(object sender, EventArgs e)
        {
            LoadPaymentData(null); // Load all data when Load All button is clicked
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //string searchQuery = txtSearch.Text.Trim();
            //LoadPaymentData(searchQuery); // Load filtered data based on the search
        }

        private void LoadPaymentData(string searchQuery)
        {
            string connStr = @"Server=localhost\SQLEXPRESS;Database=TransportManagementSystemDB;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Updated query to join Booking with Passenger to fetch PassengerName
                string query = "SELECT Booking.BookingID, Passenger.first_name, Route.RouteID, Route.Distance, " +
                               "Route.EstimatedTime,Route.EndLocation AS Destination " +
                               "FROM Route " +
                               "INNER JOIN Booking ON Route.RouteID = Booking.BRouteID " +
                               "INNER JOIN Passenger ON Booking.PassengerID = Passenger.passenger_id";

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE Route.EndLocation LIKE @SearchQuery";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Adding "Payment" column
                dt.Columns.Add("Payment", typeof(decimal));
                foreach (DataRow row in dt.Rows)
                {
                    int distance = Convert.ToInt32(row["Distance"]);
                    row["Payment"] = distance * 1300;
                }

                // Bind the data to Repeater control
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }
}

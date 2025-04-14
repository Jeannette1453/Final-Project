<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="LandTransportManagementSystem.Payment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Dashboard</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Dashboard container */
        .dashboard-container {
            width: 85%;
            max-width: 1200px;
            margin: 30px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 28px;
            letter-spacing: 1px;
        }

        /* Search bar */
        .search-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .search-bar input {
            padding: 12px;
            font-size: 16px;
            border: 2px solid #3498db;
            border-radius: 5px;
            width: 280px;
            margin-right: 10px;
            transition: all 0.3s ease;
        }

        .search-bar input:focus {
            border-color: #2ecc71;
            outline: none;
        }

        .search-bar button {
            padding: 12px 24px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #2980b9;
        }

        /* Repeater layout - card-like grid display */
        .payment-grid {
            display: flex;
            flex-direction: column;
            gap: 10px; /* Reduced gap between rows */
            padding: 20px;
        }

        .payment-grid .data {
            display: flex;
            justify-content: space-between;
            padding: 12px 15px;
            background-color: #ecf0f1;
            border-radius: 8px;
            font-size: 16px;
            color: #333;
            gap: 8px; /* Reduced gap between columns */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .payment-grid .data:hover {
            transform: translateY(-5px);
        }

        .payment-grid .data:nth-child(odd) {
            background-color: #f9fafb;
        }

        /* Payment column */
        .payment-grid .amount {
            color: #2ecc71;
            font-weight: bold;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .payment-grid {
                padding: 10px;
            }

            .search-bar input {
                width: 200px;
            }

            #btnLoadData {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .payment-grid {
                padding: 5px;
            }

            .search-bar input {
                width: 150px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Passenger Payment Details</h2>

        <!-- Search bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search by Booking ID" onkeyup="searchPayments()">
            <button onclick="clearSearch()">Clear</button>
        </div>

        <div class="payment-grid">
            <!-- Column headers -->
            <div class="data header">
                <div><strong>Booking ID</strong></div>
                <div><strong>Passenger Name</strong></div>
                <div><strong>Destination</strong></div>
                <div><strong>Distance</strong></div>
                <div><strong>Time to Spend</strong></div>
                <div><strong>Amount</strong></div>
            </div>

            <!-- Repeater for payment details -->
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="data">
                        <div><%# Eval("BookingID") %></div>
                        <div><%# Eval("first_name") %></div>
                        <div><%# Eval("Destination") %></div>
                        <div><%# Eval("Distance") %> km</div>
                        <div><%# Eval("EstimatedTime") %> hrs</div>
                        <div class="amount">$<%# Eval("Payment") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <script>
        // Function to filter payments based on search input
        function searchPayments() {
            var input = document.getElementById('searchInput').value.toUpperCase();
            var rows = document.querySelectorAll('.payment-grid .data');
            rows.forEach(function(row) {
                var bookingId = row.children[0].textContent.toUpperCase();
                if (bookingId.indexOf(input) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        // Function to clear search input
        function clearSearch() {
            document.getElementById('searchInput').value = '';
            searchPayments();
        }
    </script>
</body>
</html>

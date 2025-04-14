<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassengerOg.aspx.cs" Inherits="LandTransportManagementSystem.PassengerOg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Passenger Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f7f7;
            padding: 50px;
            margin: 0;
        }

        .container {
            background-color: #fff;
            max-width: 600px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-left: 5px solid #3c8dbc;
        }

        h2 {
            text-align: center;
            color: #3c8dbc;
            margin-bottom: 20px;
            font-size: 28px;
        }

        label {
            display: block;
            font-weight: bold;
            color: #333;
            margin-bottom: 6px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #3c8dbc;
        }

        button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            background-color: #3c8dbc;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #3276b1;
        }

        .message {
            color: red;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
        }

        .action-buttons {
            text-align: center;
        }

        .action-buttons button {
            width: 48%;
            display: inline-block;
            margin: 10px 1%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Passenger Management</h2>

            <label for="txtPassengerId">Passenger ID (for update only):</label>
            <asp:TextBox ID="txtPassengerId" runat="server" CssClass="text-box"></asp:TextBox>

            <label for="txtFirstName">First Name:</label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="text-box"></asp:TextBox>

            <label for="txtLastName">Last Name:</label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="text-box"></asp:TextBox>

            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="text-box"></asp:TextBox>

            <label for="txtPhone">Phone Number:</label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="text-box"></asp:TextBox>

            <div class="action-buttons">
                <asp:Button ID="btnInsert" runat="server" Text="Insert Passenger" OnClick="btnInsert_Click" CssClass="button" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update Passenger" OnClick="btnUpdate_Click" CssClass="button" />
                <asp:Button ID="btnBookTicket" runat="server" Text="Book Ticket" OnClick="btnBookTicket_Click" CssClass="button" />
                <asp:Button ID="Button1" runat="server" Text="View your Profile" OnClick="btnProfile" CssClass="button" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>

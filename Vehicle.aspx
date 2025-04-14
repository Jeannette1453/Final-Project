<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleRegistration.aspx.cs" Inherits="WebProjectAssignment.VehicleRegistration" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Vehicle Registration</title>
    <style>
        /* General page styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f7fb;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container to center form */
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        /* Header Style */
        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 30px;
            font-size: 24px;
        }

        /* Input fields styles */
        .input-field {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        /* Focus effect on input fields */
        .input-field:focus {
            border-color: #4CAF50;
            outline: none;
        }

        /* Register button style */
        .button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* Hover effect for the button */
        .button:hover {
            background-color: #45a049;
        }

        /* Message label styles */
        .message {
            display: block;
            margin: 10px 0;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
        }

        .text-success {
            background-color: #d4edda;
            color: #155724;
        }

        .text-danger {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Register Vehicle</h2>

            <!-- Message Label for success/error -->
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" CssClass="message" />

            <!-- Vehicle Number -->
            <asp:TextBox ID="txtVehicleNumber" runat="server" placeholder="Vehicle Number" CssClass="input-field" />

            <!-- Model -->
            <asp:TextBox ID="txtModel" runat="server" placeholder="Model" CssClass="input-field" />

            <!-- Type -->
            <asp:TextBox ID="txtType" runat="server" placeholder="Vehicle Type (e.g., Sedan, SUV)" CssClass="input-field" />

            <!-- Capacity -->
            <asp:TextBox ID="txtCapacity" runat="server" placeholder="Capacity" CssClass="input-field" />
            <asp:TextBox ID="txtline" runat="server" placeholder="Line" CssClass="input-field" />

            <!-- Availability (Checkbox) -->
            <asp:CheckBox ID="chkAvailable" runat="server" Text="Available" CssClass="input-field" /><br/>

            <!-- Register Button -->
            <asp:Button ID="btnRegisterVehicle" runat="server" Text="Register Vehicle" OnClick="btnRegisterVehicle_Click" CssClass="button" />
        </div>
    </form>
</body>
</html>

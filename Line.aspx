<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RouteRegistration.aspx.cs" Inherits="WebProjectAssignment.RouteRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Route Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: #fff;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

        .message {
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
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
        <div class="form-container">
            <h2>Route Registration</h2>

            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="message" />

            <asp:TextBox ID="txtStartLocation" runat="server" CssClass="input-field" placeholder="Start Location" />
            <asp:TextBox ID="txtEndLocation" runat="server" CssClass="input-field" placeholder="End Location" />
            <asp:TextBox ID="txtDistance" runat="server" CssClass="input-field" placeholder="Distance (in km)" TextMode="Number" />
            <asp:TextBox ID="txtEstimatedTime" runat="server" CssClass="input-field" placeholder="Estimated Time (e.g., 2 hours)" />

            <asp:Button ID="btnRegisterRoute" runat="server" Text="Register Route" CssClass="btn-submit" OnClick="btnRegisterRoute_Click" />
        </div>
    </form>
</body>
</html>

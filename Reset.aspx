<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="FinalProject.ResetPassword" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fb;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 30px;
            font-size: 24px;
        }
        .input-field {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
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
            <h2>Reset Password</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" CssClass="message" />
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email" CssClass="input-field" />
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="New Password" CssClass="input-field" />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm New Password" CssClass="input-field" />
            <asp:Button ID="btnReset" runat="server" Text="Reset Password" OnClick="btnReset_Click" CssClass="button" />
        </div>
    </form>
</body>
</html>

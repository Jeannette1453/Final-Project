<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="WebProjectAssignment.LOGIN" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Login</title>
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

        /* Login button style */
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

        /* Sign Up Link styles */
        .signup-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        /* Forgot Password Link styles */
        .forgot-password-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        /* Hover effect for sign-up and forgot password links */
        .signup-link:hover, .forgot-password-link:hover {
            text-decoration: underline;
        }

        /* Mobile responsiveness */
        @media (max-width: 600px) {
            .container {
                padding: 25px;
            }

            h2 {
                font-size: 20px;
            }

            .button {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>

            <!-- Message Label for success/error -->
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" CssClass="message" />

            <!-- Username field -->
            <asp:TextBox ID="txtUsername" runat="server" TextMode="email" placeholder="Email" CssClass="input-field" />

            <!-- Password field -->
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="input-field" />

            <!-- Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="button" />

            <!-- Link to Sign Up -->
            <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="SignUp.aspx" Text="Don't have an account? Sign Up here!" CssClass="signup-link" />

            <!-- Link to Forgot Password -->
            <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="Reset.aspx" Text="Forgot your password?" CssClass="forgot-password-link" />
        </div>
    </form>
</body>
</html>

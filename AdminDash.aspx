<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalProject.Admin" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Admin - Manage Transport</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f7fb;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-top: 50px;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .form-input {
            width: 300px;
            padding: 8px;
            margin: 5px 0;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin - Manage Transport</h2>

            
            <div>
                <h3>Add Driver</h3>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input" placeholder="First Name" />
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-input" placeholder="Last Name" />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Email" />
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-input" placeholder="Phone Number" />
                <asp:TextBox ID="txtLicenseNumber" runat="server" CssClass="form-input" placeholder="License Number" />
                <asp:DropDownList ID="ddlAssignedVehicle" runat="server" CssClass="form-input">
                   
                </asp:DropDownList>
                <asp:Button ID="btnAddDriver" runat="server" Text="Add Driver" CssClass="button" OnClick="btnAddDriver_Click" />
            </div>

            
            <div>
                <h3>View Drivers</h3>
                <asp:GridView ID="gvDrivers" runat="server" AutoGenerateColumns="True" OnRowDeleting="gvDrivers_RowDeleting">
                    
                </asp:GridView>
            </div>

           
            <div>
                <h3>Add Vehicle</h3>
                <asp:TextBox ID="txtVehicleNumber" runat="server" CssClass="form-input" placeholder="Vehicle Number" />
                <asp:TextBox ID="txtVehicleMode" runat="server" CssClass="form-input" placeholder="Vehicle Mode" />
                <asp:TextBox ID="txtVehicleType" runat="server" CssClass="form-input" placeholder="Vehicle Type" />
                <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-input" placeholder="Vehicle Capacity" />
                <asp:TextBox ID="txtavail" runat="server" CssClass="form-input" placeholder="Availability seates" />

        
    
    <asp:Button ID="btnAddVehicle" runat="server" Text="Add Vehicle" CssClass="button" OnClick="btnAddVehicle_Click" />
</div>

            
            <div>
                <h3>View Vehicles</h3>
                <asp:GridView ID="gvVehicles" runat="server" AutoGenerateColumns="True" OnRowDeleting="gvVehicles_RowDeleting">
                   
                </asp:GridView>
            </div>

           
            <div>
    <h3>Add Passenger</h3>
    <asp:TextBox ID="txtPassengerFirstName" runat="server" CssClass="form-input" placeholder="First Name" />
    <asp:TextBox ID="txtPassengerLastName" runat="server" CssClass="form-input" placeholder="Last Name" />
    <asp:TextBox ID="txtPassengerEmail" runat="server" CssClass="form-input" placeholder="Email" />
    <asp:TextBox ID="txtPassengerPhone" runat="server" CssClass="form-input" placeholder="Phone Number" />
    <asp:Button ID="btnAddPassenger" runat="server" Text="Add Passenger" CssClass="button" OnClick="btnAddPassenger_Click" />
</div>

            
            <div>
                <h3>View Passengers</h3>
                <asp:GridView ID="gvPassengers" runat="server" AutoGenerateColumns="True" OnRowDeleting="gvPassengers_RowDeleting">
                    
                </asp:GridView>
            </div>

            
            <div>
    <h3>Add Route</h3>
    <asp:TextBox ID="txtSdate" runat="server" CssClass="form-input" placeholder="Start Date" />
    <asp:TextBox ID="txtEdate" runat="server" CssClass="form-input" placeholder="End Date" />
    <asp:TextBox ID="txtDistance" runat="server" CssClass="form-input" placeholder="Distance" />
    <asp:TextBox ID="txtEstimate" runat="server" CssClass="form-input" placeholder="Estimate time" />
        
    </asp:DropDownList>
    <asp:Button ID="btnAddRoute" runat="server" Text="Add Route" CssClass="button" OnClick="btnAddRoute_Click" />
</div>

            
            <div>
                <h3>View Routes</h3>
                <asp:GridView ID="gvRoutes" runat="server" AutoGenerateColumns="True" OnRowDeleting="gvRoutes_RowDeleting">
                   
                </asp:GridView>
            </div>
        </div>
    </form>

</body>
</html>

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Purchase System</title>

    <link rel="stylesheet" href="styles/bootstrap.min.css" />
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/your-font-awesome-kit.js" crossorigin="anonymous"></script> <!-- Replace "your-font-awesome-kit.js" with your own Font Awesome script URL -->
    <style>
      .footer {
        background-color: #f8f9fa;
        padding: 20px;
        text-align: center;
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
      }
      .footer a {
        color: #000;
        text-decoration: none;
        margin: 0 5px;
      }
    </style>
</head>
<body>
  <div class="navbar navbar-dark bg-dark">
    <div class="container">
      <span class="navbar-brand mb-0 h1">Procurement Tracking System</span>
    </div>
  </div>
  <div class="container mt-5">
    <form id="form1" runat="server">
      <div class="text-center mb-4">
        <h3 class="mb-4">Login</h3>
        <asp:Label ID="lbl_errorMsg" runat="server" Text="" CssClass="text-danger"></asp:Label>
      </div>
      <div class="mb-3">
        <label class="form-label">Username:</label>
        <asp:TextBox ID="txt_username" runat="server" Width="100%" CssClass="form-control form-control-lg"></asp:TextBox>
      </div>
      <div class="mb-3">
        <label class="form-label">Password:</label>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" Width="100%" CssClass="form-control form-control-lg"></asp:TextBox>
      </div>
      <div class="text-center">
        <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-primary mt-3"></asp:Button>
      </div>
    </form>
  </div>
  <div class="footer">
    <p>© 2024 Procurement Tracking System. All rights reserved.</p>
    <p>Made by Jason Cheuk</p>
    
    <button type="button" class="btn btn-secondary" onclick="location.href = 'https:\/\/github.com/2246250622/Purchase';">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27s1.36.09 2 .27c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8"></path>
</svg>
      </button>
    
  </div>
</body>
</html>
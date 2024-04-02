<%@ Page Language="VB" AutoEventWireup="false" CodeFile="about.aspx.vb" Inherits="about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Purchase System</title>

  






    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
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
<body class="img" style="background-image: url(images/bg.jpg);background-attachment: fixed;">
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="./index.aspx">
        <img src="images/qeh_logo.png" alt="Bootstrap" width="40" height="40">
        Purchase Tracking System
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="./index.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./termofuse.aspx">Term of Use</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./about.aspx">AboutUs</a>
          </li>
        </ul>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <!-- Move the button to the right-hand side -->
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="./index.aspx">
              <button class="btn btn-outline-success">Login</button>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


  <div style="width:70%;margin-left:auto;margin-right:auto;color: rgb(255, 255, 255);">
    <br><br><br>
    <!-- Add your content here -->
    <h1>About Procurement Tracking System</h1>
    <p>
      This Procurement Tracking System is designed to streamline the procurement process and track purchases within the organization. It provides a user-friendly interface for managing purchase orders, vendor information, and inventory. The system ensures transparency and efficiency in procurement operations, helping to improve decision-making and cost control.
    </p>
    
    <h2>Contact Information</h2>
    <p>
      If you have any questions or need assistance, please feel free to contact us:
      <br>
      Email: jason.cheuk@ha.org.hk
      <br>
      Phone: 6749 9270
    </p>

    <h2>Features of Procurement Tracking System</h2>
    <ul>
      <li>Centralized purchase order management</li>
      <li>Automated vendor management</li>
      <li>Real-time inventory tracking</li>
      <li>Budget monitoring and control</li>
      <li>Customizable reporting and analytics</li>
      <li>Integration with accounting systems</li>
      <li>User-friendly interface with intuitive navigation</li>
    </ul>

    <h2>Benefits of Procurement Tracking System</h2>
    <ul>
      <li>Improved efficiency and productivity</li>
      <li>Enhanced accuracy in purchasing and inventory management</li>
      <li>Cost savings through better negotiation with vendors</li>
      <li>Increased transparency and visibility into procurement processes</li>
      <li>Streamlined approval workflows</li>
      <li>Reduced risk of errors and fraud</li>
    </ul>
  </div>

  <br><br><br><br><br>

  <div class="footer text-white bg-dark ">
    <p>© 2024 Procurement Tracking System. All rights reserved.  &nbsp; &nbsp;<b>Made by Jason Cheuk&nbsp;&nbsp; </b>
    
    <button type="button" class="btn btn-secondary" onclick="location.href = 'https:\/\/github.com/2246250622/Purchase';">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27s1.36.09 2 .27c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8"></path>
</svg>
      </button>
    </p>
  </div>
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
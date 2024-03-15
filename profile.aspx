<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" MaintainScrollPositionOnPostback="true" validateRequest="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

        <form  runat="server" >
          <nav class="navbar navbar-expand-lg "  style="background-color: #e3f2fd;">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">
                <img src="images/qeh_logo.png" alt="Bootstrap" width="40" height="40">
              </a>
        
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
        
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="https://qehcndsvr2/Purchase/mangement.aspx">Dashboard</a>
                  </li>
         
                  <li class="nav-item">
                    <a class="nav-link"  href="https://qehcndsvr2/Purchase/financialreport_admin.aspx">Financial Report</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="https://qehcndsvr2/Purchase/profile.aspx">Profile</a>
                  </li>
                </ul>
    
                <!-- Move the button to the right-hand side -->
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item">
     

                    Logged-in as:(<asp:Label ID="lbl_DomainID" runat="server" Text=""></asp:Label>)&nbsp;&nbsp;<asp:LinkButton 
                        ID="lb_Logout" runat="server"  class="btn btn-outline-primary"  onclick="lb_Logout_Click"   CausesValidation="false" >Logout</asp:LinkButton>
                  </li>
                </ul>
              
        
        
              </div>
            </div>
          </nav>
          
<form class="row g-3" ><br><br>
       
          <br><br><br><br><br>
<center>
          <div class="card" style="width: 18rem;"   >
            <img src="images/Queen_Elizabeth_Hospital.jpeg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Corp ID</h5>
              <asp:label class="card-text" id="lbl_corpid" runat="server" ClientIDMode="Static" disabled  ></asp:label><br><br>
              <h5 class="card-title">Role</h5>
              <asp:label class="card-text" id="lbl_role" runat="server"  ClientIDMode="Static"  disabled></asp:label><br><br>
              <button type="button" class="btn btn-secondary" onclick="goBack()">Back</button>
            </div>
          </div>
          </center>




</form>
        </form>


    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

<script>
function goBack() {
    window.location.replace("https://qehcndsvr2/Purchase/mangement.aspx");
  }
  </script>


</html>
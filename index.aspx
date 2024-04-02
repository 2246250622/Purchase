<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

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
<body class="img js-fullheight" style="">
  <nav class="navbar navbar-expand-lg ">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <img src="images/qeh_logo.png" alt="Bootstrap" width="40" height="40">
        Purchase Tracking System
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
       

        </ul>

      </div>
    </div>
  </nav>


  <br>    <br>    <br>    <br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">

          <img src="images/qeh_logo.png"  style="width:100px;">
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Sign in</h3>
            <asp:Label ID="lbl_errorMsg" runat="server" Text="" CssClass="text-danger"></asp:Label>
		      	<form  id="form1" runat="server">
		      		<div class="form-group">
                <asp:TextBox ID="txt_username" runat="server"  CssClass="form-control"  placeholder="Username" ></asp:TextBox>
		      		</div>
	            <div class="form-group">
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
	            
	            </div>
	            <div class="form-group">
                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="form-control btn btn-primary submit px-3"></asp:Button>
	            </div>
              
	     

              
	          </form>
    
	   
		      </div>
				</div>
			</div>






		</div>







  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="createorder.aspx.vb" Inherits="createorder" MaintainScrollPositionOnPostback="true" validateRequest="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Order</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Create Detail</h1>
        <form class="row g-3" runat="server" >
            <div class="col-md-3">
              <label for="orderId" class="form-label">Order ID</label>
              <input type="text" class="form-control is-valid" id="orderId" value="<%= Session("OrderId") %>" disabled required>
              <div class="valid-feedback">
                <asp:Label ID="lbl_id_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_id_SysRecordDate" runat="server" Text=""></asp:Label>)
              </div>
            </div>

            <div class="col-md-3">
                <label for="lbl_admin_id" class="form-label">Admin ID</label>
                <asp:TextBox class="form-control is-valid" id="lbl_admin_id" runat="server"  ClientIDMode="Static" required disabled></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_admin_id_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_admin_id_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
            </div>

            <div class="col-md-3">
                <label for="lbl_requester_id" class="form-label">Requester Name</label>
                <asp:TextBox class="form-control is-valid" id="lbl_requester_id" runat="server"  ClientIDMode="Static" required disabled></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_requester_id_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_requester_id_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
            </div>

            <div class="col-md-3">
                <label for="lbl_item_financial_year" class="form-label">Financial Year</label>
                <asp:TextBox class="form-control is-valid" id="lbl_item_financial_year" runat="server"  ClientIDMode="Static" required disabled></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_item_financial_year_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_item_financial_year_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
            </div>

            <div class="col-md-12">
                <label for="lbl_item_name" class="form-label">Item_Name</label>
                <asp:TextBox class="form-control is-valid" id="lbl_item_name" Rows="7" TextMode="MultiLine" runat="server"  ClientIDMode="Static" required disabled></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_item_name_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_item_name_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
            </div>

            <div class="col-md-3" >
                <label for="lbl_item_quality" class="form-label">Item Quality</label>
                <asp:TextBox class="form-control is-valid" id="lbl_item_quality" runat="server"  ClientIDMode="Static"  ></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_item_quality_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_item_quality_SysRecordDate" runat="server" Text="" ></asp:Label>)
                </div>

                
                <label for="lbl_item_unit_price" class="form-label">Item Unit Price</label>
                <div class="input-group">
                <span class="input-group-text">$</span>
                <asp:TextBox class="form-control is-valid" id="lbl_item_unit_price" runat="server"  ClientIDMode="Static"  ></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_item_unit_price_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_item_unit_price_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
            </div>
            </div>
 
            <div class="col-md-4">
                <label for="lbl_assign" class="form-label">Assign</label>
                <asp:TextBox class="form-control is-valid" id="lbl_assign" runat="server"  ClientIDMode="Static"  ></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_assign_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_assign_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
           

                <div class="row">
                <div class="col-md-6">
                    <label for="lbl_item_additional_charges" class="form-label">Item Additional Charges</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                    <asp:TextBox class="form-control is-valid" id="lbl_item_additional_charges" runat="server"  ClientIDMode="Static"  ></asp:TextBox>
                    <div class="valid-feedback">
                      <asp:Label ID="lbl_item_additional_charges_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_item_additional_charges_SysRecordDate" runat="server" Text=""></asp:Label>)
                    </div></div>
                </div>
            

                <div class="dropdown col-md-6">
                    <label for="lbl_budget_code" class="form-label">Budge</label>
                    <asp:TextBox class="form-control is-valid" id="lbl_budget_code" runat="server"  ClientIDMode="Static"  ></asp:TextBox>
                    <div class="valid-feedback">
                      <asp:Label ID="lbl_budget_code_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_budget_code_SysRecordDate" runat="server" Text=""></asp:Label>)
                    </div>
                </div>
            </div>
            </div>
         

           
          



        


            <div class="col-md-5">
                <label for="lbl_remark" class="form-label">Remark</label>
                <asp:TextBox class="form-control is-valid" id="lbl_remark" Rows="5" TextMode="MultiLine" runat="server"  ClientIDMode="Static"></asp:TextBox>
                <div class="valid-feedback">
                  <asp:Label ID="lbl_remark_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_remark_SysRecordDate" runat="server" Text=""></asp:Label>)
                </div>
            </div>
<center>
            <div class="col-md-3">
                <label for="lbl_process" class="form-label">Process Stage</label>
            <asp:DropDownList   class="btn btn-secondary dropdown-toggle"  ID="lbl_process" runat="server"  style="width:320px;">
                <asp:ListItem class="dropdown-item" Value="Requester">Requester</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Confirm_Budge_Code">Confirm Budge Code</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Confirm_Assign">Confirm Assign</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Quotation">Quotation</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Specification">Specification</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="PR Raised">PR Raised</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="PO">PO</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Delivery">Delivery</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Payment">Payment</asp:ListItem>
                <asp:ListItem class="dropdown-item" Value="Complete">Complete</asp:ListItem>
            </asp:DropDownList>
        
            
            <asp:Label ID="lbl_process_admin" runat="server" Text=""></asp:Label>   (<asp:Label ID="lbl_process_SysRecordDate" runat="server" Text=""></asp:Label>)
        </div>
            </center>




        <div class="progress col-md-12">
            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:<%= Session("processCode") %>"><%= Session("process") %> <%= Session("processCode") %></div>
        </div>
  

        




            <!-- Add other form fields for additional data -->
            <button type="button" class="btn btn-secondary" onclick="goBack()">Back</button>
            <asp:Button type="submit" ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save Order"  OnClientClick="return myFunction();" CausesValidation="true" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
            <asp:HiddenField ID="HiddenField4" runat="server" />
            <asp:HiddenField ID="HiddenField5" runat="server" />
            <asp:HiddenField ID="HiddenField6" runat="server" />
            <asp:HiddenField ID="HiddenField7" runat="server" />

        </form>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

<script>
function goBack() {
    window.location.replace("https://qehcndsvr2/Purchase/mangement.aspx");
  }
  </script>

<script>
    function myFunction() {
      // Get the value of the lbl_item_additional_charges field
      var itemquality = document.getElementById("lbl_item_quality").value;
      var itemunitprice = document.getElementById("lbl_item_unit_price").value;
      var additionalCharges = document.getElementById("lbl_item_additional_charges").value;
      var budgetcode = document.getElementById("lbl_budget_code").value;
      var assign = document.getElementById("lbl_assign").value;
      var process = document.getElementById("lbl_process").value;
      var remark = document.getElementById("lbl_remark").value;

    
      // Store the value in the session storage
      document.getElementById("HiddenField1").value = itemquality
      document.getElementById("HiddenField2").value = itemunitprice
      document.getElementById("HiddenField3").value = additionalCharges
      document.getElementById("HiddenField4").value = budgetcode
      document.getElementById("HiddenField5").value = assign
      document.getElementById("HiddenField6").value = process
      document.getElementById("HiddenField7").value = remark

    
      // Return true to allow the form to submit
      return true;
    }
    </script>


</html>
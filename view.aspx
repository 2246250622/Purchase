<%@ Page Language="VB" AutoEventWireup="false" CodeFile="view.aspx.vb" Inherits="view" MaintainScrollPositionOnPostback="true" validateRequest="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Purchase System</title>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/popper.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="styles/bootstrap.min.css" />
    <link rel="stylesheet" href="styles/docs.css" />
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>

    <style>
        .red {
    background-color: red;
}

.green {
    background-color: green;
}
</style>
</head>
<body>

  

    </script>
    <form id="form12" runat="server">
        <nav class="navbar navbar-expand-lg "  style="background-color: #e3f2fd;">
            <div class="container-fluid">
              <a class="navbar-brand" href="./view.aspx">
                <img src="images/qeh_logo.png" alt="Bootstrap" width="40" height="40">
                Purchase Tracking System
              </a>
        
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
        
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="./view.aspx">Dashboard</a>
                  </li>
         
                  <li class="nav-item">
                    <a class="nav-link"  href="./financialreport_viewer.aspx">Financial Report</a>
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





           

      

                  

                  <!-- Create Order Modal -->
                  <div class="modal fade" id="createOrderModal" tabindex="-1" aria-labelledby="createOrderModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="createOrderModalLabel">Create Order</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="createOrderForm"  >
                               
                                <tr>
                                    
                                    <asp:Button ID="SubmitOrder" runat="server" Text="Submit"  class="btn btn-primary" OnClientClick="return handleSubmit();"  OnClick="SubmitOrder_Click" CausesValidation="true"/>&nbsp;&nbsp;<input type="reset" value="Reset" id="reset" class="btn btn-secondary" style="text-decoration:underline;cursor:pointer;">
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>

 

   
</asp:SqlDataSource><br><br><br><br>
<center>
<div style="width:1500px;">
<div class="input-group mb-3">



    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
        <label class="btn btn-outline-primary" for="btnradio1">All</label>
      
        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
        <label class="btn btn-outline-primary" for="btnradio2">Incomplete</label>
      
        <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
        <label class="btn btn-outline-primary" for="btnradio3">Complete</label>
      </div>&nbsp; &nbsp;&nbsp; &nbsp;





   
            <input type="text" id="txtSearch" class="form-control" placeholder="Search..." aria-label="Search..." aria-describedby="btnSearch">
            <button class="btn btn-outline-secondary"  id="btnSearch">Search</button>
      
        
    
</div>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HeaderStyle-HorizontalAlign="Center" OnSorting="GridView1_Sorting" AllowSorting="True" CssClass="table table-bordered border-primary table-hover" DataKeyNames="admin_id" >
                  <Columns>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="id" HeaderText="Order" SortExpression="id" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="admin_id" HeaderText="Admin ID" SortExpression="admin_id"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="requester_id" HeaderText="Requester Name" SortExpression="requester_id"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_financial_year" HeaderText="Financial Year" SortExpression="item_financial_year"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_name" HeaderText="Item Descriptions" SortExpression="item_name"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_quality" HeaderText="Quantity" SortExpression="item_quality"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_unit_price" HeaderText="Unit Price (HKD)" SortExpression="item_unit_price"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_additional_charges" HeaderText="Additional Charges (HKD)" SortExpression="item_additional_charges"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="budget_code" HeaderText="Funding Source" SortExpression="budget_code"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="assign" HeaderText="Assign" SortExpression="assign"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="process" HeaderText="Status" ItemStyle-CssClass="p-3 mb-2 text-danger" SortExpression="process"/>
                             </Columns>
                        <EmptyDataTemplate>
                            No Record Found
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [order]">
                        <DeleteParameters>
                            <asp:Parameter Name="orderId" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>


                    </div></center>
                
          </form>

          <script>
            document.getElementById('btnSearch').addEventListener('click', function() {
                var searchKeyword = document.getElementById('txtSearch').value.trim().toLowerCase();
                var gridView = document.getElementById('<%= GridView1.ClientID %>');
                var rows = gridView.getElementsByTagName('tr');
                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip header row
                    var row = rows[i];
                    var columns = row.getElementsByTagName('td');
                    var foundMatch = false;
                    for (var j = 0; j < columns.length; j++) {
                        var cellText = columns[j].innerText || columns[j].textContent;
                        if (cellText.toLowerCase().indexOf(searchKeyword) !== -1) {
                            foundMatch = true;
                            break;
                        }
                    }
                    row.style.display = foundMatch ? '' : 'none';
                }
            });
        </script>
        <script>
            // Get the reference to the radio buttons
const allBtn = document.getElementById("btnradio1");
const incompleteBtn = document.getElementById("btnradio2");
const completeBtn = document.getElementById("btnradio3");

// Add event listeners to the radio buttons
allBtn.addEventListener("change", filterData);
incompleteBtn.addEventListener("change", filterData);
completeBtn.addEventListener("change", filterData);

function filterData() {
  // Get the GridView table element
  const gridView = document.getElementById("GridView1");

  // Get all the rows in the GridView
  const rows = gridView.getElementsByTagName("tr");

  // Loop through each row starting from the second row (index 1)
  for (let i = 1; i < rows.length; i++) {
    const row = rows[i];
    const statusCell = row.cells[10]; // Index of the Status column (zero-based index)

    // Check the selected radio button and show/hide rows accordingly
    if (allBtn.checked) {
      // Show all rows
      row.style.display = "";
    } else if (incompleteBtn.checked && statusCell.innerText !== "Complete") {
      // Show rows with incomplete status
      row.style.display = "";
    } else if (completeBtn.checked && statusCell.innerText === "Complete") {
      // Show rows with complete status
      row.style.display = "";
    } else {
      // Hide rows that don't match the selected status
      row.style.display = "none";
    }
  }
}

// Initial filtering on page load (show all rows)
filterData();
        </script>
</body>
</html>

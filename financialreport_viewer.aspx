<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financialreport_viewer.aspx.vb" Inherits="financialreport_viewer" MaintainScrollPositionOnPostback="true" validateRequest="false" %>


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
    <form id="form1" runat="server">
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
                          <h5 class="modal-title" id="createOrderModalLabel">Financial Report</h5>
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
      <input type="radio" class="btn-check" name="btnradio" id="btnradio0" autocomplete="off" checked>
      <label class="btn btn-outline-primary" for="btnradio0">All</label>

      <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
      <label class="btn btn-outline-primary" for="btnradio1">2023-2024</label>
    
      <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio2">2024-2025</label>
    
      <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio3">2025-2026</label>
      
      <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio4">2026-2027</label>

      <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio5">2027-2028</label>

      <input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio6">2028-2029</label>

      <input type="radio" class="btn-check" name="btnradio" id="btnradio7" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio7">2029-2030</label>

      <input type="radio" class="btn-check" name="btnradio" id="btnradio8" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio8">2030-2031</label>
      
      <input type="radio" class="btn-check" name="btnradio" id="btnradio9" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio9">2031-2032</label>

      <input type="radio" class="btn-check" name="btnradio" id="btnradio10" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio10">2032-2033</label>
      </div>&nbsp; &nbsp;&nbsp; &nbsp;


      


   
            <input type="text" id="txtSearch" class="form-control" placeholder="Search..." aria-label="Search..." aria-describedby="btnSearch">
            <button class="btn btn-outline-secondary"  id="btnSearch">Search</button>
      
        
    
</div>
<br>
<div  class="alert alert-primary" role="alert" id="total">

</div>
<br>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HeaderStyle-HorizontalAlign="Center" OnSorting="GridView1_Sorting" AllowSorting="True" CssClass="table table-bordered border-primary table-hover" DataKeyNames="admin_id" >
                  <Columns>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="id" HeaderText="Order" SortExpression="id" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_financial_year" HeaderText="Financial Year" SortExpression="item_financial_year"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_name" HeaderText="Item" SortExpression="item_name"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_quality" HeaderText="Quantity" SortExpression="item_quality"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_unit_price" HeaderText="Unit Price" SortExpression="item_unit_price"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_additional_charges" HeaderText="Additional Charges" SortExpression="item_additional_charges"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="budget_code" HeaderText="Budge Code" SortExpression="budget_code"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="amount" HeaderText="Amount" SortExpression="amount"/>

                             </Columns>
                        <EmptyDataTemplate>
                            No Record Found
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [order]  where 'Complete' = process ORDER BY id DESC" >
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
const allBtn = document.getElementById("btnradio0");
const y2023 = document.getElementById("btnradio1");
const y2024 = document.getElementById("btnradio2");
const y2025 = document.getElementById("btnradio3");
const y2026 = document.getElementById("btnradio4");
const y2027 = document.getElementById("btnradio5");
const y2028 = document.getElementById("btnradio6");
const y2029 = document.getElementById("btnradio7");
const y2030 = document.getElementById("btnradio8");
const y2031 = document.getElementById("btnradio9");
const y2032 = document.getElementById("btnradio10");

// Add event listeners to the radio buttons
allBtn.addEventListener("change", filterData);
y2023.addEventListener("change", filterData);
y2024.addEventListener("change", filterData);
y2025.addEventListener("change", filterData);
y2026.addEventListener("change", filterData);
y2027.addEventListener("change", filterData);
y2028.addEventListener("change", filterData);
y2029.addEventListener("change", filterData);
y2030.addEventListener("change", filterData);
y2031.addEventListener("change", filterData);
y2032.addEventListener("change", filterData);
function filterData() {
  // Get the GridView table element
  const gridView = document.getElementById("GridView1");
  var total = 0;
  // Get all the rows in the GridView
  const rows = gridView.getElementsByTagName("tr");

  // Loop through each row starting from the second row (index 1)
  for (let i = 1; i < rows.length; i++) {
    const row = rows[i];
    const financialyearCell = row.cells[1]; // Index of the Status column (zero-based index)
    const amountCell = row.cells[7];
    

    // Check the selected radio button and show/hide rows accordingly
    if (allBtn.checked) {
      total += Number(amountCell.textContent);
      // Show all rows
      row.style.display = "";
    } else if (y2023.checked && financialyearCell.innerText === "23/24") {
      total += Number(amountCell.textContent);
      // Show rows with incomplete status
      row.style.display = "";
      
      
    } else if (y2024.checked && financialyearCell.innerText === "24/25") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2025.checked && financialyearCell.innerText === "25/26") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2026.checked && financialyearCell.innerText === "26/27") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2027.checked && financialyearCell.innerText === "27/28") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2028.checked && financialyearCell.innerText === "28/29") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2029.checked && financialyearCell.innerText === "29/30") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2030.checked && financialyearCell.innerText === "30/31") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2031.checked && financialyearCell.innerText === "31/32") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    }else if (y2032.checked && financialyearCell.innerText === "32/33") {
      total += Number(amountCell.textContent);
      // Show rows with complete status
      row.style.display = "";
    } else {
      // Hide rows that don't match the selected status
      row.style.display = "none";
    }
  }
  document.getElementById("total").innerText = `Total expenses for the year are: ${total}`;
}

// Initial filtering on page load (show all rows)
filterData();
        </script>



</body>
</html>

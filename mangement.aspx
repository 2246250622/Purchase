<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mangement.aspx.vb" Inherits="mangement" MaintainScrollPositionOnPostback="true" validateRequest="false" %>


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
    Admin

    </script>
    <form id="form1" runat="server">
        <p style="padding-left:40px;">Logged-in as:(<asp:Label ID="lbl_DomainID" runat="server" Text=""></asp:Label>)&nbsp;&nbsp;<asp:LinkButton 
            ID="lb_Logout" runat="server" ForeColor="Black" onclick="lb_Logout_Click" CssClass="menu"  CausesValidation="false" ><u>Logout</u></asp:LinkButton>





           
                <!-- small box -->
     
      
                <div class="container">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createOrderModal">Create Order</button>
                  </div>
                  

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
                                <div class="mb-3">
                                    <label for="RequesterIdTextBox" class="form-label">Requester Name</label>
                                    <asp:TextBox ID="RequesterIdTextBox" class="form-control" runat="server" Width="250px" CssClass="" required></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="ItemNameTextBox" class="form-label">Item Name</label>
                                    <asp:TextBox ID="ItemNameTextBox" TextMode="MultiLine" Rows="7" class="form-control" runat="server" Width="250px" CssClass="" required></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="ItemQualityTextBox" class="form-label">Item Quality</label>
                                    <asp:TextBox ID="ItemQualityTextBox" class="form-control" runat="server" Width="250px" CssClass="" ></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="ItemUnitPriceTextBox" class="form-label">Item Unit Price</label>
                                    <asp:TextBox ID="ItemUnitPriceTextBox" class="form-control" runat="server" Width="250px" CssClass="" ></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="ItemFinancialYearTextBox" class="form-label">Financial Year</label>
                                    <asp:TextBox ID="ItemFinancialYearTextBox" class="form-control" runat="server" Width="250px" CssClass="" required></asp:TextBox>
                                </div>
                                <tr>
                                    
                                    <asp:Button ID="SubmitOrder" runat="server" Text="Submit"  class="btn btn-primary" OnClientClick="return handleSubmit();"  OnClick="SubmitOrder_Click" CausesValidation="true"/>&nbsp;&nbsp;<input type="reset" value="Reset" id="reset" class="btn btn-secondary" style="text-decoration:underline;cursor:pointer;">
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>

 

   
</asp:SqlDataSource>

<div class="input-group mb-3">
    <input type="text" id="txtSearch" class="form-control" placeholder="Search..." />
    <div class="input-group-append">
        <button id="btnSearch" class="btn btn-primary">Search</button>
    </div>
</div>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HeaderStyle-HorizontalAlign="Center" OnSorting="GridView1_Sorting" AllowSorting="True" CssClass="table table-bordered border-primary table-hover" DataKeyNames="admin_id" >
                  <Columns>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="id" HeaderText="Order" SortExpression="id" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="admin_id" HeaderText="Admin ID" SortExpression="admin_id"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="requester_id" HeaderText="Requester Name" SortExpression="requester_id"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_financial_year" HeaderText="Financial Year" SortExpression="item_financial_year"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_name" HeaderText="Item" SortExpression="item_name"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_quality" HeaderText="Quality" SortExpression="item_quality"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_unit_price" HeaderText="Unit Price" SortExpression="item_unit_price"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="item_additional_charges" HeaderText="Additional Charges" SortExpression="item_additional_charges"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="budget_code" HeaderText="Budge Code" SortExpression="budget_code"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="assign" HeaderText="Assign" SortExpression="assign"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="process" HeaderText="Status" ItemStyle-CssClass="p-3 mb-2 text-danger" SortExpression="process"/>
                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" ItemStyle-CssClass="GridViewFont" ItemStyle-HorizontalAlign="Center" />
                            <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" ItemStyle-CssClass="GridViewFont" ItemStyle-HorizontalAlign="Center" />
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
</body>
</html>

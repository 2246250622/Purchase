Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text
Imports System.DirectoryServices
Imports System.Configuration
Imports System.Web.Security
Imports System.Net
Imports System.Net.Mail
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf
Imports System.IO


Partial Class mangement
    Inherits System.Web.UI.Page
    Dim ConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim conn As New SqlConnection(ConnectionString)
    Dim OtherConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim oconn As New SqlConnection(OtherConnectionString)
    Dim myCommand, myCommand1 As New SqlCommand
    Dim dr As SqlDataReader
    Dim sysAdminEmail As String = "jason.cheuk@ha.org.hk"

Protected Sub GridView1_Sorting(ByVal sender As Object, ByVal e As GridViewSortEventArgs)
    Dim dataTable As DataTable = DirectCast(GridView1.DataSource, DataTable)
    If dataTable IsNot Nothing Then
        dataTable.DefaultView.Sort = e.SortExpression + " " + GetSortDirection()
        GridView1.DataBind()
    End If
End Sub

Private Function GetSortDirection() As String
    Dim sortDirection As String = ViewState("SortDirection")
    If sortDirection Is Nothing Then
        sortDirection = "ASC"
    ElseIf sortDirection = "ASC" Then
        sortDirection = "DESC"
    Else
        sortDirection = "ASC"
    End If
    ViewState("SortDirection") = sortDirection
    Return sortDirection
End Function


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("role") Is Nothing Then
            Response.Write("<script type='text/javascript'>alert('Session expired, please login again!'); window.location = 'index.aspx?page=intro';")
            Response.Write("</" + "script>")
        Else
            lbl_DomainID.Text = Session("corpID")
        End If

        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub lb_Logout_Click(sender As Object, e As EventArgs) Handles lb_Logout.Click
        Session.Abandon()
        Response.Write("<script type='text/javascript'>alert('You have been logged out successfully!'); window.location = 'index.aspx';")
        Response.Write("</" + "script>")
    End Sub

    Protected Sub SubmitOrder_Click(sender As Object, e As EventArgs)
        Dim itemQuality As Integer
        Dim itemUnitPrice As Decimal
        If Integer.TryParse(ItemQualityTextBox.Text, itemQuality) AndAlso Decimal.TryParse(ItemUnitPriceTextBox.Text, itemUnitPrice) Then
        Dim amount As Decimal = itemQuality * itemUnitPrice
        Dim cmd As New SqlCommand("INSERT INTO [order] (requester_id, item_name, item_quality, item_unit_price, item_financial_year,requester_id_SysRecordDate,item_name_SysRecordDate,item_quality_SysRecordDate,item_unit_price_SysRecordDate,item_financial_year_SysRecordDate, requester_id_admin, item_financial_year_admin, item_name_admin, item_quality_admin, item_unit_price_admin, admin_id, process, process_admin, process_SysRecordDate, Amount, item_additional_charges, item_additional_charges_admin, item_additional_charges_SysRecordDate, assign, assign_admin, assign_SysRecordDate, budget_code, budget_code_admin, budget_code_SysRecordDate ) VALUES (@requester_id, @item_name, @item_quality, @item_unit_price, @item_financial_year,GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),@name, @name, @name, @name, @name, @name,@process, @name, GETDATE(),@Amount ,@item_additional_charges, @name, GETDATE(), @assign,  @name, GETDATE(), @budget_code,  @name, GETDATE())", conn)
        cmd.Parameters.AddWithValue("@requester_id", RequesterIdTextBox.Text)
        cmd.Parameters.AddWithValue("@item_name", ItemNameTextBox.Text)
        cmd.Parameters.AddWithValue("@item_quality", ItemQualityTextBox.Text)
        cmd.Parameters.AddWithValue("@item_unit_price", ItemUnitPriceTextBox.Text)
        cmd.Parameters.AddWithValue("@item_additional_charges", ItemAdditionalChargesTextBox.Text)
        cmd.Parameters.AddWithValue("@item_financial_year", ItemFinancialYearTextBox.SelectedValue)
        cmd.Parameters.AddWithValue("@budget_code", BudgetCodeTextBox.SelectedValue)'
        cmd.Parameters.AddWithValue("@assign", AssignTextBox.Text) '
        cmd.Parameters.AddWithValue("@process", "Requester")
        cmd.Parameters.AddWithValue("@name", Session("corpID"))
        cmd.Parameters.AddwithValue("@Amount", amount)

        Try
            conn.Open()
            cmd.Connection = conn
            cmd.ExecuteNonQuery()
            Response.Write("<script type='text/javascript'>alert('Your action has been completed!'); window.location = 'https://qehcndsvr2/Purchase/mangement.aspx';")
            Response.Write("</" + "script>")
        Catch ex As Exception
            Response.Write("<script type='text/javascript'>alert('Something Wrong'); window.location = 'https://qehcndsvr2/Purchase/mangement.aspx';")
            Response.Write("</" + "script>")
        Finally
            conn.Close()
        End Try

        Else
        ' Handle the case when conversion fails
        ' You can show an error message or take appropriate action
    End If
    End Sub

Protected Sub sendEmail(sender As Object, e As EventArgs) Handles SubmitOrder.Click

        


                Dim mail As New MailMessage()
                mail.From = New MailAddress("donotreply-PurchaseSystem@ha.org.hk", "QEH Purchase System")
                mail.To.Add("jason.cheuk@ha.org.hk")
                mail.To.Add("kathy.lok@ha.org.hk")
                mail.To.Add("wps508@ha.org.hk")
                mail.To.Add("nsc501@ha.org.hk")
                mail.IsBodyHtml = "true"
                mail.Subject = "Order Created - QEH Purchase System"
                Dim content As String
                content  = "<div style='font-size:19px;font-family:arial;'>"
                content += "Dear Madam/Sir, <br><br>"
                content += "A submission has been created in Purchase System! <br/><br>"
                content += "Requester Id:" + RequesterIdTextBox.Text.Trim +"<br/>"
                content += "Item Descriptions:" + ItemNameTextBox.Text.Trim +"<br/>"
                content += "Quality:" + ItemQualityTextBox.Text.Trim +"<br/>"
                content += "Unit Price:" + ItemUnitPriceTextBox.Text.Trim +"<br/>"
                content += "Additional Charges:" + ItemAdditionalChargesTextBox.Text.Trim +"<br/>"
                content += "Financial Year:" + ItemFinancialYearTextBox.Text.Trim +"<br/>"
                content += "Funding source:" + BudgetCodeTextBox.Text.Trim +"<br/>"
                content += "Assign:" + AssignTextBox.Text.Trim +"<br/>" +"<br/>"
                content += "<br><br>This email is automatically generated by the system. <b>Please do not reply.</b> <br><br>Should you have any technical problem, please call Jason at 3506 8319.<br/><br/>"
                content += "Regards,<br/>Nobody"
                content += "</div>"
                mail.Body = content
                Dim smtp As New SmtpClient("MAILCORPHTS.server.ha.org.hk")
                smtp.Send(mail)

                Response.Write("<script type='text/javascript'>alert('Thank you for your submition!\n\nYou can modify or delete your order(s)!'); window.location = 'mangement.aspx?page=intro';")
                Response.Write("</" + "script>")
End Sub

Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
    ' Get the selected row from the GridView
    Dim selectedRow As GridViewRow = GridView1.SelectedRow

    ' Get the values of the columns in the selected row
    Dim orderId As String = selectedRow.Cells(0).Text
    ' ... Continue retrieving other relevant data for the order

    ' Set the session variables to the retrieved values
    Session("OrderId") = orderId

    ' ... Store other relevant data in session variables

    ' Redirect to the create order page
    Response.Redirect("createorder.aspx")
End Sub





Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs) Handles GridView1.RowCommand
    If e.CommandName = "Delete" Then
        ' Get the index of the selected row
        Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

        ' Find the selected row in the GridView
        Dim selectedRow As GridViewRow = GridView1.Rows(rowIndex)

        ' Get the values of the columns in the selected row
        Dim orderId As String = selectedRow.Cells(0).Text
        ' ... Continue retrieving other relevant data for the order

        ' Call the DeleteOrder method to delete the row from the database
        DeleteOrder(orderId)

        ' Rebind the GridView to display the updated data
        GridView1.DataBind()

        ' Show a success message for deletion
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Deleted successfully.');", True)
    End If
End Sub

Private Sub DeleteOrder(ByVal orderId As Integer)

    
End Sub

    Public Function SanitizeString(str As String) As String
        str = str.Replace("font-size: medium;", "font-size: 12px;")
        str = str.Replace("font-size: xx-small;", "font-size: 12px;")
        str = str.Replace("font-size: x-small;", "font-size: 12px;")
        str = str.Replace("font-size: small;", "font-size: 12px;")
        str = str.Replace("font-size: large;", "font-size: 12px;")
        str = str.Replace("font-size: x-large;", "font-size: 12px;")
        str = str.Replace("font-size: xx-large;", "font-size: 12px;")
        str = str.Replace("font-size: smaller;", "font-size: 12px;")
        str = str.Replace("font-size: larger;", "font-size: 12px;")
        Return str
    End Function








    


    
End Class
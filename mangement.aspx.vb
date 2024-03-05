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
        Dim cmd As New SqlCommand("INSERT INTO [order] (requester_id, item_name, item_quality, item_unit_price, item_financial_year,requester_id_SysRecordDate,item_name_SysRecordDate,item_quality_SysRecordDate,item_unit_price_SysRecordDate,item_financial_year_SysRecordDate, requester_id_admin, item_financial_year_admin, item_name_admin, item_quality_admin, item_unit_price_admin, admin_id, process, process_admin, process_SysRecordDate) VALUES (@requester_id, @item_name, @item_quality, @item_unit_price, @item_financial_year,GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),@name, @name, @name, @name, @name, @name,@process, @name, GETDATE() )", conn)
        cmd.Parameters.AddWithValue("@requester_id", RequesterIdTextBox.Text)
        cmd.Parameters.AddWithValue("@item_name", ItemNameTextBox.Text)
        cmd.Parameters.AddWithValue("@item_quality", ItemQualityTextBox.Text)
        cmd.Parameters.AddWithValue("@item_unit_price", ItemUnitPriceTextBox.Text)
        cmd.Parameters.AddWithValue("@item_financial_year", ItemFinancialYearTextBox.Text)
        cmd.Parameters.AddWithValue("@process", "Requester")
        cmd.Parameters.AddWithValue("@name", Session("corpID"))

        Try
            conn.Open()
            cmd.Connection = conn
            cmd.ExecuteNonQuery()
            Response.Write("<script type='text/javascript'>alert('good'); window.location = 'https://qehcndsvr2/Purchase/mangement.aspx';")
            Response.Write("</" + "script>")
        Catch ex As Exception
            Response.Write("<script type='text/javascript'>alert('error'); window.location = 'https://qehcndsvr2/Purchase/mangement.aspx';")
            Response.Write("</" + "script>")
        Finally
            conn.Close()
        End Try
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
    ' Assuming you are using SQL Server, here's an example of deleting a row from the database
    Using connection As New SqlConnection(OtherConnectionString)
        connection.Open()

        Dim sql As String = "DELETE FROM [order] WHERE id = @orderId"
        Using command As New SqlCommand(sql, connection)
            command.Parameters.AddWithValue("@orderId", orderId)
            command.ExecuteNonQuery()
        End Using
    End Using
End Sub


    
End Class
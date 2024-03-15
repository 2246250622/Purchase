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

Partial Class financialreport_viewer
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
    Response.Redirect("financialreport_admin.aspx")
End Sub
End Class
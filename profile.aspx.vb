Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text
Imports System.DirectoryServices
Imports System.Configuration
Imports System.Web.Security
Imports System.Net
Imports System.Net.Mail

Partial Class profile
    Inherits System.Web.UI.Page
    Dim ConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim conn As New SqlConnection(ConnectionString)
    Dim OtherConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim oconn As New SqlConnection(OtherConnectionString)
    Dim myCommand, myCommand1 As New SqlCommand
    Dim dr As SqlDataReader
     Dim sysAdminEmail As String = "jason.cheuk@ha.org.hk"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("corpID") Is Nothing Then
            Response.Write("<script type='text/javascript'>alert('Session expired, please login again!'); window.location = 'index.aspx';")
            Response.Write("</" + "script>")
        Else
        If Not IsPostBack Then

            lbl_DomainID.Text = Session("corpID")
        End If
             conn.Open()
                myCommand.Parameters.Clear()
                myCommand.CommandText = "Select * From normal_user Where corpid = @corp_id"
                myCommand.Parameters.AddWithValue("@corp_id", Session("corpID"))
                myCommand.Connection = conn
                dr = myCommand.ExecuteReader()
                While (dr.Read())
                    Session("role") = dr.Item("role")
                   
                    
                    
                End While
                conn.Close()
                
            Try
            lbl_corpID.Text =  Session("corpID")
            Catch ex As Exception
            lbl_corpID.Text = ""
            End Try

                            
            Try
            lbl_role.Text = Session("role")
            Catch ex As Exception
            lbl_role.Text = ""
            End Try

      
            


 End If
        
End Sub



    Protected Sub lb_Logout_Click(sender As Object, e As EventArgs) Handles lb_Logout.Click
        Session.Abandon()
        Response.Write("<script type='text/javascript'>alert('You have been logged out successfully!'); window.location = 'index.aspx';")
        Response.Write("</" + "script>")
    End Sub
  





End Class
Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text
Imports System.DirectoryServices
Imports System.Configuration
Imports System.Web.Security
Imports System.Net
Imports System.Net.Mail

Partial Class index
    Inherits System.Web.UI.Page
    Dim ConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim conn As New SqlConnection(ConnectionString)
    Dim OtherConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim oconn As New SqlConnection(OtherConnectionString)
    Dim myCommand, myCommand1 As New SqlCommand
    Dim dr As SqlDataReader

   Public Function IsAuthenticated(ByVal domain As String, ByVal username As String, ByVal pwd As String) As Boolean
        Dim _path As String
        Dim _filterAttribute As String
        Dim servername As String = ConfigurationManager.AppSettings("serverpath").ToString
        'Whether Authenticated User or Not 
        Dim domainAndUsername As String = domain + "\" + username

        Dim entry As New DirectoryEntry("LDAP://" + servername, domainAndUsername, pwd)
        Try
            Dim obj As Object = entry.NativeObject
            Dim search As New DirectorySearcher(entry)
            search.Filter = "(SAMAccountName=" + username + ")"
            search.PropertiesToLoad.Add("cn")
            search.PropertiesToLoad.Add("givenName")
            search.PropertiesToLoad.Add("sn")
            Dim result As SearchResult = search.FindOne
            If result Is Nothing Then
                Return False
            End If
            _path = result.Path
            _filterAttribute = CType(result.Properties("cn")(0), String)
        Catch ex As Exception
            Return False
        End Try
        Return True
    End Function

    Protected Sub btn_login_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_login.Click

        Dim username As String = txt_username.Text.Trim
        Dim password As String = txt_password.Text.Trim
        Dim domainName As String = ConfigurationManager.AppSettings("DomainName").ToString()
        Dim dr As SqlDataReader
        Dim dr1 As SqlDataReader

        Dim dummyBoolean As Boolean = False


        if IsAuthenticated(domainName, username, password) Then
        Try
        conn.Open()
        oconn.Open()
                myCommand.Parameters.Clear()
                myCommand.CommandText = "Select * From Staff Where corpID = @username"
                myCommand.Parameters.AddWithValue("@username", username)
                myCommand.Connection = conn
                dr = myCommand.ExecuteReader()
                While (dr.Read())
                    dummyBoolean = True
                    Session("My_Employee_no") = dr.Item("Employee_no")
                    Session("Employee_no") = dr.Item("Employee_no")
                    Session("Name") = dr.Item("Name")
                    Session("corpID") = dr.Item("corpID")
                    Session("My_hosp") = dr.Item("hosp")
                    Session("Unit") = dr.Item("Unit")
                    Session("ward") = dr.Item("ward")
                    Session("rank") = dr.Item("rank")
                    Session("papp") = dr.Item("papp")
                End While
                conn.Close()

                myCommand1.Parameters.Clear()
                myCommand1.CommandText = "Select * From normal_user Where corpid = @username"
                myCommand1.Parameters.AddWithValue("@username", username)
                myCommand1.Connection = oconn
                dr1 = myCommand1.ExecuteReader()
                While (dr1.Read())
                    Session("corpID") = dr1.Item("corpid")
                    Session("role") = dr1.Item("role")
                End While
                oconn.Close()

                If Session("role") = "admin" Then
                        Response.Write("<script type='text/javascript'>alert('Session expired, please login again!'); window.location = 'index.aspx?page=intro';")
                        Response.Redirect("mangement.aspx")

                    Else
                    Session("corpID") = username
                    Session("role") = "viewer"
                    Response.Redirect("view.aspx")
                End If
                


                
                
        Catch ex As Exception
            lbl_errorMsg.Text = ex.ToString
        End Try
        Else
            lbl_errorMsg.ForeColor = Drawing.Color.Red
            lbl_errorMsg.Text = "The username or password is incorrect."
            txt_username.Text = ""
            txt_password.Text = ""
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Request.QueryString("Maintenance") = Nothing Then
        '    Response.Redirect("Maintenance.html")
        'End If
    End Sub
End Class



Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text
Imports System.DirectoryServices
Imports System.Configuration
Imports System.Web.Security
Imports System.Net
Imports System.Net.Mail

Partial Class createorder
    Inherits System.Web.UI.Page
    Dim ConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim conn As New SqlConnection(ConnectionString)
    Dim OtherConnectionString As String = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
    Dim oconn As New SqlConnection(OtherConnectionString)
    Dim myCommand, myCommand1 As New SqlCommand
    Dim dr As SqlDataReader
     Dim sysAdminEmail As String = "jason.cheuk@ha.org.hk"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("OrderId") Is Nothing Then
            Response.Write("<script type='text/javascript'>alert('Session expired, please login again!'); window.location = 'index.aspx';")
            Response.Write("</" + "script>")
        Else
        If Not IsPostBack Then
            
            
        End If
             conn.Open()
            
                myCommand.CommandText = "Select * From [order] Where id = @order_id"
                myCommand.Parameters.AddWithValue("@order_id", Session("OrderId"))
                myCommand.Connection = conn
                dr = myCommand.ExecuteReader()
                While (dr.Read())
                    Session("id") = dr.Item("id")
                    Session("requester_id") = dr.Item("requester_id")
                    Session("requester_id_admin") = dr.Item("requester_id_admin")
                    Session("requester_id_SysRecordDate") = dr.Item("requester_id_SysRecordDate")

                    Session("admin_id") = dr.Item("admin_id")
                    Session("admin_id_admin") = dr.Item("admin_id")
                    Session("admin_id_SysRecordDate") = dr.Item("requester_id_SysRecordDate")

                    Session("requester_id") = dr.Item("requester_id")
                    Session("requester_id_admin") = dr.Item("requester_id_admin")
                    Session("requester_id_SysRecordDate") = dr.Item("requester_id_SysRecordDate")

                    Session("item_financial_year") = dr.Item("item_financial_year")
                    Session("item_financial_year_admin") = dr.Item("item_financial_year_admin")
                    Session("item_financial_year_SysRecordDate") = dr.Item("item_financial_year_SysRecordDate")

                    Session("item_name") = dr.Item("item_name")
                    Session("item_name_admin") = dr.Item("item_name_admin")
                    Session("item_name_SysRecordDate") = dr.Item("item_name_SysRecordDate")

                    Session("item_quality") = dr.Item("item_quality")
                    Session("item_quality_admin") = dr.Item("item_quality_admin")
                    Session("item_quality_SysRecordDate") = dr.Item("item_quality_SysRecordDate")

                    Session("item_unit_price") = dr.Item("item_unit_price")
                    Session("item_unit_price_admin") = dr.Item("item_unit_price_admin")
                    Session("item_unit_price_SysRecordDate") = dr.Item("item_unit_price_SysRecordDate")

                    Session("item_additional_charges") = dr.Item("item_additional_charges")
                    Session("item_additional_charges_admin") = dr.Item("item_additional_charges_admin")
                    Session("item_additional_charges_SysRecordDate") = dr.Item("item_additional_charges_SysRecordDate")

                    Session("budget_code") = dr.Item("budget_code")
                    Session("budget_code_admin") = dr.Item("budget_code_admin")
                    Session("budget_code_SysRecordDate") = dr.Item("budget_code_SysRecordDate")

                    Session("assign") = dr.Item("assign")
                    Session("assign_admin") = dr.Item("assign_admin")
                    Session("assign_SysRecordDate") = dr.Item("assign_SysRecordDate")

                    Session("quotation") = dr.Item("quotation")
                    Session("specification") = dr.Item("specification")
                    Session("pr_raised") = dr.Item("pr_raised")
                    Session("po") = dr.Item("po")
                    Session("delivery") = dr.Item("delivery")
                    Session("payment") = dr.Item("payment")
                    Session("complete") = dr.Item("complete")

                    Session("process") = dr.Item("process")
                    Session("process_admin") = dr.Item("process_admin")
                    Session("process_SysRecordDate") = dr.Item("process_SysRecordDate")

                    Session("remark") = dr.Item("remark")
                    Session("remark_admin") = dr.Item("remark_admin")
                    Session("remark_SysRecordDate") = dr.Item("remark_SysRecordDate")
                    
                    
                End While
                conn.Close()
                
            Try
            lbl_id_admin.Text = Session("requester_id_admin")
            lbl_id_SysRecordDate.Text = Session("requester_id_SysRecordDate")
            Catch ex As Exception
            lbl_id_admin.Text = ""
            lbl_id_SysRecordDate.Text = ""
            End Try
            



            Try
            lbl_admin_id.Text = Session("admin_id")
            lbl_admin_id_admin.Text = Session("admin_id_admin")
            lbl_admin_id_SysRecordDate.Text = Session("admin_id_SysRecordDate")
            Catch ex As Exception
            lbl_admin_id.Text = ""
            lbl_admin_id_admin.Text = ""
            lbl_admin_id_SysRecordDate.Text = ""
            End Try

            Try
            lbl_requester_id.Text = Session("requester_id")
            lbl_requester_id_admin.Text = Session("requester_id_admin")
            lbl_requester_id_SysRecordDate.Text = Session("requester_id_SysRecordDate")
            Catch ex As Exception
            lbl_requester_id.Text = ""
            lbl_requester_id_admin.Text = ""
            lbl_requester_id_SysRecordDate.Text = ""
            End Try

            Try
            lbl_item_financial_year.Text = Session("item_financial_year")
            lbl_item_financial_year_admin.Text = Session("item_financial_year_admin")
            lbl_item_financial_year_SysRecordDate.Text = Session("item_financial_year_SysRecordDate")
            Catch ex As Exception
            lbl_item_financial_year.Text = ""
            lbl_item_financial_year_admin.Text = ""
            lbl_item_financial_year_SysRecordDate.Text = ""
            End Try

            Try
            lbl_item_name.Text = Session("item_name")
            lbl_item_name_admin.Text = Session("item_name_admin")
            lbl_item_name_SysRecordDate.Text = Session("item_name_SysRecordDate")
            Catch ex As Exception
            lbl_item_name.Text = ""
            lbl_item_name_admin.Text = ""
            lbl_item_name_SysRecordDate.Text = ""
            End Try

            Try
            lbl_item_quality.Text = Session("item_quality")
            lbl_item_quality_admin.Text = Session("item_quality_admin")
            lbl_item_quality_SysRecordDate.Text = Session("item_quality_SysRecordDate")
            Catch ex As Exception
            lbl_item_quality.Text = ""
            lbl_item_quality_admin.Text = ""
            lbl_item_quality_SysRecordDate.Text = ""
            End Try

            Try
            lbl_item_unit_price.Text = Session("item_unit_price")
            lbl_item_unit_price_admin.Text = Session("item_unit_price_admin")
            lbl_item_unit_price_SysRecordDate.Text = Session("item_unit_price_SysRecordDate")
            Catch ex As Exception
            lbl_item_unit_price.Text = ""
            lbl_item_unit_price_admin.Text = ""
            lbl_item_unit_price_SysRecordDate.Text = ""
            End Try

            Try
            lbl_item_additional_charges.text = Session("item_additional_charges")
            lbl_item_additional_charges_admin.Text = Session("item_additional_charges_admin")
            lbl_item_additional_charges_SysRecordDate.Text = Session("item_additional_charges_SysRecordDate")
            Catch ex As Exception
            lbl_item_additional_charges.text = ""
            lbl_item_additional_charges_admin.Text = ""
            lbl_item_additional_charges_SysRecordDate.Text = ""
            End Try

            Try
            lbl_budget_code.text = Session("budget_code")
            lbl_budget_code_admin.Text = Session("budget_code_admin")
            lbl_budget_code_SysRecordDate.Text = Session("budget_code_SysRecordDate")
            Catch ex As Exception
            lbl_budget_code.text = ""
            lbl_budget_code_admin.Text = ""
            lbl_budget_code_SysRecordDate.Text = ""
            End Try

            Try
            lbl_assign.text = Session("assign")
            lbl_assign_admin.Text = Session("assign_admin")
            lbl_assign_SysRecordDate.Text = Session("assign_SysRecordDate")
            Catch ex As Exception
            lbl_assign.text = ""
            lbl_assign_admin.Text = ""
            lbl_assign_SysRecordDate.Text = ""
            End Try

            Try
            lbl_process.text = Session("process")
            lbl_process_admin.Text = Session("process_admin")
            lbl_process_SysRecordDate.Text = Session("process_SysRecordDate")
            Catch ex As Exception
            lbl_process.text = ""
            lbl_process_admin.Text = ""
            lbl_process_SysRecordDate.Text = ""
            End Try

            Try
            lbl_remark.text = Session("remark")
            lbl_remark_admin.Text = Session("remark_admin")
            lbl_remark_SysRecordDate.Text = Session("remark_SysRecordDate")
            Catch ex As Exception
            lbl_remark.text = ""
            lbl_remark_admin.Text = ""
            lbl_remark_SysRecordDate.Text = ""
            End Try


Select Case Session("process")

    Case "Please Select..."
        Session("processCode") = "0%"
    Case "Requester"
        Session("processCode") = "10%"
    Case "Confirm Budge Code"
        Session("processCode") = "20%"
    Case "Confirm Assign"
        Session("processCode") = "30%"
    Case "Quotation"
        Session("processCode") = "40%"
    Case "Specification"
        Session("processCode") = "50%"
    Case "PR Raised"
        Session("processCode") = "60%"
    Case "PO"
        Session("processCode") = "70%"
    Case "Delivery"
        Session("processCode") = "80%"
    Case "Payment"
        Session("processCode") = "90%"
    Case "Complete"
        Session("processCode") = "100%"
    Case Else
        Session("processCode") = "0%"
End Select

     
            End If
        End Sub
        

Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
    Dim orderId As String = HttpContext.Current.Session("id")
    Dim adminId As String = lbl_admin_id.Text
    Dim requesterId As String = lbl_requester_id.Text
    Dim itemFinancialYear As String = lbl_item_financial_year.Text
    Dim itemName As String = lbl_item_name.Text
    Dim itemquality As String = HiddenField1.value
    Dim itemunitprice As String = HiddenField2.value
    Dim additionalCharges As String = HiddenField3.value
    Dim budgetcode As String = HiddenField4.value
    Dim assign As String = HiddenField5.value
    Dim process As String = HiddenField6.value
    Dim remark As String = HiddenField7.value



    
    oconn.Open()
    myCommand1.Parameters.Clear()
    myCommand1.CommandText = "Update [order] set admin_id = @admin_id, requester_id = @requester_id, item_financial_year = @item_financial_year, item_name = @item_name ,item_quality = @item_quality, item_quality_admin = @item_quality_admin, item_quality_SysRecordDate = @item_quality_SysRecordDate,item_unit_price = @item_unit_price, item_unit_price_admin = @item_unit_price_admin, item_unit_price_SysRecordDate = @item_unit_price_SysRecordDate,item_additional_charges = @item_additional_charges ,item_additional_charges_admin = @item_additional_charges_admin, item_additional_charges_SysRecordDate = @item_additional_charges_SysRecordDate,assign = @assign, assign_admin = @assign_admin, assign_SysRecordDate = @assign_SysRecordDate, budget_code = @budget_code,budget_code_admin = @budget_code_admin, budget_code_SysRecordDate = @budget_code_SysRecordDate, process = @process, process_admin = @process_admin, process_SysRecordDate = @process_SysRecordDate ,remark = @remark, remark_admin = @remark_admin, remark_SysRecordDate = @remark_SysRecordDate Where id = @id"
    myCommand1.Parameters.AddWithValue("@id", orderId)
    myCommand1.Parameters.AddWithValue("@admin_id", adminId)
    myCommand1.Parameters.AddWithValue("@requester_id", requesterId)
    myCommand1.Parameters.AddWithValue("@item_financial_year", itemFinancialYear)
    myCommand1.Parameters.AddWithValue("@item_name", itemName)
    myCommand1.Parameters.AddWithValue("@item_quality", itemquality)
    myCommand1.Parameters.AddWithValue("@item_unit_price", itemunitprice)
    myCommand1.Parameters.AddWithValue("@item_additional_charges", additionalCharges)
    myCommand1.Parameters.AddWithValue("@budget_code", budgetcode)
    myCommand1.Parameters.AddWithValue("@assign", assign)
    myCommand1.Parameters.AddWithValue("@process", process)
    myCommand1.Parameters.AddWithValue("@remark", remark)

If HiddenField1.Value <> lbl_item_quality.Text Then
    myCommand1.Parameters.AddWithValue("@item_quality_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@item_quality_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@item_quality_admin", Session("item_quality_admin"))
    myCommand1.Parameters.AddWithValue("@item_quality_SysRecordDate", Session("item_quality_SysRecordDate"))
End If

If HiddenField2.Value <> lbl_item_unit_price.Text Then
    myCommand1.Parameters.AddWithValue("@item_unit_price_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@item_unit_price_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@item_unit_price_admin", Session("item_unit_price_admin"))
    myCommand1.Parameters.AddWithValue("@item_unit_price_SysRecordDate", Session("item_unit_price_SysRecordDate"))
End If

If HiddenField3.Value <> lbl_item_additional_charges.Text Then
    myCommand1.Parameters.AddWithValue("@item_additional_charges_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@item_additional_charges_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@item_additional_charges_admin", Session("item_additional_charges_admin"))
    myCommand1.Parameters.AddWithValue("@item_additional_charges_SysRecordDate", Session("item_additional_charges_SysRecordDate"))
End If

If HiddenField4.Value <> lbl_budget_code.Text Then
    myCommand1.Parameters.AddWithValue("@budget_code_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@budget_code_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@budget_code_admin", Session("budget_code_admin"))
    myCommand1.Parameters.AddWithValue("@budget_code_SysRecordDate", Session("budget_code_SysRecordDate"))
End If

If HiddenField5.Value <> lbl_assign.Text Then
    myCommand1.Parameters.AddWithValue("@assign_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@assign_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@assign_admin", Session("assign_admin"))
    myCommand1.Parameters.AddWithValue("@assign_SysRecordDate", Session("assign_SysRecordDate"))
End If

If lbl_process.SelectedValue <> lbl_process.Text Then
    myCommand1.Parameters.AddWithValue("@process_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@process_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@process_admin", Session("process_admin"))
    myCommand1.Parameters.AddWithValue("@process_SysRecordDate", Session("process_SysRecordDate"))
End If

If HiddenField7.Value <> lbl_remark.Text Then
    myCommand1.Parameters.AddWithValue("@remark_admin", Session("corpID"))
    myCommand1.Parameters.AddWithValue("@remark_SysRecordDate", DateTime.Now)
Else
    myCommand1.Parameters.AddWithValue("@remark_admin", Session("remark_admin"))
    myCommand1.Parameters.AddWithValue("@remark_SysRecordDate", Session("remark_SysRecordDate"))
End If






    myCommand1.Connection = oconn
    myCommand1.ExecuteNonQuery()
    oconn.Close()
    
    Response.Write("<script type='text/javascript'>alert('Order updated successfully!'); window.location = 'createorder.aspx';")
    Response.Write("</" + "script>")
End Sub




  





End Class
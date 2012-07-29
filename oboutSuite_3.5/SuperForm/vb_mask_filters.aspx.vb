﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
Imports AjaxControlToolkit
Partial Class SuperForm_vb_mask_filters
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        Dim keyNames1() As String = {"ProductID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit
       
        AddHandler SuperForm1.ItemInserted, AddressOf SuperForm1_ItemInserted
        AddHandler SuperForm1.ItemCommand, AddressOf SuperForm1_ItemCommand

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "ProductID"
        field1.HeaderText = "ProductID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ProductName"
        field2.HeaderText = "Product Name"
        field2.Required = True

        Dim FilteredTextBoxExtender1 As FilteredTextBoxExtender = New FilteredTextBoxExtender()
        FilteredTextBoxExtender1.ID = "FilteredTextBoxExtender1"
        FilteredTextBoxExtender1.FilterType = FilterTypes.LowercaseLetters Or FilterTypes.UppercaseLetters Or FilterTypes.Custom
        FilteredTextBoxExtender1.ValidChars = " "
        field2.Filters.Add(FilteredTextBoxExtender1)

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "UnitsInStock"
        field3.HeaderText = "Units In Stock"

        Dim FilteredTextBoxExtender2 As FilteredTextBoxExtender = New FilteredTextBoxExtender()
        FilteredTextBoxExtender2.ID = "FilteredTextBoxExtender2"
        FilteredTextBoxExtender2.FilterType = FilterTypes.Numbers
        FilteredTextBoxExtender2.ValidChars = " "
        field3.Filters.Add(FilteredTextBoxExtender2)

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "UnitsOnOrder"
        field4.HeaderText = "Units On Order"

        Dim FilteredTextBoxExtender3 As FilteredTextBoxExtender = New FilteredTextBoxExtender()
        FilteredTextBoxExtender3.ID = "FilteredTextBoxExtender3"
        FilteredTextBoxExtender3.FilterType = FilterTypes.Numbers
        field4.Filters.Add(FilteredTextBoxExtender3)


        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)

        SuperForm1Container.Controls.Add(SuperForm1)
    End Sub
    Sub SuperForm1_ItemInserted(ByVal sender As Object, ByVal e As EventArgs)

        SuperForm1.DefaultMode = DetailsViewMode.ReadOnly
    End Sub

    Sub SuperForm1_ItemCommand(ByVal sender As Object, ByVal e As EventArgs)

        SuperForm1.DefaultMode = DetailsViewMode.ReadOnly
    End Sub

End Class
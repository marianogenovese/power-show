﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_validation_callout.aspx.cs" Inherits="SuperForm_aspnet_validation_summary" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Validator Callout</b></span>
    
    <br /><br />

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />

    <obout:SuperForm ID="SuperForm1" 
        DataSourceID="SqlDataSource1"
        AutoGenerateRows="false"
        AutoGenerateInsertButton ="true"
        AutoGenerateEditButton="true"
        AutoGenerateDeleteButton="true"
        DataKeyNames="EmployeeID"
        RunAt="server"
        AllowPaging="true"
        ValidationGroup="Group1"
        DefaultMode="Insert"
        OnItemCommand="SuperForm1_ItemCommand">
        <Fields>
            <obout:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="true" InsertVisible="false" />
            <obout:BoundField DataField="FirstName" HeaderText="First Name">
                <Validators>
                    <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" Display="None"
                        ErrorMessage="First Name is mandatory" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="FirstNameValidatorCallout"
                        TargetControlID="FirstNameValidator" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                </Validators>
            </obout:BoundField>
            <obout:BoundField DataField="LastName" HeaderText="Last Name">
                <Validators>
                    <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" Display="None"
                        ErrorMessage="Last Name is mandatory" Text="*" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="LastNameValidatorCallout"
                        TargetControlID="LastNameValidator" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                </Validators>
            </obout:BoundField>
            <obout:BoundField DataField="TitleOfCourtesy" HeaderText="Courtesy Title">
                <Validators>
                    <asp:RequiredFieldValidator ID="TitleOfCourtesyValidator1" runat="server" Display="None"
                        ErrorMessage="Courtesy Title is mandatory" Text="*" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="TitleOfCourtesyValidatorCallout1"
                        TargetControlID="TitleOfCourtesyValidator1" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                    <asp:CustomValidator ID="TitleOfCourtesyValidator2" runat="server" OnServerValidate="ValidateTitle" Display="Dynamic"
                        ErrorMessage="Courtesy Title needs to be 'Mr.', 'Ms.', 'Mrs.' or 'Dr.'" Text="Courtesy Title needs to be 'Mr.', 'Ms.', 'Mrs.' or 'Dr.'" />
                </Validators>
            </obout:BoundField>
            <obout:DateField DataField="BirthDate" HeaderText="Birth Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true">
                <Validators>
                    <asp:RequiredFieldValidator ID="BirthDateValidator1" runat="server" Display="None"
                        ErrorMessage="Birth Date is mandatory" Text="*" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="BirthDateValidatorCallout1"
                        TargetControlID="BirthDateValidator1" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                    <asp:RangeValidator ID="BirthDateValidator2" runat="server" Display="None" MinimumValue="1900/1/1" MaximumValue = "2039/12/31" Type="Date" 
                        ErrorMessage="Birth Date needs to be in this format: mm/dd/yyyy" Text="*" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="BirthDateValidatorCallout2"
                        TargetControlID="BirthDateValidator2" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                </Validators>
            </obout:DateField>
            <obout:BoundField DataField="HomePhone" HeaderText="Home Phone">
                <Validators>
                    <asp:RequiredFieldValidator ID="HomePhoneValidator1" runat="server" Display="None"
                        ErrorMessage="Home Phone is mandatory" Text="*" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="HomePhoneValidatorCallout1"
                        TargetControlID="HomePhoneValidator1" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                    <asp:RegularExpressionValidator ID="HomePhoneValidator2" runat="server" Display="None" ValidationExpression="^(\(?\s*\d{3}\s*[\)\-\.]?\s*)?[1-9]\d{2}\s*[\-\.]\s*\d{4}$" 
                        ErrorMessage="Home Phone must be in this format (###) ###-####" Text="*" />
                    <ajaxToolkit:ValidatorCalloutExtender  runat="Server" ID="HomePhoneValidatorCallout2"
                        TargetControlID="HomePhoneValidator2" Width="250px" HighlightCssClass="highlight"
                        WarningIconImageUrl="resources/icons/warning.gif" CloseImageUrl="resources/icons/close.gif" />
                </Validators>
            </obout:BoundField>            
        </Fields>
    </obout:SuperForm>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT EmployeeID, FirstName, LastName, TitleOfCourtesy, BirthDate, HomePhone FROM [Employees] ORDER BY EmployeeID DESC"
        UpdateCommand="UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, TitleOfCourtesy=@TitleOfCourtesy, BirthDate=@BirthDate, 
                        HomePhone=@HomePhone WHERE EmployeeID=@EmployeeID"
        InsertCommand="INSERT INTO Employees (FirstName, LastName, TitleOfCourtesy, BirthDate, HomePhone) 
                        VALUES (@FirstName, @LastName, @TitleOfCourtesy, @BirthDate, @HomePhone)"
        DeleteCommand="DELETE FROM Employees WHERE EmployeeID=@EmployeeID"
        />    
    
    <br /><br />
    
    <span class="tdText">
        The Super Form allows developers to validate the data typed by the end users into the fields using various approaches.<br />
        You can add any number of validators to a field, by means of the <b>Validators</b> collection.<br /><br />

        To make the form more user friendly, you can attach ASP.NET AJAX ControlToolkit <b>ValidatorCalloutExtender</b> controls to the validators,<br />
        to make the error messages be displayed as pop-up boxes.<br />
        The ValidatorCalloutExtender controls are attached to fields using the same approach as when attaching validators - by means of the <b>Validators</b> collection.
    </span>
</asp:Content>

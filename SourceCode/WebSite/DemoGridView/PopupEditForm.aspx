<%-- BeginRegion Tags and page properties--%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="PopupEditForm.aspx.cs" Inherits="GridEditing_PopupEditForm" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <%-- BeginRegion CheckBox --%>
    <asp:CheckBox ID="cbShowAsModal" runat="server" Checked="False" OnCheckedChanged="cbShowAsModal_CheckedChanged" Text="Show Popup Edit form in modal mode" AutoPostBack="True" Width="100%"/>
    <asp:CheckBox ID="cbMemoLocation" runat="server" Checked="False" OnCheckedChanged="cbMemoLocation_CheckedChanged" Text="Show memo at bottom" AutoPostBack="True" Width="100%"/>
    <br /><br />
    <%-- EndRegion --%>
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True" />
                <NewButton Visible="True" />
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataMemoColumn FieldName="Notes" Visible="False">
                <EditFormSettings RowSpan="4" Visible="True" VisibleIndex="2" />
            </dxwgv:GridViewDataMemoColumn>
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                <EditFormSettings VisibleIndex="3" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                <EditFormSettings VisibleIndex="5" />
            </dxwgv:GridViewDataColumn>
        </Columns>
        <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="600px" />
        <SettingsPager Mode="ShowAllRecords"/>
        <Settings ShowGroupPanel="True" ShowTitlePanel="true" />
        <SettingsText Title="Popup Edit Form Editing" />
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>    
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        OnDeleting="AccessDataSource1_Modifying" OnInserting="AccessDataSource1_Modifying" OnUpdating="AccessDataSource1_Modifying"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]" 
        DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" 
        InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Notes]) VALUES (?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [Title] = ?, [BirthDate] = ?, [HireDate] = ?, [Notes] = ? WHERE [EmployeeID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

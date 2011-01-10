<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="FillComboOnFly.aspx.cs" Inherits="GridEditing_FillComboOnFly" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script type="text/javascript"><!--
//function is called on changing country
function OnCountryChanged(cmbCountry) {
    grid.GetEditor("City").PerformCallback(cmbCountry.GetValue().toString());
}
//--></script>
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSourceMain" KeyFieldName="CustomerID" Width="100%" AutoGenerateColumns="False" OnCellEditorInitialize="grid_CellEditorInitialize">
        <Settings ShowGroupPanel="True" />
        <SettingsEditing Mode="Inline" />
        <Columns>
<dxwgv:GridViewCommandColumn VisibleIndex="0">
<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="Country" VisibleIndex="1">
<PropertiesComboBox TextField="Country" ValueField="Country" EnableSynchronization="False" EnableIncrementalFiltering="True" DataSourceID="AccessDataSourceCountry">
<ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
</PropertiesComboBox>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="City" VisibleIndex="2">
<PropertiesComboBox EnableSynchronization="False" EnableIncrementalFiltering="True" DropDownStyle="DropDown"></PropertiesComboBox>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataColumn VisibleIndex="3" FieldName="ContactName"></dxwgv:GridViewDataColumn>
<dxwgv:GridViewDataColumn VisibleIndex="4" FieldName="CompanyName"></dxwgv:GridViewDataColumn>
</Columns>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSources --%>
    <asp:AccessDataSource ID="AccessDataSourceMain" runat="server" DataFile="~/App_Data/nwind.mdb"
        OnDeleting="AccessDataSource1_Modifying" OnInserting="AccessDataSource1_Modifying" OnUpdating="AccessDataSource1_Modifying"
        SelectCommand="SELECT * FROM [Customers]" 
        DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" 
        InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [City] = ?, [Country] = ? WHERE [CustomerID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceCountry" runat="server" DataFile="~/App_Data/WorldCities.mdb"
        SelectCommand="SELECT * FROM [Countries]"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceCities" runat="server" DataFile="~/App_Data/WorldCities.mdb"
        SelectCommand="SELECT c.City FROM [Cities] c, [Countries] cr WHERE (c.CountryId = cr.CountryId) AND (cr.Country = ?) order by c.City">
        <SelectParameters>
            <asp:Parameter Name="?" />
        </SelectParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="FilterBuilder.aspx.cs" Inherits="Filtering_FilterBuilder" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="OrderID" 
        OnCustomUnboundColumnData="grid_CustomUnboundColumnData" Width="100%" AutoGenerateColumns="False">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="0"/>
            <dxwgv:GridViewDataComboBoxColumn FieldName="CategoryName" VisibleIndex="0">
                <PropertiesComboBox DataSourceID="dsCategories" TextField="CategoryName" ValueField="CategoryName" ValueType="System.String" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="Country" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="dsCountries" TextField="Country" ValueField="Country" ValueType="System.String" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="3">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="5">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Total" VisibleIndex="6" UnboundType="Decimal">
                <PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dxwgv:ASPxSummaryItem FieldName="Country" SummaryType="Count" />
            <dxwgv:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="c" />
        </TotalSummary>
        <Settings ShowGroupPanel="True" ShowFilterBar="Visible" />
        <GroupSummary>
            <dxwgv:ASPxSummaryItem FieldName="Country" ShowInGroupFooterColumn="Country" SummaryType="Count" />
            <dxwgv:ASPxSummaryItem FieldName="Quantity" ShowInGroupFooterColumn="Quantity" SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem FieldName="Total" ShowInGroupFooterColumn="Total" SummaryType="Sum"  DisplayFormat="{0:c}"/>
        </GroupSummary>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [OrderID], [Country], [FirstName], [LastName], [ProductName], [CategoryName], [OrderDate], [UnitPrice], [Quantity], [Discount], [Extended Price] AS Extended_Price, [Sales Person] AS Sales_Person FROM [SalesPerson]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="dsCountries" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT distinct [Country] FROM [SalesPerson]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT distinct [CategoryName] FROM [SalesPerson]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

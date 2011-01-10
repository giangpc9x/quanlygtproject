<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="HeaderFilter.aspx.cs" Inherits="Summary_Total" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="OrderID" 
        OnCustomUnboundColumnData="grid_CustomUnboundColumnData" Width="100%" AutoGenerateColumns="False" OnHeaderFilterFillItems="grid_HeaderFilterFillItems">
        <Columns>
            <%-- BeginRegion Auto Generated Columns --%>
            <dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="0">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="1">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="2">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="3">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="5" Name="Quantity">
            </dxwgv:GridViewDataColumn>
            <%-- EndRegion --%>
            <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="c">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Total" VisibleIndex="6" UnboundType="Decimal">
                <FooterCellStyle ForeColor="Brown"> </FooterCellStyle>
                <PropertiesTextEdit DisplayFormatString="c">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowGroupPanel="True" ShowFooter="True" ShowHeaderFilterButton="true" />
        <TotalSummary>
            <dxwgv:ASPxSummaryItem FieldName="CompanyName" SummaryType="Count"/>
            <dxwgv:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="c"/>
            <dxwgv:ASPxSummaryItem FieldName="Quantity" SummaryType="Min" />
            <dxwgv:ASPxSummaryItem FieldName="Quantity" SummaryType="Average" />
            <dxwgv:ASPxSummaryItem FieldName="Quantity" SummaryType="Max" />
        </TotalSummary>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [Customers.CompanyName] AS CompanyName, [City], [Region], [Country], [Salesperson], [OrderID], [OrderDate], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount], [ExtendedPrice], [Freight] FROM [Invoices]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

<%-- BeginRegion Tags and page properties--%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="FilterRow.aspx.cs" Inherits="Filtering_FilterRow" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>  
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
	<asp:CheckBox ID="chkFilterRowMenu" runat="server" Text="Show Filter Row Menu" AutoPostBack="true" OnCheckedChanged="chkFilterRowMenu_CheckedChanged" />
	<br /><br />
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="CustomerID" Width="100%">
		<%-- BeginRegion Column --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataColumn FieldName="ContactName" VisibleIndex="1">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="2">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="3">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="4">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="5">
            </dxwgv:GridViewDataColumn>
        </Columns>
        <%-- EndRegion --%>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT * FROM [Customers]" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [ContactTitle] = ?, [Address] = ?, [City] = ?, [Region] = ?, [PostalCode] = ?, [Country] = ?, [Phone] = ?, [Fax] = ? WHERE [CustomerID] = ?">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

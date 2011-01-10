<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="FilterBuilder.aspx.cs" Inherits="Editors_FilterBuilder" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td>
				<dxrp:ASPxRoundPanel ID="fp" runat="server" HeaderText="Filter" Width="200">
					<PanelCollection>
						<dxp:PanelContent runat="server">
							<%-- BeginRegion FilterControl --%>
    <dxe:ASPxFilterControl ID="filter" runat="server" ClientInstanceName="filter" >
        <Columns>
									<dxe:FilterControlColumn PropertyName="ProductName"  />
            <dxe:FilterControlComboBoxColumn PropertyName="CategoryName">
                <PropertiesComboBox DataSourceID="dsCategories" TextField="CategoryName" ValueField="CategoryName" ValueType="System.String" />
            </dxe:FilterControlComboBoxColumn>
									<dxe:FilterControlComboBoxColumn PropertyName="Country">
										<PropertiesComboBox DataSourceID="dsCountries" TextField="Country" ValueField="Country" ValueType="System.String" />										
									</dxe:FilterControlComboBoxColumn>																		
            <dxe:FilterControlColumn PropertyName="OrderDate" ColumnType="DateTime"  />
									<dxe:FilterControlSpinEditColumn PropertyName="UnitPrice"  />
            <dxe:FilterControlSpinEditColumn PropertyName="Quantity" ColumnType="Integer" />
        </Columns>
         <ClientSideEvents applied="function(s, e) { grid.ApplyFilter(e.filterExpression);}"/>
    </dxe:ASPxFilterControl>
							<%-- EndRegion --%>
							<%-- BeginRegion Button --%>
							<table width="100%" cellpadding="0" cellspacing="5" style="margin-top: 8px">
								<tr>
									<td align="center">
										<dxe:ASPxButton runat="server" ID="btnApply" Text="Apply" AutoPostBack="false" UseSubmitBehavior="false">
											<ClientSideEvents Click="function() { filter.Apply(); }" />
										</dxe:ASPxButton>
									</td>
								</tr>
							</table>
							<%-- EndRegion --%>
						</dxp:PanelContent>
					</PanelCollection>
				</dxrp:ASPxRoundPanel>
			</td>		
			<td> &nbsp; </td>
			<td>
    <%-- BeginRegion Grid --%>
				<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" 
					KeyFieldName="OrderID" Width="100%" AutoGenerateColumns="False" >
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
        </Columns>
    </dxwgv:ASPxGridView>
    <%-- EndRegion --%>
			</td>
		</tr>
	</table>
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

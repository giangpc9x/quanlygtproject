<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ComboBoxMultiColumn.aspx.cs" Inherits="Editors_ComboBoxMultiColumn" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" runat="Server">
    <table style="margin-left: 10px; margin-top: 20px;">
        <tr>
            <td>Customer:</td>
            <td>
                <dxe:ASPxComboBox ID="CmbCustomers" runat="server" Width="170px" DropDownWidth="550" DropDownStyle="DropDownList"
                    DataSourceID="dsCustomers" ValueField="CustomerID" ValueType="System.String" TextFormatString="{0}"
                    EnableCallbackMode="true" EnableIncrementalFiltering="True" CallbackPageSize="30">
                    <Columns>
                        <dxe:ListBoxColumn FieldName="ContactName" Width="130px" />
                        <dxe:ListBoxColumn FieldName="CompanyName" Width="100%" />
                        <dxe:ListBoxColumn FieldName="Country" Width="60px" />
                        <dxe:ListBoxColumn FieldName="Phone" Width="100px" />
                    </Columns>
                </dxe:ASPxComboBox>
            </td>
        </tr>
    </table>
    <%-- BeginRegion Data Source --%>
    <asp:AccessDataSource ID="dsCustomers" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [CustomerID], [ContactName], [Phone], [CompanyName], [Country] FROM [Customers] ORDER BY [ContactName], [CompanyName]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

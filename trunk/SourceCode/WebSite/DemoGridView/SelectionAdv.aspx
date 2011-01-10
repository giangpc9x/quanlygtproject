<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="SelectionAdv.aspx.cs" Inherits="Selection_SelectionAdv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <input onclick="grid.SelectAllRowsOnPage();" type="button" value="Select All on Page" />
    <input onclick="grid.UnselectAllRowsOnPage();" type="button" value="Unselect All on Page" /><br /><br />
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="CustomerID" Width="100%">
        <SettingsBehavior AllowGroup="false" AllowDragDrop="false" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                <HeaderTemplate>
                    <input type="checkbox" onclick="grid.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Select/Unselect all rows on the page"></input>
                </HeaderTemplate>
                <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" HorizontalAlign="Center"/>
            </dxwgv:GridViewCommandColumn>
            <%-- BeginRegion Data Columns --%>
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
            <%-- EndRegion --%>
        </Columns>
        <Styles>
            <CommandColumn Paddings-PaddingTop="1" Paddings-PaddingBottom="1" HorizontalAlign="Center"></CommandColumn>
        </Styles>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion Data Source --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT * FROM [Customers]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ProgressBar.aspx.cs" Inherits="Editors_ProgressBar" Title="Untitled Page" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
<%-- BeginRegion Grid --%>
<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="ID" Width="100%" >
    <Columns>
        <dxwgv:GridViewDataTextColumn FieldName="Name" VisibleIndex="0">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Priority" VisibleIndex="1">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Assigned To" VisibleIndex="4">
        </dxwgv:GridViewDataTextColumn>        
        <dxwgv:GridViewDataProgressBarColumn FieldName="Complete" VisibleIndex="3">
        </dxwgv:GridViewDataProgressBarColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Status" VisibleIndex="2">
        </dxwgv:GridViewDataTextColumn>        
    </Columns>
</dxwgv:ASPxGridView>
<%-- EndRegion --%>
<%-- BeginRegion DataSources --%>
<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/EditorsSampleDB.mdb"
    SelectCommand="SELECT * FROM [Tasks]"></asp:AccessDataSource>
<%-- EndRegion --%>
</asp:Content>

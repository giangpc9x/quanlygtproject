<%-- BeginRegion Tags and properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master"  AutoEventWireup="true" CodeFile="FocusedRow.aspx.cs" Inherits="Rows_FocusedRow" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script language="javascript" type="text/javascript"><!--
// <!CDATA[
//function is called on changing focused row
function OnGridFocusedRowChanged() {
    // Query the server for the "EmployeeID" and "Notes" fields from the focused row 
    // The values will be returned to the OnGetRowValues() function     
    grid.GetRowValues(grid.GetFocusedRowIndex(), 'EmployeeID;Notes', OnGetRowValues);
}
//Value array contains "EmployeeID" and "Notes" field values returned from the server 
function OnGetRowValues(values) {
    var notes = document.getElementById("detailnotes");
    notes.value = values[1];
    var image = document.getElementById("detailimage");
    image.src = "FocusedRow.aspx?Photo=" + values[0];
}
//--></script>
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" PreviewFieldName="Notes" AutoGenerateColumns="False" EnableRowsCache="false" Width="100%">
        <%-- BeginRegion Columns --%>
        <Columns>
            <dxwgv:GridViewDataColumn FieldName="FirstName" VisibleIndex="0"/>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="3"/>
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="1"/>
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="2"/>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="4"/>
        </Columns>
        <%-- EndRegion --%>        
        <Settings  ShowGroupPanel="true" />
        <SettingsBehavior AllowFocusedRow="True"/>
        <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }"/>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion Detail Info controls --%>
    <div>
    Details:<br />
    <table cellpadding="5" cellspacing="2" style="width:100%">
        <tr>
            <td style="width:30%"><img id="detailimage" alt="Image" src=""/></td>
            <td style="width:70%"><textarea id="detailnotes" style="border: 1px solid #000000;padding:2px 4px 2px 4px;width:94%;vertical-align:top" readonly="readonly" rows="10" cols="50"></textarea></td>
        </tr>
    </table>
    </div>
    <%-- EndRegion --%>
    <%-- BeginRegion DataSource --%>    
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees] WHERE [Photo] is not null">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

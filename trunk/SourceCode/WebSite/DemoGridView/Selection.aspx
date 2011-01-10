<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Selection.aspx.cs" Inherits="Selection_Selection" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script type="text/javascript"><!--
function OnGridSelectionChanged() {
    var counter = document.getElementById("selCount");
    if(counter != null) setInnerText(counter, grid.GetSelectedRowCount().toString());
    grid.GetSelectedFieldValues('ContactName', OnGridSelectionComplete);
}
function OnGridSelectionComplete(values) {
    selList.BeginUpdate();
    selList.ClearItems();
    for(var i = 0; i < values.length; i ++) {
        selList.AddItem(values[i]);
    }
    selList.EndUpdate();
}
function setInnerText(element, text) { 
    if(typeof element.textContent != 'undefined') { 
        element.textContent = text; 
    } 
    else if (typeof element.innerText != 'undefined') { 
        element.innerText = text; 
    } 
    else if (typeof element.removeChild != 'undefined') { 
        while (element.hasChildNodes()) { 
            element.removeChild(element.lastChild); 
        } 
        element.appendChild(document.createTextNode(text)); 
    } 
}
//--></script>
    <table style="width:100%"><tbody>
     <tr><td>Selected values:</td><td></td></tr>
     <tr>
      <td style="vertical-align:top">
        <dxe:ASPxListBox ClientInstanceName="selList" runat="server" Height="250px" Width="120px"></dxe:ASPxListBox>
        <p></p>
        Selected count: <a id="selCount" type="text/plain">0</a>
      </td>
      <td style="vertical-align:top">
        <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="CustomerID" Width="100%">
            <Columns>
                <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"></dxwgv:GridViewCommandColumn>
                <%-- BeginRegion Columns --%>
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
                <CommandColumn Paddings-Padding="1"></CommandColumn>
            </Styles>
            <Settings ShowGroupPanel="true" />
            <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(); }" />
        </dxwgv:ASPxGridView>
      </td>
     </tr>
    </tbody></table>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT * FROM [Customers]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

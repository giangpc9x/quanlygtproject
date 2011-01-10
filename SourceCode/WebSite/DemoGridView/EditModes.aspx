<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="EditModes.aspx.cs" Inherits="GridEditing_SimpleEditing" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <%-- BeginRegion DropDown --%>
    Edit Mode: <asp:DropDownList ID="ddlEditMode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEditMode_SelectedIndexChanged">
    </asp:DropDownList>
    <br /><br />
    <%-- EndRegion --%>
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="CustomerID" Width="100%">
    <%-- BeginRegion Columns --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="true" />
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
        <SettingsEditing PopupEditFormWidth="600px" />
        <Settings ShowGroupPanel="true" />
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" 
        OnDeleting="AccessDataSource1_Modifying" OnInserting="AccessDataSource1_Modifying" OnUpdating="AccessDataSource1_Modifying"
        SelectCommand="SELECT * FROM [Customers]" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" 
        InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [City] = ?, [Region] = ?, [Country] = ? WHERE [CustomerID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Validation.aspx.cs" Inherits="GridEditing_Validation" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%-- EndRegion --%>    
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="ObjectDataSource1" KeyFieldName="Id" AutoGenerateColumns="False" Width="100%" OnHtmlRowPrepared="grid_HtmlRowPrepared" OnRowValidating="grid_RowValidating" OnStartRowEditing="grid_StartRowEditing" OnParseValue="grid_ParseValue">
        <%-- BeginRegion Columns --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True" />
                <NewButton Visible="True" />
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="First Name" FieldName="FirstName" VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Last Name" FieldName="LastName" VisibleIndex="2">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Age" FieldName="Age" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="E-mail" FieldName="Email" VisibleIndex="4">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Arrival Date" FieldName="ArrivalDate" VisibleIndex="5">
            </dxwgv:GridViewDataDateColumn>
        </Columns>
    </dxwgv:ASPxGridView>
    <%-- EndRegion --%>
    <%-- BeginRegion DataSource --%>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="PersonRegistration"
        SelectMethod="GetList" TypeName="MyPersonProvider" UpdateMethod="Update" InsertMethod="Insert"></asp:ObjectDataSource>
    <%-- EndRegion --%>
</asp:Content>

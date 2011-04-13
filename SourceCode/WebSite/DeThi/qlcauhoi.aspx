<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoi.aspx.cs" Inherits="dethi_qlcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dxuc" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxObjectContainer" tagprefix="dxoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 351px;
        }
        .style2
        {
            width: 144px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
    <div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False" 
            onclick="btnThemMoi_Click">
    </dxe:ASPxButton>
    
</div>

 <div style ="width:90px; float:left; padding-left:15px;">
    <dxe:ASPxButton ID="btnSua" ClientInstanceName = "btnSua" runat="server" 
         Text="Sửa" Width = "90px" AutoPostBack="False" onclick="btnSua_Click">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Show();
}" />
    </dxe:ASPxButton>
</div>

<div style = "float:left;padding-left:15px;width:90px;">
<dxe:ASPxButton ID="btnXoa" ClientInstanceName = "btnXoa" Width = "90px" 
        runat="server" Text="Xóa" AutoPostBack="False">
    <ClientSideEvents Click="function(s, e) {    
	            StartDelete();
}" />
</dxe:ASPxButton></div>
<div style = "clear:both;">
    <dxwgv:ASPxGridView ID="gvcauhoi" runat="server"  Width = "100%"
        AutoGenerateColumns="False" ClientInstanceName="gvcauhoi" 
        KeyFieldName="MaCauHoi" onrowvalidating="gvcauhoi_RowValidating">
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                <clearfilterbutton visible="True">
                </clearfilterbutton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nội dung câu hỏi" FieldName="NoiDung" 
                Name="gcNoiDungCauHoi" VisibleIndex="1" Width="98%">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" Visible="False" VisibleIndex="9">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã câu hỏi" FieldName="MaCauHoi" 
                Name="gtxtMaCauHoi" VisibleIndex="3" Visible="False">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"/>
    </dxwgv:ASPxGridView>
</div>
    
   
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


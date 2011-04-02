<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoi.aspx.cs" Inherits="dethi_qlcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
    <div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Show();
}" />
    </dxe:ASPxButton>
</div>
<div style = "float:left;padding-left:10px;width:90px;">
<dxe:ASPxButton ID="btnXoa" ClientInstanceName = "btnXoa" Width = "90px" 
        runat="server" Text="Xóa" AutoPostBack="False">
    <ClientSideEvents Click="function(s, e) {    
	            StartDelete();
}" />
</dxe:ASPxButton></div>
<div style = "clear:both;">
    <dxwgv:ASPxGridView ID="gvcauhoi" runat="server"  Width = "100%"
        AutoGenerateColumns="False" ClientInstanceName="gvcauhoi" 
        KeyFieldName="MaCauHoi" onrowinserting="gvcauhoi_RowInserting" 
        onrowupdating="gvcauhoi_RowUpdating" onrowvalidating="gvcauhoi_RowValidating">
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                <clearfilterbutton visible="True">
                </clearfilterbutton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã câu hỏi" FieldName="MaCauHoi" 
                Name="gtxtMaCauHoi" VisibleIndex="1" Visible="False">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nội dung câu hỏi" FieldName="NoiDung" 
                Name="gcNoiDungCauHoi" VisibleIndex="1" Width="150px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Sửa" VisibleIndex="2" Width="30px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" Visible="False" VisibleIndex="9">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"/>
    </dxwgv:ASPxGridView>
</div>
    
    <br>
    <div>
    alo
        <dxpc:ASPxPopupControl ID="PupChiTietCauHoi" runat="server" 
            ClientInstanceName="PupChiTietCauHoi" HeaderText="Chi Tiết Câu Hoi" 
            Height="265px" Width="683px" AllowDragging="True" 
            CloseAction="CloseButton" EnableAnimation="False" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <dxe:ASPxButton ID="btnClosePup" runat="server" AutoPostBack="False" 
        Text="Đóng" Width="90px">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Hide();
}" />
    </dxe:ASPxButton>
                </dxpc:PopupControlContentControl>
</ContentCollection>
        </dxpc:ASPxPopupControl>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


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
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Show();
}" />
    </dxe:ASPxButton>
    
</div>

 <div style ="width:90px; float:left; padding-left:15px;">
    <dxe:ASPxButton ID="btnSua" ClientInstanceName = "btnSua" runat="server" 
         Text="Sửa" Width = "90px" AutoPostBack="False">
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
        KeyFieldName="MaCauHoi" onrowinserting="gvcauhoi_RowInserting" 
        onrowupdating="gvcauhoi_RowUpdating" onrowvalidating="gvcauhoi_RowValidating">
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
    
   
    <div>
    alo
        <dxpc:ASPxPopupControl ID="PupChiTietCauHoi" runat="server" 
            ClientInstanceName="PupChiTietCauHoi" HeaderText="Chi Tiết Câu Hoi" 
            Height="265px" Width="683px" AllowDragging="True" 
            CloseAction="CloseButton" EnableAnimation="False" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
<dxpc:PopupControlContentControl runat="server">

   



<table style="width: 610px; height: 157px">
<tr><td class="style2">
    <dxe:ASPxLabel ID="poplbLoaiCauHoi" runat="server" Text="Loại Câu Hỏi">
    </dxe:ASPxLabel>
    </td><td class="style1">
        <dxe:ASPxComboBox ID="popcboLoaiCauHoi" runat="server" 
            ClientInstanceName="popcboLoaiCauHoi" ValueType="System.String">
        </dxe:ASPxComboBox>
    </td>

</tr>
<tr><td class="style2">
    <dxe:ASPxLabel ID="poplbNoiDung" runat="server" Text="Nội Dung">
    </dxe:ASPxLabel>
    </td><td class="style1">
        <dxe:ASPxTextBox ID="poptxtNoiDung" runat="server" 
            ClientInstanceName="poptxtNoiDung" Width="170px">
        </dxe:ASPxTextBox>
    </td>

</tr>
<tr><td class="style2">
    <dxe:ASPxBinaryImage ID="popimHinhAnh" runat="server" 
        ClientInstanceName="popimHinhAnh" Height="80px" Width="79px">
    </dxe:ASPxBinaryImage>
    
    </td><td class="style1">
        <dxuc:ASPxUploadControl ID="uplFile" runat="server" 
            ClientInstanceName="uplFile">
        </dxuc:ASPxUploadControl>
    </td>

</tr>
<tr>
<td>
    <dxe:ASPxLabel ID="poplbCauLuaChon" runat="server" Text="Câu Lựa CHọn">
    </dxe:ASPxLabel>
    </td>
<td class="style1">
<table><tr><td>
<dxe:ASPxTextBox ID="txtcauluachon" runat="server" 
        ClientInstanceName="txtcauluachon" Width="170px">
    </dxe:ASPxTextBox> 
    </td>
    <td>   
    <dxe:ASPxCheckBox ID="chbDapAn" runat="server">
    </dxe:ASPxCheckBox></td>
    </tr>
    </table>
    </td>
</tr>

<tr><td class="style1" style="margin-left: 40px"><dxe:ASPxButton ID="btnSavePup" 
            runat="server" AutoPostBack="False" 
        Text="Lưu" Width="90px" VerticalAlign="Middle" HorizontalAlign="Center">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Hide();
}" />
    </dxe:ASPxButton></td>
    <td><dxe:ASPxButton ID="btnCancelPup" runat="server" AutoPostBack="False" 
        Text="Hủy" Width="90px" VerticalAlign="Middle">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Hide();
}" />
    </dxe:ASPxButton></td>
    <td> <dxe:ASPxButton ID="btnClosePup" runat="server" AutoPostBack="False" 
        Text="Đóng" Width="90px" VerticalAlign="Middle">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Hide();
}" />
    </dxe:ASPxButton>
    </td>
    </tr>


   




</table>


                </dxpc:PopupControlContentControl>
</ContentCollection>
        </dxpc:ASPxPopupControl>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


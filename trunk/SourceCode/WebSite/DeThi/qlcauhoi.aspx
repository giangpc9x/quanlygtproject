<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoi.aspx.cs" Inherits="dethi_qlcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dxuc" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxObjectContainer" tagprefix="dxoc" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>

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
        .style3
        {
            width: 365px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
    <div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents CheckedChanged="function(s, e) {
		
}" Click="function(s, e) {
		PupChiTietCauHoi.Show();
}" />
    </dxe:ASPxButton>
    
</div>

 <div style ="width:90px; float:left; padding-left:15px;">
    <dxe:ASPxButton ID="btnSua" ClientInstanceName = "btnSua" runat="server" 
         Text="Sửa" Width = "90px" AutoPostBack="False" 
         CommandName="sua">
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


  alo alo

<dxpc:ASPxPopupControl ID="PupChiTietCauHoi" runat="server" 
            ClientInstanceName="PupChiTietCauHoi" HeaderText="Chi Tiết Câu Hoi" 
            Height="265px" Width="683px" AllowDragging="True" 
            CloseAction="CloseButton" EnableAnimation="False" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
<dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">

   



<table style="width: 610px; height: 157px">
<tr><td class="style2">
    <dxe:ASPxLabel ID="poplbLoaiCauHoi" runat="server" Text="Loại Câu Hỏi">
    </dxe:ASPxLabel>
    </td><td class="style3">
        <dxe:ASPxComboBox ID="popcboLoaiCauHoi" runat="server" Width="300px"
            ClientInstanceName="popcboLoaiCauHoi" ValueType="System.String">
        </dxe:ASPxComboBox>
    </td>

</tr>
<tr><td class="style2">
    <dxe:ASPxLabel ID="poplbNoiDung" runat="server" Text="Nội Dung">
    </dxe:ASPxLabel>
    </td><td class="style3">
        <dxe:ASPxTextBox ID="poptxtNoiDung" runat="server" 
            ClientInstanceName="poptxtNoiDung" Width="300px">
        </dxe:ASPxTextBox>
    </td>

</tr>
<tr><td class="style2">
    <dxe:ASPxBinaryImage ID="popimHinhAnh" runat="server" 
        ClientInstanceName="popimHinhAnh" Height="80px" Width="79px">
    </dxe:ASPxBinaryImage>
    
    </td><td class="style3">
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
    
    
    
<td class="style3" >


    <dxp:ASPxPanel ID="pnelCauLuaCHon" runat="server" Width="300px">
        <PanelCollection>
            <dxp:PanelContent runat="server">
            
            
            <table><tr><td style="margin-right: 5px">
                <dxe:ASPxTextBox ID="txtcauluachon" runat="server" Width="300px">
                </dxe:ASPxTextBox>
            </td><td style="margin-left: 5px">
                <dxe:ASPxRadioButton ID="rdodapan"  runat="server" GroupName="DapAn">
                </dxe:ASPxRadioButton>
            </td></tr>
            <tr><td>
                <dxe:ASPxTextBox ID="txtcauluachon2" runat="server" Width="300px">
                </dxe:ASPxTextBox>
            </td><td>
                 <dxe:ASPxRadioButton ID="rdodapan2"  runat="server" GroupName="DapAn">
                </dxe:ASPxRadioButton>
            </td></tr><tr><td>
                <dxe:ASPxTextBox ID="txtcauluachon3" runat="server" Width="300px">
                </dxe:ASPxTextBox>
            </td><td>
                <dxe:ASPxRadioButton ID="rdodapan3"  runat="server" GroupName="DapAn">
                </dxe:ASPxRadioButton>
            </td></tr>
            <tr><td>
                <dxe:ASPxTextBox ID="txtcauluachon4" runat="server" Width="300px">
                </dxe:ASPxTextBox>
            </td><td>
                 <dxe:ASPxRadioButton ID="rdodapan4"  runat="server" GroupName="DapAn">
                </dxe:ASPxRadioButton>
            </td></tr>
            </table>
            
            
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>


    </td>
</tr>

<tr><td class="style1" style="margin-left: 40px"><dxe:ASPxButton ID="btnSavePup" 
            runat="server" AutoPostBack="False" 
        Text="Lưu" Width="90px" VerticalAlign="Middle" HorizontalAlign="Center" 
        OnClick="btnSavePup_Click">
        <ClientSideEvents Click="function(s, e) {
	PupChiTietCauHoi.Hide();
}" />
    </dxe:ASPxButton></td>
    <td class="style3"><dxe:ASPxButton ID="btnCancelPup" runat="server" AutoPostBack="False" 
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

    
 
   
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


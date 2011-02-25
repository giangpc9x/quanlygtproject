<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlnguoidung.aspx.cs" Inherits="HeThong_qlnguoidung" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">


<script type="text/javascript">
function StartDelete() 
{
    if (gvNguoiDung.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvNguoiDung.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvNguoiDung.PerformCallback("Update");
}
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvNguoiDung.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvNguoiDung" ClientInstanceName = "gvNguoiDung" 
        Width = "100%" KeyFieldName = "TenDangNhap" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvNguoiDung_RowValidating" 
        onrowinserting="gvNguoiDung_RowInserting" 
        onrowupdating="gvNguoiDung_RowUpdating" 
        oncustomdatacallback="gvNguoiDung_CustomDataCallback" 
        oncustomcallback="gvNguoiDung_CustomCallback"> 
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin Điểm Thi" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewDataTextColumn 
               VisibleIndex="0">
               
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Tên Đăng Nhập" FieldName="TenDangNhap" 
                Name="gtxtTenDangNhap" VisibleIndex="1" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã Điểm Thi" FieldName="MaDiemThi" 
                Name="gtxtMaDiemThi" VisibleIndex="2" Width="90px">
                <PropertiesTextEdit ClientInstanceName="gtxtMaDiemThi">
                    <ClientSideEvents Validation="function(s, e) {
	//alert('alo alo');
}" />
                </PropertiesTextEdit>
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mật Khẩu" FieldName="MatKhau" 
                Name="gcMatKhau" VisibleIndex="3" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Họ" FieldName="Ho" Name="gcHo" 
                VisibleIndex="4" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Tên" FieldName="Ten" Name="gcTen" 
                VisibleIndex="5" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="CMND" FieldName="CMND" Name="gcCMND" 
                VisibleIndex="6" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Ngày Sinh" FieldName="NgaySinh" 
                Name="gcNgaySinh" VisibleIndex="7" Width="90px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="Địa Chỉ" FieldName="DiaChi" 
                Name="gcDiaChi" VisibleIndex="8" Width="90px">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings ColumnSpan="3" VisibleIndex="3" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Điện Thoại" FieldName="DienThoai" 
                Name="gcDienThoai" VisibleIndex="9" Width="90px">
                <EditFormSettings VisibleIndex="2" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Email" FieldName="Email" Name="gcEmail" 
                VisibleIndex="10" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Ngày Đăng Ký" FieldName="NgayDK" 
                Name="gcNgayDK" VisibleIndex="11" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Trạng Thái" FieldName="TrangThai" 
                Name="gcTrangThai" VisibleIndex="12" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã Nhóm" FieldName="MaNhom" 
                Name="gcMaNhom" VisibleIndex="13" Width="90px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="14" Caption = "Sửa" Width = "30px">
                <EditButton Visible="True" Text = "Sửa">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" 
                Visible="False" VisibleIndex="6">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlnguoidung.aspx.cs" Inherits="HeThong_qlnguoidung" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">


<script type="text/javascript">
    function StartDelete() {
        if (gvNguoiDung.GetSelectedRowCount()) {
            if (confirm('Xác nhận xóa dữ liệu'))
                gvNguoiDung.GetValuesOnCustomCallback("Delete", GetUpdateResult);
        }
        else
            alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');
    }
    function GetUpdateResult(errorText) {
        if (errorText != "")
            alert(errorText);
        gvNguoiDung.PerformCallback("Update");
    }
</script>


<div style ="width:100%; float:left; padding-bottom:10px;">
    <dxe:ASPxComboBox ID="cboDienThi" runat="server" Width="70%" 
        ClientInstanceName="cboDienThi" ValueType="System.String">
        <ClientSideEvents ValueChanged="function(s, e) {
	 gvNguoiDung.PerformCallback(cboDienThi.GetValue().toString());
}" />
    </dxe:ASPxComboBox>
</div>

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
        onrowinserting="gvNguoiDung_RowInserting" 
        onrowvalidating="gvNguoiDung_RowValidating" 
        oncustomcallback="gvNguoiDung_CustomCallback" 
        oncustomdatacallback="gvNguoiDung_CustomDataCallback" 
        onrowupdating="gvNguoiDung_RowUpdating" >
      
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin người dùng" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width = "25px">
             <HeaderTemplate>
                     <input type="checkbox" onclick="gvNhomNguoiDung.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Tên Đăng Nhập" Name = "gtxtTenDangNhap" FieldName="TenDangNhap" 
               VisibleIndex="1" Width="90px">
               
            
               
                <EditFormSettings Visible="True" VisibleIndex="0" />
               
            
               
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Họ" FieldName="Ho" 
                Name="gcHo" VisibleIndex="2" Width="90px">
                <EditFormSettings Visible="True" VisibleIndex="2" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Tên" FieldName="Ten" Name="gcTen" 
                VisibleIndex="3" Width="90px">
                <EditFormSettings Visible="True" VisibleIndex="3" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Ngày  Sinh" FieldName="NgaySinh" 
                Name="gcNgaySinh" VisibleIndex="4" Width="90px">
                <PropertiesDateEdit DisplayFormatString="dd/mm/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="5" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="Địa Chỉ" FieldName="DiaChi" 
                Name="gcDiaChi" VisibleIndex="5" Width="90px">
                <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="3" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataSpinEditColumn Caption="Điện Thoại" FieldName="DienThoai" 
                Name="gcDienThoai" VisibleIndex="6" Width="90px">
                <PropertiesSpinEdit DisplayFormatString="g" NumberFormat="Custom">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="True" VisibleIndex="7" />
            </dxwgv:GridViewDataSpinEditColumn>
            <dxwgv:GridViewDataCheckColumn Caption="Trạng Thái" FieldName="TrangThai" 
                Name="gcTrangThai" VisibleIndex="7" Width="25px">
                <PropertiesCheckEdit DisplayTextChecked="Sử dụng" 
                    DisplayTextUnchecked="Không sử dụng">
                </PropertiesCheckEdit>
                <EditFormSettings Visible="True" VisibleIndex="8" />
            </dxwgv:GridViewDataCheckColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="8" Caption = "Sửa" Width = "50px">
                <EditButton Visible="True" Text = "Sửa">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" VisibleIndex="6" Visible="False">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Email" FieldName="Email" Name="gcEmail" 
                VisibleIndex="10" Width="90px" Visible="False">
                <EditFormSettings Visible="True" VisibleIndex="9" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Chọn nhóm người dùng" FieldName="MaNhom" 
                Name="gcMaNhom" Visible="False" VisibleIndex="11" Width="90px">
                <PropertiesComboBox DisplayFormatString="g" ValueType="System.String" 
                    DataMember="MaNhom">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Nhóm người dùng" FieldName="TenNhom" />
                    </Columns>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" VisibleIndex="10" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mật Khẩu" FieldName="MatKhau" 
                Name="gcMatKhau" VisibleIndex="10" Width="90px" Visible="False">
                <PropertiesTextEdit Password="True">
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" VisibleIndex="1" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Ngày Đăng Ký" FieldName="NgayDK" 
                Name="gcNgayDK" Visible="False" VisibleIndex="11" Width="90px">
                <PropertiesDateEdit DisplayFormatString="dd/mm/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="11" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="CMND" FieldName="CMND" Name="gcCMND" 
                VisibleIndex="14" Width="90px" Visible="False">
                <EditFormSettings Visible="True" VisibleIndex="4" />
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
    </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


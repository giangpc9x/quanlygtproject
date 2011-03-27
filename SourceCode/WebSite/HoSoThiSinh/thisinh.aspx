<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="thisinh.aspx.cs" Inherits="HoSoThiSinh_thisinh" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dxhf" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">




<script type="text/javascript">
function StartDelete() 
{
    if (gvThiSinh.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvThiSinh.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvThiSinh.PerformCallback("Update");
}
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvThiSinh.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvThiSinh" ClientInstanceName = "gvThiSinh" 
        Width = "100%" KeyFieldName = "MaTS" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvThiSinh_RowValidating" 
        onrowinserting="gvThiSinh_RowInserting" 
        onrowupdating="gvThiSinh_RowUpdating" 
        oncustomdatacallback="gvThiSinh_CustomDataCallback" 
        oncustomcallback="gvThiSinh_CustomCallback"> 
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin Thi Sinh" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width = "25px">
             <HeaderTemplate>
                     <input type="checkbox" onclick="gvThiSinh.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã Thi Sinh" Name = "gtxtMaTS" FieldName="MaTS" 
               VisibleIndex="1" Width="50px">
               
                <PropertiesTextEdit ClientInstanceName="gtxtMaTS">
                </PropertiesTextEdit>               
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mật Khẩu"  Name="gcMatKhau" FieldName="MatKhau"
                VisibleIndex="2" Width="50px">
                    <PropertiesTextEdit  ClientInstanceName="gcMatKhau">
                    </PropertiesTextEdit>
                    <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Họ tên lót" FieldName="HoTenLot" 
                Name="gcHoTenLot" VisibleIndex="4" Width="50px">
                <Settings AutoFilterCondition="Contains" />
               
                <EditFormSettings VisibleIndex="2" />
               
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Tên" FieldName="Ten" 
                Name="gcTen" VisibleIndex="5" Width="50px">              
                
                <EditFormSettings VisibleIndex="3" />
                
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Ngày Sinh" FieldName="NgaySinh" 
                Name="gcNgaySinh" VisibleIndex="2" Width="100px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="Quốc Tịch" FieldName="QuocTich" 
                Name="gcQuocTich" Visible="False" VisibleIndex="6" Width="50px">
                <EditFormSettings Visible="True" VisibleIndex="5" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nguyên Quán" FieldName="NguyenQuan" 
                Name="gcNguyenQuan" Visible="False" VisibleIndex="6" Width="50px">
                <EditFormSettings Visible="True" VisibleIndex="6" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nơi Thường Chú" FieldName="NoiThuongTru" 
                Name="gcNoiThuongTru" VisibleIndex="6" Width="100px">
                <EditFormSettings Visible="True" VisibleIndex="7" />
                <EditFormSettings VisibleIndex="5" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="NoiDKHoKhau" FieldName="NoiDKHoKhau" 
                Name="gcNoiDKHoKhau" Visible="False" VisibleIndex="7" Width="100px">
                <EditFormSettings Visible="True" VisibleIndex="8" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="CMND" FieldName="CMND" 
                Name="gcCMND" VisibleIndex="7" Width="50px">
                <EditFormSettings Visible="True" VisibleIndex="9" />
                <EditFormSettings VisibleIndex="6" />
            </dxwgv:GridViewDataTextColumn>
           <dxwgv:GridViewDataDateColumn Caption="Ngày Cấp CMND" FieldName="NgayCapCMND" 
                Name="gcNgayCapCMND" VisibleIndex="2" Width="100px" Visible="False">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="10" Visible="True" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="NoiCapCMND" FieldName="NoiCapCMND" 
                Name="gcNoiCapCMND" Visible="False" VisibleIndex="8" Width="100px">
                <EditFormSettings Visible="True" VisibleIndex="11" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="DVCongTac" FieldName="DVCongTac" 
                Name="gcDVCongTac" Visible="False" VisibleIndex="8" Width="100px">
                <EditFormSettings Visible="True" VisibleIndex="12" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Ca Thi" FieldName="MaCaThi" 
                Name="gcMaCaThi" VisibleIndex="8" Width="50px">
                <PropertiesComboBox ValueType="System.String" DataMember="MaCaThi" 
                ValueField="MaCaThi">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Ca Thi" FieldName="MaCaThi" Name="gcboCaThi" />
                    </Columns>
                </PropertiesComboBox>
                <EditFormSettings VisibleIndex="13" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Phòng thi" FieldName="MaPhong" 
                Name="gcMaPhong" VisibleIndex="9" Width="50px">              
            <PropertiesComboBox ValueType="System.String" ValueField="MaPhong">
                <Columns>
                    <dxe:ListBoxColumn Caption="Phong Thi" FieldName="MaPhong"  Name="gcboPhongThi" />
                </Columns>
            </PropertiesComboBox>
                    
                <EditFormSettings VisibleIndex="14" />
                    
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="Điện Thoại" FieldName="DienThoai" 
                Name="gcDienThoai" VisibleIndex="12" Visible="False">
                <EditFormSettings Visible="True" VisibleIndex="15" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="TrinhDoVanHoa" FieldName="TrinhDoVanHoa" 
                Name="gcTrinhDoVanHoa" Visible="False" VisibleIndex="10" Width="50px">
                <EditFormSettings Visible="True" VisibleIndex="16" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Ngày Đăng Ký Thi" FieldName="NgayDKThi" 
                Name="gcNgayDKThi" VisibleIndex="10" Width="30px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="17" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="11" Caption = "Sửa" Width = "30px">
                <EditButton Visible="True" Text = "Sửa">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" VisibleIndex="12" Visible="False">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


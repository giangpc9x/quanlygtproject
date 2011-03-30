<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="phancongcoithi.aspx.cs" Inherits="HoSoThiSinh_phancongcoithi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxDataView" tagprefix="dxdv" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">



<script type="text/javascript">
function StartDelete() 
{
    if (gvDiaDiemThi.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvPhanCongCT.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvPhanCongCT.PerformCallback("Update");
}
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvPhanCongCT.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvPhanCongCT" ClientInstanceName = "gvPhanCongCT" 
        Width = "100%" KeyFieldName = "STT" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvPhanCongCT_RowValidating" 
        onrowinserting="gvPhanCongCT_RowInserting" 
        onrowupdating="gvPhanCongCT_RowUpdating" 
        oncustomdatacallback="gvPhanCongCT_CustomDataCallback" 
        oncustomcallback="gvPhanCongCT_CustomCallback"> 
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin phân công coi thi" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width = "25px">
             <HeaderTemplate>
                     <input type="checkbox" onclick="gvPhanCongCT.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Số Thứ Tự" Name = "gtxtSTT" FieldName="STT" 
               VisibleIndex="1" Width="50px">
               
                <PropertiesTextEdit ClientInstanceName="gtxtSTT">
                    
                </PropertiesTextEdit>
               
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Thi Sinh" FieldName="TenDangNhap" 
                Name="gcTenDangNhap" VisibleIndex="2" Width="90px">
                <PropertiesTextEdit ClientInstanceName="gcTenDangNhap">
                </PropertiesTextEdit>
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Ca Thi" FieldName="MaCaThi" 
                Name="gcMaCaThi" VisibleIndex="3" Width="90px">
                <PropertiesComboBox ClientInstanceName="gcMaCaThi" ValueField="MaCaThi" 
                    ValueType="System.String">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Ca Thi" FieldName="MaCaThi" Name="gcboMaCaThi" />
                    </Columns>
                </PropertiesComboBox>
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings ColumnSpan="3" VisibleIndex="3" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Phòng Thi" FieldName="MaPhong" 
                Name="gcMaPhong" VisibleIndex="4" Width="90px">
                <PropertiesComboBox ValueField="MaPhong" ValueType="System.String">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Phòng Thi" FieldName="MaPhong" Name="gcboMaPhong" />
                    </Columns>
                </PropertiesComboBox>
                <EditFormSettings VisibleIndex="2" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="5" Caption = "Sửa" Width = "30px">
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


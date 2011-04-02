<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="phongthi.aspx.cs" Inherits="DiemThi_phongthi" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">










<script type="text/javascript">
    function StartDelete() {
        if (gvPhongThi.GetSelectedRowCount()) {
            if (confirm('Xác nhận xóa dữ liệu'))
                gvPhongThi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
        }
        else
            alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');
    }
    function GetUpdateResult(errorText) {
        if (errorText != "")
            alert(errorText);
        gvPhongThi.PerformCallback("Update");
    }
</script>

<div style ="width:100%; float:left; padding-bottom:10px;">
    <dxe:ASPxComboBox ID="cboDiemThi" runat="server" Width="70%" 
        ClientInstanceName="cboLoaiBang" ValueType="System.String">
        <ClientSideEvents ValueChanged="function(s, e) {
	 gvPhongThi.PerformCallback(cboLoaiBang.GetValue().toString());
}" />
    </dxe:ASPxComboBox>
</div>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvPhongThi.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvPhongThi" ClientInstanceName = "gvPhongThi" 
        Width = "100%" KeyFieldName = "MaPhong" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvPhongThi_RowValidating" 
        onrowinserting="gvPhongThi_RowInserting" 
        onrowupdating="gvPhongThi_RowUpdating" 
        oncustomdatacallback="gvPhongThi_CustomDataCallback" 
        oncustomcallback="gvPhongThi_CustomCallback"> 
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin cấu trúc đề thi" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width = "25px">
             <HeaderTemplate>
                     <input type="checkbox" onclick="gvPhongThi.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn FieldName="MaPhong" Name="gcxtMaPhong" Width="90px" Caption="Mã Phòng" 
                VisibleIndex="1">
    <EditFormSettings VisibleIndex="1" />
</dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mô Tả" FieldName="MoTa" Name="gcMoTa" 
                VisibleIndex="2" Visible="False" Width="90px">
                <EditFormSettings VisibleIndex="3" ColumnSpan="2" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Số Lượng" FieldName="SoThSinhToiDa" 
                Name="gcSoThSinhToiDa" VisibleIndex="2" Width="50px">
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataCheckColumn Caption="Trạng Thái" FieldName="TrangThai" 
                Name="gcTrangThai" VisibleIndex="3" Width="50px">
                <PropertiesCheckEdit DisplayTextChecked="có" DisplayTextUnchecked="không" >
                </PropertiesCheckEdit>
            </dxwgv:GridViewDataCheckColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="4" Caption = "Sửa" Width = "30px">
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


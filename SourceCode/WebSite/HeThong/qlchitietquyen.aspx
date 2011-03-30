<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlchitietquyen.aspx.cs" Inherits="HeThong_qlchitietquyen" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">








<script type="text/javascript">
    function StartDelete() {
        if (gvCTQuyen.GetSelectedRowCount()) {
            if (confirm('Xác nhận xóa dữ liệu'))
                gvCTQuyen.GetValuesOnCustomCallback("Delete", GetUpdateResult);
        }
        else
            alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');
    }
    function GetUpdateResult(errorText) {
        if (errorText != "")
            alert(errorText);
        gvCTQuyen.PerformCallback("Update");
    }
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvCTQuyen.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvCTQuyen" ClientInstanceName = "gvCTQuyen" 
        Width = "100%" KeyFieldName = "MaQuyen" 
        runat="server" AutoGenerateColumns="False" 
        onrowinserting="gvCTQuyen_RowInserting" 
        onrowvalidating="gvCTQuyen_RowValidating" 
        oncustomcallback="gvCTQuyen_CustomCallback" 
        oncustomdatacallback="gvCTQuyen_CustomDataCallback" 
        onrowupdating="gvCTQuyen_RowUpdating" >
      
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="Inline" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin Điểm Thi" 
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
            <dxwgv:GridViewDataTextColumn Caption="Mã Quyền" Name = "gtxtMaQuyen" FieldName="MaQuyen" 
               VisibleIndex="1" Width="90px">
               
                <PropertiesTextEdit ClientInstanceName="gtxtMaDiemThi">
                    <ClientSideEvents Validation="function(s, e) {
	//alert('alo alo');
}" />
                </PropertiesTextEdit>
               
                <EditFormSettings VisibleIndex="0" Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã Nhóm" FieldName="MaNhom" 
                Name="gcMaNhom" VisibleIndex="2">
                <PropertiesTextEdit Width="100%">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="3" Caption = "Sửa" Width = "50px">
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


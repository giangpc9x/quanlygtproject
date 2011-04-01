<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="dotthi.aspx.cs" Inherits="DiemThi_dotthi" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxCallback" tagprefix="dxcb" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">









<script type="text/javascript">
    function StartDelete() {
        if (gvCauTrucDeThi.GetSelectedRowCount()) {
            if (confirm('Xác nhận xóa dữ liệu'))
                gvDotThi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
        }
        else
            alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');
    }
    function GetUpdateResult(errorText) {
        if (errorText != "")
            alert(errorText);
        gvDotThi.PerformCallback("Update");
    }
</script>

<div style ="width:100%; float:left; padding-bottom:10px;">
    <dxe:ASPxComboBox ID="cboLoaiBang" runat="server" Width="70%" 
        ClientInstanceName="cboLoaiBang" ValueType="System.String" 
        ValueField="TenLoai">
        <ClientSideEvents ValueChanged="function(s, e) {
	 gvDotThi.PerformCallback(cboLoaiBang.GetValue().toString());
}" />
    </dxe:ASPxComboBox>
</div>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvDotThi.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvDotThi" ClientInstanceName = "gvDotThi" 
        Width = "100%" KeyFieldName = "MaDotThi" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvDotThi_RowValidating" 
        onrowinserting="gvDotThi_RowInserting" 
        onrowupdating="gvDotThi_RowUpdating" 
        oncustomdatacallback="gvDotThi_CustomDataCallback" 
        oncustomcallback="gvDotThi_CustomCallback"> 
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
                     <input type="checkbox" onclick="gvDotThi.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn FieldName="MaDotThi" Name="gcMaDotThi" Width="50px" Caption="Mã Đợt Thi" 
                VisibleIndex="1" Visible="False">
    <EditFormSettings VisibleIndex="0" ColumnSpan="2" RowSpan="1" />
</dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Ngày Tạo" FieldName="NgayTao" 
                Name="gcNgayTao" VisibleIndex="1" Width="90px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
                <EditFormSettings ColumnSpan="2" VisibleIndex="0" RowSpan="1" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mô Tả" FieldName="MoTa" Name="gcMoTa" 
                VisibleIndex="2" Width="100px">
                <EditFormSettings VisibleIndex="1" ColumnSpan="2" RowSpan="1" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="3" Caption = "Sửa" Width = "30px">
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


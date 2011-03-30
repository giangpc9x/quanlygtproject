<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoiloaibang.aspx.cs" Inherits="dethi_qlcauhoiloaibang" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">










<script type="text/javascript">
function StartDelete() 
{
    if (gvCauHoiLoaiBang.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvCauHoiLoaiBang.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvCauHoiLoaiBang.PerformCallback("Update");
}
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvCauHoiLoaiBang.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvCauHoiLoaiBang" ClientInstanceName = "gvCauHoiLoaiBang" 
        Width = "100%" KeyFieldName = "STT" 
        runat="server" AutoGenerateColumns="False" 
        oncustomcallback="gvCauHoiLoaiBang_CustomCallback" 
        oncustomdatacallback="gvCauHoiLoaiBang_CustomDataCallback" 
        onrowinserting="gvCauHoiLoaiBang_RowInserting" 
        onrowupdating="gvCauHoiLoaiBang_RowUpdating" 
        onrowvalidating="gvCauHoiLoaiBang_RowValidating"> 
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin câu hỏi loại bằng lái" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width = "25px">
             <HeaderTemplate>
                     <input type="checkbox" onclick="gvCauHoiLoaiBang.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn FieldName="STT" Name="gcSTT" Width="90px" Caption="STT" 
                VisibleIndex="1">
    <EditFormSettings VisibleIndex="1" />
</dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Mã loại bằng" FieldName="MaLoaiBang" 
                Name="gcMaLoaiBang" VisibleIndex="2">
                <PropertiesComboBox ClientInstanceName="gcMaLoaiBang" 
                    ValueType="System.String" DataMember="MaLoaiBang">
                    
                    <ClientSideEvents Validation="function(s, e) {
	//alert('alo alo');
}" />
                    
                </PropertiesComboBox>
                <EditFormSettings VisibleIndex="2" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Mã câu hỏi" FieldName="MaCauHoi" 
                Name="gcMaCauHoi" VisibleIndex="3">
                <PropertiesComboBox DataMember="MaCauHoi" ValueType="System.String" 
                    ValueField="MaCauHoi">
                    
                    
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" VisibleIndex="3" />
            </dxwgv:GridViewDataComboBoxColumn>
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


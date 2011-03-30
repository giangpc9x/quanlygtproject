<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcautrucdethi.aspx.cs" Inherits="dethi_qlcautrucdethi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">










<script type="text/javascript">
function StartDelete() 
{
    if (gvCauTrucDeThi.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvCauTrucDeThi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvCauTrucDeThi.PerformCallback("Update");
}
</script>

<div style ="width:100%; float:left; padding-bottom:10px;">
    <dxe:ASPxComboBox ID="cboLoaiBang" runat="server" Width="70%" 
        ClientInstanceName="cboLoaiBang" ValueType="System.String">
        <ClientSideEvents ValueChanged="function(s, e) {
	 gvCauTrucDeThi.PerformCallback(cboLoaiBang.GetValue().toString());
}" />
    </dxe:ASPxComboBox>
</div>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvCauTrucDeThi.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvCauTrucDeThi" ClientInstanceName = "gvCauTrucDeThi" 
        Width = "100%" KeyFieldName = "STT" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvCauTrucDeThi_RowValidating" 
        onrowinserting="gvCauTrucDeThi_RowInserting" 
        onrowupdating="gvCauTrucDeThi_RowUpdating" 
        oncustomdatacallback="gvCauTrucDeThi_CustomDataCallback" 
        oncustomcallback="gvCauTrucDeThi_CustomCallback"> 
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
                     <input type="checkbox" onclick="gvLoaiCauHoi.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
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
            <dxwgv:GridViewDataTextColumn Caption="Loại câu hỏi" FieldName="MaloaiCauHoi" 
                Name="gcLoaiCauHoi" VisibleIndex="2">
                <EditFormSettings ColumnSpan="2" VisibleIndex="3" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Số câu" FieldName="SoCau" Name="gcSoCau" 
                VisibleIndex="3">
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataTextColumn>
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


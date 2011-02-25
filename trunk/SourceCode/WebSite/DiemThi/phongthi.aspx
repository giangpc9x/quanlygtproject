<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="phongthi.aspx.cs" Inherits="DiemThi_phongthi" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">

<script type="text/javascript">
function StartDelete() 
{
    if (gvPhongThi.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvPhongThi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvPhongThi.PerformCallback("Update");
}
</script>

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
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin Điểm Thi" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="1" 
                Width = "25px">
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
            <dxwgv:GridViewDataTextColumn Caption="Mã Phòng" Name = "gtxtMaPhong" FieldName="MaPhong" 
               VisibleIndex="2" Width="90px">
               
                <PropertiesTextEdit ClientInstanceName="gtxtMaDiemThi">
                    <ClientSideEvents Validation="function(s, e) {
	//alert('alo alo');
}" />
                </PropertiesTextEdit>
               
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mô Tả" FieldName="MoTa" Name="gcMoTa" 
                VisibleIndex="3" Width="100px">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesTextEdit>
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Số Thí Sinh Tối Đa" FieldName="SoThSinhToiDa" 
                Name="gcSoThSinhToiDa" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings ColumnSpan="3" VisibleIndex="2" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Trạng Thái" FieldName="TrangThai" 
                Name="gcTrangThai" VisibleIndex="5" Width="100px">
                <EditFormSettings VisibleIndex="2" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="6" Caption = "Sửa" Width = "30px">
                <EditButton Visible="True" Text = "Sửa">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" 
                Visible="False" VisibleIndex="6">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã Điểm Thi" FieldName="MaDiemThi" 
                Name="gcMaDiemThi" VisibleIndex="0">
                <EditFormSettings VisibleIndex="3" />
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>



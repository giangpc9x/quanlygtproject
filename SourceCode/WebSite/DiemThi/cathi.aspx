<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="cathi.aspx.cs" Inherits="DiemThi_cathi" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">

<script type="text/javascript">
function StartDelete() 
{
    if (gvCaThi.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvCaThi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvCaThi.PerformCallback("Update");
}
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {
	gvCaThi.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvCaThi" ClientInstanceName = "gvCaThi" 
        Width = "100%" KeyFieldName = "MaCaThi" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvCaThi_RowValidating" 
        onrowinserting="gvCaThi_RowInserting" 
        onrowupdating="gvCaThi_RowUpdating" 
        oncustomdatacallback="gvCaThi_CustomDataCallback" 
        oncustomcallback="gvCaThi_CustomCallback"> 
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
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" 
                Width="25px">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
                <HeaderStyle HorizontalAlign="Center">
                <Paddings PaddingBottom="1px" PaddingTop="1px" />
                </HeaderStyle>
                <HeaderTemplate>
                    <input onclick="gvCaThi.SelectAllRowsOnPage(this.checked);" 
                        style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này" 
                        type="checkbox"></input>
                </HeaderTemplate>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã Ca Thi" FieldName="MaCaThi" 
                Name="gtxtMaCaThi" VisibleIndex="1" Width="90px">
                <PropertiesTextEdit ClientInstanceName="gtxtMaCaThi">
                </PropertiesTextEdit>              
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Đợt Thi" FieldName="MaDotThi" 
                Name="gcMaDotThi" VisibleIndex="2" Width="50px">
                <PropertiesComboBox DataMember="MaDotThi" ValueType="System.String" 
                    ValueField="MaDotThi">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Dot Thi" FieldName="MaDotThi" Name="gvdotthi" />
                    </Columns>
                </PropertiesComboBox>              
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="Giờ Bắt Đầu" FieldName="GioBatDau" 
                Name="gcGioBatDau" VisibleIndex="3" Width="90px">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings ColumnSpan="3" VisibleIndex="3" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mô Tả" FieldName="MoTa" Name="gcMoTa" 
                VisibleIndex="4">        
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn Caption="Sửa" VisibleIndex="5" Width="30px">
                <EditButton Text="Sửa" Visible="True">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" Visible="False" VisibleIndex="6">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


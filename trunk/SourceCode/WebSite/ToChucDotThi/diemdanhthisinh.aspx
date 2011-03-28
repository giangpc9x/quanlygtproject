<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="diemdanhthisinh.aspx.cs" Inherits="ToChucDotThi_diemdanhthisinh" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">




<script type="text/javascript">
function StartDelete() 
{
    if (gvKetQuaThi.GetSelectedRowCount()) 
    {
        if (confirm('Xác nhận xóa dữ liệu'))
            gvKetQuaThi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
    }
    else
        alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');    
}
function GetUpdateResult(errorText) 
{
    if (errorText != "")
        alert(errorText);
    gvKetQuaThi.PerformCallback("Update");
}
</script>

<div style ="width:90px; float:left; padding-bottom:5px;">
    <dxe:ASPxButton ID="btnThemMoi" ClientInstanceName = "btnThemMoi" runat="server" 
         Text="Thêm Mới" Width = "90px" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	gvKetQuaThi.AddNewRow();
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
    <dxwgv:ASPxGridView ID="gvKetQuaThi" ClientInstanceName = "gvKetQuaThi" 
        Width = "100%" KeyFieldName = "SoDeThi" 
        runat="server" AutoGenerateColumns="False" 
        onrowvalidating="gvKetQuaThi_RowValidating" 
        onrowinserting="gvKetQuaThi_RowInserting" 
        onrowupdating="gvKetQuaThi_RowUpdating" 
        oncustomdatacallback="gvKetQuaThi_CustomDataCallback" 
        oncustomcallback="gvKetQuaThi_CustomCallback"> 
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager>
            <Summary Text="Trang {0}/{1} ({2} dòng)" />
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" Mode="EditForm" 
            PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" 
            PopupEditFormWidth="600px" />
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin Kết Qủa Thi" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width = "25px">
             <HeaderTemplate>
                     <input type="checkbox" onclick="gvKetQuaThi.SelectAllRowsOnPage(this.checked);" style="vertical-align:middle;" title="Chọn/Bỏ chọn tất cả dòng trên trang này"></input>
                 </HeaderTemplate>
                 <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" 
                    HorizontalAlign="Center">
<Paddings PaddingTop="1px" PaddingBottom="1px"></Paddings>
                </HeaderStyle>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Số Đề Thi" Name = "gtxtSoDeThi" FieldName="SoDeThi" 
               VisibleIndex="1" Width="90px">
               
                <PropertiesTextEdit ClientInstanceName="gtxtSoDeThi">
                    
                </PropertiesTextEdit>
               
                <EditFormSettings VisibleIndex="0" CaptionLocation="Near" ColumnSpan="2" 
                    RowSpan="3" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Mã Thi Sinh" FieldName="MaTS" 
                Name="gcMaTS" VisibleIndex="2" Width="90px">
                <PropertiesComboBox ValueField="MaTS" ValueType="System.String">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Thi Sinh" FieldName="MaTS" Name="gcboMaTS" />
                    </Columns>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="2" VisibleIndex="1" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataCheckColumn Caption="Điểm Danh" FieldName="DiemDanh" 
                Name="gcDiemDanh" VisibleIndex="3" Width="90px">
                <PropertiesCheckEdit DisplayTextChecked="có dự thi" 
                    DisplayTextUnchecked="Không dự thi" EnableClientSideAPI="True" 
                    EnableDefaultAppearance="False">
                </PropertiesCheckEdit>
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings ColumnSpan="2" VisibleIndex="2" />
            </dxwgv:GridViewDataCheckColumn>
            <dxwgv:GridViewDataCheckColumn Caption="Kết Qủa Thi" FieldName="KetQuaThi" 
                Name="gcKetQuaThi" VisibleIndex="4" Width="90px">
                <PropertiesCheckEdit DisplayTextChecked="có" DisplayTextUnchecked="không">
                </PropertiesCheckEdit>
               
                <EditFormSettings ColumnSpan="2" VisibleIndex="2" />
               
            </dxwgv:GridViewDataCheckColumn>
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


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
      
        <SettingsEditing EditFormColumnCount="3" />
      
        <SettingsText EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" 
            CommandUpdate="Lưu" PopupEditFormCaption="Thông Tin Điểm Thi" 
            ConfirmDelete="Xác nhận xóa dữ liệu ?" />
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" 
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
               VisibleIndex="1" Width="50px">
               
                <EditFormSettings VisibleIndex="1" />
               
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataSpinEditColumn Caption="SL" FieldName="SoThSinhToiDa" 
                Name="gcSoThSinhToiDa" ToolTip="So luong thi sinh trong phong" VisibleIndex="2" 
                Width="40px">
                <PropertiesSpinEdit DisplayFormatString="g">
                </PropertiesSpinEdit>
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings VisibleIndex="2" />
            </dxwgv:GridViewDataSpinEditColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Điểm Thi" FieldName="DiaChi" 
                Name="gcMaDiemThi" VisibleIndex="3">
                <PropertiesComboBox DataMember="MaDiemThi" ValueType="System.String" 
                    ValueField="MaDiemThi">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Tên điểm thi" FieldName="DiaChi" 
                            Name="gcboDiemThi" />
                    </Columns>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="3" VisibleIndex="0" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mô Tả" FieldName="MoTa" Name="gcMoTa" 
                VisibleIndex="4" Width="100px">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                </PropertiesTextEdit>
                <EditFormSettings ColumnSpan="3" VisibleIndex="4" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataCheckColumn Caption="Trạng Thái" FieldName="TrangThai" 
                Name="gcTrangThai" VisibleIndex="5" Width="50px">
                <PropertiesCheckEdit DisplayTextChecked="Sử dụng" 
                    DisplayTextUnchecked="Không sử dụng">
                </PropertiesCheckEdit>
                <EditFormSettings VisibleIndex="3" />
            </dxwgv:GridViewDataCheckColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="6" Caption = "Sửa" Width = "30px">
                <EditButton Visible="True" Text = "Sửa">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" 
                Visible="False" VisibleIndex="7">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>



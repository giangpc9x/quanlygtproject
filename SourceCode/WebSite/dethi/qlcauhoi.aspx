<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoi.aspx.cs" Inherits="dethi_qlcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
    
    <dxwgv:ASPxGridView ID="gvcauhoi" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="gvcauhoi" 
        KeyFieldName="MaCauHoi" onrowinserting="gvcauhoi_RowInserting" 
        onrowupdating="gvcauhoi_RowUpdating" onrowvalidating="gvcauhoi_RowValidating">
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                <clearfilterbutton visible="True">
                </clearfilterbutton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã câu hỏi" FieldName="MaCauHoi" 
                Name="gtxtMaCauHoi" VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nội dung câu hỏi" FieldName="NoiDung" 
                Name="gcNoiDungCauHoi" VisibleIndex="2" Width="150px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Hình ảnh" FieldName="HinhAnh" 
                Name="gcHinhAnh" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Loại Câu Hỏi" FieldName="TenLoai" 
                Name="gcboLoaiCauHoi" VisibleIndex="4" Width="100px">
                <propertiescombobox datamember="MaloaiCauHoi" valuetype="System.String"></propertiescombobox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mã câu lựa chọn" 
                FieldName="MaCauLuaChon" Name="gcMaCauLuaChon" VisibleIndex="5">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nội dung câu lựa chọn" 
                FieldName="NoiDungCLC" Name="gcNoiDungCLC" VisibleIndex="6" Width="150px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataCheckColumn Caption="Đáp án" FieldName="DapAn" 
                Name="gcDapAn" VisibleIndex="7">
            </dxwgv:GridViewDataCheckColumn>
            <dxwgv:GridViewDataTextColumn Caption="Sửa" VisibleIndex="8" Width="30px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" Visible="False" VisibleIndex="9">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlchitietcauhoi.aspx.cs" Inherits="DeThi_qlchitietcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dxuc" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">












<table><tr><td colspan ="3"> 
    <dxe:ASPxComboBox ID="cboLoaiCauHoi" runat="server">
    </dxe:ASPxComboBox>
</td></tr>
<tr><td>
    <dxe:ASPxLabel ID="lbNoiDung" runat="server" Text="Câu hỏi">
    </dxe:ASPxLabel>
</td><td colspan ="2"> 
    <dxe:ASPxTextBox ID="txtNoiDung" runat="server" Width="300px">
    </dxe:ASPxTextBox>
</td></tr>
<tr><td>
    <dxe:ASPxImage ID="imHinhAnh" runat="server">
    </dxe:ASPxImage>
</td><td colspan ="2"> 
    <dxuc:ASPxUploadControl ID="uplFile" runat="server">
    </dxuc:ASPxUploadControl> </td></tr>
    <tr><td>
        <dxe:ASPxLabel ID="lbCauLuaChon" runat="server" Text="Câu lựa chọn">
        </dxe:ASPxLabel>
    </td><td>
        <dxe:ASPxTextBox ID="txtCauLuaChon" runat="server" Width="300px">
        </dxe:ASPxTextBox>
    </td><td>
        <dxe:ASPxRadioButton ID="rbtDapAn" runat="server" GroupName="DapAn">
        </dxe:ASPxRadioButton>
    </td></tr>
     <tr><td>
        <dxe:ASPxLabel ID="lbCauLuaChon1" runat="server" Text="Câu lựa chọn">
        </dxe:ASPxLabel>
    </td><td>
        <dxe:ASPxTextBox ID="txtCauLuaChon1" runat="server" Width="300px">
        </dxe:ASPxTextBox>
    </td><td>
        <dxe:ASPxRadioButton ID="rbtDapAn1" runat="server" GroupName="DapAn">
        </dxe:ASPxRadioButton>
    </td></tr>
     <tr><td>
        <dxe:ASPxLabel ID="lbCauLuaChon2" runat="server" Text="Câu lựa chọn">
        </dxe:ASPxLabel>
    </td><td>
        <dxe:ASPxTextBox ID="txtCauLuaChon2" runat="server" Width="300px">
        </dxe:ASPxTextBox>
    </td><td>
        <dxe:ASPxRadioButton ID="rbtDapAn2" runat="server" GroupName="DapAn">
        </dxe:ASPxRadioButton>
    </td></tr>
     <tr><td>
        <dxe:ASPxLabel ID="lbCauLuaChon3" runat="server" Text="Câu lựa chọn">
        </dxe:ASPxLabel>
    </td><td>
        <dxe:ASPxTextBox ID="txtCauLuaChon3" runat="server" Width="300px">
        </dxe:ASPxTextBox>
    </td><td>
        <dxe:ASPxRadioButton ID="rbtDapAn3" runat="server" GroupName="DapAn">
        </dxe:ASPxRadioButton>
    </td></tr>
    <tr><td>
        <dxe:ASPxButton ID="btnLuu" runat="server" Text="Lưu" Width="90px" 
            onclick="btnLuu_Click">
        </dxe:ASPxButton>
    </td><td> <dxe:ASPxButton ID="btnHuy" runat="server" Text="Hủy" Width="90px">
        </dxe:ASPxButton></td>
        <td> </td></tr>


</table>




















</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


﻿<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="testnhap2aspx.aspx.cs" Inherits="testnhap2aspx" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxDataView" tagprefix="dxdv" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
    <asp:DataList ID="listDataList1" runat="server">
        <ItemTemplate>
            <table class="style1" width="800px">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="100px">
                        &nbsp;</td>
                    <td width="700px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="100px">
                        &nbsp;</td>
                    <td width="700px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="100px">
                        &nbsp;</td>
                    <td width="700px">
                        <asp:Image ID="Image1" runat="server" 
                         />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxe:ASPxRadioButtonList ID="radCauLuaChon" runat="server">
                        </dxe:ASPxRadioButtonList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


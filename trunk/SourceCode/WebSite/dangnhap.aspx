<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dangnhap.aspx.cs" Inherits="dangnhap" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 100%;
            margin-top: 10%;
        }
        .style3
        {
            text-align: left;
        }
        .style4
        {
            width: 500px;
        }
        .style6
        {
            text-align: right;
            height: 30px;
        }
        .style7
        {
            text-align: justify;
            height: 30px;
        }
        .style9
        {
            text-align: left;
            font-weight: bold;
            color: #0000FF;
            font-size: x-large;
            height: 38px;
        }
        .style10
        {
            text-align: justify;
        }
        .style11
        {
            height: 30px;
        }
    </style>
</head>
<body alink="#ffffff">
    <form id="form1" runat="server">
    <br />
    <table class="style2">
        <tr>
            <td class="style3">
                <table class="style4">
                    <tr>
                        <td>
                            <table class="style4">
                                <tr>
                                    <td class="style9" colspan="3">
                                        Đăng Nhập Hệ Thống</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <dxe:ASPxLabel ID="lblthongbao" runat="server" ForeColor="Red">
                                        </dxe:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" width="280px">
                                        Tên Đăng Nhập</td>
                                    <td width="20px" class="style11">
                                        </td>
                                    <td class="style7" width="200px">
                                        <dxe:ASPxTextBox ID="txttendangnhap" runat="server" Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6" width="280px">
                                        Mật Khẩu</td>
                                    <td width="20px" class="style11">
                                        </td>
                                    <td class="style7" width="200px">
                                        <dxe:ASPxTextBox ID="txtmatkhau" runat="server" Password="True" Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td width="20px">
                                        &nbsp;</td>
                                    <td class="style10" width="200px">
                                        <dxe:ASPxButton ID="btndangnhap" runat="server" onclick="btndangnhap_Click" 
                                            Text="Đăng Nhập">
                                        </dxe:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

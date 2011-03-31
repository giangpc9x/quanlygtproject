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
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            width: 500px;
        }
        .style5
        {
            width: 250px;
        }
        .style6
        {
            width: 250%;
        }
        .style7
        {
            text-align: justify;
        }
        .style8
        {
            text-align: justify;
        }
        .style9
        {
            text-align: right;
        }
        .style10
        {
            text-align: right;
        }
    </style>
</head>
<body alink="#ffffff">
    <form id="form1" runat="server">
    <table class="style2">
        <tr>
            <td class="style3">
                <table class="style4">
                    <tr>
                        <td>
                            <table class="style4">
                                <tr>
                                    <td colspan="2" valign="middle">
                                        LOG IN</td>
                                </tr>
                                <tr>
                                    <td width="250px">
                                        <table class="style5">
                                            <tr>
                                                <td class="style9">
                                                    User Name</td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    Pass Word</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="250px">
                                        <table class="style6">
                                            <tr>
                                                <td class="style7">
                                                    <dxe:ASPxTextBox ID="ASPxTextBoxusrename" runat="server" Width="170px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style8">
                                                    <dxe:ASPxTextBox ID="ASPxTextBoxpass" runat="server" Width="170px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" width="500px">
                                        <table class="style4">
                                            <tr>
                                                <td>
                                                    <table class="style4">
                                                        <tr>
                                                            <td width="200px">
                                                                &nbsp;</td>
                                                            <td width="100px">
                                                                <dxe:ASPxButton ID="ASPxButtonlogin" runat="server" 
                                                                    onclick="ASPxButtonlogin_Click" Text="LOG IN">
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td width="200px">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
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

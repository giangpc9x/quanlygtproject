<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DB_Access.ascx.cs" Inherits="WebUserControl" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Panel ID="Panel1" runat="server" Width="428px" BorderColor="Gray" BorderStyle="Double">
    <table style="width: 100%; height: 100%;">
        <tr>
            <td style="height: 20px; background-color: gainsboro" align="center">
                Cấu hình SQL Database Server</td>
        </tr>
        <tr>
            <td align="center" style="height: 20px; background-color: floralwhite">
                <asp:Label ID="lb_mess" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td align="center">
                <table style="width: 100%; height: 100%;">
                    <tr align = "left">
                        <td style="width: 140px" align="right">
                            Password cấu hình :
                        </td>
                        <td align = "left">
                            <asp:TextBox ID="txt_conf" runat="server" Width="95%" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 140px" align="right">
                            Server :</td>
                        <td align = "left">
                            <asp:TextBox ID="Txt_Server" runat="server" Width="95%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 140px" align="right">
                            Database :</td>
                        <td align = "left">
                            <asp:TextBox ID="txt_db" runat="server" Width="95%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 140px" align="right">
                            UserID :</td>
                        <td align = "left">
                            <asp:TextBox ID="txt_uid" runat="server" Width="95%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 140px" align="right">
                            Password :</td>
                        <td align = "left">
                            <asp:TextBox ID="txt_pwd" runat="server" Width="95%" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 140px" align="right">
                            &nbsp;</td>
                        <td align = "left">
                             <div style ="width:80px; float:left;">
                              <dxe:ASPxButton ID="btnTest" Width = "80px" runat="server" onclick="btnTest_Click" Text="Test">
</dxe:ASPxButton>
</div>
<div style = "float:left;padding-left:10px;width:80px;">
<dxe:ASPxButton ID="btnSave" Width = "80px" runat="server" onclick="btnSave_Click" Text="Save">
</dxe:ASPxButton></div>
</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>



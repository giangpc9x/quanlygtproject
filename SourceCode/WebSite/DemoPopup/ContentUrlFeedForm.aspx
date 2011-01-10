<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentUrlFeedForm.aspx.cs" Inherits="PopupControl_ContentUrldata2" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
    <head runat="server">
        <title>Feedback form</title>
    </head>
    <body style="padding: 15px; margin:0px; background-color: #EDF3F4; background-image: none;">
        <form id="MailForm" runat="server" action="" style="width: 100%; height: 100%; padding:0px; margin:0px;">
            <table id="FeedBackTable" style="width: 100%; height: 100%; padding: 0px; margin: 0px;" border="0" cellpadding="2" cellspacing="0"><tr>
                <td style="width: 25px; height: 25px; padding-right: 5px;" valign="middle"><dxe:ASPxLabel ID="LbFrom" runat="server" Text="Email:" Font-Bold="False" ForeColor="#6E6E6E" Font-Names="Tahoma" Font-Size="9pt" /></td>
                <td style="height: 25px;" valign="middle"><dxe:ASPxTextBox ID="TbFrom" runat="server" Width="100%" EnableViewState="False">
                    <ClientSideEvents GotFocus="function(s, e) {
	s.SelectAll();
}" />
                </dxe:ASPxTextBox></td>
            </tr><tr>
                <td style="width: 25px; padding-right: 5px;" valign="middle"><dxe:ASPxLabel ID="LbSubject" runat="server" Text="Subject:" Font-Bold="False" ForeColor="#6E6E6E" Font-Names="Tahoma" Font-Size="9pt" /></td>
                <td style="height: 25px;" valign="middle"><dxe:ASPxTextBox ID="TbSubject" runat="server" Width="100%" EnableViewState="False">
                    <ClientSideEvents GotFocus="function(s, e) {
	s.SelectAll();
}" />
                </dxe:ASPxTextBox></td>
            </tr><tr>
                <td style="width: 25px; padding-right: 5px;" valign="top"><dxe:ASPxLabel ID="LbMessage" runat="server" Text="Message:" Font-Bold="False" ForeColor="#6E6E6E" Font-Names="Tahoma" Font-Size="9pt" /></td>
                <td>
                    <script type="text/javascript">
                        function OnMessageInit(s, e) {
                            var textarea = s.GetInputElement();
                            if (_aspxIsExists(textarea)) {
                                textarea.style.width = "100%";
                                textarea.style.height = "100%";
                            }
                        };
                    </script>
                    <dxe:ASPxMemo ID="TbMessage" runat="server" Height="100%" Width="100%" 
                        EnableViewState="False">
                        <ClientSideEvents GotFocus="function(s, e) { s.SelectAll(); }" Init="OnMessageInit" />
                    </dxe:ASPxMemo>
                </td>
            </tr><tr>
                <td><div class="Spacer" style="width: 25px; height: 30px;"></div></td>
                <td style="height: 30px;" align="right"><dxe:ASPxButton ID="BtnSend" runat="server" Text="Send" OnClick="BtnSend_Click" Width="61px" /></td>
            </tr></table>
        </form>
    </body>
</html>

<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Templates.aspx.cs" Inherits="PopupControl_Templates" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script type="text/javascript"><!--
function SetPCVisible(doShow) {
    var popupControl = GetPopupControl();
    if (doShow) {
        popupControl.Show();
    } 
    else {
        popupControl.Hide();
    }
}
function SetHelpVisible(doShow) {
    var pHelp = document.getElementById('pHelp');
    if (pHelp.className == 'Show' || doShow == false)
        pHelp.className = 'Hide';
    else
        pHelp.className = 'Show';
}
function SetColor(colorName) {
    var link = document.getElementById('lColorCSS');
    var linkSrc = link.href.substring(0, link.href.lastIndexOf('/'));
    link.href = linkSrc + '/' + colorName + 'Color.css';
}        
function AddHover(element) {
    element.className = element.className + ' Hover';
}        
function RemoveHover(element) {
    element.className = element.className.replace(' Hover', '');
}        
function GetPopupControl() {
    return ASPxPopupClientControl;
}        
//--></script>
<dxpc:ASPxPopupControl ClientInstanceName="ASPxPopupClientControl" SkinId="None" ShowFooter="True" ShowOnPageLoad="True" PopupHorizontalAlign="Center" PopupVerticalAlign="TopSides" CssClass="PopupControlTemplate" AllowDragging="True" CloseAction="None" PopupElementID="blueArea" ID="ASPxPopupControl1" EnableViewState="False" runat="server" PopupHorizontalOffset="0" PopupVerticalOffset="0" EnableHierarchyRecreation="True">
<%-- BeginRegion Templates --%>
    <HeaderTemplate>
        <table cellpadding="1" cellspacing="0" border="0" style="width: 100%;">
            <tr>
                <td style="width: 100%;">Templates</td>
                <td><img class="HideBorder" onclick="SetHelpVisible(true);" onmousedown="event.cancelBubble = true;" alt="" src="Images/Buttons/pcHelp.gif" style="width: 15px; height: 14px; cursor: pointer; cursor: hand;" /></td>
                <td><img class="HideBorder" onclick="SetPCVisible(false);" onmousedown="event.cancelBubble = true;" alt="" src="Images/Buttons/pcClose.gif" style="width: 15px; height: 14px; cursor: pointer; cursor: hand;" /></td>
            </tr>
        </table>    
    </HeaderTemplate>
    <FooterTemplate>
        <table cellpadding="4" cellspacing="0" border="0" style="width: 100%;">
            <tr>
                <th align="right" style="width: 100%; font-weight: normal;">Color:</th>
                <td style="padding: 4px;"><img class="SelectedGray Cursor" onmouseover="AddHover(this);" onmouseout="RemoveHover(this);" onclick="SetColor('Gray');" alt="" src="Images/Colors/GrayColor.gif" style="width: 12px; height: 12px;" /></td>
                <td style="padding: 4px;"><img class="SelectedYellow Cursor" onmouseover="AddHover(this);" onmouseout="RemoveHover(this);" onclick="SetColor('Yellow');" alt="" src="Images/Colors/YellowColor.gif" style="width: 12px; height: 12px;" /></td>
                <td style="padding: 4px;"><img class="SelectedBlue Cursor" onmouseover="AddHover(this);" onmouseout="RemoveHover(this);" onclick="SetColor('Blue');" alt="" src="Images/Colors/BlueColor.gif" style="width: 12px; height: 12px;" /></td>
                <td style="padding: 4px;"><img class="SelectedGreen Cursor" onmouseover="AddHover(this);" onmouseout="RemoveHover(this);" onclick="SetColor('Green');" alt="" src="Images/Colors/GreenColor.gif" style="width: 12px; height: 12px;" /></td>
                <td style="padding: 4px;"><img class="SelectedPink Cursor" onmouseover="AddHover(this);" onmouseout="RemoveHover(this);" onclick="SetColor('Pink');" alt="" src="Images/Colors/PinkColor.gif" style="width: 12px; height: 12px;" /></td>
            </tr>
        </table>
        <p id="pHelp" style="background-color: #FFFBBA; border: 1px solid #BAAE6D; margin: 4px; color: #9E8A4F; padding: 4px;" class="Hide">Click a colored box above to select the background color for the window's content.</p>
    </FooterTemplate>
<%-- EndRegion --%>
    <ContentStyle>
        <Paddings Padding="0px" />
    </ContentStyle>
    <ContentCollection>
        <dxpc:PopupControlContentControl runat="server">
            <asp:Panel ID="Panel1" runat="server" CssClass="PopupContentControls">
                <p class="ClearIndent">This sample demonstrates the use of template technology within the <br /><b>ASPxPopupControl</b>. The look of each element of a popup window can be completely modified by creating a specific template which defines how the element will be rendered by a client browser.</p>
            </asp:Panel>
        </dxpc:PopupControlContentControl>
    </ContentCollection>
    <FooterStyle Wrap="True">
        <Paddings PaddingLeft="6px" PaddingBottom="6px" PaddingRight="6px" PaddingTop="6px" />
    </FooterStyle>
    <HeaderStyle>
        <Paddings PaddingLeft="9px" />
    </HeaderStyle>
</dxpc:ASPxPopupControl>
<%-- BeginRegion ASPxRoundPanel --%>
<dxrp:ASPxRoundPanel Width="100%" EnableViewState="False" ShowHeader="False" ID="ASPxRoundPanel1" runat="server" HorizontalAlign="Center">
    <PanelCollection>
        <dxrp:PanelContent ID="PanelContent2" runat="server">
            <table id="blueArea" cellpadding="0" cellspacing="0" width="100%" border="0"><tr><td><div class="Spacer" style="width: 0px; height: 278px;"></div></td><td align="center" class="UserHelpTopic">Click here to invoke a popup window</td></tr></table>
        </dxrp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>
</asp:Content>

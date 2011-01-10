<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Features.aspx.cs" Inherits="PopupControl_Features" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="Server">
<script type="text/javascript"><!--
function SetPCVisible(value) {
    var popupControl = GetPopupControl();
    if(value)
        popupControl.Show();
    else
        popupControl.Hide();
}
function SetImageState(value) {
    var img = document.getElementById('imgButton');
    var imgSrc = value ? 'Images/Buttons/pcButtonPress.gif' : 'Images/Buttons/pcButton.gif';
    img.src = imgSrc;
}
function GetPopupControl() {
    return ASPxPopupClientControl;
}
//--></script>
<dxpc:ASPxPopupControl ClientInstanceName="ASPxPopupClientControl" Width="260px" ID="pcMain" ShowFooter="True" FooterText="Runtime: 155 min" PopupElementID="imgButton" HeaderText="Gladiator" runat="server" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below" EnableHierarchyRecreation="True">
    <ContentCollection>
        <dxpc:PopupControlContentControl runat="server">
            <asp:Panel ID="Panel1" runat="server">
                <table border="0" cellpadding="4" cellspacing="0"><tr>
                    <td valign="top"><dxe:ASPxImage ImageUrl="~/DemoPopup/Images/Gladiator.jpg" ID="Image1" runat="server" /></td>
                    <td><div class="Spacer" style="width: 4px;"></div></td>
                    <td valign="top" style="color: #666666;"><span class="Gray"><b>Directed by:</b> Ridley Scott<br /><b>Year:</b> 2000</span><br /><br /> <div style="font-family: Tahoma; font-size: 10px; color: #666666;">When a Roman general is betrayed and his family murdered by a corrupt prince, he comes to Rome as a gladiator to seek revenge.</div></td>
                </tr></table>
            </asp:Panel>
        </dxpc:PopupControlContentControl>
    </ContentCollection>
<%-- BeginRegion ClientSideEvents --%>
    <ClientSideEvents CloseUp="function(s, e) {
    SetImageState(false);
    }" PopUp="function(s, e) {
    SetImageState(true);
    }" />
<%-- EndRegion --%>
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
    <table border="0" cellpadding="0" cellspacing="0"><tr><td valign="top" style="width: 100%;">
<%-- EndRegion --%>
<%-- BeginRegion ASPxRoundPanel --%>
    <dxrp:ASPxRoundPanel EnableViewState="False" Width="100%" ShowHeader="False" ID="ASPxRoundPanel1" runat="server">
        <PanelCollection>
            <dxrp:PanelContent ID="PanelContent2" runat="server">
                    <span runat="server" EnableViewState="False" ID="lblCursor" class="Cursor"><img id="imgButton" alt="" src="Images/Buttons/pcButton.gif" style="width: 103px; height: 28px;" /></span>
                    <div class="Spacer" style="height: 518px;"></div>
            </dxrp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
<%-- EndRegion --%>    
<%-- BeginRegion Static Html --%>
    </td>
    <td valign="top" class="ControlActionSpacing">
<%-- EndRegion --%>
<%-- BeginRegion Control Panel properties --%>
<dxrp:ASPxRoundPanel ShowHeader="False" ID="ASPxRoundPanel2" runat="server">
    <PanelCollection>
        <dxrp:PanelContent ID="PanelContent1" runat="server">            
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr>
                    <td class="ActionMainLabel"><dxe:ASPxLabel EnableViewState="False" ID="Label5" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Layout" /></td>
                </tr><tr><td style="padding-left: 10px;" valign="top">
                    <table cellpadding="2" cellspacing="0" border="0"><tr>
                        <td><dxe:ASPxCheckBox ID="cbShowCloseButton" runat="server" AutoPostBack="True" Checked="True" CssClass="DemoCheckBox" OnCheckedChanged="cbShowCloseButton_CheckedChanged" /></td>
                        <td class="InfoPanelLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblShowCloseButton" runat="server" Text="ShowCloseButton" AssociatedControlID="cbShowCloseButton" /></td>
                        <td class="InfoPanelLabel"><dxe:ASPxCheckBox ID="cbShowShadow" runat="server" AutoPostBack="True" Checked="True" CssClass="DemoCheckBox" OnCheckedChanged="cbShowShadow_CheckedChanged" /></td>
                        <td class="InfoPanelLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblShowShadow" runat="server" Text="ShowShadow" AssociatedControlID="cbShowShadow" /></td>
                    </tr><tr>
                        <td><dxe:ASPxCheckBox ID="cbShowHeader" runat="server" AutoPostBack="True" Checked="True" CssClass="DemoCheckBox" OnCheckedChanged="cbShowHeader_CheckedChanged" /></td>
                        <td class="InfoPanelLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblShowHeader" runat="server" Text="ShowHeader" AssociatedControlID="cbShowHeader" /></td>
                        <td class="InfoPanelLabel"><dxe:ASPxCheckBox ID="cbShowFooter" runat="server" AutoPostBack="True" Checked="True" CssClass="DemoCheckBox" OnCheckedChanged="cbShowFooter_CheckedChanged" /></td>
                        <td class="InfoPanelLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblShowFooter" runat="server" Text="ShowFooter" AssociatedControlID="cbShowFooter" /></td>
                    </tr></table>
                    <table cellpadding="2" cellspacing="0" border="0" class="InfoPanelIndent TableCheckBoxLeftIndentCorrect"><tr>
                        <td class="ActionLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupHorizontalAlign" runat="server" Text="PopupHorizontalAlign:" /></td>
                        <td align="right">
                            <dxe:ASPxComboBox Width="124px" SelectedIndex="2" ID="ddlPopupHorizontalAlign" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPopupHorizontalAlign_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="NotSet" Text="NotSet" />
                                    <dxe:ListEditItem Value="OutsideLeft" Text="OutsideLeft" />
                                    <dxe:ListEditItem Value="LeftSides" Text="LeftSides" />
                                    <dxe:ListEditItem Value="Center" Text="Center" />
                                    <dxe:ListEditItem Value="RightSides" Text="RightSides" />
                                    <dxe:ListEditItem Value="OutsideRight" Text="OutsideRight" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupVerticalAlign" runat="server" Text="PopupVerticalAlign:" /></td>
                        <td align="right">
                            <dxe:ASPxComboBox SelectedIndex="5" Width="124px" ID="ddlPopupVerticalAlign" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPopupVerticalAlign_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="NotSet" Text="NotSet" />
                                    <dxe:ListEditItem Value="Above" Text="Above" />
                                    <dxe:ListEditItem Value="TopSides" Text="TopSides" />
                                    <dxe:ListEditItem Value="Middle" Text="Middle" />
                                    <dxe:ListEditItem Value="BottomSides" Text="BottomSides" />
                                    <dxe:ListEditItem Value="Below" Text="Below" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel ActionItemIndent"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupHorizontalOffset" runat="server" Text="PopupHorizontalOffset (px):" AssociatedControlID="tbPopupHorizontalOffset" /></td>
                        <td align="right" class="ActionItemIndent"><dxe:ASPxTextBox ID="tbPopupHorizontalOffset" runat="server" CssClass="DemoEdit" Width="50px" Text="0" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupVerticalOffset" runat="server" Text="PopupVerticalOffset (px):" AssociatedControlID="tbPopupVerticalOffset" /></td>
                        <td align="right"><dxe:ASPxTextBox ID="tbPopupVerticalOffset" runat="server" CssClass="DemoEdit" Width="50px" Text="0" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel ActionItemIndent"><dxe:ASPxLabel EnableViewState="False" ID="lblOpacity" runat="server" Text="Opacity (%):" AssociatedControlID="tbOpacity" /></td>
                        <td align="right" class="ActionItemIndent"><dxe:ASPxTextBox ID="tbOpacity" runat="server" CssClass="DemoEdit" Width="50px" Text="100" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr></table></td>
                </tr><tr>
                    <td class="ActionMainLabel ActionGroupIndent"><dxe:ASPxLabel EnableViewState="False" ID="Label6" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Behavior" /></td>
                </tr><tr><td style="padding-left: 10px;" valign="top">
                    <table cellpadding="2" cellspacing="0" border="0"><tr>
                        <td class="ActionLabel"><dxe:ASPxCheckBox ID="cbEnableAnimation" runat="server" AutoPostBack="True" Checked="True" CssClass="DemoCheckBox" OnCheckedChanged="cbEnableAnimation_CheckedChanged" /></td>
                        <td colspan="2" class="InfoPanelLabel" style="width: 100%;"><dxe:ASPxLabel EnableViewState="False" ID="lblEnableAnimation" runat="server" Text="EnableAnimation" AssociatedControlID="cbEnableAnimation" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel ActionItemIndent"><dxe:ASPxCheckBox ID="cbAllowDragging" runat="server" AutoPostBack="True" CssClass="DemoCheckBox" OnCheckedChanged="cbAllowDragging_CheckedChanged" /></td>
                        <td colspan="2" align="left" class="InfoPanelLabel ActionItemIndent"><dxe:ASPxLabel EnableViewState="False" ID="Label1" runat="server" Text="AllowDragging" AssociatedControlID="cbAllowDragging" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td><div class="Spacer"></div></td>
                        <td class="ActionLabel" style="padding-left: 3px;"><dxe:ASPxLabel ID="lblDragElement" runat="server" EnableViewState="False" Text="DragElement:" /></td>
                        <td align="right">
                            <dxe:ASPxComboBox SelectedIndex="0" Width="124px" ID="ddlDragElement" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDragElement_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="Header" Text="Header" />
                                    <dxe:ListEditItem Value="Window" Text="Window" />
                                </Items>
                            </dxe:ASPxComboBox></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel ActionItemIndent"><dxe:ASPxCheckBox ID="cbAllowResize" runat="server" AutoPostBack="True" CssClass="DemoCheckBox" OnCheckedChanged="cbAllowResize_CheckedChanged" /></td>
                        <td colspan="2" class="ActionLabel ActionItemIndent"><dxe:ASPxLabel ID="Label2" runat="server" AssociatedControlID="cbAllowResize" EnableViewState="False" Text="AllowResize" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr>
                    <tr>
                        <td><div class="Spacer"></div></td>
                        <td class="InfoPanelLabel"><dxe:ASPxLabel ID="Label3" runat="server" EnableViewState="False" Text="ResizeMode:" /></td>
                        <td class="InfoPanelLabel" align="right">
                            <dxe:ASPxComboBox SelectedIndex="1" Width="124px" ID="ddlResizeMode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlResizeMode_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="Postponed" Text="Postponed" />
                                    <dxe:ListEditItem Value="Live" Text="Live" />
                                </Items>
                            </dxe:ASPxComboBox></td>
                        <td><div class="Spacer"></div></td>
                    </tr>
                    <tr>
                        <td><div class="Spacer"></div></td>
                        <td class="InfoPanelLabel"><dxe:ASPxLabel ID="Label4" runat="server" EnableViewState="False" Text="ShowSizeGrip:" /></td>
                        <td class="InfoPanelLabel" align="right">
                            <dxe:ASPxComboBox SelectedIndex="0" Width="124px" ID="ddlShowSizeGrip" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlShowSizeGrip_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="Auto" Text="Auto" />
                                    <dxe:ListEditItem Value="True" Text="True" />
                                    <dxe:ListEditItem Value="False" Text="False" />
                                </Items>
                            </dxe:ASPxComboBox></td>
                        <td><div class="Spacer"></div></td>
                    </tr></table>
                    <table cellpadding="2" cellspacing="0" border="0" class="InfoPanelIndent TableCheckBoxLeftIndentCorrect"><tr>
                        <td class="ActionLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblCloseAction" runat="server" Text="CloseAction:" /></td>
                        <td align="right">
                            <dxe:ASPxComboBox SelectedIndex="2" Width="124px" ID="ddlCloseAction" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCloseAction_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="None" Text="None" />
                                    <dxe:ListEditItem Value="CloseButton" Text="CloseButton" />
                                    <dxe:ListEditItem Value="OuterMouseClick" Text="OuterMouseClick" />
                                    <dxe:ListEditItem Value="MouseOut" Text="MouseOut" />
                                </Items>
                            </dxe:ASPxComboBox></td>
                        <td><dxe:ASPxHyperLink ID="hlHide" runat="server" Visible="False" NavigateUrl="javascript:SetPCVisible(false);" CssClass="LinkButton" Text="Hide" /></td>
                    </tr><tr>
                        <td class="ActionLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupAction" runat="server" Text="PopupAction:" /></td>
                        <td align="right">
                            <dxe:ASPxComboBox SelectedIndex="1" Width="124px" ID="ddlPopupAction" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPopupAction_SelectedIndexChanged">
                                <Items>
                                    <dxe:ListEditItem Value="None" Text="None" />
                                    <dxe:ListEditItem Value="LeftMouseClick" Text="LeftMouseClick" />
                                    <dxe:ListEditItem Value="RightMouseClick" Text="RightMouseClick" />
                                    <dxe:ListEditItem Value="MouseOver" Text="MouseOver" />
                                </Items>
                            </dxe:ASPxComboBox></td>
                        <td><dxe:ASPxHyperLink ID="hlShow" runat="server" Visible="False" NavigateUrl="javascript:SetPCVisible(true);" CssClass="LinkButton" Text="Show" /></td>
                    </tr><tr>
                        <td class="ActionLabel ActionItemIndent"><dxe:ASPxLabel EnableViewState="False" ID="lblAppearAfter" runat="server" Text="AppearAfter (ms):" AssociatedControlID="tbAppearAfter" /></td>
                        <td align="right" class="ActionItemIndent"><dxe:ASPxTextBox ID="tbAppearAfter" runat="server" CssClass="DemoEdit" Width="50px" Text="300" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td class="ActionLabel"><dxe:ASPxLabel EnableViewState="False" ID="lblDisappearAfter" runat="server" Text="DisappearAfter (ms):" AssociatedControlID="tbDisappearAfter" /></td>
                        <td align="right"><dxe:ASPxTextBox ID="tbDisappearAfter" runat="server" CssClass="DemoEdit" Width="50px" Text="500" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td colspan="2" align="right"><dxe:ASPxButton ID="Button1" CssClass="DemoButton" runat="server" Text="Apply" OnClick="Button1_Click" Width="70px" /></td>
                        <td><div class="Spacer"></div></td>
                    </tr><tr>
                        <td colspan="3"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupHorizontalOffsetError" runat="server" Font-Size="9px" ForeColor="Red" Text="PopupHorizontalOffset value isn't valid" Visible="False" /></td>
                    </tr><tr>
                        <td colspan="3"><dxe:ASPxLabel EnableViewState="False" ID="lblPopupVerticalOffsetError" runat="server" Font-Size="9px" ForeColor="Red" Text="PopupVerticalOffset value isn't valid" Visible="False" /></td>
                    </tr><tr>
                        <td colspan="3"><dxe:ASPxLabel EnableViewState="False" ID="lblAppearAfterError" runat="server" Font-Size="9px" ForeColor="Red" Text="AppearAfter value isn't valid" Visible="False" /></td>
                    </tr><tr>
                        <td colspan="3"><dxe:ASPxLabel EnableViewState="False" ID="lblDisappearAfterError" runat="server" Font-Size="9px" ForeColor="Red" Text="DisappearAfter value isn't valid" Visible="False" /></td>
                    </tr><tr>
                        <td colspan="3"><dxe:ASPxLabel EnableViewState="False" ID="lblOpacityError" runat="server" Font-Size="9px" ForeColor="Red" Text="Opacity value isn't valid" Visible="False" /></td>
                    </tr></table>
                </td></tr></table>
        </dxrp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>
<%-- BeginRegion Static Html --%>
    </td></tr></table>
<%-- EndRegion --%>
</asp:Content>

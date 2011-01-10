<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ButtonFeatures.aspx.cs" Inherits="Editors_ButtonFeatures" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <table cellspacing="0" cellpadding="0">
        <tr><td>
            <dxrp:ASPxRoundPanel ID="RadioButtonsGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Radio buttons" HorizontalAlign="Center">
                <ContentPaddings PaddingTop="2px" PaddingLeft="22px" PaddingBottom="7px" PaddingRight="22px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellspacing="0" cellpadding="0" style="height: 40px;">
                        <tr><td>
                            <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Checked="True"
                                GroupName="G" Text="Option 1" Width="110px">
                            </dxe:ASPxButton>
                        </td><td><div class="Spacer" style="width: 10px;"></div></td><td>
                            <dxe:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" GroupName="G"
                                Text="Option 2" Width="110px">
                            </dxe:ASPxButton>
                        </td><td><div class="Spacer" style="width: 10px;"></div></td><td>
                            <dxe:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" GroupName="G"
                                Text="Option 3" Width="110px">
                            </dxe:ASPxButton>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
        <tr><td><div class="Spacer" style="height: 14px;"></div></td></tr>
        <tr><td>
            <dxrp:ASPxRoundPanel ID="ClientSideGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Client-side functionality" HorizontalAlign="Center">
                <ContentPaddings PaddingTop="2px" PaddingLeft="22px" PaddingBottom="7px" PaddingRight="22px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellspacing="0" cellpadding="0" style="height: 40px;">
                        <tr><td>
                            <dxe:ASPxButton ID="ASPxButton4" runat="server" AutoPostBack="False" GroupName="G1" Wrap="False"
                                Text="Disable Button" Width="110px">
                                <ClientSideEvents CheckedChanged="
                                function(s, e) {
                	                if (s.GetChecked()) {
	                                    button.SetEnabled(false);
	                                    s.SetText(&quot;Enable Button&quot;);
                                    } else {
	                                    button.SetEnabled(true);
	                                    s.SetText(&quot;Disable Button&quot;);
                                    }
                                }"></ClientSideEvents>
                            </dxe:ASPxButton>
                        </td><td><div class="Spacer" style="width: 10px;"></div></td><td>
                            <dxe:ASPxButton ID="ASPxButton5" runat="server" AutoPostBack="False" ClientInstanceName="button"
                                Text="Button" Width="110px">
                            </dxe:ASPxButton>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
    </table>
</asp:Content>

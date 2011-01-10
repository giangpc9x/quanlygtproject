<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="SpinEdit.aspx.cs" Inherits="Editors_SpinEdit" Theme="Glass" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<%-- BeginRegion Css --%>
<asp:Content ID="Content2" ContentPlaceHolderID="localCssPlaceholder" runat="server">
    <style type="text/css">
        td.spin, td.param {
            height: 46px;
            vertical-align: center;
            padding-left: 18px;
        }
        div.separator {
            height: 5px;
        }
        td.param {
            color: Black;
            padding-left: 16px;
        }
        td.prop {
            height: 16px;
        }
    </style>
</asp:Content>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr><td style="width: 100%;">
            <dxrp:ASPxRoundPanel ID="LargeIncrementButtonsGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Large Increment Buttons">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellspacing="0" cellpadding="0">
                        <tr><td class="spin">
                            <dxe:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" Number="1">
                                <SpinButtons ShowIncrementButtons="False" ShowLargeIncrementButtons="True"></SpinButtons>
                            </dxe:ASPxSpinEdit>
                        </td><td class="param">
                            <table>
                                <tr><td class="prop">ShowIncrementButtons = False</td></tr>
                                <tr><td class="prop">ShowLargeIncrementButtons = True</td></tr>
                            </table>
                        </td></tr>
                    </table>            
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
        <tr><td><div class="separator"></div></td></tr>
        <tr><td style="width: 100%;">
            <dxrp:ASPxRoundPanel ID="AllIncrementButtonsGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Increment + Large Increment Buttons">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellspacing="0" cellpadding="0">
                        <tr><td class="spin">
                            <dxe:ASPxSpinEdit ID="ASPxSpinEdit2" runat="server" Number="10" NumberType="Integer" Increment="2" HorizontalAlign="Right">
                                <Paddings PaddingRight="5px" />
                                <SpinButtons Position="Left" ShowLargeIncrementButtons="True" />
                            </dxe:ASPxSpinEdit>
                        </td><td class="param">
                            <table>
                                <tr><td class="prop">NumberType = Integer</td></tr>
                                <tr><td class="prop">Increment = 2</td></tr>
                                <tr><td class="prop">LargeIncrement = 10</td></tr>
                            </table>
                        </td></tr>
                    </table>
                    </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
        <tr><td><div class="separator"></div></td></tr>
        <tr><td style="width: 100%;">
            <dxrp:ASPxRoundPanel ID="RangeValueGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Range of Values">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellspacing="0" cellpadding="0">
                        <tr><td class="spin">
                            <dxe:ASPxSpinEdit ID="ASPxSpinEdit5" runat="server" Number="13" NumberType="Integer" MinValue="10" MaxValue="16"></dxe:ASPxSpinEdit>
                        </td><td class="param">
                            <table>
                                <tr><td class="prop">NumberType = Integer</td></tr>
                                <tr><td class="prop">MinValue = 10</td></tr>
                                <tr><td class="prop">MaxValue = 16</td></tr>
                            </table>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
        <tr><td><div class="separator"></div></td></tr>
        <tr><td style="width: 100%;">
            <dxrp:ASPxRoundPanel ID="CustomIncrementGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Custom Increment">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellspacing="0" cellpadding="0">
                        <tr><td class="spin">
                            <dxe:ASPxSpinEdit ID="ASPxSpinEdit4" runat="server" Number="55.12" DecimalPlaces="2" Increment="10.253"></dxe:ASPxSpinEdit>
                        </td><td class="param">
                            <table>
                                <tr><td class="prop">DecimalPlaces = 2</td></tr>
                                <tr><td class="prop">Increment = 10.253</td></tr>
                                <tr><td class="prop">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr><td>Page UI Culture =&nbsp;</td><td>
                                            <dxe:ASPxComboBox ID="cmbCultureSelector" runat="server" SelectedIndex="0" Width="100px"
                                                ToolTip="Various decimal separators corresponds to various cultures. ">
                                                <Items>
                                                    <dxe:ListEditItem Value="en-US" Text="English (USA)"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Value="it-IT" Text="Italian"></dxe:ListEditItem>
                                                </Items>
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { document.location.href = '?cult=' + s.GetSelectedItem().value; }" />
                                            </dxe:ASPxComboBox>
                                        </td></tr>
                                    </table>
                                </td></tr>
                            </table>
                        </td></tr>
                    </table>            
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
    </table>
</asp:Content>

<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Button.aspx.cs" Inherits="Editors_Button" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <table cellspacing="0" cellpadding="0" style="width: 100%;">
        <tr><td style="width: 50%;">
            <dxrp:ASPxRoundPanel ID="ImageGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Image" HorizontalAlign="Center">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="15px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellpadding="0" cellspacing="0" style="height: 52px;">
                        <tr><td>
                            <dxe:ASPxButton ID="btnSearch" runat="server" EnableTheming="False" EnableDefaultAppearance="False" AutoPostBack="False" EnableViewState="False">
                                <Image Width="137px" Height="48px" Url="Images/Button/Search/normal.png" UrlHottracked="Images/Button/Search/hover.png" UrlPressed="Images/Button/Search/pressed.png" />
                            </dxe:ASPxButton>
                        </td><td><div class="Spacer" style="width: 13px;"></div></td><td>
                            <dxe:ASPxButton ID="btnBlueBall" runat="server" EnableTheming="False" EnableDefaultAppearance="False" AutoPostBack="False" EnableViewState="False">
                                <Image Width="44px" Height="44px" Url="Images/Button/BlueBall/normal.png" UrlHottracked="Images/Button/BlueBall/hover.png" UrlPressed="Images/Button/BlueBall/pressed.png" />
                            </dxe:ASPxButton>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td><td><div class="Spacer" style="width: 3px;"></div></td><td style="width: 50%;">
            <dxrp:ASPxRoundPanel ID="ImageTextGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Image + Text" HorizontalAlign="Center">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="6px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellpadding="0" cellspacing="0" style="height: 61px;">
                        <tr><td>
                            <dxe:ASPxButton ID="btnIcq" runat="server" EnableTheming="False" Text="Send&nbsp;a&nbsp;message" EnableDefaultAppearance="False" AllowFocus="False" AutoPostBack="False" Width="122px" CssFilePath="Css/Button.css" CssPostfix="icq">
                                <Image Url="Images/Button/Icq/icq.png" Width="16px" Height="16px" />
                            </dxe:ASPxButton>
                        </td><td><div class="Spacer" style="width: 13px;"></div></td><td>
                            <dxe:ASPxButton ID="btnMail" runat="server" EnableTheming="False" Text="Get&nbsp;new&nbsp;mail" EnableDefaultAppearance="False" AllowFocus="False" AutoPostBack="False" ImagePosition="Right" Width="122px" ImageSpacing="5px" CssFilePath="Css/Button.css" CssPostfix="mail">
                                <Image Url="Images/Button/Mail/mail.png" Width="16px" Height="16px" />
                            </dxe:ASPxButton>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
        <tr><td colspan="3"><div class="Spacer" style="height: 14px;"></div></td></tr>
        <tr><td style="width: 50%;">
            <dxrp:ASPxRoundPanel ID="BackgroundImageTextGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Background Image + Text" HorizontalAlign="Center">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="10px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellpadding="0" cellspacing="0" style="height: 57px;">
                        <tr><td>
                            <dxe:ASPxButton ID="ASPxButton1" runat="server" EnableTheming="False" Text="Submit" 
                                EnableDefaultAppearance="False" AutoPostBack="False" ImagePosition="Right" 
                                Width="90px" Height="30px" Cursor="pointer" ForeColor="#FFFFFF">
                                <HoverStyle ForeColor="#FAD9E0" >
                                    <BackgroundImage ImageUrl="Images/Button/Wine/hover.jpg" />
                                </HoverStyle>
                                <PressedStyle ForeColor="#DCB7C8" >
                                    <BackgroundImage ImageUrl="Images/Button/Wine/pressed.jpg" />
                                </PressedStyle>
                                <Paddings PaddingBottom="2px" />
                                <BackgroundImage ImageUrl="Images/Button/Wine/normal.jpg" />
                            </dxe:ASPxButton>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td><td><div class="Spacer" style="width: 3px;"></div></td><td style="width: 50%;">
            <dxrp:ASPxRoundPanel ID="NativeGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-10px" HeaderText="Native" HorizontalAlign="Center">
                <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="12px" PaddingRight="2px" />
                <PanelCollection><dxp:PanelContent>
                    <table cellpadding="0" cellspacing="0" style="height: 55px;">
                        <tr><td>
                            <dxe:ASPxButton ID="btnNative" runat="server" EnableTheming="False" Native="True" Width="80px" Text="OK" AutoPostBack="false" EnableViewState="False"></dxe:ASPxButton>
                        </td></tr>
                    </table>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
    </table>
</asp:Content>

<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="NativeMode.aspx.cs" Inherits="Editors_NativeMode" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<%-- BeginRegion Css --%>
<asp:Content ID="Content2" ContentPlaceHolderID="localCssPlaceholder" runat="server">
    <style type="text/css">
        textarea, select, input {
            font-family: Tahoma!important;
            font-size: 9pt!important;
        }
    </style>
</asp:Content>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
<dxrp:ASPxRoundPanel ID="rpNativeEditors" SkinID="RoundPanelGroupBox" runat="server" HeaderText="Editors" GroupBoxCaptionOffsetY="-13px">
    <%-- BeginRegion Static Html --%>
    <ContentPaddings PaddingTop="5px" PaddingLeft="10px" PaddingBottom="5px" PaddingRight="10px" />
    <PanelCollection><dxp:PanelContent runat="server">
        <table cellspacing="5"><tr><td valign="top">
            <dxe:ASPxLabel ID="lblTextBox" runat="server" Text="ASPxTextBox"></dxe:ASPxLabel>
        </td><td><div class="Spacer" style="width: 80px;"></div></td><td>
    <%-- EndRegion --%>
            <dxe:ASPxTextBox ID="TextBox" SkinID="None" runat="server" Native="True" Width="166px" Text="TextBox">
                <ClientSideEvents TextChanged="function(s, e) { trace_event(s, e, &quot;TextChanged&quot;); }"></ClientSideEvents>
            </dxe:ASPxTextBox>
    <%-- BeginRegion Static Html --%>
        </td></tr>
        <tr><td colspan="2" valign="top">
            <dxe:ASPxLabel ID="lblMemo" runat="server" Text="ASPxMemo"></dxe:ASPxLabel>
        </td><td>
    <%-- EndRegion --%>
            <dxe:ASPxMemo ID="Memo" SkinID="None" runat="server" Native="True" Text="Memo" Height="70px" Width="166px">
                <ClientSideEvents TextChanged="function(s, e) { trace_event(s, e, &quot;TextChanged&quot;); }"></ClientSideEvents>
            </dxe:ASPxMemo>
    <%-- BeginRegion Static Html --%>
        </td></tr>
        <tr><td colspan="2" valign="top">
            <dxe:ASPxLabel ID="lblListBox" runat="server" Text="ASPxListBox"></dxe:ASPxLabel>
        </td><td>
    <%-- EndRegion --%>
            <dxe:ASPxListBox ID="ListBox" SkinID="None" runat="server" Native="True" Height="70px" Width="170px">
                <Items>
                    <dxe:ListEditItem Text="Item 1" Value="Item1" />
                    <dxe:ListEditItem Text="Item 2" Value="Item2" />
                    <dxe:ListEditItem Text="Item 3" Value="Item3" />
                    <dxe:ListEditItem Text="Item 4" Value="Item4" />
                    <dxe:ListEditItem Text="Item 5" Value="Item5" />
                    <dxe:ListEditItem Text="Item 6" Value="Item6" />
                    <dxe:ListEditItem Text="Item 7" Value="Item7" />
                    <dxe:ListEditItem Text="Item 8" Value="Item8" />
                    <dxe:ListEditItem Text="Item 9" Value="Item9" />
                </Items>
                <ClientSideEvents SelectedIndexChanged="function(s, e) { trace_event(s, e, &quot;SelectedIndexChanged&quot;); }"></ClientSideEvents>
            </dxe:ASPxListBox>
    <%-- BeginRegion Static Html --%>
        </td></tr>
        <tr><td colspan="2" valign="top">
            <dxe:ASPxLabel ID="lblComboBox" runat="server" Text="ASPxComboBox"></dxe:ASPxLabel>
        </td><td>
    <%-- EndRegion --%>
            <dxe:ASPxComboBox ID="ComboBox" SkinID="None" runat="server" Native="True" Width="170px" SelectedIndex="0">
                <Items>
                    <dxe:ListEditItem Text="Item 1" Value="Item1" />
                    <dxe:ListEditItem Text="Item 2" Value="Item2" />
                    <dxe:ListEditItem Text="Item 3" Value="Item3" />
                    <dxe:ListEditItem Text="Item 4" Value="Item4" />
                    <dxe:ListEditItem Text="Item 5" Value="Item5" />
                    <dxe:ListEditItem Text="Item 6" Value="Item6" />
                    <dxe:ListEditItem Text="Item 7" Value="Item7" />
                    <dxe:ListEditItem Text="Item 8" Value="Item8" />
                    <dxe:ListEditItem Text="Item 9" Value="Item9" />
                </Items>
                <ClientSideEvents SelectedIndexChanged="function(s, e) { trace_event(s, e, &quot;SelectedIndexChanged&quot;); }"></ClientSideEvents>
            </dxe:ASPxComboBox>
    <%-- BeginRegion Static Html --%>
        </td></tr>
        <tr><td colspan="2" valign="top">
            <dxe:ASPxLabel ID="lblButton" runat="server" Text="ASPxButton"></dxe:ASPxLabel>
        </td><td>
    <%-- EndRegion --%>
            <dxe:ASPxButton ID="Button" SkinID="None" runat="server" AutoPostBack="False" Native="True" Text="Click here">
                <ClientSideEvents Click="function(s, e) { trace_event(s, e, &quot;Click&quot;); }"></ClientSideEvents>
            </dxe:ASPxButton>
    <%-- BeginRegion Static Html --%>
        </td></tr></table>
    </dxp:PanelContent></PanelCollection>
    <%-- EndRegion --%>
</dxrp:ASPxRoundPanel>
<br />
<%-- BeginRegion Event monitor --%>
<dxrp:ASPxRoundPanel ID="rpEventMonitor" runat="server" HeaderText="Event monitor" Width="100%">
    <PanelCollection><dxp:PanelContent runat="server">
        <div class="EventMonitor">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr><td valign="top" class="ActionPanel"><div id="Events" class="Events"></div></td></tr>
                <tr><td><input type="button" id="Clear" class="DemoButton" value="Clear" onclick="clear_monitor();"/></td></tr>
            </table>
        </div>
    </dxp:PanelContent></PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>
</asp:Content>

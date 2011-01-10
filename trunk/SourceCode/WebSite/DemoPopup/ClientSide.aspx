<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ClientSide.aspx.cs" Inherits="PopupControl_ClientSide" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<dxpc:ASPxPopupControl SkinId="None" EncodeHtml="False" id="ASPxPopupControl1" runat="server" EnableViewState="False" EnableHotTrack="False" Width="200px" PopupHorizontalAlign="RightSides" PopupVerticalAlign="Above" PopupHorizontalOffset="1" PopupVerticalOffset="-4" EnableHierarchyRecreation="True">
<%-- BeginRegion ClientSideEvents --%>
    <ClientSideEvents CloseUp="function(s, e) { 
        if (document.getElementById('CloseUp').checked) { 
	        trace_event(s, e, &quot;CloseUp&quot;); 
        } 
    }" PopUp="function(s, e) { 
        if (document.getElementById('PopUp').checked) { 
    	    trace_event(s, e, &quot;PopUp&quot;); 
	    } 
    }" Init="function(s, e) { 
        if (document.getElementById('Init').checked) { 
    	    trace_event(s, e, &quot;Init&quot;); 
        } 
    }" />
<%-- EndRegion --%>
<%-- BeginRegion Windows --%>
    <Windows>
        <dxpc:PopupWindow PopupElementID="imgASPxNavBar" HeaderText="ASPxNavBar" Text="The &lt;b&gt;ASPxNavBar&lt;/b&gt; control allows you to introduce cutting edge site navigation capabilities to your ASP.NET 2 solutions with ease and simplicity."></dxpc:PopupWindow>
        <dxpc:PopupWindow PopupElementID="imgASPxMenu" HeaderText="ASPxMenu" Text="The &lt;b&gt;ASPxMenu&lt;/b&gt; is part of our brand new ASP.NET 2 web development library and offers you an elegant way in which to provide website navigation options to your end-users."></dxpc:PopupWindow>
        <dxpc:PopupWindow PopupElementID="imgASPxSiteMapControl" HeaderText="ASPxSiteMapControl" Text="The &lt;b&gt;ASPxSiteMapControl&lt;/b&gt; adds an advanced site map generation engine to your development arsenal."></dxpc:PopupWindow>
        <dxpc:PopupWindow PopupElementID="imgASPxTabControl" HeaderText="ASPxTabControl" Text="The &lt;b&gt;ASPxTabControl&lt;/b&gt; includes two components, allowing you to build tabbed interfaces within your web sites."></dxpc:PopupWindow>
        <dxpc:PopupWindow PopupElementID="imgASPxPopupControl" HeaderText="ASPxPopupControl" Text="The &lt;b&gt;ASPxPopupControl&lt;/b&gt; allows you to enhance the presentation of extra data within web pages using poping up windows."></dxpc:PopupWindow>
    </Windows>
<%-- EndRegion --%>
    <FooterStyle BackColor="#FFFBBA">
        <Border BorderWidth="0px" />
    </FooterStyle>
    <Border BorderColor="#BAAE6D" BorderStyle="Solid" BorderWidth="1px" />
    <CloseButtonImage Height="15px" Url="~/DemoPopup/Images/Hint/pcClose.gif" Width="15px" />
    <HeaderStyle BackColor="#FCFADD" Font-Bold="True" ForeColor="#9E8A4F" Font-Size="9pt">
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" BorderColor="#DCD9B0" BorderStyle="Solid" />
        <Paddings PaddingBottom="6px" PaddingLeft="13px" PaddingRight="8px" PaddingTop="6px" />
    </HeaderStyle>
    <ContentStyle BackColor="#FFFBBA" ForeColor="#9E8A4F">
        <Border BorderWidth="0px" />
        <Paddings PaddingBottom="10px" PaddingLeft="13px" PaddingRight="13px" PaddingTop="9px" />
    </ContentStyle>
    <CloseButtonStyle>
        <Paddings Padding="0px" PaddingLeft="3px" />
    </CloseButtonStyle>
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
<p class="WhiteControlArea">
    Our completely re-engineered shared library for ASP.NET 2 is used as the base for our newest web components:
    <span class="NoWrap"><b>ASPxNavBar</b><img src="Images/Help.gif" alt="" id="imgASPxNavBar" /></span>, 
    <span class="NoWrap"><b>ASPxMenu</b><img src="Images/Help.gif" alt="" id="imgASPxMenu" /></span>, 
    <span class="NoWrap"><b>ASPxTabControl</b><img src="Images/Help.gif" alt="" id="imgASPxTabControl" /></span>, 
    <span class="NoWrap"><b>ASPxPopupControl</b><img src="Images/Help.gif" alt="" id="imgASPxPopupControl" /></span>, 
    <span class="NoWrap"><b>ASPxSiteMapControl</b><img src="Images/Help.gif" alt="" id="imgASPxSiteMapControl" /></span>.
    The next generation of our web controls will give you the means with which to build stunning and highly usable web applications.
</p>
    <br />
<%-- EndRegion --%>
<%-- BeginRegion Control Panel properties --%>
<dxrp:ASPxRoundPanel ShowHeader="False" ID="ASPxRoundPanel2" runat="server" Height="265px" Width="100%">
    <PanelCollection>
        <dxrp:PanelContent ID="PanelContent1" runat="server">
            <div class="EventMonitor">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr>
                <td colspan="2" class="ActionMainLabel"><dxe:ASPxLabel EnableViewState="False" ID="Label1" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Event monitor:" /></td>
            </tr><tr>
                <td valign="top" class="ActionPanel"><div id="Events" class="Events"></div></td>
                <td valign="top" class="InfoPanel">
                    <dxe:ASPxLabel EnableViewState="False" ID="Label2" runat="server" CssClass="DemoLabel" Text="Trace events:" />
                    <table cellpadding="2" cellspacing="0" border="0" class="InfoPanelIndent"><tr>
                        <td><input type="checkbox" disabled="disabled" checked="checked" id="Init" /></td>
                        <td class="InfoPanelLabel"><label for="Init">Init</label></td>
                    </tr><tr>
                        <td><input type="checkbox" checked="checked" id="PopUp" /></td>
                        <td class="InfoPanelLabel"><label for="PopUp">PopUp</label></td>
                    </tr><tr>
                        <td><input type="checkbox" checked="checked" id="CloseUp" /></td>
                        <td class="InfoPanelLabel"><label for="CloseUp">CloseUp</label></td>
                    </tr></table>
                </td>
            </tr><tr>
                <td colspan="2"><input type="button" id="Clear" class="DemoButton" value="Clear" onclick="clear_monitor()"/></td>
            </tr></table>
            </div>
        </dxrp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>
</asp:Content>

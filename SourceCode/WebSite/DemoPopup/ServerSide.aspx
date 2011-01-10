<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ServerSide.aspx.cs" Inherits="PopupControl_ServerSide" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script type="text/javascript"><!--
function PC_OnInit() {
    var popupControl = GetPopupControl();
    var isAllWindowVisible = true;
    for(var i = 0; i < popupControl.GetWindowCount(); i++) {
        var window = popupControl.GetWindow(i);
        if(!popupControl.IsWindowVisible(window)) {
            SetLinkButtonVisible(hlShowAllNotesID, true);
            isAllWindowVisible = false;
            break;
        }
    }
    if(isAllWindowVisible && popupControl.GetWindowCount() > 0)
        SetLinkButtonVisible(hlShowAllNotesID, false);
    TBWindowContentReset();
    SetBtnDisabled(true);
}
function PC_OnCloseUp() {
    SetLinkButtonVisible(hlShowAllNotesID, true);
}
function PC_OnPopUp() {
    SetLinkButtonVisible(blClearAllNotesID, true);
}
function SetLinkButtonVisible(elementID, value) {
    var element = document.getElementById(elementID);
    if(element != null) {
        if(value && element.className != 'LinkButton ShowInline')
            element.className = 'LinkButton ShowInline';
        else if (!value && element.className != 'LinkButton Hide')
            element.className = 'LinkButton Hide';
    }
}
function ShowAllNotes() {
    var popupControl = GetPopupControl();
    for(var i = 0; i < popupControl.GetWindowCount(); i++) {
        var window = popupControl.GetWindow(i);
        if(!popupControl.IsWindowVisible(window))
            popupControl.ShowWindow(window);
    }
    SetLinkButtonVisible(hlShowAllNotesID, false);
}
function TBWindowContentFocus() {
    var tbWindowContent = GetTBWindowContent();
    var btnCreateNote = GetBtnCreateNote();
    if(btnCreateNote != null && tbWindowContent != null && btnCreateNote.GetEnabled() == false) {
        tbWindowContent.SetText('');
        SetMemoInactive(false);
    }
}
function TBWindowContentChange() {
    var tbWindowContent = GetTBWindowContent();
    if(tbWindowContent != null && tbWindowContent.GetText() != '')
        SetBtnDisabled(false);
}
function ImposeMaxLength(maxLength) {
    var tbWindowContent = GetTBWindowContent();
    if (tbWindowContent != null)
        return (tbWindowContent.GetText().length <= maxLength);
    else
        return false;
}        
function TBWindowContentBlur() {
    var tbWindowContent = GetTBWindowContent();
    if(tbWindowContent != null && tbWindowContent.GetText() == '') {
        TBWindowContentReset();
        SetBtnDisabled(true);
    }
}
function TBWindowContentReset() {
    var tbWindowContent = GetTBWindowContent();
    if(tbWindowContent != null) {
        tbWindowContent.SetText('[Enter some text here and then press the Create Note button]');
        SetMemoInactive(true);
    }
}
function SetMemoInactive(value) {
    var tbWindowContent = GetTBWindowContent();
    if(value)
        tbWindowContent.inputElement.className += ' InactiveColor';
    else
        tbWindowContent.inputElement.className = tbWindowContent.inputElement.className.replace(' InactiveColor', '');
}
function SetBtnDisabled(value) {
    var btnCreateNote = GetBtnCreateNote();
    if(btnCreateNote != null)
        btnCreateNote.SetEnabled(!value);
}
function GetTBWindowContent() {
    return ASPxWindowContent;
}
function GetBtnCreateNote() {
    return ASPxBtnCreateNote;
}
function GetPopupControl() {
    return ASPxPopupClientControl;
}
//--></script>
<dxpc:ASPxPopupControl ClientInstanceName="ASPxPopupClientControl" SkinId="None" EnableHotTrack="False" HeaderText="Note" AllowDragging="True" CloseAction="CloseButton" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides" id="ASPxPopupControl1" runat="server" ShowFooter="True" EnableHierarchyRecreation="True" EnableAnimation="false">
    <FooterStyle BackColor="#FFFBBA">
        <Border BorderWidth="0px" />
        <BorderTop BorderWidth="0px" />
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
<%-- BeginRegion ClientSideEvents --%>
    <ClientSideEvents CloseUp="function(s, e) {
    PC_OnCloseUp();
    }" Init="function(s, e) {
    PC_OnInit();
    }" PopUp="function(s, e) {
    PC_OnPopUp();
    }" />
<%-- EndRegion --%>            
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr><td valign="top" style="width: 100%;">
<%-- BeginRegion ASPxRoundPanel --%>
    <dxrp:ASPxRoundPanel Width="100%" HorizontalAlign="Center" EnableViewState="False" ShowHeader="False" ID="ASPxRoundPanel1" runat="server">
        <PanelCollection>
            <dxrp:PanelContent ID="PanelContent2" runat="server">
                <div class="Spacer" style="height: 124px;"></div>
            </dxrp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
<%-- EndRegion --%>    
    </td><td valign="top" class="ControlActionSpacing">
<%-- EndRegion --%>            
<%-- BeginRegion Control Panel properties --%>
<dxrp:ASPxRoundPanel ShowHeader="False" ID="ASPxRoundPanel2" runat="server" Height="201px">
    <PanelCollection>
        <dxrp:PanelContent ID="PanelContent1" runat="server">            
                <table border="0" cellpadding="0" cellspacing="0"><tr>                            
                    <td class="ActionLabel ActionPanel" colspan="2">
                        <dxe:ASPxMemo ID="ASPxWindowContent" ClientInstanceName="ASPxWindowContent" runat="server" Columns="30" Rows="7" Font-Names="Tahoma" Font-Size="11px" Text="[Enter some text here and then press the Create Note button]">
                            <ClientSideEvents GotFocus="function(s, e) { TBWindowContentFocus(); }"
                            LostFocus="function(s, e) { TBWindowContentBlur(); }"
                            KeyPress="function(s, e) { return ImposeMaxLength(200); }"
                            KeyUp="function(s, e) {	TBWindowContentChange(); }"
                            TextChanged="function(s, e) { TBWindowContentChange(); }" />
                        </dxe:ASPxMemo>
                    </td>
                </tr><tr>
                    <td class="ActionLabel ActionPanel" colspan="2"><dxe:ASPxButton ClientInstanceName="ASPxBtnCreateNote" ID="btnCreateNote" ClientEnabled="False" runat="server" CssClass="BigButton" Text="Create Note" OnClick="Button1_Click" /><br /></td>
                </tr><tr>
                    <td class="ActionLabel"><dxe:ASPxHyperLink ID="hlShowAllNotes" CssClass="LinkButton Hide" runat="server" NavigateUrl="javascript:ShowAllNotes(true);" Text="Show All Notes" /></td>
                    <td class="ActionLabel" align="right"><asp:LinkButton ID="lbClearAllNotes" CssClass="LinkButton Hide" runat="server" Text="Clear All Notes" OnClick="hlClearAllNotes_Click" /></td>
                </tr></table>
        </dxrp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>            
<%-- BeginRegion Static Html --%>
    </td></tr></table>
<%-- EndRegion --%>            
</asp:Content>

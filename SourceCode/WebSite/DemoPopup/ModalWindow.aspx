<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ModalWindow.aspx.cs" Inherits="PopupControl_ModalWindow" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="Server">
<script type="text/javascript"><!--
function ShowLoginWindow() {
    pcLogin.Show();
}
function ShowCreateAccountWindow() {
    pcCreateAccount.Show();
    tbUsername.Focus();
}
//--></script>
<%-- BeginRegion ASPxRoundPanel --%>
    <dxrp:ASPxRoundPanel Width="100%" HorizontalAlign="Center" EnableViewState="False" ShowHeader="False" ID="ASPxRoundPanel1" runat="server">
        <PanelCollection>
            <dxrp:PanelContent ID="PanelContent2" runat="server">
<%-- EndRegion --%>    
                <dxe:ASPxButton ID="btShowModal" runat="server" Text="Show Modal Window" AutoPostBack="False">
            <%-- BeginRegion ClientSideEvents --%>
                    <ClientSideEvents Click="function(s, e) {
    ShowLoginWindow();
}" />
            <%-- EndRegion --%>
                </dxe:ASPxButton>
<%-- BeginRegion ASPxRoundPanel --%>
            </dxrp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
<%-- EndRegion --%>    
    <dxpc:ASPxPopupControl id="pcLogin" runat="server" CloseAction="CloseButton" 
        Modal="True" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" ClientInstanceName="pcLogin" 
        HeaderText="Login" AllowDragging="True" EnableAnimation="False" 
        EnableViewState="False" Width="300px">
<%-- BeginRegion ClientSideEvents --%>
        <ClientSideEvents PopUp="function(s, e) {
	ASPxClientEdit.ClearGroup('entryGroup');
	tbLogin.Focus();
}" />
<%-- EndRegion --%>
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <dxp:ASPxPanel ID="Panel1" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dxp:PanelContent runat="server">
                            <table cellpadding="0" cellspacing="0">
    <%-- BeginRegion Username --%>
                                <tr><td rowspan="4"><div class="pcmSideSpacer"></div></td>
                                    <td class="pcmCellCaption" valign="top">
                                        <dxe:ASPxLabel ID="lblUsername1" runat="server" Text="Username:" AssociatedControlID="tbLogin"></dxe:ASPxLabel>
                                    </td>
                                    <td class="pcmCellText">
                                        <dxe:ASPxTextBox ID="tbLogin" runat="server" Width="150px" ClientInstanceName="tbLogin">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom" CausesValidation="True">
                                                <RequiredField ErrorText="Username required" IsRequired="True" />
                                                <RegularExpression ErrorText="Login required" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td><td rowspan="4"><div class="pcmSideSpacer"></div></td>
                                </tr>
    <%-- EndRegion --%>
    <%-- BeginRegion Password --%>
                                <tr>
                                    <td class="pcmCellCaption" valign="top">
                                        <dxe:ASPxLabel ID="lblPass1" runat="server" Text="Password:" AssociatedControlID="tbPassword"></dxe:ASPxLabel>
                                    </td>
                                    <td class="pcmCellText">
                                        <dxe:ASPxTextBox ID="tbPassword" runat="server" Width="150px" Password="True">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="Password required" IsRequired="True" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
    <%-- EndRegion --%>
                                <tr>
                                    <td></td>
                                    <td class="pcmCheckBox">
                                        <dxe:ASPxCheckBox ID="chbRemember" runat="server" Text="Remember me"></dxe:ASPxCheckBox>
                                    </td>
                                </tr>
    <%-- BeginRegion Buttons --%>
                                <tr><td colspan="2"><div class="pcmButton">
                                    <table width="100%" cellpadding="0" cellspacing="0"><tr><td align="right">
                                        <dxe:ASPxButton ID="btOK" runat="server" Text="OK" Width="80px" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
	    if(ASPxClientEdit.ValidateGroup('entryGroup'))
	        pcLogin.Hide();
    }" />
                                        </dxe:ASPxButton></td><td><div style="width: 8px;"></div></td><td align="left">
                                        <dxe:ASPxButton ID="btCancel" runat="server" Text="Cancel" Width="80px" AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {
	    pcLogin.Hide();
    }" />
                                        </dxe:ASPxButton></td></tr>
                                    </table></div>
                                </td></tr>
    <%-- EndRegion --%>
                            </table>
                        </dxp:PanelContent>
                    </PanelCollection>
                </dxp:ASPxPanel>
                <div>
                    <a href="javascript:ShowCreateAccountWindow();" id="hl1" style="float: right; margin: 14px 0 10px 0;">Create Account</a>
                </div>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle><Paddings PaddingBottom="5px" /></ContentStyle>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="pcCreateAccount" runat="server" 
        CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" ClientInstanceName="pcCreateAccount" 
        HeaderText="Create Account" AllowDragging="True" Modal="True" 
        EnableAnimation="true" EnableViewState="False" PopupHorizontalOffset="40" 
        PopupVerticalOffset="40" Width="350px">
        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('createAccountGroup'); }" />
        <SizeGripImage Width="11px" />
        <CloseButtonImage Width="17px" />
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <dxp:ASPxPanel ID="Panel2" runat="server" DefaultButton="btCreate">
                    <PanelCollection>
                        <dxp:PanelContent runat="server">
                            <table cellpadding="0" cellspacing="0">
    <%-- BeginRegion Username --%>
                                <tr><td rowspan="5"><div class="pcmSideSpacer"></div></td>
                                    <td class="pcmCellCaption" valign="top">
                                        <dxe:ASPxLabel ID="lblUsername2" runat="server" Text="Username:" AssociatedControlID="tbUsername"></dxe:ASPxLabel>
                                    </td>
                                    <td class="pcmCellText">
                                        <dxe:ASPxTextBox ID="tbUsername" runat="server" Width="150px" ClientInstanceName="tbUsername">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="createAccountGroup" SetFocusOnError="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                <RequiredField IsRequired="True" ErrorText="Username is required" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td><td rowspan="5"><div class="pcmSideSpacer"></div></td>
                                </tr>
    <%-- EndRegion --%>
    <%-- BeginRegion Password --%>
                                <tr>
                                    <td class="pcmCellCaption" valign="top">
                                        <dxe:ASPxLabel ID="lblPass2" runat="server" Text="Password:" AssociatedControlID="tbPass1"></dxe:ASPxLabel>
                                    </td>
                                    <td class="pcmCellText">
                                        <dxe:ASPxTextBox ID="tbPass1" runat="server" Width="150px" ClientInstanceName="pass1" Password="True">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="createAccountGroup" SetFocusOnError="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                <RequiredField IsRequired="True" ErrorText="Password is required" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
    <%-- EndRegion --%>
    <%-- BeginRegion Confirm password --%>
                                <tr>
                                    <td class="pcmCellCaption" valign="top">
                                        <dxe:ASPxLabel ID="lblConfPass2" runat="server" Text="Confirm password:" AssociatedControlID="tbConfPass2"></dxe:ASPxLabel>
                                    </td>
                                    <td class="pcmCellText">
                                        <dxe:ASPxTextBox ID="tbConfPass2" runat="server" Width="150px" ClientInstanceName="pass2" Password="True">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="createAccountGroup" SetFocusOnError="True" ErrorText="Password is incorrect" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                <RequiredField IsRequired="True" ErrorText="Please, confirm your password" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                            <ClientSideEvents Validation="function(s, e) {
	    e.isValid = (pass1.GetText()==pass2.GetText());
    }" />
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
    <%-- EndRegion --%>
    <%-- BeginRegion Email --%>
                                <tr>
                                    <td class="pcmCellCaption" valign="top">
                                        <dxe:ASPxLabel ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="tbEmail"></dxe:ASPxLabel>
                                    </td>
                                    <td class="pcmCellText">
                                        <dxe:ASPxTextBox ID="tbEmail" runat="server" Width="150px">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="createAccountGroup" SetFocusOnError="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                <RequiredField IsRequired="True" ErrorText="E-mail is required" />
                                                <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
    <%-- EndRegion --%>
    <%-- BeginRegion Buttons --%>
                                <tr>
                                    <td colspan="2"><div class="pcmButton">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="right" class="pcmButton">
                                                    <dxe:ASPxButton ID="btCreate" runat="server" Text="OK" Width="80px" AutoPostBack="False">
                                                        <ClientSideEvents Click="function(s, e) {
	    if(ASPxClientEdit.ValidateGroup('createAccountGroup')) {
		    ASPxClientEdit.ClearGroup('entryGroup');
		    tbLogin.SetText(tbUsername.GetText());
		    pcCreateAccount.Hide();
	    }
    }" />
                                                    </dxe:ASPxButton>
                                                </td>
                                                <td><div style="width: 10px;"></div></td>
                                                <td align="left" class="pcmButton">
                                                    <dxe:ASPxButton ID="btCancel2" runat="server" Text="Cancel" Width="80px" AutoPostBack="False">
                                                        <ClientSideEvents Click="function(s, e) {
	    pcCreateAccount.Hide();
    }" />
                                                    </dxe:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </div></td>
                                </tr>
    <%-- EndRegion --%>
                            </table>
                        </dxp:PanelContent>
                    </PanelCollection>
                </dxp:ASPxPanel>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
</asp:Content>

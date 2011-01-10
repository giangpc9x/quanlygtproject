<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ClientSideAPI.aspx.cs" Inherits="PopupControl_ClientSideAPI" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script type="text/javascript"><!--
function TextBox_OnChange() {
    if (IsErrorVisible())
        ValidateField();
}
function ValidateField() {
    var txtLogin = document.getElementById('txtLogin');
    var txtPassword = document.getElementById('txtPassword');
    var txtEmail = document.getElementById('txtEmail');
    
    var isLogin = CheckLogin(txtLogin.value);
    var isPassword = CheckPassword(txtPassword.value);
    var isEmail = CheckEmail(txtEmail.value);
    var errorText = '';
    if(!isLogin)
        errorText += 'Invalid login.';
    if(!isPassword) {
        if(errorText != '')
            errorText += '<br /><br />';
        errorText += 'Invalid password.';
    }
    if(!isEmail) {
        if(errorText != '')
            errorText += '<br /><br />';
        errorText += 'Invalid email address.';
    }
    if(isLogin && isPassword && isEmail) {
        SetErrorVisible(false);
    } else {
        SetErrorString(errorText);
        SetErrorVisible(true);
    }
    
}
function CheckLogin(value) {
    return CheckRegExp("^[a-z]+$", value);
}
function CheckPassword(value) {
    return CheckRegExp("^[0-9]+$", value);
}
function CheckEmail(value) {
    return CheckRegExp("^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", value);
}
function CheckRegExp(pattern, value) {
    var reg = new RegExp(pattern);
    return reg.exec(value) != null ? true : false;
}
function SetHintVisible(name, value) {
    var popupControl = GetPopupControl('Hint');
    var hintWindow = popupControl.GetWindowByName(name);
    if(value)
        popupControl.ShowWindow(hintWindow);
    else
        popupControl.HideWindow(hintWindow);
}
function SetErrorVisible(value) {
    var popupControl = GetPopupControl('Error');
    if(value)
        popupControl.Show();
    else
        popupControl.Hide();
}
function SetErrorString(text) {
    var popupControl = GetPopupControl('Error');            
    popupControl.SetContentHTML(text);
}
function IsErrorVisible() {
    var popupControl = GetPopupControl('Error');            
    return popupControl.IsVisible();
}
function GetPopupControl(name) {
    if(name == 'Hint')
        return ASPxPopupHintClientControl;
    else if(name == 'Error')
        return ASPxPopupErrorClientControl;
}
//--></script>
<dxpc:ASPxPopupControl ClientInstanceName="ASPxPopupHintClientControl" SkinId="None" Width="200px" ID="pcHint" runat="server" EncodeHtml="false" EnableViewState="False" PopupHorizontalAlign="OutsideRight" PopupVerticalAlign="TopSides" ShowHeader="False" EnableHotTrack="False" PopupHorizontalOffset="1" PopupAction="None" CloseAction="CloseButton" PopupVerticalOffset="-10" EnableHierarchyRecreation="True">
<%-- BeginRegion Windows --%>
    <Windows>
        <dxpc:PopupWindow Name="Login" Text="Login should consist of &lt;b&gt;a-z&lt;/b&gt;." PopupElementID="txtLogin"></dxpc:PopupWindow>
        <dxpc:PopupWindow Name="Password" Text="Password should consist of &lt;b&gt;0-9&lt;/b&gt;." PopupElementID="txtPassword"></dxpc:PopupWindow>
        <dxpc:PopupWindow Name="Email" Text="For instance, &lt;b&gt;myname@example.com&lt;/b&gt;. This will be used to sign-in to your account." PopupElementID="txtEmail"></dxpc:PopupWindow>
    </Windows>
<%-- EndRegion --%>
    <ContentStyle BackColor="#FFFBBA" ForeColor="#916E04">
        <Paddings PaddingBottom="12px" PaddingLeft="14px" PaddingRight="14px" PaddingTop="12px" />
        <Border BorderWidth="0px" />
    </ContentStyle>
    <Border BorderColor="#FFC800" BorderStyle="Solid" BorderWidth="1px" />                        
</dxpc:ASPxPopupControl>
<dxpc:ASPxPopupControl ClientInstanceName="ASPxPopupErrorClientControl" ShowShadow="false" PopupElementID="actionArea" Width="210px" ID="pcError" runat="server" EnableViewState="False" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides" ShowHeader="False" EnableHotTrack="False" CloseAction="CloseButton" PopupHorizontalOffset="17" PopupVerticalOffset="128" PopupAction="None" EnableHierarchyRecreation="True">
    <ContentStyle BackColor="#FFFBBA" ForeColor="#FF3333">
        <Paddings PaddingBottom="12px" PaddingLeft="14px" PaddingRight="14px" PaddingTop="12px" />
        <Border BorderWidth="0px" />
    </ContentStyle>
    <Border BorderColor="#FFC800" BorderStyle="Solid" BorderWidth="1px" />
</dxpc:ASPxPopupControl>
<%-- BeginRegion ASPxRoundPanel --%>
<dxrp:ASPxRoundPanel ShowHeader="False" ID="actionArea" runat="server">
    <PanelCollection>
        <dxrp:PanelContent ID="PanelContent1" runat="server">
<%-- EndRegion --%>            
<%-- BeginRegion Static Html --%>
            <div style="height: 212px;">
                <table border="0" cellpadding="2" cellspacing="0" class="PopupControlCSAPI"><tr>
                    <td><label id="lblLogin" for="txtLogin">Login: </label></td>
                    <td><input style="width: 150px;" onblur="SetHintVisible('Login', false);" onfocus="SetHintVisible('Login', true);" onchange="TextBox_OnChange();" id="txtLogin" type="text" /></td>
                </tr><tr>
                    <td><label id="lblPassword" for="txtPassword">Password: </label></td>
                    <td><input style="width: 150px;" onblur="SetHintVisible('Password', false);" onfocus="SetHintVisible('Password', true);" onchange="TextBox_OnChange();" id="txtPassword" type="password" /></td>
                </tr><tr>
                    <td><label id="lblEmail" for="txtEmail">E-mail: </label></td>
                    <td><input style="width: 150px;" onblur="SetHintVisible('Email', false);" onfocus="SetHintVisible('Email', true);" onchange="TextBox_OnChange();" id="txtEmail" type="text" /></td>
                </tr><tr>
                    <td><div class="Spacer"></div></td>
                    <td><dxe:ASPxButton AutoPostBack="False" runat="server" CssClass="DemoButton" ID="btnValidate" Text="Submit" style="margin: 0px;">
                        <ClientSideEvents Click="function(s, e) {
	ValidateField(); return false;
}" />
                    </dxe:ASPxButton></td>
                </tr></table>
            </div>
<%-- EndRegion --%>            
<%-- BeginRegion ASPxRoundPanel --%>
        </dxrp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>            
</asp:Content>

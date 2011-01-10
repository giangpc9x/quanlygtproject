<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Validation.aspx.cs" Inherits="Editors_Validation" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="localCssPlaceholder" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Css/Validation.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <dxrp:ASPxRoundPanel ID="rpnlValidationGroupBox" DefaultButton="btnOk" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-14px" HeaderText="Conference Registration Form">
        <ContentPaddings padding="6px" />
            <PanelCollection><dxp:PanelContent>
                <table id="registrationForm">
                    <tbody>
                        <tr>
                            <td class="label" style="width: 80px;">
                                <span class="star">*</span>
                                <dxe:ASPxLabel runat="server" ID="NameLabel" AssociatedControlID="NameTextBox" Text="Name:" />
                            </td>
                            <td class="editor">
                                <script type="text/javascript">
// <![CDATA[
function OnNameValidation(s, e) {
    var name = e.value;
    if (name == null)
        return;
    if (name.length < 2)
        e.isValid = false;
}
// ]]>
                                </script>
                                <dxe:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="160px" ID="NameTextBox"
                                    ClientInstanceName="Name" OnValidation="NameTextBox_Validation">
                                    <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least two characters long">
                                        <ErrorImage Height="16px" Width="16px" AlternateText="Error" Url="~/Images/iconError.png" />
                                        <RequiredField IsRequired="True" ErrorText="Name is required" />
                                        <ErrorFrameStyle ForeColor="Red">
                                            <Paddings Padding="3px" PaddingLeft="4px" />
                                            <BackgroundImage ImageUrl="~/Images/bgError.png" />
                                            <Border BorderColor="#FD4D3E" BorderStyle="Solid" BorderWidth="1px" />
                                            <ErrorTextPaddings PaddingRight="3px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnNameValidation" />
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;<dxe:ASPxLabel runat="server" ID="AgeLabel" AssociatedControlID="AgeTextBox"
                                    Text="Age:">
                                </dxe:ASPxLabel>
                            </td>
                            <td class="editor">
                                <script type="text/javascript">
// <![CDATA[
function OnAgeValidation(s, e) {
    var age = e.value;
    if (age == null || age == "")
        return;
    var digits = "0123456789";
    for (var i = 0; i < age.length; i++) {
        if (digits.indexOf(age.charAt(i)) == -1) {
            e.isValid = false;
            break;
        }
    }
    if (e.isValid && age.charAt(0) == '0') {
        age = age.replace(/^0+/, "");
        if (age.length == 0)
            age = "0";
        e.value = age;
    }
    if (age < 18)
        e.isValid = false;
}
// ]]>
                                </script>
                                <dxe:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="160px" ID="AgeTextBox"
                                    ClientInstanceName="Age" OnValidation="AgeTextBox_Validation">
                                    <ValidationSettings SetFocusOnError="True" ErrorText="Age must be greater than or equal 18">
                                        <ErrorImage Height="16px" Width="16px" AlternateText="Error:" Url="~/Images/iconError.png" />
                                        <ErrorFrameStyle ForeColor="Red">
                                            <Paddings Padding="3px" PaddingLeft="4px" />
                                            <BackgroundImage ImageUrl="~/Images/bgError.png" />
                                            <Border BorderColor="#FD4D3E" BorderStyle="Solid" BorderWidth="1px" />
                                            <ErrorTextPaddings PaddingRight="3px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnAgeValidation" />
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <span class="star">*</span>
                                <dxe:ASPxLabel runat="server" ID="EmailLabel" AssociatedControlID="EmailTextBox" Text="E-mail:" />
                            </td>
                            <td class="editor">
                                <dxe:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="160px" ID="EmailTextBox"
                                    ClientInstanceName="Email">
                                    <ValidationSettings SetFocusOnError="True">
                                        <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </RegularExpression>
                                        <ErrorImage Height="16px" Width="16px" AlternateText="Error:" Url="~/Images/iconError.png">
                                        </ErrorImage>
                                        <RequiredField IsRequired="True" ErrorText="E-mail is required"></RequiredField>
                                        <ErrorFrameStyle ForeColor="Red">
                                            <Paddings Padding="3px" PaddingLeft="4px" />
                                            <BackgroundImage ImageUrl="~/Images/bgError.png" />
                                            <Border BorderColor="#FD4D3E" BorderStyle="Solid" BorderWidth="1px" />
                                            <ErrorTextPaddings PaddingRight="3px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <span class="star">*</span>
                                <dxe:ASPxLabel runat="server" ID="ArrivalLabel" AssociatedControlID="ArrivalDateEdit"
                                    Text="Arrival date:">
                                </dxe:ASPxLabel>
                            </td>
                            <td class="editor">
                                <script type="text/javascript">
// <![CDATA[
function OnArrivalDateValidation(s, e) {
    var selectedDate = s.date;
    if (selectedDate == null || selectedDate == false)
        return;
    var currentDate = new Date();
    if (currentDate.getFullYear() != selectedDate.getFullYear() ||
        currentDate.getMonth() != selectedDate.getMonth())
        e.isValid = false;
}
// ]]>
                                </script>
                                <dxe:ASPxDateEdit runat="server" Width="160px" BackColor="White"
                                    ID="ArrivalDateEdit" ClientInstanceName="ArrivalDate" OnValidation="ArrivalDateEdit_Validation" Height="19px">
                                    <ValidationSettings SetFocusOnError="True" ErrorText="Arrival date is required and must belong to the current month">
                                        <ErrorImage Height="16px" Width="16px" AlternateText="Error:" Url="~/Images/iconError.png">
                                        </ErrorImage>
                                        <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                                        <ErrorFrameStyle ForeColor="Red">
                                            <Paddings Padding="3px" PaddingLeft="4px" />
                                            <BackgroundImage ImageUrl="~/Images/bgError.png" />
                                            <Border BorderColor="#FD4D3E" BorderStyle="Solid" BorderWidth="1px" />
                                            <ErrorTextPaddings PaddingRight="3px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnArrivalDateValidation" />
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="buttonCell">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <dxe:ASPxButton ID="btnOk" runat="server" Text="OK" Width="74px"></dxe:ASPxButton>
                                        </td>
                                        <td style="padding-left: 13px;">
                                            <dxe:ASPxButton ID="btnReset" runat="server" AutoPostBack="False" Text="Reset" Width="74px" CausesValidation="False">
                                                <ClientSideEvents Click="function(s, e) {
                                                    ASPxClientEdit.ClearEditorsInContainerById('registrationForm');
                                                    return false;
                                                }" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </dxp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
    <br />
    <br />
    <dxrp:ASPxRoundPanel ID="rpnlSettings" runat="server" SkinID="RoundPanelGroupBox" Width="100%" GroupBoxCaptionOffsetY="-14px" HeaderText="Settings">
        <PanelCollection>
            <dxp:PanelContent>
                
                <table id="settings" cellpadding="2">
                    <tr>
                        <td class="label">
                            ErrorDisplayMode:
                        </td>
                        <td class="control">
                            <dxe:ASPxRadioButtonList ID="rblErrorDisplayMode" runat="server" Border-BorderStyle="None" Paddings-Padding="0" RepeatDirection="Horizontal"
                                ItemSpacing="10px" OnSelectedIndexChanged="OnSettingsChanged" SelectedIndex="0" AutoPostBack="True">
                                <Items>
                                    <dxe:ListEditItem Value="ImageWithText" />
                                    <dxe:ListEditItem Value="ImageWithTooltip" />
                                    <dxe:ListEditItem Value="Text" />
                                    <dxe:ListEditItem Value="None" />
                                </Items>
                            </dxe:ASPxRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Display:
                        </td>
                        <td class="control">
                            <dxe:ASPxRadioButtonList ID="rblDisplay" runat="server"
                                Border-BorderStyle="None" Paddings-Padding="0" RepeatDirection="Horizontal" ItemSpacing="10px" OnSelectedIndexChanged="OnSettingsChanged"
                                     SelectedIndex="0" AutoPostBack="True">
                                <Items>
                                    <dxe:ListEditItem Value="Static" />
                                    <dxe:ListEditItem Value="Dynamic" />
                                </Items>
                            </dxe:ASPxRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            ValidateOnLeave:
                        </td>
                        <td class="control">
                            <dxe:ASPxCheckBox ID="chbValidateOnLeave" runat="server" Checked="True" OnCheckedChanged="OnSettingsChanged" AutoPostBack="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            SetFocusOnError:
                        </td>
                        <td class="control">
                            <dxe:ASPxCheckBox ID="chbSetFocusOnError" runat="server" OnCheckedChanged="OnSettingsChanged" AutoPostBack="True" />
                        </td>
                    </tr>
                </table>
                
            </dxp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
</asp:Content>

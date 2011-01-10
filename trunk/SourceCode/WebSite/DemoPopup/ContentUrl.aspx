<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ContentUrl.aspx.cs" Inherits="PopupControl_ContentUrl" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="Server">
<%-- BeginRegion Static Html --%>
    <table style="width: 100%" id="blueArea"><tr>
        <td><div class="Spacer" style="width: 0px; height: 300px"></div></td>
        <td align="center" valign="middle">
            <table><tr>
                <td style="width: 32px; height: 34px;"><dxe:ASPxImage ID="Image1" runat="server" BackColor="Transparent" Height="32px" ImageUrl="~/DemoPopup/Images/mail32x32.gif" Width="32px" /></td>
                <td style="height: 34px;"><dxe:ASPxLabel ID="Label1" runat="server" Text="Click here to send us a message..." /></td>
            </tr></table>
        </td>
    </tr></table>
<%-- EndRegion --%>
<dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True"
    AllowResize="True" CloseAction="CloseButton" ContentUrl="~/DemoPopup/ContentUrlFeedForm.aspx"
    EnableViewState="False" PopupElementID="blueArea"
    PopupHorizontalAlign="Center" PopupVerticalAlign="Middle" ShowFooter="True" ShowOnPageLoad="True"
    Width="400px" Height="300px" FooterText="Try to resize the control using the resize grip or the control's edges"
    HeaderText="Feedback form"
    ClientInstanceName="FeedPopupControl" EnableHierarchyRecreation="True">
    <ContentStyle>
        <Paddings Padding="0px"></Paddings>
    </ContentStyle>
</dxpc:ASPxPopupControl>
</asp:Content>

<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="Transparency.aspx.cs" Inherits="PopupControl_Transparency" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<%-- BeginRegion Static Html --%>
   <table border="0" cellpadding="0" cellspacing="0" width="100%"><tr>
   <td class="UserHelpTopic">
       <table width="284" cellpadding="0" cellspacing="0" border="0" style="height: 266px;"><tr>
            <td id="MercuryCell" align="center" valign="top">
            <dxe:ASPxImage ID="Image1" runat="server" Height="463px" ImageUrl="~/DemoPopup/Images/Puzzle Demo/bg.png" Width="365px" /></td>
            <td align="center" class="ControlActionSpacing">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 200px; height: 450px"><tr>
            <td id="Cell1"><div class="Spacer"></div>
<%-- EndRegion --%>
<dxpc:ASPxPopupControl SkinID="None" ID="ASPxPopupControl3" runat="server" AllowDragging="True" BackColor="Transparent" CloseAction="None" DragElement="Window" EnableViewState="False" FooterText="" HeaderText="" Height="112px" PopupAction="None" PopupElementID="Cell1" ShowShadow="False" Width="137px" ShowCloseButton="False" ShowHeader="False" ShowOnPageLoad="True" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Middle" EnableHierarchyRecreation="True">
<Border BorderWidth="0px" />
<HeaderStyle Font-Bold="False" Font-Italic="False" BackColor="Transparent" >
<Paddings Padding="0px" PaddingRight="90px" />
<BorderBottom BorderWidth="0px" />
<Border BorderWidth="0px" />
</HeaderStyle>
<BackgroundImage HorizontalPosition="left" ImageUrl="~/DemoPopup/Images/Puzzle Demo/p3.png"
Repeat="NoRepeat" VerticalPosition="top" />
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
            </td>
            <td><div class="Spacer"></div></td>
            </tr><tr>
            <td><div class="Spacer"></div></td>
            <td id="Cell2"><div class="Spacer"></div>
<%-- EndRegion --%>
<dxpc:ASPxPopupControl SkinID="None" ID="ASPxPopupControl1" runat="server" AllowDragging="True" BackColor="Transparent" CloseAction="None" DragElement="Window" EnableViewState="False" FooterText="" HeaderText="" Height="145px" PopupAction="None" PopupElementID="Cell2" ShowShadow="False" Width="118px" ShowCloseButton="False" ShowHeader="False" ShowOnPageLoad="True" PopupHorizontalAlign="RightSides" PopupVerticalAlign="Middle" EnableHierarchyRecreation="True">
<Border BorderWidth="0px" />
<HeaderStyle Font-Bold="False" Font-Italic="False" BackColor="Transparent" >
<Paddings Padding="0px" PaddingRight="90px" />
<BorderBottom BorderWidth="0px" />
<Border BorderWidth="0px" />
</HeaderStyle>
<BackgroundImage HorizontalPosition="left" ImageUrl="~/DemoPopup/Images/Puzzle Demo/p2.png"
Repeat="NoRepeat" VerticalPosition="top" />
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
            </td>
            </tr><tr>
            <td id="Cell3"><div class="Spacer"></div>
<%-- EndRegion --%>
<dxpc:ASPxPopupControl SkinID="None" ID="ASPxPopupControl2" runat="server" AllowDragging="True" BackColor="Transparent" CloseAction="None" DragElement="Window" EnableViewState="False" FooterText="" HeaderText="" Height="129px" PopupAction="None" PopupElementID="Cell3" ShowShadow="False" Width="130px" ShowCloseButton="False" ShowHeader="False" ShowOnPageLoad="True" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Middle" EnableHierarchyRecreation="True">
<Border BorderWidth="0px" />
<HeaderStyle Font-Bold="False" Font-Italic="False" BackColor="Transparent" >
<Paddings Padding="0px" PaddingRight="90px" />
<BorderBottom BorderWidth="0px" />
<Border BorderWidth="0px" />
</HeaderStyle>
<BackgroundImage HorizontalPosition="left" ImageUrl="~/DemoPopup/Images/Puzzle Demo/p1.png"
Repeat="NoRepeat" VerticalPosition="top" />
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
            </td>
            <td><div class="Spacer"></div></td></tr>
            <tr>
            <td><div class="Spacer"></div></td>
            <td id="Cell4"><div class="Spacer"></div>
<%-- EndRegion --%>
<dxpc:ASPxPopupControl SkinID="None" ID="ASPxPopupControl5" runat="server" AllowDragging="True" BackColor="Transparent" CloseAction="None" DragElement="Window" EnableViewState="False" FooterText="" HeaderText="" Height="145px" PopupAction="None" PopupElementID="Cell4" ShowShadow="False" Width="118px" ShowCloseButton="False" ShowHeader="False" ShowOnPageLoad="True" PopupHorizontalAlign="RightSides" PopupVerticalAlign="Middle" EnableHierarchyRecreation="True">
<Border BorderWidth="0px" />
<HeaderStyle Font-Bold="False" Font-Italic="False" BackColor="Transparent" >
<Paddings Padding="0px" PaddingRight="90px" />
<BorderBottom BorderWidth="0px" />
<Border BorderWidth="0px" />
</HeaderStyle>
<BackgroundImage HorizontalPosition="left" ImageUrl="~/DemoPopup/Images/Puzzle Demo/p5.png" Repeat="NoRepeat" VerticalPosition="top" />
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
               </td>
           </tr><tr>
            <td id="Cell5"><div class="Spacer"></div>
<%-- EndRegion --%>
<dxpc:ASPxPopupControl SkinID="None" ID="ASPxPopupControl4" runat="server" AllowDragging="True" BackColor="Transparent" CloseAction="None" DragElement="Window" EnableViewState="False" FooterText="" HeaderText="" Height="107px" PopupAction="None" PopupElementID="Cell5" ShowShadow="False" Width="130px" ShowCloseButton="False" ShowHeader="False" ShowOnPageLoad="True" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Middle" EnableHierarchyRecreation="True">
<Border BorderWidth="0px" />
<HeaderStyle Font-Bold="False" Font-Italic="False" BackColor="Transparent" >
<Paddings Padding="0px" PaddingRight="90px" />
<BorderBottom BorderWidth="0px" />
<Border BorderWidth="0px" />
</HeaderStyle>
<BackgroundImage HorizontalPosition="left" ImageUrl="~/DemoPopup/Images/Puzzle Demo/p4.png" Repeat="NoRepeat" VerticalPosition="top" />
</dxpc:ASPxPopupControl>
<%-- BeginRegion Static Html --%>
            </td>
            <td><div class="Spacer"></div>
            </td></tr></table>
        </td></tr></table>
   </td></tr></table>
<%-- EndRegion --%>
</asp:Content>

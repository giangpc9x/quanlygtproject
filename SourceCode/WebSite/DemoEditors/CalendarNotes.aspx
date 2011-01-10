<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="CalendarNotes.aspx.cs" Inherits="Editors_CalendarNotes" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%-- EndRegion --%>
<%-- BeginRegion Css --%>
<asp:Content ID="as" ContentPlaceHolderID="localCssPlaceholder" runat="server">
    <style type="text/css">
        .NotesCalendar a {
            font-weight: bold;
        }
        .DayNotes p {
            margin: 7px 0;
        }
        body:not([unknown]) #popupAnchor {
            margin-top: -1px;
        }
    </style>
</asp:Content>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <script type="text/javascript">
        __currentDateString = null;
        
function ShowNotes(dateString) {
    if (__currentDateString != dateString) {
        cbCallback.PerformCallback(dateString);
        __currentDateString = dateString;
    }
}
function OnCallbackComplete(s, e) {
    var currentDateString = __currentDateString;
    pcNotePopup.Hide();
    __currentDateString = currentDateString;
    if (!e.result)
        return;
    var separatorIndex = e.result.indexOf(';');
    var headerText = e.result.substr(0, separatorIndex);
    var contentText = e.result.substring(separatorIndex + 1, e.result.length);
    pcNotePopup.SetHeaderText(headerText);
    pcNotePopup.SetContentHTML(contentText);
    pcNotePopup.Show();
}
    </script>
    <p style="margin: 0 0 10px 2px;">
        Click an underlined date
    </p>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <dxe:ASPxCalendar ID="ASPxCalendar1" runat="server" CssClass="NotesCalendar" EnableViewState="False" 
                    ShowTodayButton="False" ShowClearButton="False" ShowWeekNumbers="False" 
                    ReadOnly="True" EnableYearNavigation="False" EnableMonthNavigation="False"
                    OnDayRender="OnDayRender"
                    Font-Bold="False" Font-Size="11pt">
                    <TodayStyle>
                        <Border BorderStyle="None" />
                    </TodayStyle>
                    <HeaderStyle Font-Size="14pt" />
					<DayOtherMonthStyle ForeColor="#BBBBBB" />
                    <DayStyle ForeColor="#585858" />
                </dxe:ASPxCalendar>
            </td>
            <td style="vertical-align: top; padding-left: 2px;"><div id="popupAnchor"></div></td>
        </tr>
    </table>
    <%-- BeginRegion Callback --%>
    <dxc:ASPxCallback ID="cbCallback" runat="server" OnCallback="OnCallback" ClientInstanceName="cbCallback">
        <ClientSideEvents CallbackComplete="function(s, e) { OnCallbackComplete(s, e); }" />
    </dxc:ASPxCallback>
    <%-- EndRegion --%>
    <%-- BeginRegion Popup --%>
    <dxpc:ASPxPopupControl ID="pcNotePopup" CssClass="DayNotes" runat="server" Width="222px"  Font-Size="11pt"
        ClientInstanceName="pcNotePopup" PopupElementID="popupAnchor" PopupAction="None" CloseAction="CloseButton">
        <ContentStyle VerticalAlign="Top" />
        <ClientSideEvents CloseUp="function(s, e) { __currentDateString = null; }" />
    </dxpc:ASPxPopupControl>
    <%-- EndRegion --%>
</asp:Content>

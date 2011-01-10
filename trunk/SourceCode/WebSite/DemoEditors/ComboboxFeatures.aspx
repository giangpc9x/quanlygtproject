<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ComboboxFeatures.aspx.cs" Inherits="Editors_Combobox" Theme="Glass"%>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<%-- BeginRegion Css --%>
<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" runat="server">
    <style type="text/css">
        td.param {
            padding-left: 10px;
        }
        td.prop {
            height: 18px;
        }
    </style>
</asp:Content>
<%-- EndRegion --%>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">
    <dxrp:ASPxRoundPanel ID="FilteringGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-20px" HeaderText="Filtering">
        <ContentPaddings PaddingTop="12px" PaddingLeft="13px" PaddingBottom="21px" />
        <PanelCollection><dxp:PanelContent>
            <table cellspacing="0" cellpadding="0">
                <tr><td valign="middle">
                    <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" ID="CmbAutoComplete" EnableIncrementalFiltering="True" 
                        DataSourceID="ClubMembersDataSource" TextField="Email" ValueField="Email" Width="180px">
                    </dxe:ASPxComboBox>
                </td><td valign="middle" class="param">
                    <table cellpadding="0" cellspacing="0">
                        <tr><td class="prop">EnableIncrementalFiltering = True</td></tr>
                    </table>
                </td></tr>
            </table>
        </dxp:PanelContent></PanelCollection>
    </dxrp:ASPxRoundPanel>
    <div style="height: 5px;" class="Spacer"></div>
    <dxrp:ASPxRoundPanel ID="CallbackModeGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-12px" HeaderText="CallbackMode">
    <ContentPaddings PaddingTop="4px" PaddingLeft="12px" PaddingBottom="13px" />
        <PanelCollection><dxp:PanelContent>
            <table cellspacing="0">
                <tr><td valign="middle">
                    <dxe:ASPxComboBox runat="server" ID="CmbLoadItemOnCallback" 
                        DataSourceID="AccessDataSourceCountry" TextField="Country" ValueField="Country" Width="180px" SelectedIndex="0" CallbackPageSize="15" EnableCallbackMode="True">
                    </dxe:ASPxComboBox>
                </td><td valign="middle" class="param">
                    <table cellpadding="0" cellspacing="0">
                        <tr><td class="prop">CallBackPageSize = 15</td>
                        </tr><tr><td class="prop">EnableCallbackMode = True</td></tr>
                    </table>
                </td></tr>
            </table>
        </dxp:PanelContent></PanelCollection>
    </dxrp:ASPxRoundPanel>
    <%-- BeginRegion DataSources --%>
    <asp:AccessDataSource ID="ClubMembersDataSource" runat="server" DataFile="~/App_Data/EditorsSampleDB.mdb" SelectCommand="SELECT * FROM [ClubMember] ORDER BY [Email]"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceCountry" runat="server" DataFile="~/App_Data/WorldCities.mdb" SelectCommand="SELECT * FROM [Countries] ORDER BY [Country]" ></asp:AccessDataSource>    
    <%-- EndRegion --%>    
</asp:Content>

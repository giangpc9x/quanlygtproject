<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="ComboboxClientAPI.aspx.cs" Inherits="Editors_ComboboxClientAPI" Theme="Glass"%>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
<script language="javascript" type="text/javascript"><!--
// <!CDATA[
//function is called on changing country
function OnCountryChanged(cmbCountry) {
    cmbCity.PerformCallback(cmbCountry.GetValue().toString());
}
//--></script>
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr><td>
            <dxrp:ASPxRoundPanel ID="CountryGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-20px" HeaderText="Country">
                <ContentPaddings PaddingTop="12px" PaddingLeft="20px" PaddingBottom="21px" />
                <PanelCollection><dxp:PanelContent>
                    <dxe:ASPxComboBox runat="server" ID="CmbCountry" DropDownStyle="DropDownList" EnableIncrementalFiltering="True" 
                        DataSourceID="AccessDataSourceCountry" TextField="Country" ValueField="Country" EnableSynchronization="False">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
                    </dxe:ASPxComboBox>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td><td><div class="Spacer" style="width: 5px;" /></td><td>
            <dxrp:ASPxRoundPanel ID="CityGroupBox" SkinID="RoundPanelGroupBox" runat="server" Width="100%" GroupBoxCaptionOffsetY="-20px" HeaderText="City">
                <ContentPaddings PaddingTop="12px" PaddingLeft="20px" PaddingBottom="21px" />
                <PanelCollection><dxp:PanelContent>
                    <dxe:ASPxComboBox runat="server" ID="CmbCity" ClientInstanceName="cmbCity" OnCallback="CmbCity_Callback" 
                        DropDownStyle="DropDown" DataSourceID="AccessDataSourceCities" TextField="City" ValueField="City" EnableIncrementalFiltering="True" EnableSynchronization="False">
                    </dxe:ASPxComboBox>
                </dxp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td></tr>
        <tr><td colspan="3"><div class="Spacer" style="height: 58px;"></div></td></tr>
    </table>
    <%-- BeginRegion DataSources --%>    
    <asp:AccessDataSource ID="AccessDataSourceCountry" runat="server" DataFile="~/App_Data/WorldCities.mdb"
        SelectCommand="SELECT * FROM [Countries]"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceCities" runat="server" DataFile="~/App_Data/WorldCities.mdb"
        SelectCommand="SELECT c.City FROM [Cities] c, [Countries] cr WHERE (c.CountryId = cr.CountryId) AND (cr.Country = ?) order by c.City">
        <SelectParameters>
            <asp:Parameter Name="?" />
        </SelectParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

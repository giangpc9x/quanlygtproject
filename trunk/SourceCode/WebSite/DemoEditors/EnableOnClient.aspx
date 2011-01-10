<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="EnableOnClient.aspx.cs" Inherits="Editors_EnableOnClient" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <script type="text/javascript" language="javascript">
function ChangeTechnology(control) {
    cbProduct.SetSelectedIndex(0);
    cbVersion.SetSelectedIndex(0);
    CheckControlsEnabled();
    if(control.GetValue() != "") {
        cbProduct.PerformCallback(control.GetText());
        cbProduct.SetFocus();
    }
}
function ChangeProduct(control) {
    cbVersion.SetSelectedIndex(0);
    CheckControlsEnabled();
    if(control.GetValue() != "")
        cbVersion.SetFocus();
}
function CheckControlsEnabled() {
    cbProduct.SetEnabled(cbTechnology.GetSelectedIndex() > 0);
    cbVersion.SetEnabled(cbProduct.GetSelectedIndex() > 0);
}
    </script>
    <table cellspacing="0" cellpadding="0" width="100%"><tr><td>
        <dxrp:ASPxRoundPanel ID="rpTechnology" SkinID="RoundPanelGroupBox" runat="server" HeaderText="Select Step by Step" GroupBoxCaptionOffsetY="-20px">
            <ContentPaddings PaddingTop="12px" PaddingLeft="20px" PaddingBottom="21px" PaddingRight="20px" />
            <PanelCollection><dxp:PanelContent runat="server">
                <%-- BeginRegion Technology --%>
                <table cellspacing="2" cellpadding="0" border="0"><tr><td>
                    <dxe:ASPxLabel ID="lblTechnology" runat="server" Text="Technology" AssociatedControlID="cbTechnology"></dxe:ASPxLabel>
                </td><td><div class="Spacer" style="width: 30px;"></div></td><td>
                    <dxe:ASPxComboBox ID="cbTechnology" ClientInstanceName="cbTechnology" runat="server" Width="200px" TextField="Name" DropDownStyle="DropDownList" EnableIncrementalFiltering="True" SelectedIndex="0" DataSourceID="xmlTechnology" OnDataBound="cbTechnology_DataBound">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) { ChangeTechnology(s); }"></ClientSideEvents>
                    </dxe:ASPxComboBox>
                </td></tr>
                <%-- EndRegion --%>
                <%-- BeginRegion Product --%>
                <tr><td colspan="2">
                    <dxe:ASPxLabel ID="lblProduct" runat="server" Text="Product" AssociatedControlID="cbProduct"></dxe:ASPxLabel>
                </td><td>
                    <dxe:ASPxComboBox ID="cbProduct" ClientInstanceName="cbProduct" runat="server" Width="200px" TextField="Name" DropDownStyle="DropDownList" EnableIncrementalFiltering="True" SelectedIndex="0" DataSourceID="xmlProduct" OnDataBound="cbProduct_DataBound" OnCallback="cbProduct_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) { ChangeProduct(s); }"></ClientSideEvents>
                    </dxe:ASPxComboBox>
                </td></tr>
                <%-- EndRegion --%>
                <%-- BeginRegion Version --%>
                <tr><td colspan="2">
                    <dxe:ASPxLabel ID="lblVersion" runat="server" Text="Version" AssociatedControlID="cbVersion"></dxe:ASPxLabel>
                </td><td>
                    <dxe:ASPxComboBox ID="cbVersion" ClientInstanceName="cbVersion" runat="server" Width="200px" DropDownStyle="DropDownList" EnableIncrementalFiltering="True" SelectedIndex="0">
                        <Items>
                            <dxe:ListEditItem Text="(none)" Value="none" />
                            <dxe:ListEditItem Text="v2007 vol3.0" Value="v7.3" />
                            <dxe:ListEditItem Text="v2008 vol1.0" Value="v8.1" />
                            <dxe:ListEditItem Text="v2008 vol2.0" Value="v8.2" />
                        </Items>
                    </dxe:ASPxComboBox>
                </td></tr></table>
                <%-- EndRegion --%>
            </dxp:PanelContent></PanelCollection>
        </dxrp:ASPxRoundPanel>
    </td></tr><tr><td><div class="Spacer" style="height: 58px;"></div></td></tr></table>
    <%-- BeginRegion DataSource --%>
    <asp:XmlDataSource ID="xmlTechnology" runat="server" DataFile="~/App_Data/Products.xml" XPath="//Technology"></asp:XmlDataSource>
    <asp:XmlDataSource ID="xmlProduct" runat="server" DataFile="~/App_Data/Products.xml"></asp:XmlDataSource>
    <%-- EndRegion --%>
</asp:Content>

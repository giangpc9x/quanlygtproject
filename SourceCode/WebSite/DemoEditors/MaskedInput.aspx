<%-- BeginRegion Tags and page paramerties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="MaskedInput.aspx.cs" Inherits="Editors_MaskedInput" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%-- EndRegion --%>
<%-- BeginRegion Css --%>
<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" runat="server">
<style type="text/css">
    td.editorCell {
        padding-left: 20px; 
        width: 200px;
    }      
    div.notes{
        color: black;
        padding: 4px;
    }
    .separator {
        height: 5px;
    }
</style>
</asp:Content>
<%-- EndRegion --%>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" runat="server">
<script type="text/javascript">
// <![CDATA[
function phone_InitAndKeyUp(s, e) {
    document.getElementById("phoneValue").innerHTML = s.GetValue();        
}
function price_InitAndKeyUp(s, e) {
    document.getElementById("priceValue").innerHTML = s.GetValue();        
}
// ]]>
</script>
<%-- BeginRegion Zip Code --%>
<dxrp:ASPxRoundPanel ID="ZipMask" SkinID="RoundPanelGroupBox" runat="server" Width="100%" 
    GroupBoxCaptionOffsetY="-10px" HeaderText="Zip Code">
    <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
    <PanelCollection>
        <dxp:PanelContent runat="server">
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="editorCell">
                        <dxe:ASPxTextBox ID="txtZip" runat="server" Width="150">
                            <MaskSettings Mask="00000" ErrorText="Please input missing symbols" />
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>
                        <div class="notes">Mask = 00000</div>                        
                        <div class="notes">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>PromptChar =&nbsp;</td>                                        
                                    <td>
                                        <dxe:ASPxComboBox ID="cmbPromtChar" runat="server" 
                                            AutoPostBack="true" Width="50" DropDownWidth="50" SelectedIndex="0">
                                            <Items>
                                                <dxe:ListEditItem Value="_" />
                                                <dxe:ListEditItem Value="#" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>                        
                        <div class="notes">ErrorText = &quot;Please input missing symbols&quot;</div>
                    </td>
                </tr>
            </table>   
        </dxp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<div class="separator"></div>
<%-- EndRegion --%>
<%-- BeginRegion Telephone --%>
<dxrp:ASPxRoundPanel ID="PhoneMask" SkinID="RoundPanelGroupBox" runat="server" Width="100%" 
    GroupBoxCaptionOffsetY="-10px" HeaderText="Telephone">
    <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
    <PanelCollection>
        <dxp:PanelContent runat="server">
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="editorCell">
                        <dxe:ASPxTextBox ID="txtPhone" runat="server" Width="150" ClientInstanceName="clTxtPhone">
                            <MaskSettings Mask="+1 (999) 000-0000" IncludeLiterals="None" />
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                            <ClientSideEvents Init="phone_InitAndKeyUp" KeyUp="phone_InitAndKeyUp" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>                            
                        <div class="notes">Mask = +1 (999) 000-0000</div>
                        <div class="notes">IncludeLiterals = None</div>
                        <div class="notes">Value = <span id="phoneValue"></span></div>
                    </td>
                </tr>
            </table>   
        </dxp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<div class="separator"></div>
<%-- EndRegion --%>
<%-- BeginRegion Price --%>
<dxrp:ASPxRoundPanel ID="PriceMask" SkinID="RoundPanelGroupBox" runat="server" Width="100%" 
    GroupBoxCaptionOffsetY="-20px" HeaderText="Price">
    <ContentPaddings PaddingTop="12px" PaddingLeft="2px" PaddingBottom="17px" PaddingRight="2px" />        
    <PanelCollection>
        <dxp:PanelContent runat="server" class="">                
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="editorCell">
                        <dxe:ASPxTextBox ID="txtPrice" runat="server" Width="150">
                            <MaskSettings Mask="$<0..99999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                            <ClientSideEvents Init="price_InitAndKeyUp" KeyUp="price_InitAndKeyUp" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>
                        <div class="notes">Mask = $&lt;0..99999g&gt;.&lt;00..99&gt;</div>
                        <div class="notes">IncludeLiterals = DecimalSymbol</div>
                        <div class="notes">Value = <span id="priceValue"></span></div>                        
                    </td>
                </tr>
            </table>   
        </dxp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<div class="separator"></div>
<%-- EndRegion --%>  
<%-- BeginRegion Date --%>
<dxrp:ASPxRoundPanel ID="DateMask" SkinID="RoundPanelGroupBox" runat="server" Width="100%" 
    GroupBoxCaptionOffsetY="-10px" HeaderText="ASPxDateEdit with Mask">
    <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
    <PanelCollection>
        <dxp:PanelContent runat="server"> 
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="editorCell">
                        <dxe:ASPxDateEdit ID="dateEdit" runat="server" Width="150" 
                            EditFormat="Custom" UseMaskBehavior="true" />
                    </td>
                    <td>
                        <div class="notes">UseMaskBehavior = True</div>
                        <div class="notes">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>EditFormatString =&nbsp;</td>
                                    <td>
                                        <dxe:ASPxComboBox ID="cmbDateType" runat="server" Width="150" 
                                            AutoPostBack="true" SelectedIndex="0">
                                            <Items>
                                                <dxe:ListEditItem Value="MMMM dd, yyyy" />
                                                <dxe:ListEditItem Value="MM/dd/yyyy hh:mm tt" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>   
        </dxp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<div class="separator"></div>
<%-- EndRegion --%>
<%-- BeginRegion Promo Code --%>
<dxrp:ASPxRoundPanel ID="PromoCodeMask" SkinID="RoundPanelGroupBox" runat="server" Width="100%" 
    GroupBoxCaptionOffsetY="-10px" HeaderText="Promo Code">
    <ContentPaddings PaddingTop="2px" PaddingLeft="2px" PaddingBottom="7px" PaddingRight="2px" />
    <PanelCollection>
        <dxp:PanelContent runat="server">
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="editorCell">
                        <dxe:ASPxTextBox ID="txtPromoCode" runat="server" Width="150">
                            <MaskSettings ShowHints="true" Mask="<HOME|*BUSINESS>->aaaa-aaaa" />
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>
                        <div class="notes">Mask = &lt;HOME|*BUSINESS&gt;-&gt;aaaa-aaaa</div>
                        <div class="notes">ShowHints = True</div>
                    </td>
                </tr>
            </table>   
        </dxp:PanelContent>
    </PanelCollection>
</dxrp:ASPxRoundPanel>
<%-- EndRegion --%>
</asp:Content>

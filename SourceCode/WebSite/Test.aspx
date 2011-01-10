<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Culture = "vi-VN" Inherits="Test" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v9.1" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dxhe" %>

<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxDataView" tagprefix="dxdv" %>
<%@ Register assembly="DevExpress.Web.ASPxTreeList.v9.1" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dxwtl" %>
<%@ Register assembly="DevExpress.Web.ASPxTreeList.v9.1.Export" namespace="DevExpress.Web.ASPxTreeList.Export" tagprefix="dxwtl" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v9.1" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxwpg" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dxwsc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <div style = "padding-left:50px;">
       
        <dxhe:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" Height="550px">
            <SettingsImageUpload>
                <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/x-png">
                </ValidationSettings>
            </SettingsImageUpload>
        </dxhe:ASPxHtmlEditor>
       
    </div>
    </form>
</body>
</html>

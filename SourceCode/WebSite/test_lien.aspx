<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_lien.aspx.cs" Inherits="test_lien" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dxe:ASPxButton ID="btnLuu" runat="server" onclick="btnLuu_Click" Text="Luu" 
            Width="90px">
        </dxe:ASPxButton>
    
    </div>
    <dxwgv:ASPxGridView ID="gvDienThi" runat="server">
    </dxwgv:ASPxGridView>
    </form>
</body>
</html>

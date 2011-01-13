<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test_Khanh.aspx.cs" Inherits="Test_Khanh" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style = "padding-left: 10px; float:left; width:100px;">
        <asp:Button ID="btnInsert" runat="server" Text="Insert" 
            onclick="btnInsert_Click" />
    </div>
    <div style = "padding-left: 10px; float:left; width:100px;">
        <asp:Button ID="btnUpdate" runat="server" Text="Update" />
    </div>
    <div style = "padding-left: 10px; float:left; width:100px;">
        <asp:Button ID="btnDelete" runat="server" Text="Delete" />
    </div>
    <div style = "padding-left: 10px; float:left; width:100px;">
        <asp:Button ID="btnSelect" runat="server" Text="Select" />
    </div>
    <div style = "padding-left: 10px; float:left; width:600px;">
        <asp:Label ID="lblTest" runat="server" Text=""></asp:Label>
    </div>
    <div style = "clear:both;">
        <asp:GridView ID="gvTest" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>

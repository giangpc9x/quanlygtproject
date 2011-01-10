<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="PopupEditFormTemplate.aspx.cs" Inherits="GridEditing_PopupEditFormTemplate" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%-- EndRegion --%>    
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating" Width="100%">
        <%-- BeginRegion Columns --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True" />
                <NewButton Visible="True" />
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                <EditFormSettings VisibleIndex="2" ColumnSpan="2" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataMemoColumn FieldName="Notes" Visible="False">
            </dxwgv:GridViewDataMemoColumn>
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                <EditFormSettings VisibleIndex="3" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataColumn>
        </Columns>
        <%-- EndRegion --%>
        <SettingsPager Mode="ShowAllRecords"/>
        <SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="400px" />
        <Templates>
            <EditForm>
            <div style="padding:4px 4px 3px 4px">
            <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%" Height="140px">
            <TabPages>
                <dxtc:TabPage Text="Info" Visible="true">
                    <ContentCollection><dxw:ContentControl runat="server">
                        <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                    </dxw:ContentControl></ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="Notes"  Visible="true">
                   <ContentCollection><dxw:ContentControl runat="server">
                        <dxe:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="100%" Height="93px"></dxe:ASPxMemo>
                   </dxw:ContentControl></ContentCollection>
                </dxtc:TabPage>
            </TabPages>
            </dxtc:ASPxPageControl>
            </div>
            <div style="text-align:right; padding:2px 2px 2px 2px">
                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
            </div>
            </EditForm>
        </Templates>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        OnDeleting="AccessDataSource1_Modifying" OnInserting="AccessDataSource1_Modifying" OnUpdating="AccessDataSource1_Modifying"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]" 
        DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" 
        InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Notes]) VALUES (?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [Title] = ?, [BirthDate] = ?, [HireDate] = ?, [Notes] = ? WHERE [EmployeeID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
</asp:Content>

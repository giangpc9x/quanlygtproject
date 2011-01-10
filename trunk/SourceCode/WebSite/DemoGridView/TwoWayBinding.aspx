<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="TwoWayBinding.aspx.cs" Inherits="GridEditing_TwoWayBinding" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%-- EndRegion --%>    
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" Runat="Server">
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" Width="100%" EnableRowsCache="False">
        <%-- BeginRegion Columns --%>
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True" />
                <NewButton Visible="True" />
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1"/>
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="2"/>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="4"/>
            <dxwgv:GridViewDataMemoColumn FieldName="Notes" Visible="False"/>
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3"/>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="5"/>
        </Columns>
        <%-- EndRegion --%>
        <SettingsPager Mode="ShowAllRecords"/>
        <Templates>
            <EditForm>
            <div style="padding:4px 4px 3px 4px">
                <table>
                    <tr>
                        <% if(!grid.IsNewRowEditing) { %>
                        <td rowspan="4">
                            <div style="border: solid 1px #C2D4DA; padding: 2px;"><dxe:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Photo") %>'></dxe:ASPxBinaryImage></div>
                        </td>
                        <% } %>
                        <td style="white-space:nowrap">First Name</td>
                        <td style="width:50%"><dxe:ASPxTextBox runat="server" ID="edFirst" Text='<%# Bind("FirstName") %>' Width="100%"></dxe:ASPxTextBox> </td>
                        <td style="white-space:nowrap">Last Name</td>
                        <td  style="width:50%"><dxe:ASPxTextBox runat="server" ID="edLast" Text='<%# Bind("LastName") %>' Width="100%"></dxe:ASPxTextBox> </td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td style="width:100%" colspan="3"><dxe:ASPxTextBox runat="server" ID="edTitle" Text='<%# Bind("Title") %>' Width="100%"></dxe:ASPxTextBox> </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap">Birth Date</td>
                        <td style="width:50%"><dxe:ASPxDateEdit runat="server" ID="edBirth" Value='<%# Bind("BirthDate") %>' Width="100%"></dxe:ASPxDateEdit> </td>
                        <td style="white-space:nowrap">Hire Date</td>
                        <td style="width:50%"><dxe:ASPxDateEdit runat="server" ID="edHire" Value='<%# Bind("HireDate") %>' Width="100%"></dxe:ASPxDateEdit> </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <dxe:ASPxMemo runat="server" ID="edNotes" Text='<%# Bind("Notes")%>' Width="100%" Height="100px"></dxe:ASPxMemo>
                        </td>
                    </tr>
                </table>
                
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
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]  WHERE [Photo] is not null" 
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

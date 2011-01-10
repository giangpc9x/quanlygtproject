<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="C#" MasterPageFile="~/Demo.master" AutoEventWireup="true" CodeFile="DataBinding.aspx.cs" Inherits="Editors_DataBinding" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%-- EndRegion --%>
<asp:Content ID="Content2" ContentPlaceHolderID="localCssPlaceholder" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Css/DataBinding.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phContent" runat="server">
    <script type="text/javascript" language="javascript">
function RaiseClientValidation() {
    return ASPxClientEdit.ValidateGroup("");
}
    </script>
    
    <dxrp:ASPxRoundPanel ID="RoundPanel" runat="server" Width="400px" HeaderText="Club Member Card">
        <PanelCollection>
            <dxrp:PanelContent>
                <div id="roundPanelContent">
                    <asp:DetailsView runat="server" Height="159px" BorderStyle="None" Font-Size="9pt" Width="100%" BorderWidth="0px" 
                        DataSourceID="ClubMembersDataSource" ID="ClubMemberCard" GridLines="None" AllowPaging="True" AutoGenerateRows="False" 
                        DataKeyNames="ClubMemberId" OnDataBound="OnDataBound">
                        <FieldHeaderStyle Width="95px"></FieldHeaderStyle>
                        <RowStyle Height="23px" VerticalAlign="Middle"></RowStyle>
                        <PagerStyle HorizontalAlign="Center"></PagerStyle>
                        <Fields>
                            <%-- BeginRegion Fields --%>
                            <asp:TemplateField SortExpression="ID" HeaderText="&#160;MemberId" InsertVisible="False">
                                <EditItemTemplate>
                                    <dxe:ASPxLabel ID="lblClubMemberId" runat="server" Text='<%# Bind("ClubMemberId") %>'></dxe:ASPxLabel>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <dxe:ASPxLabel id="lblClubMemberId" runat="server" Text='<%# Eval("ClubMemberId") %>'></dxe:ASPxLabel>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Name" HeaderText="&#160;Name">
                                <EditItemTemplate>
                                    <dxe:ASPxTextBox id="tbName" runat="server" Width="200px" Value='<%# Bind("Name") %>' MaxLength="128">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Name is required." />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltName" runat="server" Text='<%# Eval("Name") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Gender" HeaderText="&#160;Gender">
                                <EditItemTemplate>
                                    <dxe:ASPxRadioButtonList id="rblGender" runat="server" BackColor="Transparent" Value='<%# Bind("Gender") %>'
                                        RepeatDirection="Horizontal" EncodeHtml="False">
                                        <Items>
                                            <dxe:ListEditItem Text="Male&nbsp;&nbsp;" Value="Male" />
                                            <dxe:ListEditItem Text="Female" Value="Female" />
                                        </Items>
                                        <Paddings padding="0px" />
                                        <Border borderstyle="None" />
                                    </dxe:ASPxRadioButtonList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltGender" Text='<%# Eval("Gender") %>' runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Birthday" HeaderText="&#160;Birthday">
                                <EditItemTemplate>
                                    <dxe:ASPxDateEdit ID="deBirthday" runat="server" Value='<%# Bind("Birthday") %>'
                                        Width="200px" EditFormatString="MM/dd/yyyy">
                                    </dxe:ASPxDateEdit>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltBirthday" runat="server" Text='<%# Eval("Birthday", "{0:d}") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Occupation" HeaderText="&#160;Occupation">
                                <EditItemTemplate>
                                    <dxe:ASPxComboBox id="cbOccupation" runat="server" DataSourceID="OccupationsDataSource"
                                        Width="200px" Value='<%# Bind("Occupation") %>' ValueField="Occupation" TextField="Occupation"
                                        MaxLength="128">
                                    </dxe:ASPxComboBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltOccupation" Text='<%# Eval("Occupation") %>' runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <div class="separator">
                                        <hr />
                                    </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <div class="separator">
                                        <hr />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Email" HeaderText="&#160;Email">
                                <EditItemTemplate>
                                    <dxe:ASPxTextBox id="tbEmail" runat="server" Width="200px" Value='<%# Bind("Email") %>'
                                        MaxLength="64">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="E-mail is required." />
                                            <RegularExpression ErrorText="Invalid e-mail." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="SubscriptionFlag" HeaderText="&#160;News&nbsp;Subscription&nbsp;">
                                <EditItemTemplate>
                                    <dxe:ASPxCheckBox ID="ckbSubscriptionFlag" runat="server" ValueType="System.Int32"
                                        ValueChecked="1" ValueUnchecked="0" Value='<%# Bind("SubscriptionFlag") %>'>
                                    </dxe:ASPxCheckBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltSubscriptionFlag" runat="server" Text='<%# Eval("SubscriptionFlag").ToString() == "1" ? "Yes" : "No" %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <div class="commandButtonsBlock">
                                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Update" Text="Update" OnClientClick="return RaiseClientValidation();"></asp:LinkButton>
                                        <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </div>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <div class="commandButtonsBlock">
                                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Insert" Text="Insert" OnClientClick="return RaiseClientValidation();"></asp:LinkButton>
                                        <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </div>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <div class="commandButtonsBlock">
                                        <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        <asp:LinkButton ID="lbNew" runat="server" CommandName="New" Text="New"></asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- EndRegion --%>
                        </Fields>
                    </asp:DetailsView>
                </div>
             </dxrp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
    <br />
    <%-- BeginRegion Error Panel --%>
    <dxrp:ASPxRoundPanel ID="rpReadOnlyError" runat="server" BackColor="#FFEAEA" ForeColor="Red"
        ShowHeader="False" SkinID="Undefined" Visible="False" Width="400px">
        <Border BorderColor="Red" BorderStyle="Solid" BorderWidth="1px"></Border>
        <BottomRightCorner Height="4px" Url="~/Editors/Images/ASPxRoundPanel/ReadOnlyError/BottomRightCorner.png"
            Width="4px">
        </BottomRightCorner>
        <PanelCollection>
            <dxrp:PanelContent runat="server">
            </dxrp:PanelContent>
        </PanelCollection>
        <TopLeftCorner Height="4px" Url="~/Editors/Images/ASPxRoundPanel/ReadOnlyError/TopLeftCorner.png"
            Width="4px"></TopLeftCorner>
        <TopRightCorner Height="4px" Url="~/Editors/Images/ASPxRoundPanel/ReadOnlyError/TopRightCorner.png"
            Width="4px"></TopRightCorner>
        <HeaderStyle BackColor="#DEDEDE" />
        <BottomLeftCorner Height="4px" Url="~/Editors/Images/ASPxRoundPanel/ReadOnlyError/BottomLeftCorner.png"
            Width="4px"></BottomLeftCorner>
    </dxrp:ASPxRoundPanel>
    <%-- EndRegion --%>
    
    <%-- BeginRegion Data Sources --%>
    <asp:AccessDataSource ID="ClubMembersDataSource" runat="server" DataFile="~/App_Data/EditorsSampleDB.mdb"
        SelectCommand="SELECT [ClubMemberId], [Name], [Gender], [Email], [Birthday], [Occupation], [SubscriptionFlag] FROM ClubMember ORDER BY [ClubMemberId]"
        UpdateCommand="UPDATE [ClubMember] SET [Name] = ?, [Gender] = ?, [Email] = ?, [Birthday] = ?, [Occupation] = ?, [SubscriptionFlag] = ? WHERE [ClubMemberId] = ?"
        InsertCommand="INSERT INTO [ClubMember] ([Name], [Gender], [Email], [Birthday], [Occupation], [SubscriptionFlag]) VALUES (?, ?, ?, ?, ?, ?)"
        DeleteCommand="DELETE FROM [ClubMember] WHERE [ClubMemberId] = ?" CancelSelectOnNullParameter="False" 
        OnUpdating="OnClubMemberDataSourceModifying" OnInserting="OnClubMemberDataSourceModifying" OnDeleting="OnClubMemberDataSourceModifying">
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Birthday" Type="DateTime" />
            <asp:Parameter Name="Occupation" Type="String" />
            <asp:Parameter Name="SubscriptionFlag" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="ClubMemberId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Birthday" Type="DateTime" />
            <asp:Parameter Name="Occupation" Type="String" />
            <asp:Parameter Name="SubscriptionFlag" Type="Int32" DefaultValue="0" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="ClubMemberId" Type="Int32" />
        </DeleteParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="OccupationsDataSource" runat="server" DataFile="~/App_Data/EditorsSampleDB.mdb"
        SelectCommand="SELECT [Occupation] FROM [Occupation] ORDER BY [Occupation]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoi.aspx.cs" Inherits="DeThi_qlcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dxuc" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">


   <div style="width:90px; float:left; padding-bottom:5px;"> 
       <dxe:ASPxButton ID="btThemmoi" ClientInstanceName="btThemmoi" runat="server" Text="Thêm mới">
       </dxe:ASPxButton>
   </div>
   
   <div style="width:90px; float:left; padding-left:15px;"> 
       <dxe:ASPxButton ID="btSua" ClientInstanceName="btSua" runat="server" Text="Sửa">
       </dxe:ASPxButton>
   </div>
   
   <div style="width:90px; float:left; padding-left:20px;"> 
       <dxe:ASPxButton ID="btXoa" ClientInstanceName="btXoa" runat="server" Text="Xóa">
       </dxe:ASPxButton>
   </div>
   
   <div style = "clear:both;">
       <dxwgv:ASPxGridView ID="gvCauHoi" runat="server" AutoGenerateColumns="False" 
           KeyFieldName="MaCauHoi" Width="284px">
           <Columns>
               <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                   <ClearFilterButton Visible="True">
                   </ClearFilterButton>
               </dxwgv:GridViewCommandColumn>
               <dxwgv:GridViewDataTextColumn Caption="Mã câu hỏi" FieldName="MaCauHoi" 
                   Name="gcMaCauHoi" VisibleIndex="1">
               </dxwgv:GridViewDataTextColumn>
               <dxwgv:GridViewDataTextColumn Caption="Nội dung câu hỏi" FieldName="NoiDung" 
                   Name="gcNoiDung" VisibleIndex="2">
               </dxwgv:GridViewDataTextColumn>
           </Columns>
       </dxwgv:ASPxGridView>
   </div>
   
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


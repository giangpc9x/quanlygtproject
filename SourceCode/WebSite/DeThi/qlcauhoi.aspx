<%@ Page Title="" Language="C#" MasterPageFile="~/giaothong.master" AutoEventWireup="true" CodeFile="qlcauhoi.aspx.cs" Inherits="DeThi_qlcauhoi" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v9.1" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dxuc" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="localCssPlaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phContent" Runat="Server">








<script type="text/javascript">
    function StartDelete() {
        if (gvCauHoi.GetSelectedRowCount()) {
            if (confirm('Xác nhận xóa dữ liệu'))
                gvCauHoi.GetValuesOnCustomCallback("Delete", GetUpdateResult);
        }
        else
            alert('Vui lòng chọn một hoặc nhiều dòng dữ liệu trước khi xóa');
    }
  
</script>


   <div style="width:90px; float:left; padding-bottom:5px;"> 
       <dxe:ASPxButton ID="btThemmoi" ClientInstanceName="btThemmoi" runat="server" 
           Text="Thêm mới" Width="90px" onclick="btThemmoi_Click">
       </dxe:ASPxButton>
   </div>
   
   <div style="width:90px; float:left; padding-left:20px;"> 
       <dxe:ASPxButton ID="btXoa" ClientInstanceName="btXoa" runat="server" Text="Xóa" Width="90px">
           <ClientSideEvents Click="function(s, e) {    
	            StartDelete();
}" />
       </dxe:ASPxButton>
   </div>
   
   <div style = "clear:both;">
       <dxwgv:ASPxGridView ID="gvCauHoi" runat="server" AutoGenerateColumns="False" 
           KeyFieldName="MaCauHoi" Width="100%" 
           oncustomcallback="gvCauHoi_CustomCallback" 
           oncustomdatacallback="gvCauHoi_CustomDataCallback" 
           onrowvalidating="gvCauHoi_RowValidating">
           <SettingsBehavior AllowFocusedRow="True" />
           <Columns>
               <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                   <ClearFilterButton Visible="True">
                   </ClearFilterButton>
               </dxwgv:GridViewCommandColumn>
               <dxwgv:GridViewDataTextColumn Caption="Mã câu hỏi" FieldName="MaCauHoi" 
                   Name="gcMaCauHoi" VisibleIndex="1" Width="120px">
               </dxwgv:GridViewDataTextColumn>
               <dxwgv:GridViewDataTextColumn Caption="Nội dung câu hỏi" FieldName="NoiDung" 
                   Name="gcNoiDung" VisibleIndex="2">
               </dxwgv:GridViewDataTextColumn>
           </Columns>
       </dxwgv:ASPxGridView>
       <dxwgv:GridViewCommandColumn VisibleIndex="2" Caption = "Sửa" Width = "30px">
                <EditButton Visible="True" Text = "Sửa">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Error" 
                Visible="False" VisibleIndex="6">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dxwgv:ASPxGridView>
   </div>
   
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOnceContent" Runat="Server">
</asp:Content>


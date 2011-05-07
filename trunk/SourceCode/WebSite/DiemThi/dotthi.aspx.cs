using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;

public partial class DiemThi_dotthi : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsDotThi_DAL dotthiDAL;
    clsDotThi_DTO dotthiDTO;

    clsLoaiBanglai_DAL lblDAL;
    clsLoaiBanglai_DTO lblDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");
        dotthiDAL = new clsDotThi_DAL();
        dotthiDTO = new clsDotThi_DTO();

        lblDAL = new clsLoaiBanglai_DAL();

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        if (cboLoaiBang.Value != null)
        {
            dotthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
            gvDotThi.DataSource = loadDataToUI(dotthiDTO);
            gvDotThi.DataBind();
        }

    }
    private void loadMasterData()
    {
        lblDTO = new clsLoaiBanglai_DTO();
        DataTable dt = new DataTable();
        dt = lblDAL.getMaLoaibang(lblDTO);


        cboLoaiBang.ValueField = "MaLoaiBang";
        cboLoaiBang.TextField = "TenLoai";

        cboLoaiBang.DataSource = dt;
        cboLoaiBang.DataBind();
        //GridViewDataComboBoxColumn gcloaibang = gvDotThi.Columns["TenLoai"] as GridViewDataComboBoxColumn;
        //gcloaibang.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";

        //GridViewDataCheckColumn gclTrangThai = gvDotThi.Columns["TrangThai"] as GridViewDataCheckColumn;
        //gclTrangThai.PropertiesCheckEdit.DisplayTextChecked = "Chon";
    }
    private DataTable loadDataToUI(clsDotThi_DTO dotthiDTO)
    {
        DataTable dt = new DataTable();
        dt = dotthiDAL.getDotThi(dotthiDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView

    protected void gvDotThi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvDotThi.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvDotThi.Columns)
        {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if (dataColumn == null || dataColumn.Caption == "Error" || dataColumn.Caption == "Mã Đợt Thi") continue;
            if (e.NewValues[dataColumn.FieldName] == null || e.NewValues[dataColumn.FieldName].ToString().Trim() == string.Empty)
            {
                e.Errors[dataColumn] = "Vui lòng điền dữ liệu.";
            }
        }
        if (e.Errors.Count > 0)
        {
            e.RowError = "Vui lòng điền đầy đủ thông tin trước khi lưu.";
            return;
        }
        strOldValues = e.OldValues["MaDotThi"] == null ? string.Empty : e.OldValues["MaDotThi"].ToString();
    }
    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }
    #endregion

     #region Sự kiện thêm - Xóa - Sửa dữ liệu trên GridView

    protected void gvDotThi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        dotthiDTO = new clsDotThi_DTO();
        e.Cancel = true;
        dotthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString() ;
        dotthiDTO.NgayTao = cmn.Convert_DMY_To_MDY(e.NewValues["NgayTao"].ToString());
        dotthiDTO.MoTa = e.NewValues["MoTa"].ToString();
        
        int iReturn = dotthiDAL.InsertUpdate(dotthiDTO);
        if (iReturn >= 0)
        {
            dotthiDTO = new clsDotThi_DTO();
            dotthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
            gvDotThi.DataSource = loadDataToUI(dotthiDTO);
            gvDotThi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvDotThi.DoRowValidation();
        }
    }

    protected void gvDotThi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        dotthiDTO = new clsDotThi_DTO();
        e.Cancel = true;
        //dotthiDTO.OldID = e.OldValues["MaDotThi"].ToString();
        //dotthiDTO.MaDotThi = e.NewValues["MaDotThi"].ToString();
        dotthiDTO.MaLoaiBang =cboLoaiBang.Value.ToString();
        dotthiDTO.NgayTao = cmn.Convert_DMY_To_MDY(e.NewValues["NgayTao"].ToString());
        dotthiDTO.MoTa = e.NewValues["MoTa"].ToString();
        int iReturn = dotthiDAL.InsertUpdate(dotthiDTO);
        if (iReturn >= 0)
        {
            dotthiDTO = new clsDotThi_DTO();
            dotthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
            gvDotThi.DataSource = loadDataToUI(dotthiDTO);
            gvDotThi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvDotThi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvDotThi.DoRowValidation();
        }
    }

    protected void gvDotThi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        dotthiDTO = new clsDotThi_DTO();
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvDotThi.VisibleRowCount;
        List<object> keyValues = gvDotThi.GetSelectedFieldValues("MaDotThi");
        foreach (object key in keyValues)
        {
            dotthiDTO.MaDotThi = key.ToString();
            int iReturn = dotthiDAL.Delete(dotthiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        dotthiDTO = new clsDotThi_DTO();
        dotthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
        gvDotThi.DataSource = loadDataToUI(dotthiDTO);
        gvDotThi.Selection.SelectAll();
    }

    protected void gvDotThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        dotthiDTO = new clsDotThi_DTO();
        if (e.Parameters == "Update")
        {
            dotthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
            gvDotThi.DataSource = loadDataToUI(dotthiDTO);
            gvDotThi.Selection.UnselectAll();
        }
        else
        {
           
            dotthiDTO.MaLoaiBang = e.Parameters;
            DataTable dt = dotthiDAL.getDotThi(dotthiDTO);
            gvDotThi.DataSource = dt;
            gvDotThi.DataBind();
        }
    }
     #endregion
}

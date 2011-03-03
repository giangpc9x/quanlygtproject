using System;
using System.Collections.Generic;
using System.Linq;
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
        dotthiDAL = new clsDotThi_DAL();
        dotthiDTO = new clsDotThi_DTO();

        lblDAL = new clsLoaiBanglai_DAL();
        lblDTO = new clsLoaiBanglai_DTO();

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        gvDotThi.DataSource = loadDataToUI();
        gvDotThi.DataBind();

    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = lblDAL.getMaLoaibang(lblDTO);
        GridViewDataComboBoxColumn gcloaibang = gvDotThi.Columns["TenLoai"] as GridViewDataComboBoxColumn;
        gcloaibang.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";

        //GridViewDataCheckColumn gclTrangThai = gvDotThi.Columns["TrangThai"] as GridViewDataCheckColumn;
        //gclTrangThai.PropertiesCheckEdit.DisplayTextChecked = "Chon";
    }
    private DataTable loadDataToUI()
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
            if (dataColumn == null || dataColumn.Caption == "Error") continue;
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
        if (e.NewValues["MaDotThi"].ToString() != strOldValues && dotthiDAL.Check_Dot_Thi(e.NewValues["MaDotThi"].ToString()) == 1)
        {
            AddError(e.Errors, gvDotThi.Columns["MaDotThi"], "Đã tồn tại Mã Đợt Thi, không thể lưu");
            e.RowError = "Trùng mã Đợt Thi, vui lòng kiểm tra lại";
            return;
        }
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
        e.Cancel = true;
        dotthiDTO.MaDotThi = e.NewValues["MaDotThi"].ToString();
        dotthiDTO.MaLoaiBang = e.NewValues["TenLoai"].ToString(); ;
        dotthiDTO.NgayTao = cmn.Convert_DMY_To_MDY(e.NewValues["NgayTao"].ToString());
        dotthiDTO.MoTa = e.NewValues["MoTa"].ToString();
        
        int iReturn = dotthiDAL.InsertUpdate(dotthiDTO);
        if (iReturn >= 0)
        {
            gvDotThi.DataSource = loadDataToUI();
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
        e.Cancel = true;
        dotthiDTO.OldID = e.OldValues["MaDotThi"].ToString();
        dotthiDTO.MaDotThi = e.NewValues["MaDotThi"].ToString();
        dotthiDTO.MaLoaiBang = e.NewValues["TenLoai"].ToString(); ;
        dotthiDTO.NgayTao = cmn.Convert_DMY_To_MDY(e.NewValues["NgayTao"].ToString());
        dotthiDTO.MoTa = e.NewValues["MoTa"].ToString();
        int iReturn = dotthiDAL.InsertUpdate(dotthiDTO);
        if (iReturn >= 0)
        {
            gvDotThi.DataSource = loadDataToUI();
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
        gvDotThi.DataSource = loadDataToUI();
        gvDotThi.Selection.SelectAll();
    }

    protected void gvDotThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvDotThi.DataSource = loadDataToUI();
            gvDotThi.Selection.UnselectAll();
        }
    }
     #endregion
}

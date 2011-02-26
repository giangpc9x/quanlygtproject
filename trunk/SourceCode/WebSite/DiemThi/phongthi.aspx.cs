using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;

public partial class DiemThi_phongthi : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsPhongThi_DAL pthiDAL;
    clsPhongThi_DTO pthiDTO;

    clsDiaDiemThi_DAL dthiDAL;
    clsDiaDiemThi_DTO dthiDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {

        pthiDAL = new clsPhongThi_DAL();
        pthiDTO = new clsPhongThi_DTO();

        dthiDAL = new clsDiaDiemThi_DAL();
        dthiDTO = new clsDiaDiemThi_DTO();

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {
           
        }
        if (!Page.IsPostBack)
        {
           
        }
        loadMasterData();
        gvPhongThi.DataSource = loadDataToUI();
        gvPhongThi.DataBind();
    }

    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = dthiDAL.getDiaDiemThi(dthiDTO);
        GridViewDataComboBoxColumn gclDiemThi = gvPhongThi.Columns["DiaChi"] as GridViewDataComboBoxColumn;
        gclDiemThi.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";

        GridViewDataCheckColumn gclTrangThai = gvPhongThi.Columns["TrangThai"] as GridViewDataCheckColumn;
        gclTrangThai.PropertiesCheckEdit.DisplayTextChecked = "Chon";
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = pthiDAL.getPhongThi(pthiDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView
    protected void gvPhongThi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvPhongThi.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvPhongThi.Columns)
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
        strOldValues = e.OldValues["MaPhong"] == null ? string.Empty : e.OldValues["MaPhong"].ToString();
        if (e.NewValues["MaPhong"].ToString() != strOldValues && pthiDAL.Check_MaPhong(e.NewValues["MaPhong"].ToString()) == 1)
        {
            AddError(e.Errors, gvPhongThi.Columns["MaPhong"], "Đã tồn tại Mã Phòng, không thể lưu");
            e.RowError = "Trùng mã phòng, vui lòng kiểm tra lại";
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
    protected void gvPhongThi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        pthiDTO.MaPhong = e.NewValues["MaPhong"].ToString();
        pthiDTO.MoTa = e.NewValues["MoTa"].ToString(); ;
        pthiDTO.SoThSinhToiDa = e.NewValues["SoThSinhToiDa"].ToString();
        pthiDTO.TrangThai = e.NewValues["TrangThai"].ToString();
        pthiDTO.MaDiemThi = e.NewValues["DiaChi"].ToString();
        int iReturn = pthiDAL.InsertUpdate(pthiDTO);
        if (iReturn >= 0)
        {
            gvPhongThi.DataSource = loadDataToUI();
            gvPhongThi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvPhongThi.DoRowValidation();
        }
    }
    protected void gvPhongThi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        pthiDTO.OldID = e.OldValues["MaPhong"].ToString();
        pthiDTO.MaPhong = e.NewValues["MaPhong"].ToString();
        pthiDTO.MoTa = e.NewValues["MoTa"].ToString(); ;
        pthiDTO.SoThSinhToiDa = e.NewValues["SoThSinhToiDa"].ToString();
        pthiDTO.TrangThai = e.NewValues["TrangThai"].ToString();
        pthiDTO.MaDiemThi = e.NewValues["MaDiemThi"].ToString();
        int iReturn = pthiDAL.InsertUpdate(pthiDTO);
        if (iReturn >= 0)
        {
            gvPhongThi.DataSource = loadDataToUI();
            gvPhongThi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvPhongThi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvPhongThi.DoRowValidation();
        }
    }
    protected void gvPhongThi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvPhongThi.VisibleRowCount;
        List<object> keyValues = gvPhongThi.GetSelectedFieldValues("MaPhong");
        foreach (object key in keyValues)
        {
            pthiDTO.MaPhong = key.ToString();
            int iReturn = pthiDAL.Delete(pthiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvPhongThi.DataSource = loadDataToUI();
        gvPhongThi.Selection.SelectAll();
    }
    protected void gvPhongThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvPhongThi.DataSource = loadDataToUI();
            gvPhongThi.Selection.UnselectAll();
        }
    } 
    #endregion    
}
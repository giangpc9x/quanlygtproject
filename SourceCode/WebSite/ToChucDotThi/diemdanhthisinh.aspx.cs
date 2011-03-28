using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;
public partial class ToChucDotThi_diemdanhthisinh : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsThiSinh_DAL thisinhDAL;
    clsThiSinh_DTO thisinhDTO;

    clsKetQuaThi_DAL kqtDAL;
    clsKetQuaThi_DTO kqtDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        kqtDAL = new clsKetQuaThi_DAL();
        kqtDTO = new clsKetQuaThi_DTO();

        thisinhDAL = new clsThiSinh_DAL();
        thisinhDTO = new clsThiSinh_DTO();

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        gvKetQuaThi.DataSource = loadDataToUI();
        gvKetQuaThi.DataBind();
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = thisinhDAL.getThiSinh(thisinhDTO);
        GridViewDataComboBoxColumn gclthisinh = gvKetQuaThi.Columns["MaTS"] as GridViewDataComboBoxColumn;
        gclthisinh.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";

        //GridViewDataCheckColumn gclTrangThai = gvKetQuaThi.Columns["TrangThai"] as GridViewDataCheckColumn;
        //gclTrangThai.PropertiesCheckEdit.DisplayTextChecked = "Chon";
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = kqtDAL.getKetQuaThi(kqtDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView

    protected void gvKetQuaThi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvKetQuaThi.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvKetQuaThi.Columns)
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
        strOldValues = e.OldValues["SoDeThi"] == null ? string.Empty : e.OldValues["SoDeThi"].ToString();
        if (e.NewValues["SoDeThi"].ToString() != strOldValues && kqtDAL.Check_SoDeThi(e.NewValues["SoDeThi"].ToString()) == 1)
        {
            AddError(e.Errors, gvKetQuaThi.Columns["SoDeThi"], "Đã tồn tại số đề thi, không thể lưu");
            e.RowError = "Trùng số đề thi, vui lòng kiểm tra lại";
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

    protected void gvKetQuaThi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        kqtDTO.SoDeThi = e.NewValues["SoDeThi"].ToString();
        kqtDTO.MaTS = e.NewValues["MaTS"].ToString(); ;
        kqtDTO.DiemDanh = e.NewValues["DiemDanh"].ToString();
        kqtDTO.KetQuaThi = e.NewValues["KetQuaThi"].ToString();
        int iReturn = kqtDAL.InsertUpdate(kqtDTO);
        if (iReturn >= 0)
        {
            gvKetQuaThi.DataSource = loadDataToUI();
            gvKetQuaThi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvKetQuaThi.DoRowValidation();
        }
    }

    protected void gvKetQuaThi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        kqtDTO.OldID = e.OldValues["SoDeThi"].ToString();
        kqtDTO.SoDeThi = e.NewValues["SoDeThi"].ToString();
        kqtDTO.MaTS = e.NewValues["MaTS"].ToString(); ;
        kqtDTO.DiemDanh = e.NewValues["DiemDanh"].ToString();
        kqtDTO.KetQuaThi = e.NewValues["KetQuaThi"].ToString();
        int iReturn = kqtDAL.InsertUpdate( kqtDTO);
        if (iReturn >= 0)
        {
            gvKetQuaThi.DataSource = loadDataToUI();
            gvKetQuaThi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvKetQuaThi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvKetQuaThi.DoRowValidation();
        }
    }

    protected void gvKetQuaThi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvKetQuaThi.VisibleRowCount;
        List<object> keyValues = gvKetQuaThi.GetSelectedFieldValues("SoDeThi");
        foreach (object key in keyValues)
        {
            kqtDTO.SoDeThi = key.ToString();
            int iReturn = kqtDAL.Delete( kqtDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvKetQuaThi.DataSource = loadDataToUI();
        gvKetQuaThi.Selection.SelectAll();
    }

    protected void gvKetQuaThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvKetQuaThi.DataSource = loadDataToUI();
            gvKetQuaThi.Selection.UnselectAll();
        }
    }
    #endregion
}

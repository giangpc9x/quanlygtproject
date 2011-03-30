using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;

public partial class HoSoThiSinh_phancongcoithi : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsPhanCongCoithi_DAL pcctDAL;
    clsPhanCongCoiThi_DTO pcctDTO;

    clsCaThi_DAL cathiDAL;
    clsCaThi_DTO cathiDTO;

    clsPhongThi_DAL pthiDAL;
    clsPhongThi_DTO pthiDTO;

    clsThiSinh_DAL thisinhDAL;
    clsThiSinh_DTO thisinhDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        pcctDAL = new clsPhanCongCoithi_DAL();
        pcctDTO = new clsPhanCongCoiThi_DTO();

        pthiDAL = new clsPhongThi_DAL();
        pthiDTO = new clsPhongThi_DTO();

        cathiDAL = new clsCaThi_DAL();
        cathiDTO = new clsCaThi_DTO();

        //thisinhDAL = new clsThiSinh_DAL();
        //thisinhDTO = new clsThiSinh_DTO();

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        gvPhanCongCT.DataSource = loadDataToUI();
        gvPhanCongCT.DataBind();
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = cathiDAL.getCaThi(cathiDTO);
        GridViewDataComboBoxColumn gclCaThi = gvPhanCongCT.Columns["MaCaThi"] as GridViewDataComboBoxColumn;
        gclCaThi.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";
        dt = pthiDAL.getPhongThi(pthiDTO);
        GridViewDataComboBoxColumn gclPhongThi = gvPhanCongCT.Columns["MaPhong"] as GridViewDataComboBoxColumn;
        gclPhongThi.PropertiesComboBox.DataSource = dt;

        //dt = thisinhDAL.getThiSinh(thisinhDTO);
        //GridViewDataComboBoxColumn gclThiSinh = gvPhanCongCT.Columns["TenDangNhap"] as GridViewDataComboBoxColumn;
        //gclThiSinh.PropertiesComboBox.DataSource = dt;
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = pcctDAL.getPCCT(pcctDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView

    protected void gvPhanCongCT_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvPhanCongCT.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvPhanCongCT.Columns)
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
        strOldValues = e.OldValues["STT"] == null ? string.Empty : e.OldValues["STT"].ToString();
        if (e.NewValues["STT"].ToString() != strOldValues && pcctDAL.Check_STT(e.NewValues["STT"].ToString()) == 1)
        {
            AddError(e.Errors, gvPhanCongCT.Columns["STT"], "Đã tồn tại Mã, không thể lưu");
            e.RowError = "Trùng mã , vui lòng kiểm tra lại";
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

    protected void gvPhanCongCT_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        pcctDTO.STT = e.NewValues["STT"].ToString();
        pcctDTO.TenDangNhap = e.NewValues["TenDangNhap"].ToString(); ;
        pcctDTO.MaCaThi = e.NewValues["MaCaThi"].ToString();
        pcctDTO.MaPhong = e.NewValues["MaPhong"].ToString();
        int iReturn = pcctDAL.InsertUpdate(pcctDTO);
        if (iReturn >= 0)
        {
            gvPhanCongCT.DataSource = loadDataToUI();
            gvPhanCongCT.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvPhanCongCT.DoRowValidation();
        }
    }

    protected void gvPhanCongCT_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        pcctDTO.OldID = e.OldValues["STT"].ToString();
        pcctDTO.STT = e.NewValues["STT"].ToString();
        pcctDTO.TenDangNhap = e.NewValues["TenDangNhap"].ToString(); ;
        pcctDTO.MaCaThi = e.NewValues["MaCaThi"].ToString();
        pcctDTO.MaPhong = e.NewValues["MaPhong"].ToString();
        int iReturn = pcctDAL.InsertUpdate(pcctDTO);
        if (iReturn >= 0)
        {
            gvPhanCongCT.DataSource = loadDataToUI();
            gvPhanCongCT.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvPhanCongCT.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvPhanCongCT.DoRowValidation();
        }
    }

    protected void gvPhanCongCT_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvPhanCongCT.VisibleRowCount;
        List<object> keyValues = gvPhanCongCT.GetSelectedFieldValues("STT");
        foreach (object key in keyValues)
        {
            pcctDTO.STT = key.ToString();
            int iReturn = pcctDAL.Delete(pcctDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvPhanCongCT.DataSource = loadDataToUI();
        gvPhanCongCT.Selection.SelectAll();
    }

    protected void gvPhanCongCT_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvPhanCongCT.DataSource = loadDataToUI();
            gvPhanCongCT.Selection.UnselectAll();
        }
    }
    #endregion
}

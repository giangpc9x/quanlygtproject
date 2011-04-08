using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;


public partial class HeThong_qlnguoidung : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsNguoiDung_DAL ndungDAL;
    clsNguoiDung_DTO ndungDTO;

    clsDiaDiemThi_DAL dthiDAL;
    clsDiaDiemThi_DTO dthiDTO;

    clsNhomNguoiDung_DAL nhomNDDAL;
    clsNhomNguoiDung_DTO nhomNDDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        ndungDAL = new clsNguoiDung_DAL();
        ndungDTO = new clsNguoiDung_DTO();

        dthiDAL = new clsDiaDiemThi_DAL();
        dthiDTO = new clsDiaDiemThi_DTO();


        nhomNDDAL = new clsNhomNguoiDung_DAL();
        nhomNDDTO = new clsNhomNguoiDung_DTO();
        cmn = new clsCommon();
        loadMasterData();
        gvNguoiDung.DataSource = loadDataToUI();
        gvNguoiDung.DataBind();
    }

    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = dthiDAL.getDiaDiemThi(dthiDTO);
        cboDienThi.ValueField = "MaDiemThi";
        cboDienThi.TextField = "DiaChi";
        cboDienThi.DataSource = dt;
        cboDienThi.DataBind();

        dt = nhomNDDAL.getNhomNguoiDung(nhomNDDTO);
        GridViewDataComboBoxColumn gclNhomnguoidung = gvNguoiDung.Columns["MaNhom"] as GridViewDataComboBoxColumn ;
        gclNhomnguoidung.PropertiesComboBox.DataSource = dt ;
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = ndungDAL.getNguoiDung(ndungDTO);
        return dt;
    }

    protected void gvNguoiDung_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
         string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvNguoiDung.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        if (cboDienThi.Value == null)
        {
            AddError(e.Errors, gvNguoiDung.Columns["Error"], "");
            e.RowError = "Vui lòng chọn 1 điểm thi";
            return;
        }
        foreach (GridViewColumn column in gvNguoiDung.Columns)
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
        strOldValues = e.OldValues["TenDangNhap"] == null ? string.Empty : e.OldValues["TenDangNhap"].ToString();
        if (e.NewValues["TenDangNhap"].ToString() != strOldValues && ndungDAL.Check_TenDangNhap(e.NewValues["TenDangNhap"].ToString()) == 1)
        {
            AddError(e.Errors, gvNguoiDung.Columns["TenDangNhap"], "Đã tồn tại Tên Đăng Nhập, không thể lưu");
            e.RowError = "Trùng tên đăng nhập, vui lòng kiểm tra lại";
            return;
        }
       
    }
    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }

    protected void gvNguoiDung_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        ndungDTO.TenDangNhap = e.NewValues["TenDangNhap"].ToString();
        ndungDTO.MaDiemThi = cboDienThi.Value.ToString();
        ndungDTO.MatKhau = e.NewValues["MatKhau"].ToString();
        ndungDTO.Ho = e.NewValues["Ho"].ToString();
        ndungDTO.Ten = e.NewValues["Ten"].ToString();
        ndungDTO.CMND = e.NewValues["CMND"].ToString();
        ndungDTO.NgaySinh = cmn.Convert_DMY_To_MDY(e.NewValues["NgaySinh"].ToString());
        ndungDTO.DiaChi = e.NewValues["DiaChi"].ToString();
        ndungDTO.DienThoai = e.NewValues["DienThoai"].ToString().Trim();
        ndungDTO.Email = e.NewValues["Email"].ToString();
        ndungDTO.NgayDK = cmn.Convert_DMY_To_MDY(e.NewValues["NgayDK"].ToString());
        ndungDTO.TrangThai = e.NewValues["TrangThai"].ToString();
        ndungDTO.MaNhom = e.NewValues["TenNhom"].ToString();
        int iReturn = ndungDAL.InsertUpdate(ndungDTO);
        if (iReturn >= 0)
        {
            gvNguoiDung.DataSource = loadDataToUI();
            gvNguoiDung.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvNguoiDung.DoRowValidation();
        }
    }
    protected void gvNguoiDung_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        ndungDTO.OldID = e.NewValues["TenDangNhap"].ToString();
        ndungDTO.TenDangNhap = e.NewValues["TenDangNhap"].ToString();
        ndungDTO.MaDiemThi = cboDienThi.Value.ToString();
        ndungDTO.MatKhau = e.NewValues["MatKhau"].ToString();
        ndungDTO.Ho = e.NewValues["Ho"].ToString();
        ndungDTO.Ten = e.NewValues["Ten"].ToString();
        ndungDTO.CMND = e.NewValues["CMND"].ToString();
        ndungDTO.NgaySinh = cmn.Convert_DMY_To_MDY(e.NewValues["NgaySinh"].ToString());
        ndungDTO.DiaChi = e.NewValues["DiaChi"].ToString();
        ndungDTO.DienThoai = e.NewValues["DienThoai"].ToString();
        ndungDTO.Email = e.NewValues["Email"].ToString();
        ndungDTO.NgayDK = cmn.Convert_DMY_To_MDY(e.NewValues["NgayDK"].ToString());
        ndungDTO.TrangThai = e.NewValues["TrangThai"].ToString();
        ndungDTO.MaNhom = e.NewValues["TenNhom"].ToString();
        int iReturn = ndungDAL.InsertUpdate(ndungDTO);
        if (iReturn >= 0)
        {
            gvNguoiDung.DataSource = loadDataToUI();
            gvNguoiDung.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại tên đăng nhập để cập nhật";
            gvNguoiDung.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvNguoiDung.DoRowValidation();
        }
    }
    protected void gvNguoiDung_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvNguoiDung.VisibleRowCount;
        List<object> keyValues = gvNguoiDung.GetSelectedFieldValues("TenDangNhap");
        foreach (object key in keyValues)
        {
            ndungDTO.TenDangNhap = key.ToString();
            int iReturn = ndungDAL.Delete(ndungDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvNguoiDung.DataSource = loadDataToUI();
        gvNguoiDung.Selection.SelectAll();
    }
    protected void gvNguoiDung_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvNguoiDung.DataSource = loadDataToUI();
            gvNguoiDung.Selection.UnselectAll();
        }
        else
        {
            ndungDTO.MaDiemThi = e.Parameters;
            gvNguoiDung.DataSource = loadDataToUI();
            gvNguoiDung.DataBind();
        }
    }
}

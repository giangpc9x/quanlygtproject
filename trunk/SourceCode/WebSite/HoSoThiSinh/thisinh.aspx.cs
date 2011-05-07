#region Using
using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;
#endregion

public partial class HoSoThiSinh_thisinh : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsThiSinh_DAL thisinhDAL;
    clsThiSinh_DTO thisinhDTO;
    clsPhongThi_DAL pthiDAL;
    clsPhongThi_DTO pthiDTO;
    clsCaThi_DAL cathiDAL;
    clsCaThi_DTO cathiDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");
        thisinhDAL = new clsThiSinh_DAL();
        thisinhDTO = new clsThiSinh_DTO();

        cathiDAL = new clsCaThi_DAL();
        cathiDTO = new clsCaThi_DTO();

        pthiDAL = new clsPhongThi_DAL();
        pthiDTO = new clsPhongThi_DTO();


        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        if (cboCaThi.Value != null)
        {
            thisinhDTO = new clsThiSinh_DTO();
            thisinhDTO.MaTS = cboCaThi.Value.ToString();
            gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
            gvThiSinh.DataBind();
        }
        if (cboPhongThi.Value != null)
        {
            thisinhDTO = new clsThiSinh_DTO();
            thisinhDTO.MaTS = cboPhongThi.Value.ToString();
            gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
            gvThiSinh.DataBind();
        }
    }
    private void loadMasterData()
    {
        cathiDTO = new clsCaThi_DTO();
        DataTable dt = new DataTable();
        dt = cathiDAL.getCaThi(cathiDTO);


        cboCaThi.ValueField = "MaCaThi";
        cboCaThi.TextField = "MaCaThi";

        cboCaThi.DataSource = dt;
        cboCaThi.DataBind();


        //GridViewDataComboBoxColumn gclCathi = gvThiSinh.Columns["MaCaThi"] as GridViewDataComboBoxColumn;
        //gclCathi.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";
        pthiDTO = new clsPhongThi_DTO();
        dt = pthiDAL.getPhongThi(pthiDTO);


        cboPhongThi.ValueField = "MaPhong";
        cboPhongThi.TextField = "MaPhong";

        cboPhongThi.DataSource = dt;
        cboPhongThi.DataBind();

        //GridViewDataComboBoxColumn gclPhongthi = gvThiSinh.Columns["MaPhong"] as GridViewDataComboBoxColumn;
        //gclPhongthi.PropertiesComboBox.DataSource = dt;
    }

    private DataTable loadDataToUI(clsThiSinh_DTO thisinhDTO)
    {

        DataTable dt = new DataTable();
        dt = thisinhDAL.getThiSinh(thisinhDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView

    protected void gvThiSinh_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvThiSinh.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvThiSinh.Columns)
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
        strOldValues = e.OldValues["MaTS"] == null ? string.Empty : e.OldValues["MaTS"].ToString();
        if (e.NewValues["MaTS"].ToString() != strOldValues && thisinhDAL.Check_MaThiSinh(e.NewValues["MaTS"].ToString()) == 1)
        {
            AddError(e.Errors, gvThiSinh.Columns["MaTS"], "Đã tồn tại Mã điểm thi, không thể lưu");
            e.RowError = "Trùng mã thi sinh, vui lòng kiểm tra lại";
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

    protected void gvThiSinh_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        thisinhDTO = new clsThiSinh_DTO();
        e.Cancel = true;
        thisinhDTO.MaTS = e.NewValues["MaTS"].ToString();
        thisinhDTO.MatKhau = e.NewValues["MatKhau"].ToString();
        thisinhDTO.HoTenLot = e.NewValues["HoTenLot"].ToString();
        thisinhDTO.Ten = e.NewValues["Ten"].ToString();
        thisinhDTO.QuocTich = e.NewValues["QuocTich"].ToString();
        thisinhDTO.NgaySinh = cmn.Convert_DMY_To_MDY(e.NewValues["NgaySinh"].ToString());
        thisinhDTO.NguyenQuan = e.NewValues["NguyenQuan"].ToString();
        thisinhDTO.NoiDKHoKhau = e.NewValues["NoiDKHoKhau"].ToString();
        thisinhDTO.NoiThuongTru = e.NewValues["NoiThuongTru"].ToString();
        thisinhDTO.DienThoai = e.NewValues["DienThoai"].ToString();
        thisinhDTO.DVCongTac = e.NewValues["DVCongTac"].ToString();
        thisinhDTO.CMND = e.NewValues["CMND"].ToString();
        thisinhDTO.NgayCapCMND = cmn.Convert_DMY_To_MDY(e.NewValues["NgayCapCMND"].ToString());
        thisinhDTO.NoiCapCMND = e.NewValues["NoiCapCMND"].ToString();
        thisinhDTO.TrinhDoVanHoa = e.NewValues["TrinhDoVanHoa"].ToString();
        thisinhDTO.NgayDKThi = cmn.Convert_DMY_To_MDY(e.NewValues["NgayDKThi"].ToString());
        thisinhDTO.MaCaThi = e.NewValues["MaCaThi"].ToString();
        thisinhDTO.MaPhong = e.NewValues["MaPhong"].ToString();
        int iReturn = thisinhDAL.InsertUpdate(thisinhDTO);
        if (iReturn >= 0)
        {
            thisinhDTO = new clsThiSinh_DTO();
            thisinhDTO.MaTS = cboPhongThi.Value.ToString();
            thisinhDTO.MaTS = cboCaThi.Value.ToString();
            gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
            gvThiSinh.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvThiSinh.DoRowValidation();
        }
    }

    protected void gvThiSinh_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        thisinhDTO = new clsThiSinh_DTO();
        e.Cancel = true;
        thisinhDTO.OldID = e.OldValues["MaTS"].ToString();
        thisinhDTO.MaTS = e.NewValues["MaTS"].ToString();
        thisinhDTO.MatKhau = e.NewValues["MatKhau"].ToString();
        thisinhDTO.HoTenLot = e.NewValues["HoTenLot"].ToString();
        thisinhDTO.Ten = e.NewValues["Ten"].ToString();
        thisinhDTO.QuocTich = e.NewValues["QuocTich"].ToString();
        thisinhDTO.NgaySinh = cmn.Convert_DMY_To_MDY(e.NewValues["NgaySinh"].ToString());
        thisinhDTO.NguyenQuan = e.NewValues["NguyenQuan"].ToString();
        thisinhDTO.NoiDKHoKhau = e.NewValues["NoiDKHoKhau"].ToString();
        thisinhDTO.NoiThuongTru = e.NewValues["NoiThuongTru"].ToString();
        thisinhDTO.DienThoai = e.NewValues["DienThoai"].ToString();
        thisinhDTO.DVCongTac = e.NewValues["DVCongTac"].ToString();
        thisinhDTO.CMND = e.NewValues["CMND"].ToString();
        thisinhDTO.NgayCapCMND = cmn.Convert_DMY_To_MDY(e.NewValues["NgayCapCMND"].ToString());
        thisinhDTO.NoiCapCMND = e.NewValues["NoiCapCMND"].ToString();
        thisinhDTO.TrinhDoVanHoa = e.NewValues["TrinhDoVanHoa"].ToString();
        thisinhDTO.NgayDKThi = cmn.Convert_DMY_To_MDY(e.NewValues["NgayDKThi"].ToString());
        thisinhDTO.MaCaThi = e.NewValues["MaCaThi"].ToString();
        thisinhDTO.MaPhong = e.NewValues["MaPhong"].ToString();
        int iReturn = thisinhDAL.InsertUpdate(thisinhDTO);
        if (iReturn >= 0)
        {
            gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
            gvThiSinh.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvThiSinh.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvThiSinh.DoRowValidation();
        }
    }

    protected void gvThiSinh_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        thisinhDTO = new clsThiSinh_DTO();
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvThiSinh.VisibleRowCount;
        List<object> keyValues = gvThiSinh.GetSelectedFieldValues("MaTS");
        foreach (object key in keyValues)
        {
            thisinhDTO.MaTS = key.ToString();
            int iReturn = thisinhDAL.Delete(thisinhDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
        gvThiSinh.Selection.SelectAll();
    }
    protected void gvThiSinh_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        thisinhDTO = new clsThiSinh_DTO();
        if (e.Parameters == "Update")
        {
            thisinhDTO.MaTS = cboCaThi.Value.ToString();
            gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
            gvThiSinh.Selection.UnselectAll();
        }
        else
        {
            thisinhDTO = new clsThiSinh_DTO();
            //thisinhDTO.MaTS = e.Parameters;
            if (cboPhongThi.Value != null)
                thisinhDTO.MaPhong = cboPhongThi.Value.ToString();
            if (cboCaThi.Value!= null)
                thisinhDTO.MaCaThi = cboCaThi.Value.ToString();
            DataTable dt = thisinhDAL.getThiSinh(thisinhDTO);
            gvThiSinh.DataSource = dt;
            gvThiSinh.DataBind();
        }
        //thisinhDTO = new clsThiSinh_DTO();
        //if (e.Parameters == "Update")
        //{
        //    thisinhDTO.MaTS = cboPhongThi.Value.ToString();
        //    gvThiSinh.DataSource = loadDataToUI(thisinhDTO);
        //    gvThiSinh.Selection.UnselectAll();
        //}
        //else
        //{
        //    thisinhDTO = new clsThiSinh_DTO();
        //    thisinhDTO.MaTS = e.Parameters;
        //    DataTable dt = thisinhDAL.getThiSinh(thisinhDTO);
        //    gvThiSinh.DataSource = dt;
        //    gvThiSinh.DataBind();
        //}

    }
    #endregion

    protected void cboCaThi_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

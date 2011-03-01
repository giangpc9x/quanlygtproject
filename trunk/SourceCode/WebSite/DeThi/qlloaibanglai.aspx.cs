using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;

public partial class DeThi_qlloaibanglai : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsLoaiBanglai_DAL lblaiDAL;
    clsLoaiBanglai_DTO lblaiDTO;
    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        lblaiDAL = new clsLoaiBanglai_DAL();
        lblaiDTO = new clsLoaiBanglai_DTO();
        cmn = new clsCommon();
        gvLoaiBangLai.DataSource = loadDataToUI();
        gvLoaiBangLai.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = lblaiDAL.getDiaDiemThi(lblaiDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView

    protected void gvLoaiBangLai_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvLoaiBangLai.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvLoaiBangLai.Columns)
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
        strOldValues = e.OldValues["MaLoaiBang"] == null ? string.Empty : e.OldValues["MaLoaiBang"].ToString();
        if (e.NewValues["MaLoaiBang"].ToString() != strOldValues && lblaiDAL.Check_MaLoaiBang(e.NewValues["MaLoaiBang"].ToString()) == 1)
        {
            AddError(e.Errors, gvLoaiBangLai.Columns["MaLoaiBang"], "Đã tồn tại Mã loại bằng, không thể lưu");
            e.RowError = "Trùng Mã loại bằng, vui lòng kiểm tra lại";
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
    protected void gvLoaiBangLai_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        lblaiDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        lblaiDTO.TenLoai = e.NewValues["TenLoai"].ToString();
        lblaiDTO.MoTa = e.NewValues["MoTa"].ToString();
        lblaiDTO.TGThi = e.NewValues["TGThi"].ToString();
        lblaiDTO.SoCauDat = e.NewValues["SoCauDat"].ToString();
        int iReturn = lblaiDAL.InsertUpdate(lblaiDTO);
        if (iReturn >= 0)
        {
            gvLoaiBangLai.DataSource = loadDataToUI();
            gvLoaiBangLai.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvLoaiBangLai.DoRowValidation();
        }
    }

    protected void gvLoaiBangLai_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        lblaiDTO.OldID = e.OldValues["MaLoaiBang"].ToString();
        lblaiDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        lblaiDTO.TenLoai = e.NewValues["TenLoai"].ToString();
        lblaiDTO.MoTa = e.NewValues["MoTa"].ToString();
        lblaiDTO.TGThi = e.NewValues["TGThi"].ToString();
        lblaiDTO.SoCauDat = e.NewValues["SoCauDat"].ToString();
        int iReturn = lblaiDAL.InsertUpdate(lblaiDTO);
        if (iReturn >= 0)
        {
            gvLoaiBangLai.DataSource = loadDataToUI();
            gvLoaiBangLai.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvLoaiBangLai.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvLoaiBangLai.DoRowValidation();
        }
    }

    protected void gvLoaiBangLai_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvLoaiBangLai.VisibleRowCount;
        List<object> keyValues = gvLoaiBangLai.GetSelectedFieldValues("MaLoaiBang");
        foreach (object key in keyValues)
        {
            lblaiDTO.MaLoaiBang = key.ToString();
            int iReturn = lblaiDAL.Delete(lblaiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvLoaiBangLai.DataSource = loadDataToUI();
        gvLoaiBangLai.Selection.SelectAll();
    }

    protected void gvLoaiBangLai_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvLoaiBangLai.DataSource = loadDataToUI();
            gvLoaiBangLai.Selection.UnselectAll();
        }
    }
    #endregion
}

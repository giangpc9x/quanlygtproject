using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class DeThi_qlloaibanglai : NTT.Web.UI.BasePage
{
    clsLoaiBanglai_DAL lbangDAL;
    clsLoaiBanglai_DTO lbangDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbangDAL = new clsLoaiBanglai_DAL();
        lbangDTO = new clsLoaiBanglai_DTO();
        cmn = new clsCommon();
        gvLoaiBang.DataSource = loadDataToUI();
        gvLoaiBang.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = lbangDAL.getMaLoaibang(lbangDTO);
        return dt;
    }
    protected void gvLoaiBang_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        foreach (GridViewColumn column in gvLoaiBang.Columns)
        {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if (dataColumn == null || dataColumn.Caption == "Error" || dataColumn.Caption == "Mô Tả") continue;
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
    }
    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }

    protected void gvLoaiBang_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        lbangDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        lbangDTO.TenLoai = e.NewValues["TenLoai"].ToString();
        lbangDTO.MoTa = e.NewValues["MoTa"].ToString();
        lbangDTO.TGThi = e.NewValues["TGThi"].ToString();
        lbangDTO.SoCauDat = e.NewValues["SoCauDat"].ToString();
        int iReturn = lbangDAL.InsertUpdate(lbangDTO);
        if (iReturn >= 0)
        {
            gvLoaiBang.DataSource = loadDataToUI();
            gvLoaiBang.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvLoaiBang.DoRowValidation();
        }
    }
    protected void gvLoaiBang_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        lbangDTO.OldID = e.NewValues["MaLoaiBang"].ToString();
        lbangDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        lbangDTO.TenLoai = e.NewValues["TenLoai"].ToString();
        lbangDTO.MoTa = e.NewValues["MoTa"].ToString();
        lbangDTO.TGThi = e.NewValues["TGThi"].ToString();
        lbangDTO.SoCauDat = e.NewValues["SoCauDat"].ToString();
        int iReturn = lbangDAL.InsertUpdate(lbangDTO);
        if (iReturn >= 0)
        {
            gvLoaiBang.DataSource = loadDataToUI();
            gvLoaiBang.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvLoaiBang.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvLoaiBang.DoRowValidation();
        }
    }

    protected void gvLoaiBang_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvLoaiBang.VisibleRowCount;
        List<object> keyValues = gvLoaiBang.GetSelectedFieldValues("MaLoaiBang");
        foreach (object key in keyValues)
        {
            lbangDTO.MaLoaiBang = key.ToString();
            int iReturn = lbangDAL.Delete(lbangDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvLoaiBang.DataSource = loadDataToUI();
        gvLoaiBang.Selection.SelectAll();
    }
    protected void gvLoaiBang_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvLoaiBang.DataSource = loadDataToUI();
            gvLoaiBang.Selection.UnselectAll();
        }
    }
}

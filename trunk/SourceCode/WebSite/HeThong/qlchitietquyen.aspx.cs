using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class HeThong_qlchitietquyen : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsCTQuyen_DAL ctquyenDAL;
    clsCTQuyen_DTO ctquyenDTO;
    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");
        ctquyenDAL = new clsCTQuyen_DAL();
        ctquyenDTO = new clsCTQuyen_DTO();
        cmn = new clsCommon();
        gvCTQuyen.DataSource = loadDataToUI();
        gvCTQuyen.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = ctquyenDAL.getCTQuyen(ctquyenDTO);
        return dt;
    }

    protected void gvCTQuyen_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        foreach (GridViewColumn column in gvCTQuyen.Columns)
        {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if (dataColumn == null || dataColumn.Caption == "Error" ) continue;
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

    protected void gvCTQuyen_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        ctquyenDTO.MaQuyen = e.NewValues["MaQuyen"].ToString();
        ctquyenDTO.MaNhom = e.NewValues["MaNhom"].ToString();
        int iReturn = ctquyenDAL.InsertUpdate(ctquyenDTO);
        if (iReturn >= 0)
        {
            gvCTQuyen.DataSource = loadDataToUI();
            gvCTQuyen.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvCTQuyen.DoRowValidation();
        }
    }
    protected void gvCTQuyen_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        ctquyenDTO.OldID_MaQuyen = e.OldValues["MaQuyen"].ToString();
        ctquyenDTO.MaQuyen = e.NewValues["MaQuyen"].ToString();

        ctquyenDTO.MaNhom = e.NewValues["MaNhom"].ToString();

        int iReturn = ctquyenDAL.InsertUpdate(ctquyenDTO);
        if (iReturn >= 0)
        {
            gvCTQuyen.DataSource = loadDataToUI();
            gvCTQuyen.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvCTQuyen.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvCTQuyen.DoRowValidation();
        }
    }
    protected void gvCTQuyen_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvCTQuyen.VisibleRowCount;
        List<object> keyValues = gvCTQuyen.GetSelectedFieldValues("MaQuyen");
        foreach (object key in keyValues)
        {
            ctquyenDTO.MaQuyen = key.ToString();
            int iReturn = ctquyenDAL.Delete(ctquyenDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvCTQuyen.DataSource = loadDataToUI();
        gvCTQuyen.Selection.SelectAll();
    }
    protected void gvCTQuyen_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvCTQuyen.DataSource = loadDataToUI();
            gvCTQuyen.Selection.UnselectAll();
        }
    }
}

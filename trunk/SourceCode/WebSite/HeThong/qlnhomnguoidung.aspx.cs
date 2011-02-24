using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class HeThong_qlnhomnguoidung : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsNhomNguoiDung_DAL nhomNDDAL;
    clsNhomNguoiDung_DTO nhomNDDTO;
    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        nhomNDDAL = new clsNhomNguoiDung_DAL();
        nhomNDDTO = new clsNhomNguoiDung_DTO();
        cmn = new clsCommon();
        gvNhomNguoiDung.DataSource = loadDataToUI();
        gvNhomNguoiDung.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = nhomNDDAL.getNhomNguoiDung(nhomNDDTO);
        return dt;
    }
    protected void gvNhomNguoiDung_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        foreach (GridViewColumn column in gvNhomNguoiDung.Columns)
        {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if (dataColumn == null || dataColumn.Caption == "Error" || dataColumn.Caption == "Mã Nhóm") continue;
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
    protected void gvNhomNguoiDung_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        //nhomNDDTO.MaNhom = e.NewValues["MaNhom"].ToString();
        //nhomNDDTO.NgayThanhLap = cmn.Convert_DMY_To_MDY(e.NewValues["NgayThanhLap"].ToString());
      //  nhomNDDTO.SoDienThoai = e.NewValues["SoDienThoai"].ToString();
        nhomNDDTO.TenNhom = e.NewValues["TenNhom"].ToString();
        int iReturn = nhomNDDAL.InsertUpdate(nhomNDDTO);
        if (iReturn >= 0)
        {
            gvNhomNguoiDung.DataSource = loadDataToUI();
            gvNhomNguoiDung.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvNhomNguoiDung.DoRowValidation();
        }
    }
}

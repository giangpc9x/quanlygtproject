﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class DeThi_qlloaicauhoi : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsLoaiCauHoi_DAL loaiCHDAL;
    clsLoaiCauHoi_DTO loaiCHDTO;
    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        loaiCHDAL = new clsLoaiCauHoi_DAL();
        loaiCHDTO = new clsLoaiCauHoi_DTO();
        cmn = new clsCommon();
        gvLoaiCauHoi.DataSource = loadDataToUI();
        gvLoaiCauHoi.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = loaiCHDAL.getLoaiCauHoi(loaiCHDTO);
        return dt;
    }

    protected void gvLoaiCauHoi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        foreach (GridViewColumn column in gvLoaiCauHoi.Columns)
        {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if (dataColumn == null || dataColumn.Caption == "Error" || dataColumn.Caption == "Mã Loại Câu Hỏi") continue;
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
    protected void gvLoaiCauHoi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;

        loaiCHDTO.TenLoai = e.NewValues["TenLoai"].ToString();
        int iReturn = loaiCHDAL.InsertUpdate(loaiCHDTO);
        if (iReturn >= 0)
        {
            gvLoaiCauHoi.DataSource = loadDataToUI();
            gvLoaiCauHoi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvLoaiCauHoi.DoRowValidation();
        }
    }
    protected void gvLoaiCauHoi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;

        loaiCHDTO.TenLoai = e.NewValues["TenLoai"].ToString();
        int iReturn = loaiCHDAL.InsertUpdate(loaiCHDTO);
        if (iReturn >= 0)
        {
            gvLoaiCauHoi.DataSource = loadDataToUI();
            gvLoaiCauHoi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvLoaiCauHoi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvLoaiCauHoi.DoRowValidation();
        }
    }
    protected void gvLoaiCauHoi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvLoaiCauHoi.VisibleRowCount;
        List<object> keyValues = gvLoaiCauHoi.GetSelectedFieldValues("MaloaiCauHoi");
        foreach (object key in keyValues)
        {
            loaiCHDTO.MaloaiCauHoi = key.ToString();
            int iReturn = loaiCHDAL.Delete(loaiCHDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvLoaiCauHoi.DataSource = loadDataToUI();
        gvLoaiCauHoi.Selection.SelectAll();

    }
    protected void gvLoaiCauHoi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvLoaiCauHoi.DataSource = loadDataToUI();
            gvLoaiCauHoi.Selection.UnselectAll();
        }
    }
}

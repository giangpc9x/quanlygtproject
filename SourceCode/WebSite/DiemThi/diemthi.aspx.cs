﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NTT.Web.UI;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class DiemThi_diemthi : BasePage
{
    clsDiaDiemThi_DAL dthi;
    clsDiaDiemThi_DTO dthiDTO;
    clsCommon cmn;
    string strMess = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        dthi = new clsDiaDiemThi_DAL();
        dthiDTO = new clsDiaDiemThi_DTO();
        cmn = new clsCommon();
        gvDiaDiemThi.DataSource = getDataToUI();
        gvDiaDiemThi.DataBind();
    }
    private DataTable getDataToUI()
    {

        DataTable dt = new DataTable();
        dt = dthi.getDiaDiemThi(dthiDTO);
        return dt;
    }
    protected void gvDiaDiemThi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvDiaDiemThi.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvDiaDiemThi.Columns)
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
        strOldValues = e.OldValues["MaDiemThi"] == null ? string.Empty : e.OldValues["MaDiemThi"].ToString();
        if (e.NewValues["MaDiemThi"].ToString() != strOldValues && dthi.Check_MaDiemThi(e.NewValues["MaDiemThi"].ToString()) == 1)
        {
            AddError(e.Errors, gvDiaDiemThi.Columns["MaDiemThi"], "Đã tồn tại Mã điểm thi, không thể lưu");
            e.RowError = "Trùng mã điểm thi, vui lòng kiểm tra lại";
            return;
        }
    }
    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }
    protected void gvDiaDiemThi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        dthiDTO.MaDiemThi = e.NewValues["MaDiemThi"].ToString();
        dthiDTO.NgayThanhLap = cmn.Convert_DMY_To_MDY(e.NewValues["NgayThanhLap"].ToString());
        dthiDTO.SoDienThoai = e.NewValues["SoDienThoai"].ToString();
        dthiDTO.DiaChi = e.NewValues["DiaChi"].ToString();
        int iReturn = dthi.InsertUpdate(dthiDTO);
        if (iReturn >= 0)
        {
            gvDiaDiemThi.DataSource = getDataToUI();
            gvDiaDiemThi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvDiaDiemThi.DoRowValidation();
        }
    }

    protected void gvDiaDiemThi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        dthiDTO.OldID = e.OldValues["MaDiemThi"].ToString();
        dthiDTO.MaDiemThi = e.NewValues["MaDiemThi"].ToString();
        dthiDTO.NgayThanhLap = cmn.Convert_DMY_To_MDY(e.NewValues["NgayThanhLap"].ToString());
        dthiDTO.SoDienThoai = e.NewValues["SoDienThoai"].ToString();
        dthiDTO.DiaChi = e.NewValues["DiaChi"].ToString();
        int iReturn = dthi.InsertUpdate(dthiDTO);
        if (iReturn >= 0)
        {
            gvDiaDiemThi.DataSource = getDataToUI();
            gvDiaDiemThi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvDiaDiemThi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvDiaDiemThi.DoRowValidation();
        }
    }
    protected void gvDiaDiemThi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvDiaDiemThi.VisibleRowCount;
        List<object> keyValues = gvDiaDiemThi.GetSelectedFieldValues("MaDiemThi");
        foreach (object key in keyValues)
        {
            dthiDTO.MaDiemThi = key.ToString();
            int iReturn = dthi.Delete(dthiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvDiaDiemThi.DataSource = getDataToUI();
        gvDiaDiemThi.Selection.SelectAll();
    }
    protected void gvDiaDiemThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvDiaDiemThi.DataSource = getDataToUI();
            gvDiaDiemThi.Selection.UnselectAll();
        }
    }
}

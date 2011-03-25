﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;

public partial class DiemThi_cathi : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsCaThi_DAL cathiDAL;
    clsCaThi_DTO cathiDTO;

    clsDotThi_DAL dotthiDAL;
    clsDotThi_DTO dotthiDTO;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        cathiDAL = new clsCaThi_DAL();
        cathiDTO = new clsCaThi_DTO();

        dotthiDAL = new clsDotThi_DAL();
        dotthiDTO = new clsDotThi_DTO();

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        gvCaThi.DataSource = loadDataToUI();
        gvCaThi.DataBind();
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = dotthiDAL.getDotThi(dotthiDTO);
        GridViewDataComboBoxColumn gcCathi = gvCaThi.Columns["MaDotThi"] as GridViewDataComboBoxColumn;
        gcCathi.PropertiesComboBox.DataSource = dt;
        //gclDiemThi.PropertiesComboBox.ValueField = "MaDienThi";
        //gclDiemThi.PropertiesComboBox.TextField = "TenDiemThi";

        //GridViewDataCheckColumn gclTrangThai = gvDotThi.Columns["TrangThai"] as GridViewDataCheckColumn;
        //gclTrangThai.PropertiesCheckEdit.DisplayTextChecked = "Chon";
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = cathiDAL.getCaThi(cathiDTO);
        return dt;
    }
    #region Kiểm tra nhập dữ liệu trên GridView

    protected void gvCaThi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvCaThi.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
        foreach (GridViewColumn column in gvCaThi.Columns)
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
        strOldValues = e.OldValues["MaCaThi"] == null ? string.Empty : e.OldValues["MaCaThi"].ToString();
        if (e.NewValues["MaCaThi"].ToString() != strOldValues && cathiDAL.Check_MaCaThi(e.NewValues["MaCaThi"].ToString()) == 1)
        {
            AddError(e.Errors, gvCaThi.Columns["MaCaThi"], "Đã tồn tại Mã Ca Thi, không thể lưu");
            e.RowError = "Trùng Mã Ca Thi, vui lòng kiểm tra lại";
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

    protected void gvCaThi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        cathiDTO.MaCaThi = e.NewValues["MaCaThi"].ToString();
        cathiDTO.MoTa = e.NewValues["MoTa"].ToString(); ;
        cathiDTO.GioBatDau = e.NewValues["GioBatDau"].ToString(); 
        cathiDTO.MaDotThi = e.NewValues["MaDotThi"].ToString();

        int iReturn = cathiDAL.InsertUpdate(cathiDTO);
        if (iReturn >= 0)
        {
            gvCaThi.DataSource = loadDataToUI();
            gvCaThi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvCaThi.DoRowValidation();
        }
    }

    protected void gvCaThi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        cathiDTO.OldID = e.OldValues["MaCaThi"].ToString();
        cathiDTO.MaCaThi = e.NewValues["MaCaThi"].ToString();
        cathiDTO.MoTa = e.NewValues["MoTa"].ToString(); ;
        cathiDTO.GioBatDau = e.NewValues["GioBatDau"].ToString();
        cathiDTO.MaDotThi = e.NewValues["MaDotThi"].ToString();
        int iReturn = cathiDAL.InsertUpdate(cathiDTO);
        if (iReturn >= 0)
        {
            gvCaThi.DataSource = loadDataToUI();
            gvCaThi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvCaThi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvCaThi.DoRowValidation();
        }

    }

    protected void gvCaThi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvCaThi.VisibleRowCount;
        List<object> keyValues = gvCaThi.GetSelectedFieldValues("MaCaThi");
        foreach (object key in keyValues)
        {
            cathiDTO.MaCaThi = key.ToString();
            int iReturn = cathiDAL.Delete(cathiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvCaThi.DataSource = loadDataToUI();
        gvCaThi.Selection.SelectAll();
    }

    protected void gvCaThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvCaThi.DataSource = loadDataToUI();
            gvCaThi.Selection.UnselectAll();
        }
    }
     #endregion
}

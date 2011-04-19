using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;

public partial class dethi_qlcautrucdethi :NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsCauTrucDeThi_DAL ctdthiDAL;
    clsCauTrucDeThi_DTO ctdthiDTO;

    clsLoaiCauHoi_DAL loaichoiDAL;
    clsLoaiCauHoi_DTO loaichoiDTO;

    clsLoaiBanglai_DAL lbangDAL;
    clsLoaiBanglai_DTO lbangDTO;


    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");
        ctdthiDAL = new clsCauTrucDeThi_DAL();
        ctdthiDTO = new clsCauTrucDeThi_DTO();

        loaichoiDAL = new clsLoaiCauHoi_DAL();
        loaichoiDTO = new clsLoaiCauHoi_DTO();


        lbangDAL = new clsLoaiBanglai_DAL();
        lbangDTO = new clsLoaiBanglai_DTO();
        

        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        gvCauTrucDeThi.DataSource = loadDataToUI();
        gvCauTrucDeThi.DataBind();

       
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
       // DataTable dt1 = new DataTable();
    
       
       // dt = ctdthiDAL.getCauTrucDeThi(ctdthiDTO);
       dt = lbangDAL.getMaLoaibang(lbangDTO);

        cboLoaiBang.ValueField = "MaLoaiBang";
        cboLoaiBang.TextField = "MaLoaiBang";

        cboLoaiBang.DataSource = dt;
        cboLoaiBang.DataBind();


        dt = loaichoiDAL.getLoaiCauHoi(loaichoiDTO);
        GridViewDataComboBoxColumn gclLcauhoi = gvCauTrucDeThi.Columns["MaloaiCauHoi"] as GridViewDataComboBoxColumn ;
        gclLcauhoi.PropertiesComboBox.DataSource = dt ;
       // gclLoaiCauHoi.PropertiesComboBox.DataSource = dt;
        
       
       
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = ctdthiDAL.getCauTrucDeThi(ctdthiDTO);
        return dt;
    }

    protected void gvCauTrucDeThi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {

        foreach (GridViewColumn column in gvCauTrucDeThi.Columns)
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
        
    }
    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }
    protected void gvCauTrucDeThi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
       // ctdthiDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        ctdthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
        ctdthiDTO.MaloaiCauHoi = e.NewValues["TenLoaiCH"].ToString(); ;
        ctdthiDTO.SoCau = e.NewValues["SoCau"].ToString();

        ctdthiDTO.STT = e.NewValues["STT"].ToString();
        int iReturn = ctdthiDAL.InsertUpdate(ctdthiDTO);
        if (iReturn >= 0)
        {
            gvCauTrucDeThi.DataSource = loadDataToUI();
            gvCauTrucDeThi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvCauTrucDeThi.DoRowValidation();
        }
    }
    protected void gvCauTrucDeThi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        ctdthiDTO.OldID = e.OldValues["STT"].ToString();
       // ctdthiDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        ctdthiDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
        ctdthiDTO.MaloaiCauHoi = e.NewValues["TenLoaiCH"].ToString(); ;
        ctdthiDTO.SoCau = e.NewValues["SoCau"].ToString();

        ctdthiDTO.STT = e.NewValues["STT"].ToString();
        int iReturn = ctdthiDAL.InsertUpdate(ctdthiDTO);
        if (iReturn >= 0)
        {
            gvCauTrucDeThi.DataSource = loadDataToUI();
            gvCauTrucDeThi.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvCauTrucDeThi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvCauTrucDeThi.DoRowValidation();
        }
    }
    protected void gvCauTrucDeThi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvCauTrucDeThi.VisibleRowCount;
        List<object> keyValues = gvCauTrucDeThi.GetSelectedFieldValues("STT");
        foreach (object key in keyValues)
        {
            ctdthiDTO.STT = key.ToString();
            int iReturn = ctdthiDAL.Delete(ctdthiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvCauTrucDeThi.DataSource = loadDataToUI();
        gvCauTrucDeThi.Selection.SelectAll();
    }

    protected void gvCauTrucDeThi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvCauTrucDeThi.DataSource = loadDataToUI();
            gvCauTrucDeThi.Selection.UnselectAll();
        }
        else
        {
            ctdthiDTO = new clsCauTrucDeThi_DTO();
            ctdthiDTO.MaLoaiBang = e.Parameters;
            DataTable dt = ctdthiDAL.getCauTrucDeThi(ctdthiDTO);
            gvCauTrucDeThi.DataSource = dt;
            gvCauTrucDeThi.DataBind();
        }
    }
}

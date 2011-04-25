using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class dethi_qlcauhoiloaibang : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsCauHoi_LoaiBang_DAL choilbangDAL;
    clsCauHoi_LoaiBang_DTO choilbangDTO;

    clsLoaiBanglai_DAL lbangDAL;
    clsLoaiBanglai_DTO lbangDTO;

    clsCauHoi_DAL choiDAL;
    clsCauHoi_DTO choiDTO;
    

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");
        choilbangDAL = new clsCauHoi_LoaiBang_DAL();
        choilbangDTO = new clsCauHoi_LoaiBang_DTO();

        lbangDAL = new clsLoaiBanglai_DAL();
        lbangDTO = new clsLoaiBanglai_DTO();

        choiDAL = new clsCauHoi_DAL();
        choiDTO = new clsCauHoi_DTO();


        cmn = new clsCommon();
        if (!IsPostBack || !IsCallback)
        {

        }
        if (!Page.IsPostBack)
        {

        }
        loadMasterData();
        gvCauHoiLoaiBang.DataSource = loadDataToUI();
        gvCauHoiLoaiBang.DataBind();
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();


        // dt = ctdthiDAL.getCauTrucDeThi(ctdthiDTO);
        dt = lbangDAL.getMaLoaibang(lbangDTO);


        cboLoaiBang.ValueField = "MaLoaiBang";
        cboLoaiBang.TextField = "MaLoaiBang";

        cboLoaiBang.DataSource = dt;
        cboLoaiBang.DataBind();


       // dt = choilbangDAL.getCauHoi_LoaiBang(choilbangDTO);
        dt = choiDAL.getCauHoi(choiDTO);

        GridViewDataComboBoxColumn gclMaCauHoi = gvCauHoiLoaiBang.Columns["MaCauHoi"] as GridViewDataComboBoxColumn;
        gclMaCauHoi.PropertiesComboBox.DataSource = dt;

    
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = choilbangDAL.getCauHoi_LoaiBang(choilbangDTO);
        return dt;
    }

    protected void gvCauHoiLoaiBang_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {

        foreach (GridViewColumn column in gvCauHoiLoaiBang.Columns)
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

    protected void gvCauHoiLoaiBang_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
       // choilbangDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        choilbangDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
        choilbangDTO.MaCauHoi = e.NewValues["MaCauHoi"].ToString();
        choilbangDTO.STT = e.NewValues["STT"].ToString();
        int iReturn = choilbangDAL.InsertUpdate(choilbangDTO);
        if (iReturn >= 0)
        {
            gvCauHoiLoaiBang.DataSource = loadDataToUI();
            gvCauHoiLoaiBang.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvCauHoiLoaiBang.DoRowValidation();
        }
    }
    protected void gvCauHoiLoaiBang_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        choilbangDTO.OldID = e.OldValues["STT"].ToString();
        //choilbangDTO.MaLoaiBang = e.NewValues["MaLoaiBang"].ToString();
        choilbangDTO.MaLoaiBang = cboLoaiBang.Value.ToString();
        choilbangDTO.MaCauHoi = e.NewValues["MaCauHoi"].ToString();
        choilbangDTO.STT = e.NewValues["STT"].ToString();
        int iReturn = choilbangDAL.InsertUpdate(choilbangDTO);
        if (iReturn >= 0)
        {
            gvCauHoiLoaiBang.DataSource = loadDataToUI();
            gvCauHoiLoaiBang.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvCauHoiLoaiBang.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvCauHoiLoaiBang.DoRowValidation();
        }
    }
    protected void gvCauHoiLoaiBang_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvCauHoiLoaiBang.VisibleRowCount;
        List<object> keyValues = gvCauHoiLoaiBang.GetSelectedFieldValues("STT");
        foreach (object key in keyValues)
        {
            choilbangDTO.STT = key.ToString();
            int iReturn = choilbangDAL.Delete(choilbangDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvCauHoiLoaiBang.DataSource = loadDataToUI();
        gvCauHoiLoaiBang.Selection.SelectAll();
    }

    protected void gvCauHoiLoaiBang_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvCauHoiLoaiBang.DataSource = loadDataToUI();
            gvCauHoiLoaiBang.Selection.UnselectAll();
        }
        else
        {
            choilbangDTO = new clsCauHoi_LoaiBang_DTO();
            choilbangDTO.MaLoaiBang = e.Parameters;
            DataTable dt = choilbangDAL.getCauHoi_LoaiBang(choilbangDTO);
            gvCauHoiLoaiBang.DataSource = dt;
            gvCauHoiLoaiBang.DataBind();
        }
    }
}

using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class DeThi_qlcauhoi : NTT.Web.UI.BasePage
{
     #region

    clsCauHoi_DAL choiDAL ;
    clsCauHoi_DTO choiDTO ;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    
    {
        //if (Convert.ToString(Session["TenDangNhap"]) == "")
          //  Response.Redirect("~/dangnhap.aspx");
        choiDAL = new clsCauHoi_DAL();
        choiDTO = new clsCauHoi_DTO();
        cmn = new clsCommon();
        gvCauHoi.DataSource = loadDataToUI();
        gvCauHoi.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = choiDAL.getCauHoi(choiDTO);
        return dt;
    }
    protected void gvCauHoi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
      
         string strOldValues;
        if (strMess != string.Empty)
        {
            AddError(e.Errors, gvCauHoi.Columns["Error"], strMess);
            e.RowError = strMess;
            return;
        }
       
        foreach (GridViewColumn column in gvCauHoi.Columns)
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
    

    protected void gvCauHoi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    { //ndungDTO = new clsNguoiDung_DTO();

        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvCauHoi.VisibleRowCount;
        List<object> keyValues = gvCauHoi.GetSelectedFieldValues("MaCauHoi");
        foreach (object key in keyValues)
        {
            choiDTO.MaCauHoi = key.ToString();
            int iReturn = choiDAL.Delete(choiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvCauHoi.DataSource = loadDataToUI();
        gvCauHoi.Selection.SelectAll();

    }
    protected void gvCauHoi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        // ndungDTO = new clsNguoiDung_DTO();
        if (e.Parameters == "Update")
        {
            gvCauHoi.DataSource = loadDataToUI();
            gvCauHoi.Selection.UnselectAll();
        }
    }

    protected void btThemmoi_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/DeThi/qlchitietcauhoi.aspx");
    }




    protected void btSua_Click(object sender, EventArgs e)
    {
        int index = gvCauHoi.FocusedRowIndex;
        DataRow dr = gvCauHoi.GetDataRow(index);
        string id = dr["MaCauHoi"].ToString();
        Response.Redirect("~/DeThi/qlchitietcauhoi.aspx?MaCauHoi=" + id + "");

    }
}

using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class HeThong_qlquyen : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsQuyen_DAL quyenDAL;
    clsQuyen_DTO quyenDTO;
    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        quyenDAL = new clsQuyen_DAL();
        quyenDTO = new clsQuyen_DTO();
        cmn = new clsCommon();
        gvQuyen.DataSource = loadDataToUI();
        gvQuyen.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = quyenDAL.getQuyen(quyenDTO);
        return dt;
    }

    protected void gvQuyen_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        foreach (GridViewColumn column in gvQuyen.Columns)
        {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if (dataColumn == null || dataColumn.Caption == "Error" || dataColumn.Caption == "Mã Quyền") continue;
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
  
    protected void gvQuyen_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
      
        quyenDTO.MoTa = e.NewValues["MoTa"].ToString();
        int iReturn = quyenDAL.InsertUpdate(quyenDTO);
        if (iReturn >= 0)
        {
            gvQuyen.DataSource = loadDataToUI();
            gvQuyen.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvQuyen.DoRowValidation();
        }
    }
    protected void gvQuyen_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        
        quyenDTO.MoTa = e.NewValues["MoTa"].ToString();
        int iReturn = quyenDAL.InsertUpdate(quyenDTO);
        if (iReturn >= 0)
        {
            gvQuyen.DataSource = loadDataToUI();
            gvQuyen.CancelEdit();
        }
        else if (iReturn == -2)
        {
            strMess = "Không tồn tại mã để cập nhật";
            gvQuyen.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvQuyen.DoRowValidation();
        }

    }

    protected void gvQuyen_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvQuyen.VisibleRowCount;
        List<object> keyValues = gvQuyen.GetSelectedFieldValues("MaQuyen");
        foreach (object key in keyValues)
        {
            quyenDTO.MaQuyen = key.ToString();
            int iReturn = quyenDAL.Delete(quyenDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvQuyen.DataSource = loadDataToUI();
        gvQuyen.Selection.SelectAll();

    }
    protected void gvQuyen_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvQuyen.DataSource = loadDataToUI();
            gvQuyen.Selection.UnselectAll();
        }
    }
   
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using System.IO;

public partial class dethi_qlcauhoi : NTT.Web.UI.BasePage
{
    #region Khai báo các đối tượng và các biến toàn cục
    clsCauHoi_DAL choiDAL;
    clsCauHoi_DTO choiDTO;

    clsCauHoi_CauLuaChon_DAL choiclcDAL;
    clsCauHoi_CauLuaChon_DTO choiclcDTO;

    clsCauLuaChon_DAL clchonDAL;
    clsCauLuaChon_DTO clchonDTO;

    clsLoaiCauHoi_DAL loaichoiDAL;
    clsLoaiCauHoi_DTO loaichoiDTO;


    clsCommon cmn;
    string strMess = string.Empty;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");
        choiDAL = new clsCauHoi_DAL();
        choiDTO = new clsCauHoi_DTO();

        choiclcDAL = new clsCauHoi_CauLuaChon_DAL();
        choiclcDTO = new clsCauHoi_CauLuaChon_DTO();

        clchonDAL = new clsCauLuaChon_DAL();
        clchonDTO = new clsCauLuaChon_DTO();

        loaichoiDAL = new clsLoaiCauHoi_DAL();
        loaichoiDTO = new clsLoaiCauHoi_DTO();

       

        cmn = new clsCommon();
        loadMasterData();

        gvcauhoi.DataSource = loadDataToUI();
        gvcauhoi.DataBind();
       
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = choiclcDAL.getCauHoi_CauLuaChon(choiclcDTO);
        dt = loaichoiDAL.getLoaiCauHoi(loaichoiDTO);

    

      /*  if (gvcauhoi.KeyFieldName != null)
        {
            dt = choiDAL.getCauHoi(choiDTO);
            poptxtNoiDung.Value = "NoiDung";

            dt = choiclcDAL.getCauHoi_CauLuaChon(choiclcDTO);
            txtcauluachon.Value = "NoiDung";
        }*/
}
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = choiDAL.getCauHoi(choiDTO);
        return dt;
    }

    protected void gvcauhoi_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
      
        foreach (GridViewColumn column in gvcauhoi.Columns)
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

    protected void btnThemMoi_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DeThi/chitietcauhoi.aspx");       
    }
    protected void btnSua_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DeThi/chitietcauhoi.aspx?MaCauHoi = gvCauHoi.selected");
    }
   
}

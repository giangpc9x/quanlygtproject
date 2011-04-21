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
       /* if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");*/
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

        PupChiTietCauHoi.DataSource = loadDataToUI();
        PupChiTietCauHoi.DataBind();
        
       
    }
    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        choiDAL.getCauHoi(choiDTO);
       
        dt = clchonDAL.getCauLuaChon(clchonDTO);


      /*  if (gvcauhoi.Selection != null)
        {
            poptxtNoiDung.Text = "NoiDung";

          //  popimHinhAnh.Value = 

        }*/

        dt = choiclcDAL.getCauHoi_CauLuaChon(choiclcDTO);
        dt = loaichoiDAL.getLoaiCauHoi(loaichoiDTO);

        popcboLoaiCauHoi.ValueField = "MaloaiCauHoi";
        popcboLoaiCauHoi.TextField = "TenLoaiCH";

        popcboLoaiCauHoi.DataSource = dt;
        popcboLoaiCauHoi.DataBind();
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
    protected void gvcauhoi_CustomDataCallback(object sender, ASPxGridViewCustomDataCallbackEventArgs e)
    {
        string strReturn = string.Empty;
        string strMess = string.Empty;
        int iRow = gvcauhoi.VisibleRowCount;
        List<object> keyValues = gvcauhoi.GetSelectedFieldValues("MaCauHoi");
        foreach (object key in keyValues)
        {
            choiDTO.MaCauHoi= key.ToString();
            int iReturn = choiDAL.Delete(choiDTO);
            if (iReturn < 0)
                strMess += " " + key.ToString();
        }
        if (strMess != string.Empty)
            e.Result = "Do ràng buộc dữ liệu, không thể xóa " + strMess;
        else
            e.Result = string.Empty;
        gvcauhoi.DataSource = loadDataToUI();
        gvcauhoi.Selection.SelectAll();
    }
    protected void gvcauhoi_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "Update")
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.Selection.UnselectAll();
        }
    }

    /* protected void btnThemMoi_Click(object sender, EventArgs e)
     {
         Response.Redirect("~/DeThi/chitietcauhoi.aspx");       
     }
     protected void btnSua_Click(object sender, EventArgs e)
     {
         Response.Redirect("~/DeThi/chitietcauhoi.aspx?MaCauHoi = gvcauhoi.DataMember");
     }*/



    protected void btnSavePup_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        choiDTO = new clsCauHoi_DTO();
        clchonDTO = new clsCauLuaChon_DTO();
        choiclcDTO = new clsCauHoi_CauLuaChon_DTO();

        choiDTO.NoiDung = poptxtNoiDung.Text.ToString();
        choiDTO.HinhAnh = uplFile.FileName.ToString();
        choiDTO.MaloaiCauHoi = popcboLoaiCauHoi.SelectedIndex.ToString();
        int iReturn = choiDAL.InsertUpdate(choiDTO);
        if(iReturn > 0)
        {
            PupChiTietCauHoi.DataSource = dt;
            PupChiTietCauHoi.DataBind();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            PupChiTietCauHoi.Focus();
        }


    
        clchonDTO.NoiDungCLC = txtcauluachon.Text.ToString();
        clchonDTO.NoiDungCLC = txtcauluachon2.Text.ToString();
        clchonDTO.NoiDungCLC = txtcauluachon3.Text.ToString();
        clchonDTO.NoiDungCLC = txtcauluachon4.Text.ToString();
        int iReturn1 = clchonDAL.InsertUpdate(clchonDTO);
        if(iReturn1 > 0)
        {
            PupChiTietCauHoi.DataSource = dt;
            PupChiTietCauHoi.DataBind();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            PupChiTietCauHoi.Focus();
        }
        choiclcDTO.MaCauHoi = iReturn.ToString();
        choiclcDTO.MaCauLuaChon = iReturn1.ToString();
        choiclcDTO.DapAn = rdodapan.Checked.ToString();
        choiclcDTO.DapAn = rdodapan2.Checked.ToString();
        choiclcDTO.DapAn = rdodapan3.Checked.ToString();
        choiclcDTO.DapAn = rdodapan4.Checked.ToString();
        int iReturn3 = choiclcDAL.InsertUpdate(choiclcDTO);
        if (iReturn3 > 0)
        {
            PupChiTietCauHoi.DataSource = dt;
            PupChiTietCauHoi.DataBind();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            PupChiTietCauHoi.Focus();

        }

    }
   
}

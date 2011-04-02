using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

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

    protected void gvcauhoi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        choiDTO.MaCauHoi = e.NewValues["MaCauHoi"].ToString();
        choiDTO.NoiDung = e.NewValues["NoiDung"].ToString();
        choiDTO.HinhAnh = e.NewValues["HinhAnh"].ToString();
        choiDTO.MaloaiCauHoi = e.NewValues["TenLoai"].ToString();

        int iReturn1 = choiDAL.InsertUpdate(choiDTO);
        if (iReturn1 >= 0)
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvcauhoi.DoRowValidation();
        }

        // insert cau hoi cau lua chon

        choiclcDTO.MaCauHoi = e.NewValues["MaCauHoi"].ToString();
        choiclcDTO.MaCauLuaChon = e.NewValues["MaCauLuaChon"].ToString();
        choiclcDTO.DapAn = e.NewValues["DapAn"].ToString();


        int iReturn2 = choiclcDAL.InsertUpdate(choiclcDTO);
        if (iReturn2 >= 0)
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvcauhoi.DoRowValidation();
        }

        // insert cau lua chon
        clchonDTO.MaCauLuaChon = e.NewValues["MaCauLuaChon"].ToString();
        clchonDTO.NoiDungCLC = e.NewValues["NoiDungCLC"].ToString();


        int iReturn3 = clchonDAL.InsertUpdate(clchonDTO);
        if (iReturn3 >= 0)
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.CancelEdit();
        }
        else
        {
            strMess = "Lưu Dữ Liệu Không Thành Công";
            gvcauhoi.DoRowValidation();
        }
    }

    protected void gvcauhoi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        choiDTO.OldID = e.NewValues["MaCauHoi"].ToString();
        clchonDTO.OldID = e.NewValues["MaCauLuaChon"].ToString();
 
        // sua cau hoi
        choiDTO.MaCauHoi = e.NewValues["MaCauHoi"].ToString();
        choiDTO.NoiDung = e.NewValues["NoiDung"].ToString();
        choiDTO.HinhAnh = e.NewValues["HinhAnh"].ToString();
        choiDTO.MaloaiCauHoi = e.NewValues["TenLoai"].ToString();


              

        
        int iReturn1 = choiDAL.InsertUpdate(choiDTO);
        if (iReturn1 >= 0)
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.CancelEdit();
        }
        else if (iReturn1 == -2)
        {
            strMess = "Không tồn tại tên đăng nhập để cập nhật";
            gvcauhoi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvcauhoi.DoRowValidation();
        }

        // sua cau hoi_cau lua chon
        choiclcDTO.MaCauHoi = e.NewValues["MaCauHoi"].ToString();
        choiclcDTO.MaCauLuaChon = e.NewValues["MaCauLuaChon"].ToString();
        choiclcDTO.DapAn = e.NewValues["DapAn"].ToString();

        int iReturn2 = choiclcDAL.InsertUpdate(choiclcDTO);
        if (iReturn2 >= 0)
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.CancelEdit();
        }
        else if (iReturn2 == -2)
        {
            strMess = "Không tồn tại tên đăng nhập để cập nhật";
            gvcauhoi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvcauhoi.DoRowValidation();
        }

        //sua cau lua chon
        clchonDTO.MaCauLuaChon = e.NewValues["MaCauLuaChon"].ToString();
        clchonDTO.NoiDungCLC = e.NewValues["NoiDungCLC"].ToString();

        int iReturn3 = clchonDAL.InsertUpdate(clchonDTO);
        if (iReturn3 >= 0)
        {
            gvcauhoi.DataSource = loadDataToUI();
            gvcauhoi.CancelEdit();
        }
        else if (iReturn3 == -2)
        {
            strMess = "Không tồn tại tên đăng nhập để cập nhật";
            gvcauhoi.DoRowValidation();
        }
        else
        {
            strMess = "Do ràng buộc dữ liệu. Không thể thực hiện cập nhật";
            gvcauhoi.DoRowValidation();
        }
    }
}

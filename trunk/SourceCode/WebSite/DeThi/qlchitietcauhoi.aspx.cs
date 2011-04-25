using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class DeThi_qlchitietcauhoi : NTT.Web.UI.BasePage
{
    clsLoaiCauHoi_DAL lchoiDAL;
    clsLoaiCauHoi_DTO lchoiDTO;

    clsCauHoi_DAL choiDAL;
    clsCauHoi_DTO choiDTO;

    clsCauLuaChon_DAL clchonDAL;
    clsCauLuaChon_DTO clchonDTO;

    clsCauHoi_CauLuaChon_DAL choi_clchonDAL;
    clsCauHoi_CauLuaChon_DTO choi_clchonDTO;

    clsCommon cmn;
    protected void Page_Load(object sender, EventArgs e)
    {
        lchoiDAL = new clsLoaiCauHoi_DAL();
        lchoiDTO = new clsLoaiCauHoi_DTO();

        choiDAL = new clsCauHoi_DAL();
        choiDTO = new clsCauHoi_DTO();

        clchonDAL = new clsCauLuaChon_DAL();
        clchonDTO = new clsCauLuaChon_DTO();


        choi_clchonDAL = new clsCauHoi_CauLuaChon_DAL();
        choi_clchonDTO = new clsCauHoi_CauLuaChon_DTO();
        cmn = new clsCommon();
        loadMasterData();
   
      
        
           
           // ndungDTO.MaDiemThi = cboDienThi.Value.ToString();
          //  gvNguoiDung.DataSource = loadDataToUI();
          //  gvNguoiDung.DataBind();
        
    }

    private void loadMasterData()
    {
        DataTable dt = new DataTable();
        dt = lchoiDAL.getLoaiCauHoi(lchoiDTO);
         cboLoaiCauHoi.TextField = "TenLoaiCH";
        cboLoaiCauHoi.ValueField = "MaloaiCauHoi";

        cboLoaiCauHoi.DataSource = dt;
        cboLoaiCauHoi.DataBind();

    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = choiDAL.getCauHoi(choiDTO);
        return dt;
    }

}

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

    clsChiTietCauHoi_DAL ctchoiDAL;

    clsCommon cmn;
    string strMess = string.Empty;
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

        ctchoiDAL = new clsChiTietCauHoi_DAL();
        cmn = new clsCommon();
        loadMasterData();
        
    }

    protected void loadMasterData()
    {
        //string maCauHoi = Request.Params["MaCauHoi"].ToString();
        String id = Request.QueryString["MaCauHoi"].ToString();

        DataTable dt = new DataTable();
        dt = lchoiDAL.getLoaiCauHoi(lchoiDTO);
      
            cboLoaiCauHoi.TextField = "TenLoaiCH";
            cboLoaiCauHoi.ValueField = "MaloaiCauHoi";

            cboLoaiCauHoi.DataSource = dt;
            cboLoaiCauHoi.DataBind();

          

            DataTable dt1 = new DataTable();
            dt1 = ctchoiDAL.getChiTietCauHoi("id");
            txtNoiDung.Text = dt1.Columns["NoiDung"].ToString();






       
      //  txtNoiDung.Text = 



            //clsDeThi_DAL dethi = new clsDeThi_DAL();
            //DataTable dt1 = new DataTable();
          //  dt1 = dethi.getDeThi("A2");
          //  listDataList1.DataSource = dt;
           // listDataList1.DataBind();
           // DataTable dt_CauLuaChon = new DataTable();

           //// DataTable dt_CauLuaChon = new DataTable();
           // for (int i = 0; i < dt1.Rows.Count; i++)
           // {
           //     dt_CauLuaChon = dethi.getcauluachon_cauhoi(dt.Rows[i]["MaCauHoi"].ToString());
           //    // Image img = listDataList1.Items[i].FindControl("Image1") as Image;
           //     Image img = imgHinhAnh.FindControl("imHinhAnh") as Image;
           //     if (dt1.Rows[i]["HinhAnh"] == DBNull.Value || dt1.Rows[i]["HinhAnh"].ToString() == "")
           //     {
           //         img.Visible = false;
           //     }
           //     else
           //     {
           //         img.Visible = true;
           //         img.ImageUrl = "~/hinh/" + dt.Rows[i]["HinhAnh"].ToString() + "";
           //     }
           //   //  ASPxTextBox txtcauhoi = txtNoiDung.FindControl("txtNoiDung") as ASPxTextBox;
           //     //ASPxRadioButtonList radCauLuaChon = listDataList1.Items[i].FindControl("radCauLuaChon") as ASPxRadioButtonList;
           //    // radCauLuaChon.DataSource = dt_CauLuaChon;
           //    // radCauLuaChon.TextField = "NoiDungCLC";
           //    // radCauLuaChon.DataBind();
           // }
       

        

    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = choiDAL.getCauHoi(choiDTO);
        return dt;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        choiDTO = new clsCauHoi_DTO();
        clchonDTO = new clsCauLuaChon_DTO();
        choi_clchonDTO = new clsCauHoi_CauLuaChon_DTO();

        choiDTO.NoiDung = txtNoiDung.Text.ToString();
        choiDTO.HinhAnh = uplFile.FileName.ToString();
        choiDTO.MaloaiCauHoi = cboLoaiCauHoi.SelectedIndex.ToString();

        int iReturn = choiDAL.InsertUpdate(choiDTO);
        if (iReturn > 0)
        {
            uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            txtNoiDung.Focus();
        }

        clchonDTO.NoiDungCLC = txtCauLuaChon.Text.ToString();
        int iReturn1 = clchonDAL.InsertUpdate(clchonDTO);
        if (iReturn1 > 0)
        {
            // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            // txtNoiDung.Focus();
        }
        clchonDTO.NoiDungCLC = txtCauLuaChon1.Text.ToString();
        int iReturn2 = clchonDAL.InsertUpdate(clchonDTO);
        if (iReturn2 > 0)
        {
            // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            // txtNoiDung.Focus();
        }
        clchonDTO.NoiDungCLC = txtCauLuaChon2.Text.ToString();
        int iReturn3 = clchonDAL.InsertUpdate(clchonDTO);
        if (iReturn3 > 0)
        {
            // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            // txtNoiDung.Focus();
        }
        clchonDTO.NoiDungCLC = txtCauLuaChon3.Text.ToString();

        int iReturn4 = clchonDAL.InsertUpdate(clchonDTO);
        if (iReturn4 > 0)
        {
           // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
           // txtNoiDung.Focus();
        }

        choi_clchonDTO.MaCauHoi = iReturn.ToString();
        choi_clchonDTO.MaCauLuaChon = iReturn1.ToString();
        choi_clchonDTO.DapAn = rbtDapAn.Checked.ToString();

         int iReturn5 = choi_clchonDAL.InsertUpdate(choi_clchonDTO);
         if (iReturn5 >= 0)
         {
             // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
             Response.Write("Lưu dữ liệu thành công");
         }
         else
         {
             Response.Write("lưu dữ liệu thất bại");
             // txtNoiDung.Focus();
         }

        choi_clchonDTO.MaCauHoi = iReturn.ToString();
        choi_clchonDTO.MaCauLuaChon = iReturn2.ToString();
        choi_clchonDTO.DapAn = rbtDapAn1.Checked.ToString();

        int iReturn6 = choi_clchonDAL.InsertUpdate(choi_clchonDTO);
        if (iReturn6 >= 0)
        {
            // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            // txtNoiDung.Focus();
        }

        choi_clchonDTO.MaCauHoi = iReturn.ToString();
        choi_clchonDTO.MaCauLuaChon = iReturn3.ToString();
        choi_clchonDTO.DapAn = rbtDapAn2.Checked.ToString();

        int iReturn7 = choi_clchonDAL.InsertUpdate(choi_clchonDTO);
        if (iReturn7 >= 0)
        {
            // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            // txtNoiDung.Focus();
        }

        choi_clchonDTO.MaCauHoi = iReturn.ToString();
        choi_clchonDTO.MaCauLuaChon = iReturn4.ToString();
        choi_clchonDTO.DapAn = rbtDapAn3.Checked.ToString();

        int iReturn8 = choi_clchonDAL.InsertUpdate(choi_clchonDTO);
        if (iReturn8 >= 0)
        {
            // uplFile.SaveAs(Server.MapPath(@"~\hinh\") + uplFile.FileName);
            Response.Write("Lưu dữ liệu thành công");
        }
        else
        {
            Response.Write("lưu dữ liệu thất bại");
            // txtNoiDung.Focus();
        }
    }
}

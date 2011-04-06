using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class dangnhap : NTT.Web.UI.BasePage//System.Web.UI.Page
{
    clsNguoiDung_DAL nguoidungDAL;
    clsNguoiDung_DTO nguoidungDTO;

    protected void Page_Load(object sender, EventArgs e)
    {
        nguoidungDAL = new clsNguoiDung_DAL();
    }


    protected void ASPxButtonlogin_Click(object sender, EventArgs e)
    {
        

    }
    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        string strTenDangNhap = txttendangnhap.Text.Trim();
        string strPassword = txtmatkhau.Text.Trim();
        if (nguoidungDAL.Check_Login(strTenDangNhap, strPassword) > 0)
        {
            nguoidungDTO = new clsNguoiDung_DTO();
            nguoidungDTO.TenDangNhap = strTenDangNhap;
            nguoidungDTO.MatKhau = strPassword;
            DataTable dt = new DataTable();
            dt = nguoidungDAL.getNguoiDung(nguoidungDTO);

            Session["TenDangNhap"] = dt.Rows[0]["TenDangNhap"].ToString();
            Session["HoTen"] = dt.Rows[0]["Ho"].ToString() + " " + dt.Rows[0]["Ten"].ToString();
            Session["MaDiemThi"] = dt.Rows[0]["MaDiemThi"].ToString();
            
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            lblthongbao.Text = "Dang Nhap That bai! vui long kiem tra lai";
            txttendangnhap.Focus();
        }
    }
}

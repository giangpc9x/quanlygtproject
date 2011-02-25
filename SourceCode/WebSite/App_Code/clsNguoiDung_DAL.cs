using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsNguoiDung_DAL : NTT.Web.UI.BasePage
{
    DataObject obj;
    public clsNguoiDung_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getNguoiDung(clsNguoiDung_DTO nguoidungDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("TenDangNhap", nguoidungDTO.TenDangNhap);
        _list.Add("MaDiemThi", nguoidungDTO.MaDiemThi);
        _list.Add("MatKhau", nguoidungDTO.MatKhau);
        _list.Add("Ho", nguoidungDTO.Ho);
        _list.Add("Ten", nguoidungDTO.Ten);
        _list.Add("CMND", nguoidungDTO.CMND);
        _list.Add("NgaySinh", nguoidungDTO.NgaySinh);
        _list.Add("DiaChi", nguoidungDTO.DiaChi);
        _list.Add("DienThoai", nguoidungDTO.DienThoai);
        _list.Add("Email", nguoidungDTO.Email);
        _list.Add("NgayDK", nguoidungDTO.NgayDK);
        _list.Add("TrangThai", nguoidungDTO.TrangThai);
        _list.Add("MaNhom", nguoidungDTO.MaNhom);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Nguoi_Dung", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }

    public int InsertUpdate(clsNguoiDung_DTO nguoidungDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", nguoidungDTO.OldID);
            _list.Add("TenDangNhap", nguoidungDTO.TenDangNhap);
            _list.Add("MaDiemThi", nguoidungDTO.MaDiemThi);
            _list.Add("MatKhau", nguoidungDTO.MatKhau);
            _list.Add("Ho", nguoidungDTO.Ho);
            _list.Add("Ten", nguoidungDTO.Ten);
            _list.Add("CMND", nguoidungDTO.CMND);
            _list.Add("NgaySinh", nguoidungDTO.NgaySinh);
            _list.Add("DiaChi", nguoidungDTO.DiaChi);
            _list.Add("DienThoai", nguoidungDTO.DienThoai);
            _list.Add("DienThoai", nguoidungDTO.DienThoai);
            _list.Add("NgayDK", nguoidungDTO.NgayDK);
            _list.Add("TrangThai", nguoidungDTO.TrangThai);
            _list.Add("MaNhom", nguoidungDTO.MaNhom);
            int iReturn = obj.ExcSql("Insert_Update_Nguoi_Dung", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsNguoiDung_DTO nguoidungDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("TenDangNhap", nguoidungDTO.TenDangNhap);
            int iReturn = obj.ExcSql("Delete_Nguoi_Dung", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
     public int Check_TenDangNhap(string strTenDangNhap)
      {

          try
          {
              ListDictionary _list = new ListDictionary();
              _list.Add("TenDangNhap", strTenDangNhap);
              int iReturn = obj.ExcSql("Check_TenDangNhap", _list, CommandType.StoredProcedure);
              return iReturn;
          }
          catch (Exception)
          {
              return -1111;
          }
      }
    
}

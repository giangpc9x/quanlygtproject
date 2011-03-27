using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsThiSinh_DAL
{
    DataObject obj;

    public clsThiSinh_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getThiSinh(clsThiSinh_DTO thisinhDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaTS", thisinhDTO.MaTS);
        _list.Add("MatKhau", thisinhDTO.MatKhau);
        _list.Add("HoTenLot", thisinhDTO.HoTenLot);
        _list.Add("Ten", thisinhDTO.Ten);
        _list.Add("QuocTich", thisinhDTO.QuocTich);
        _list.Add("NgaySinh", thisinhDTO.NgaySinh);
        _list.Add("NguyenQuan", thisinhDTO.NguyenQuan);
        _list.Add("NoiDKHoKhau", thisinhDTO.NoiDKHoKhau);
        _list.Add("NoiThuongTru", thisinhDTO.NoiThuongTru);
        _list.Add("DienThoai", thisinhDTO.DienThoai);
        _list.Add("DVCongTac", thisinhDTO.DVCongTac);
        _list.Add("CMND", thisinhDTO.CMND);
        _list.Add("NgayCapCMND", thisinhDTO.NgayCapCMND);
        _list.Add("NoiCapCMND", thisinhDTO.NoiCapCMND);
        _list.Add("TrinhDoVanHoa", thisinhDTO.TrinhDoVanHoa);
        _list.Add("NgayDKThi", thisinhDTO.NgayDKThi);
        _list.Add("MaCaThi", thisinhDTO.MaCaThi);
        _list.Add("MaPhong", thisinhDTO.MaPhong);   
  
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Thi_Sinh", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsThiSinh_DTO thisinhDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", thisinhDTO.OldID);
            _list.Add("MaTS", thisinhDTO.MaTS);
            _list.Add("MatKhau", thisinhDTO.MatKhau);
            _list.Add("HoTenLot", thisinhDTO.HoTenLot);
            _list.Add("Ten", thisinhDTO.Ten);
            _list.Add("QuocTich", thisinhDTO.QuocTich);
            _list.Add("NgaySinh", thisinhDTO.NgaySinh);
            _list.Add("NguyenQuan", thisinhDTO.NguyenQuan);
            _list.Add("NoiDKHoKhau", thisinhDTO.NoiDKHoKhau);
            _list.Add("NoiThuongTru", thisinhDTO.NoiThuongTru);
            _list.Add("DienThoai", thisinhDTO.DienThoai);
            _list.Add("DVCongTac", thisinhDTO.DVCongTac);
            _list.Add("CMND", thisinhDTO.CMND);
            _list.Add("NgayCapCMND", thisinhDTO.NgayCapCMND);
            _list.Add("NoiCapCMND", thisinhDTO.NoiCapCMND);
            _list.Add("TrinhDoVanHoa", thisinhDTO.TrinhDoVanHoa);
            _list.Add("NgayDKThi", thisinhDTO.NgayDKThi);
            _list.Add("MaCaThi", thisinhDTO.MaCaThi);
            _list.Add("MaPhong", thisinhDTO.MaPhong);
            int iReturn = obj.ExcSql("Insert_Update_Thi_Sinh", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsThiSinh_DTO thisinhDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaTS", thisinhDTO.MaTS);
            int iReturn = obj.ExcSql("Delete_Thi_Sinh", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_MaThiSinh(string strMaTS)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaTS", strMaTS);
            int iReturn = obj.ExcSql("Check_MaTS", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

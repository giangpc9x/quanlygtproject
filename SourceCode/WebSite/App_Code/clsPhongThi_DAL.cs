using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsPhongThi_DAL
{
    DataObject obj;
    public clsPhongThi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getPhongThi(clsPhongThi_DTO phongthiDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaPhong", phongthiDTO.MaPhong);
        _list.Add("MoTa", phongthiDTO.MoTa);
        _list.Add("SoThSinhToiDa", phongthiDTO.SoThSinhToiDa);
        _list.Add("TrangThai", phongthiDTO.TrangThai);
        _list.Add("MaDiemThi", phongthiDTO.MaDiemThi);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Phong_Thi", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsPhongThi_DTO phongthiDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", phongthiDTO.OldID);
            _list.Add("MaPhong", phongthiDTO.MaPhong);
            _list.Add("MoTa", phongthiDTO.MoTa);
            _list.Add("SoThSinhToiDa", phongthiDTO.SoThSinhToiDa);
            _list.Add("TrangThai", phongthiDTO.TrangThai);
            _list.Add("MaDiemThi", phongthiDTO.MaDiemThi);

            int iReturn = obj.ExcSql("Insert_Update_Phong_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsPhongThi_DTO phongthiDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaPhong", phongthiDTO.MaPhong);
            int iReturn = obj.ExcSql("Delete_Phong_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_MaPhong(string strMaPhong)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaPhong", strMaPhong);
            int iReturn = obj.ExcSql("Check_MaPhong", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

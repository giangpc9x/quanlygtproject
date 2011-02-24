using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsNhomNguoiDung_DAL
{
    DataObject obj;
    public clsNhomNguoiDung_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getNhomNguoiDung(clsNhomNguoiDung_DTO nhomndDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaNhom", nhomndDTO.MaNhom);
        _list.Add("TenNhom", nhomndDTO.TenNhom);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Nhom_Nguoi_Dung", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsNhomNguoiDung_DTO nhomndDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", nhomndDTO.OldID);
            _list.Add("MaNhom", nhomndDTO.MaNhom);
            _list.Add("TenNhom", nhomndDTO.TenNhom);

            int iReturn = obj.ExcSql("Insert_Update_Nhom_Nguoi_Dung", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsNhomNguoiDung_DTO nhomndDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaNhom", nhomndDTO.MaNhom);
            int iReturn = obj.ExcSql("Delete_Nhom_Nguoi_Dung", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
}

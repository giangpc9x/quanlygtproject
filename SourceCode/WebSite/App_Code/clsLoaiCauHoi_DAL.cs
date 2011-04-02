using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsLoaiCauHoi_DAL
{
    DataObject obj;
    public clsLoaiCauHoi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getLoaiCauHoi(clsLoaiCauHoi_DTO loaiCHDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaloaiCauHoi", loaiCHDTO.MaloaiCauHoi);
        _list.Add("TenLoaiCH", loaiCHDTO.TenLoaiCH);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Loai_Cau_Hoi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsLoaiCauHoi_DTO loaiCHDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", loaiCHDTO.OldID);
            _list.Add("MaloaiCauHoi", loaiCHDTO.MaloaiCauHoi);
            _list.Add("TenLoaiCH", loaiCHDTO.TenLoaiCH);

            int iReturn = obj.ExcSql("Insert_Update_Loai_Cau_Hoi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsLoaiCauHoi_DTO loaiCHDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaloaiCauHoi", loaiCHDTO.MaloaiCauHoi);

            int iReturn = obj.ExcSql("Delete_Loai_Cau_Hoi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
}

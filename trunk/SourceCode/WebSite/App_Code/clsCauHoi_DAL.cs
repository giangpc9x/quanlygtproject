using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCauHoi_DAL
{
    DataObject obj;
    public clsCauHoi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getCauHoi(clsCauHoi_DTO cauhoiDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaCauHoi", cauhoiDTO.MaCauHoi);
        _list.Add("NoiDung", cauhoiDTO.NoiDung);
        _list.Add("HinhAnh", cauhoiDTO.HinhAnh);
        _list.Add("MaloaiCauHoi", cauhoiDTO.MaloaiCauHoi);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Cau_Hoi", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCauHoi_DTO cauhoiDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();

            _list.Add("old_id", cauhoiDTO.OldID);
            _list.Add("MaCauHoi", cauhoiDTO.MaCauHoi);
            _list.Add("NoiDung", cauhoiDTO.NoiDung);
            _list.Add("HinhAnh", cauhoiDTO.HinhAnh);
            _list.Add("MaloaiCauHoi", cauhoiDTO.MaloaiCauHoi);

            int iReturn = obj.ExcSql("Insert_Update_Cau_Hoi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCauHoi_DTO cauhoiDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaCauHoi", cauhoiDTO.MaCauHoi);
            int iReturn = obj.ExcSql("Delete_Cau_Hoi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public void Laymacauhoimoi(clsCauHoi_DTO cauhoiDTO)
    {
            string sql = "Select top 1 MaCauHoi from CauHoi order by MaCauHoi";       
    }
}

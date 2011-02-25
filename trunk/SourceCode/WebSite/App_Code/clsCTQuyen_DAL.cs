using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCTQuyen_DAL
{
    DataObject obj;
    public clsCTQuyen_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getQuyen(clsCTQuyen_DTO ctqDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaQuyen", ctqDTO.MaQuyen);
        _list.Add("MaNhom", ctqDTO.MaNhom);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_CT_Quyen", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCTQuyen_DTO ctqDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", ctqDTO.OldID);
            _list.Add("MaQuyen", ctqDTO.MaQuyen);
            _list.Add("MaNhom", ctqDTO.MaNhom);

            int iReturn = obj.ExcSql("Insert_Update_CT_Quyen", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCTQuyen_DTO ctqDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaQuyen", ctqDTO.MaQuyen);
            int iReturn = obj.ExcSql("Delete_Quyen", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
}

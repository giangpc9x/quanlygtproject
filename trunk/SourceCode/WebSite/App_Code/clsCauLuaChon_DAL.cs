using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCauLuaChon_DAL
{
    DataObject obj;
    public clsCauLuaChon_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getCauLuaChon(clsCauLuaChon_DTO clcDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaCauLuaChon", clcDTO.MaCauLuaChon);
        _list.Add("NoiDungCLC", clcDTO.NoiDungCLC);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Cau_Lua_Chon", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCauLuaChon_DTO clcDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();

            _list.Add("old_id", clcDTO.OldID);
            _list.Add("MaCauLuaChon", clcDTO.MaCauLuaChon);
            _list.Add("NoiDungCLC", clcDTO.NoiDungCLC);

            int iReturn = obj.ExcSql("Insert_Update_Cau_Lua_Chon", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCauLuaChon_DTO clcDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaCauLuaChon", clcDTO.MaCauLuaChon);
            int iReturn = obj.ExcSql("Delete_Cau_Lua_Chon", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
   
}

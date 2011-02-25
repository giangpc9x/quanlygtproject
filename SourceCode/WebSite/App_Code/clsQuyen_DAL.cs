using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsQuyen_DAL
{
    DataObject obj;
    public clsQuyen_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getQuyen(clsQuyen_DTO qDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaQuyen", qDTO.MaQuyen);
        _list.Add("MoTa", qDTO.MoTa);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Quyen", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsQuyen_DTO qDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", qDTO.OldID);
            _list.Add("MaQuyen", qDTO.MaQuyen);
            _list.Add("MoTa", qDTO.MoTa);

            int iReturn = obj.ExcSql("Insert_Update_Quyen", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsQuyen_DTO qDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaQuyen", qDTO.MaQuyen);
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

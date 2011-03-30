using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCauHoi_CauLuaChon_DAL
{
    DataObject obj;
    public clsCauHoi_CauLuaChon_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getCauHoi_CauLuaChon(clsCauHoi_CauLuaChon_DTO ch_clcDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaCauHoi", ch_clcDTO.MaCauHoi);
        _list.Add("MaCauLuaChon", ch_clcDTO.MaCauLuaChon);
        _list.Add("DapAn", ch_clcDTO.DapAn);
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_CauHoi_CauLuaChon", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCauHoi_CauLuaChon_DTO ch_clcDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();

            _list.Add("old_id", ch_clcDTO.OldID);
            _list.Add("MaCauHoi", ch_clcDTO.MaCauHoi);
            _list.Add("MaCauLuaChon", ch_clcDTO.MaCauLuaChon);
            _list.Add("DapAn", ch_clcDTO.DapAn);

            int iReturn = obj.ExcSql("Insert_Update_CauHoi_CauLuaChon", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCauHoi_CauLuaChon_DTO ch_clcDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaCauHoi", ch_clcDTO.MaCauHoi);
            int iReturn = obj.ExcSql("Delete_CauHoi_CauLuaChon", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
}

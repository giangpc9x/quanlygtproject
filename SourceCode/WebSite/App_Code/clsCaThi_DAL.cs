using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCaThi_DAL
{
    DataObject obj;
    public clsCaThi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getCaThi(clsCaThi_DTO cathiDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaCaThi", cathiDTO.MaCaThi);
        _list.Add("MoTa", cathiDTO.MoTa);
        _list.Add("GioBatDau", cathiDTO.GioBatDau);
        _list.Add("MaDotThi", cathiDTO.MaDotThi);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Ca_Thi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCaThi_DTO cathiDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", cathiDTO.OldID);
            _list.Add("MaCaThi", cathiDTO.MaCaThi);
            _list.Add("MoTa", cathiDTO.MoTa);
            _list.Add("GioBatDau", cathiDTO.GioBatDau);
            _list.Add("MaDotThi", cathiDTO.MaDotThi);
            int iReturn = obj.ExcSql("Insert_Update_CaThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCaThi_DTO cathiDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaCaThi", cathiDTO.MaCaThi);
            int iReturn = obj.ExcSql("Delete_CaThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_MaCaThi(string strMaCaThi)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaCaThi", strMaCaThi);
            int iReturn = obj.ExcSql("Check_CaThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

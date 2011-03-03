using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsDotThi_DAL
{
    DataObject obj;
    public clsDotThi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getDotThi(clsDotThi_DTO dotthiDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaDotThi", dotthiDTO.MaDotThi);
        _list.Add("MaLoaiBang", dotthiDTO.MaLoaiBang);
        _list.Add("NgayTao", dotthiDTO.NgayTao);
        _list.Add("MoTa", dotthiDTO.MoTa);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Dot_Thi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsDotThi_DTO dotthiDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", dotthiDTO.OldID);
            _list.Add("MaDotThi", dotthiDTO.MaDotThi);
            _list.Add("MaLoaiBang", dotthiDTO.MaLoaiBang);
            _list.Add("NgayTao", dotthiDTO.NgayTao);
            _list.Add("MoTa", dotthiDTO.MoTa);
            int iReturn = obj.ExcSql("Insert_Update_Dot_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsDotThi_DTO dotthiDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaDotThi", dotthiDTO.MaDotThi);
            int iReturn = obj.ExcSql("Delete_DotThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_Dot_Thi(string strMaDotThi)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaDotThi", strMaDotThi);
            int iReturn = obj.ExcSql("Check_Dot_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

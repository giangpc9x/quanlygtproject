using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsKetQuaThi_DAL
{
    DataObject obj;
    public clsKetQuaThi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getKetQuaThi(clsKetQuaThi_DTO kqtDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("SoDeThi", kqtDTO.SoDeThi);
        _list.Add("MaTS", kqtDTO.MaTS);
        _list.Add("DiemDanh", kqtDTO.DiemDanh);
        _list.Add("KetQuaThi", kqtDTO.KetQuaThi);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Ket_Qua_Thi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsKetQuaThi_DTO kqtDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", kqtDTO.OldID);
            _list.Add("SoDeThi", kqtDTO.SoDeThi);
            _list.Add("MaTS", kqtDTO.MaTS);
            _list.Add("DiemDanh", kqtDTO.DiemDanh);
            _list.Add("KetQuaThi", kqtDTO.KetQuaThi);
            int iReturn = obj.ExcSql("Insert_Update_KetQuaThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsKetQuaThi_DTO kqtDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("SoDeThi", kqtDTO.SoDeThi);
            int iReturn = obj.ExcSql("Delete_KetQuaThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_SoDeThi(string strSoDeThi)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("SoDeThi", strSoDeThi);
            int iReturn = obj.ExcSql("Check_Ket_Qua_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

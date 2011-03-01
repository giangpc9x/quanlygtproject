using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsLoaiBanglai_DAL
{
    DataObject obj;
    public clsLoaiBanglai_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getDiaDiemThi(clsLoaiBanglai_DTO loaibanglaiDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaLoaiBang", loaibanglaiDTO.MaLoaiBang);
        _list.Add("TenLoai", loaibanglaiDTO.TenLoai);
        _list.Add("MoTa", loaibanglaiDTO.MoTa);
        _list.Add("TGThi", loaibanglaiDTO.TGThi);
        _list.Add("SoCauDat", loaibanglaiDTO.SoCauDat);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Loai_Bang_Lai", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsLoaiBanglai_DTO loaibanglaiDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", loaibanglaiDTO.OldID);
            _list.Add("MaLoaiBang", loaibanglaiDTO.MaLoaiBang);
            _list.Add("TenLoai", loaibanglaiDTO.TenLoai);
            _list.Add("MoTa", loaibanglaiDTO.MoTa);
            _list.Add("TGThi", loaibanglaiDTO.TGThi);
            _list.Add("SoCauDat", loaibanglaiDTO.SoCauDat);
            int iReturn = obj.ExcSql("Insert_Update_Loai_Bang_Lai", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsLoaiBanglai_DTO loaibanglaiDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaLoaiBang", loaibanglaiDTO.MaLoaiBang);
            int iReturn = obj.ExcSql("Delete_Loai_Bang_Lai", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_MaLoaiBang(string strMaLoaiBang)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaLoaiBang", strMaLoaiBang);
            int iReturn = obj.ExcSql("Check_Loai_Bang_Lai", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

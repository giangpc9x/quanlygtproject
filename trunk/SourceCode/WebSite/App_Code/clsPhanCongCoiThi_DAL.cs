using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsPhanCongCoithi_DAL
{
    DataObject obj;
    public clsPhanCongCoithi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getPCCT(clsPhanCongCoiThi_DTO pcctDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("STT", pcctDTO.STT);
        _list.Add("TenDangNhap", pcctDTO.TenDangNhap);
        _list.Add("MaCaThi", pcctDTO.MaCaThi);
        _list.Add("MaPhong", pcctDTO.MaPhong);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Phan_Cong_Coi_Thi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsPhanCongCoiThi_DTO pcctDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", pcctDTO.OldID);
            _list.Add("STT", pcctDTO.STT);
            _list.Add("TenDangNhap", pcctDTO.TenDangNhap);
            _list.Add("MaCaThi", pcctDTO.MaCaThi);
            _list.Add("MaPhong", pcctDTO.MaPhong);
            int iReturn = obj.ExcSql("Insert_Update_Phan_Cong_Coi_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsPhanCongCoiThi_DTO pcctDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("STT", pcctDTO.STT);
            int iReturn = obj.ExcSql("Delete_Phan_Cong_Coi_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_STT(string strSTT)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("STT", strSTT);
            int iReturn = obj.ExcSql("Check_Phan_Cong_Coi_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

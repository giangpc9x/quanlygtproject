using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCauTrucDeThi_DAL
{
    DataObject obj;
    public clsCauTrucDeThi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getCauTrucDeThi(clsCauTrucDeThi_DTO ctdtDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("STT", ctdtDTO.STT);
        _list.Add("MaLoaiBang", ctdtDTO.MaLoaiBang);
        _list.Add("MaloaiCauHoi", ctdtDTO.MaloaiCauHoi);
        _list.Add("SoCau", ctdtDTO.SoCau);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Cau_Truc_De_Thi", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCauTrucDeThi_DTO ctdtDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", ctdtDTO.OldID);
            _list.Add("STT", ctdtDTO.STT);
            _list.Add("MaLoaiBang", ctdtDTO.MaLoaiBang);
            _list.Add("MaloaiCauHoi", ctdtDTO.MaloaiCauHoi);
            _list.Add("SoCau", ctdtDTO.SoCau);

            int iReturn = obj.ExcSql("Insert_Update_Cau_Truc_De_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCauTrucDeThi_DTO ctdtDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("STT", ctdtDTO.STT);
            
            int iReturn = obj.ExcSql("Delete_Cau_Truc_De_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_Cau_Truc_De_Thi_MLB(string strSTT)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("STT", strSTT);
            int iReturn = obj.ExcSql("Check_Cau_Truc_De_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

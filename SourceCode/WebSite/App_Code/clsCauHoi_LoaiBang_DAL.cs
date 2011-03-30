using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsCauHoi_LoaiBang_DAL
{
    DataObject obj;
    public clsCauHoi_LoaiBang_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getCauHoi_LoaiBang(clsCauHoi_LoaiBang_DTO ch_lbDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("STT", ch_lbDTO.STT);
        _list.Add("MaLoaiBang", ch_lbDTO.MaLoaiBang);
        _list.Add("MaCauHoi", ch_lbDTO.MaCauHoi);
       
       
       
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_CauHoi_LoaiBang", CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsCauHoi_LoaiBang_DTO ch_lbDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();

            _list.Add("old_id", ch_lbDTO.OldID);
            _list.Add("STT", ch_lbDTO.STT);
            _list.Add("MaLoaiBang", ch_lbDTO.MaLoaiBang);
            _list.Add("MaCauHoi", ch_lbDTO.MaCauHoi);

            int iReturn = obj.ExcSql("Insert_Update_CauHoi_LoaiBang", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsCauHoi_LoaiBang_DTO ch_lbDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("STT", ch_lbDTO.STT);

            int iReturn = obj.ExcSql("Delete_CauHoi_LoaiBang", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsChiTietCauHoi_DAL
{
    DataObject obj;
    public clsChiTietCauHoi_DAL()
    {
        obj = new DataObject();
    }
    public DataTable getChiTietCauHoi(string MaCauHoi)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaCauHoi", MaCauHoi);

        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Chi_Tiet_Cau_Hoi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
}

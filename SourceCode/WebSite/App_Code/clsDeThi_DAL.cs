using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsDeThi_DAL
{
    DataObject obj;
    public clsDeThi_DAL()
    {
        obj = new DataObject();
    }
    public DataTable getLoaiCauTheHangBang(string MaLoaiBang)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaLoaiBang", MaLoaiBang);

        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_dethitheoloaibang", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public DataTable getDeThi(string MaLoaiBang)
    {
        DataTable dt_dethi = new DataTable();
        DataTable dt_LoaiCauHoi = new DataTable();
        DataTable dt_DeThiTheoLoai = new DataTable();
        try
        {
            dt_dethi = obj.GetDataTable("select top 0 * from Cau_Hoi", CommandType.Text);

            dt_LoaiCauHoi = getLoaiCauTheHangBang(MaLoaiBang);
            foreach (DataRow dr in dt_LoaiCauHoi.Rows)
            {
                ListDictionary _list = new ListDictionary();
                _list.Add("MaLoaiCauHoi", dr["loaicauhoi"].ToString());
                _list.Add("SoCau", dr["SoCau"].ToString());
                dt_DeThiTheoLoai = obj.GetDataTable("Select_dethiTheoLoaiCauHoi", _list, CommandType.StoredProcedure);
                for (int i = 0; i < dt_DeThiTheoLoai.Rows.Count; i++)
                {
                    DataRow drDeThi = dt_dethi.NewRow();
                    drDeThi["MaCauHoi"] = dt_DeThiTheoLoai.Rows[i]["MaCauHoi"];
                    drDeThi["NoiDung"] = dt_DeThiTheoLoai.Rows[i]["NoiDung"];
                    drDeThi["HinhAnh"] = dt_DeThiTheoLoai.Rows[i]["HinhAnh"];
                    drDeThi["MaloaiCauHoi"] = dt_DeThiTheoLoai.Rows[i]["MaloaiCauHoi"];
                    dt_dethi.Rows.Add(drDeThi);
                }
            }
        }


         
        catch
        {
            dt_dethi = null;
        }
        return dt_dethi;
    }

}

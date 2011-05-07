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
    public DataTable getCaulucchontheoloaicauhoi(string MaCauHoi)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaCauHoi", MaCauHoi);

        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_cauluachontheocauhoi", _list, CommandType.StoredProcedure);
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

    //lay cau lua chon theo cau hoi

    public DataTable getcauluachon_cauhoi(string MaCauHoi)
    {
        DataTable dt_dethi1 = new DataTable();
        DataTable dt_cauhoi_cauluachon = new DataTable();
        try
        {
            dt_dethi1 = obj.GetDataTable("select top 0 * from View_cauhoi_cauluachon", CommandType.Text);
            dt_cauhoi_cauluachon = getcauluachon_cauhoi(MaCauHoi);
            foreach (DataRow dr in dt_cauhoi_cauluachon.Rows)
            {
                ListDictionary _list = new ListDictionary();
                _list.Add("MaCauHoi", dr["MaCauHoi"].ToString());
                _list.Add("NoiDung", dr["NoiDung"].ToString());
                _list.Add("HinhAnh", dr["HinhAnh"].ToString());
                _list.Add("NoiDungCLC", dr["NoiDungCLC"].ToString());
                //_list.Add("NoiDung", dr["NoiDung"].ToString());
                dt_cauhoi_cauluachon = obj.GetDataTable("Select_cauluachontheocauhoi", _list, CommandType.StoredProcedure);
               for (int i = 0; i < dt_cauhoi_cauluachon.Rows.Count; i++)
                {
                    DataRow drDeThi = dt_dethi1.NewRow();
                    drDeThi["MaCauHoi"] = dt_cauhoi_cauluachon.Rows[i]["MaCauHoi"];
                    drDeThi["NoiDung"] = dt_cauhoi_cauluachon.Rows[i]["NoiDung"];
                    drDeThi["HinhAnh"] = dt_cauhoi_cauluachon.Rows[i]["HinhAnh"];
                    drDeThi["NoiDungCLC"] = dt_cauhoi_cauluachon.Rows[i]["NoiDungCLC"];
                    dt_dethi1.Rows.Add(drDeThi);
                }
            }
        }
        catch
        {
            dt_cauhoi_cauluachon = null;
        }
        return dt_cauhoi_cauluachon;
    }
    
    

}

﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;

public class clsDiaDiemThi_DAL
{
    DataObject obj;
	public clsDiaDiemThi_DAL()
	{
        obj = new DataObject();
	}
    public DataTable getDiaDiemThi(clsDiaDiemThi_DTO diemthiDTO)
    {
        ListDictionary _list = new ListDictionary();
        _list.Add("MaDiemThi", diemthiDTO.MaDiemThi);
        _list.Add("DiaChi", diemthiDTO.DiaChi);
        _list.Add("SoDienThoai", diemthiDTO.SoDienThoai);
        _list.Add("NgayThanhLap", diemthiDTO.NgayThanhLap);
        DataTable dt = new DataTable();
        try
        {
            dt = obj.GetDataTable("Select_Dia_Diem_Thi", _list, CommandType.StoredProcedure);
        }
        catch
        {
            dt = null;
        }
        return dt;
    }
    public int InsertUpdate(clsDiaDiemThi_DTO diemthiDTO)
    {
        
        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("old_id", diemthiDTO.OldID);
            _list.Add("MaDiemThi", diemthiDTO.MaDiemThi);
            _list.Add("DiaChi", diemthiDTO.DiaChi);
            _list.Add("SoDienThoai", diemthiDTO.SoDienThoai);
            _list.Add("NgayThanhLap", diemthiDTO.NgayThanhLap);
            int iReturn = obj.ExcSql("Insert_Update_Dia_Diem_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }        
        catch (Exception)
        {
            //return ex.Message;
            return -1111; // Đặt số này làm ngoại lệ ko lường trước được. ở StoredProcedure không được return có số này tránh trường hợp trùng
        }
    }
    public int Delete(clsDiaDiemThi_DTO diemthiDTO)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaDiemThi", diemthiDTO.MaDiemThi);
            int iReturn = obj.ExcSql("Delete_Dia_Diem_Thi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            //return ex.Message;
            return -1111;
        }
    }
    public int Check_MaDiemThi(string strMaDiemThi)
    {

        try
        {
            ListDictionary _list = new ListDictionary();
            _list.Add("MaDiemThi", strMaDiemThi);
            int iReturn = obj.ExcSql("Check_MaDiemThi", _list, CommandType.StoredProcedure);
            return iReturn;
        }
        catch (Exception)
        {
            return -1111;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsNguoiDung_DTO
{
    private string _oldID, _TenDangNhap, _MaDiemThi, _MatKhau, _Ho, _Ten,_CMND,_NgaySinh,_DiaChi,_DienThoai,_Email,_NgayDK, _TrangThai, _MaNhom;
    public clsNguoiDung_DTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string OldID
    {
        get { return this._oldID; }
        set { this._oldID = value; }
    }
    public string TenDangNhap
    {
        get { return this._TenDangNhap; }
        set { this._TenDangNhap = value; }
    }
    public string MaDiemThi
    {
        get { return this._MaDiemThi; }
        set { this._MaDiemThi = value; }
    }
    public string MatKhau
    {
        get { return this._MatKhau; }
        set { this._MatKhau = value; }
    }
    public string Ho
    {
        get { return this._Ho; }
        set { this._Ho = value; }
    }
    public string Ten
    {
        get { return this._Ten; }
        set { this._Ten = value; }
    }
    public string CMND
    {
        get { return this._CMND; }
        set { this._CMND = value; }
    }
    public string NgaySinh
    {
        get { return this._NgaySinh; }
        set { this._NgaySinh = value; }
    }
    public string DiaChi
    {
        get { return this._DiaChi; }
        set { this._DiaChi = value; }
    }
    public string DienThoai
    {
        get { return this._DienThoai; }
        set { this._DienThoai = value; }
    }
    public string Email
    {
        get { return this._Email; }
        set { this._Email = value; }
    }
    public string NgayDK
    {
        get { return this._NgayDK; }
        set { this._NgayDK = value; }
    }
    public string TrangThai
    {
        get { return this._TrangThai; }
        set { this._TrangThai = value; }
    }
    public string MaNhom
    {
        get { return this._MaNhom; }
        set { this._MaNhom = value; }
    }
}

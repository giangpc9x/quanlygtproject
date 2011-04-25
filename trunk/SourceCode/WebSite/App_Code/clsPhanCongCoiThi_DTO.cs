using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsPhanCongCoiThi_DTO
/// </summary>
public class clsPhanCongCoiThi_DTO
{
    private string _oldID, _STT, _TenDangNhap, _MaCaThi, _MaPhong;
    public clsPhanCongCoiThi_DTO()
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
    public string STT
    {
        get { return this._STT; }
        set { this._STT = value; }
    }
    public string TenDangNhap
    {
        get { return this._TenDangNhap; }
        set { this._TenDangNhap = value; }
    }
    public string MaCaThi
    {
        get { return this._MaCaThi; }
        set { this._MaCaThi = value; }
    }
    public string MaPhong
    {
        get { return this._MaPhong; }
        set { this._MaPhong = value; }
    }
}

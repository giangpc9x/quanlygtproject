using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsPhongThi_DTO
{
    private string _oldID, _MaPhong, _MoTa, _SoThSinhToiDa, _TrangThai , _MaDiemThi;
    public clsPhongThi_DTO()
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
    public string MaPhong
    {
        get { return this._MaPhong; }
        set { this._MaPhong = value; }
    }
    public string MoTa
    {
        get { return this._MoTa; }
        set { this._MoTa = value; }
    }
    public string SoThSinhToiDa
    {
        get { return this._SoThSinhToiDa; }
        set { this._SoThSinhToiDa = value; }
    }
    public string TrangThai
    {
        get { return this._TrangThai; }
        set { this._TrangThai = value; }
    }
    public string MaDiemThi
    {
        get { return this._MaDiemThi; }
        set { this._MaDiemThi = value; }
    }
}

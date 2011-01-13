using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsDiaDiemThi_DTO
{
    private string _oldID, _MaDiemThi, _DiaChi, _SoDienThoai, _NgayThanhLap;
    public clsDiaDiemThi_DTO()
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
    public string MaDiemThi
    {
        get { return this._MaDiemThi; }
        set { this._MaDiemThi = value; }
    }
    public string DiaChi
    {
        get { return this._DiaChi; }
        set { this._DiaChi = value; }
    }
    public string SoDienThoai
    {
        get { return this._SoDienThoai; }
        set { this._SoDienThoai = value; }
    }
    public string NgayThanhLap
    {
        get { return this._NgayThanhLap; }
        set { this._NgayThanhLap = value; }
    }
}

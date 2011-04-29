using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCauHoi_CauLuaChon_DTO
{
    private string _oldID_MaCauHoi, _oldID_MaCauLuaChon, _MaCauHoi, _MaCauLuaChon, _DapAn;
    public clsCauHoi_CauLuaChon_DTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string OldID_MaCauHoi
    {
        get { return this._oldID_MaCauHoi; }
        set { this._oldID_MaCauHoi = value; }
    }
    public string OldID_MaCauLuaChon
    {
        get { return this._oldID_MaCauLuaChon; }
        set { this._oldID_MaCauLuaChon = value; }
    }

    public string MaCauHoi
    {
        get { return this._MaCauHoi; }
        set { this._MaCauHoi = value; }
    }
    public string MaCauLuaChon
    {
        get { return this._MaCauLuaChon; }
        set { this._MaCauLuaChon = value; }
    }
    public string DapAn
    {
        get { return this._DapAn; }
        set { this._DapAn = value; }
    }
   
}

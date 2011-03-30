using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCauHoi_CauLuaChon_DTO
{
    private string _oldID, _MaCauHoi, _MaCauLuaChon, _DapAn;
    public clsCauHoi_CauLuaChon_DTO()
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

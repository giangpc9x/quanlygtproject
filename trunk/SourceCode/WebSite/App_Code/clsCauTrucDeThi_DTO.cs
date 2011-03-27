using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCauTrucDeThi_DTO
{
    private string _oldID, _STT, _MaLoaiBang, _MaloaiCauHoi, _SoCau;
    public clsCauTrucDeThi_DTO()
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
    public string MaLoaiBang
    {
        get { return this._MaLoaiBang; }
        set { this._MaLoaiBang = value; }
    }
    public string MaloaiCauHoi
    {
        get { return this._MaloaiCauHoi; }
        set { this._MaloaiCauHoi = value; }
    }
    public string SoCau
    {
        get { return this._SoCau; }
        set { this._SoCau = value; }
    }
}

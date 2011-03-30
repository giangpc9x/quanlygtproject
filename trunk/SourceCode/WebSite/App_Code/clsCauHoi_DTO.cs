using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCauHoi_DTO
{
    private string _oldID, _MaCauHoi, _NoiDung, _HinhAnh, _MaloaiCauHoi;
    public clsCauHoi_DTO()
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
    public string NoiDung
    {
        get { return this._NoiDung; }
        set { this._NoiDung = value; }
    }
    public string HinhAnh
    {
        get { return this._HinhAnh; }
        set { this._HinhAnh = value; }
    }
    public string MaloaiCauHoi
    {
        get { return this._MaloaiCauHoi; }
        set { this._MaloaiCauHoi = value; }
    }
}

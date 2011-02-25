using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsQuyen_DTO
{
    private string _oldID, _MaQuyen, _MoTa;
    public clsQuyen_DTO()
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
    public string MaQuyen
    {
        get { return this._MaQuyen; }
        set { this._MaQuyen = value; }
    }
    public string MoTa
    {
        get { return this._MoTa; }
        set { this._MoTa = value; }
    }
}

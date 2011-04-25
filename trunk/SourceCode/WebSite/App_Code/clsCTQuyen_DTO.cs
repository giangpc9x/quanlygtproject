using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCTQuyen_DTO
{
    private string _oldID_MaQuyen,_oldID_MaNhom, _MaQuyen, _MaNhom;
    public clsCTQuyen_DTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string OldID_MaQuyen
    {
        get { return this._oldID_MaQuyen; }
        set { this._oldID_MaQuyen = value; }
    }
    public string OldID_MaNhom
    {
        get { return this._oldID_MaNhom; }
        set { this._oldID_MaNhom = value; }
    }
    public string MaQuyen
    {
        get { return this._MaQuyen; }
        set { this._MaQuyen = value; }
    }
    public string MaNhom
    {
        get { return this._MaNhom; }
        set { this._MaNhom = value; }
    }
}

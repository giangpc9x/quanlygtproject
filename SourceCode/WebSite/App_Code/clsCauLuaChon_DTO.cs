using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCauLuaChon_DTO
{
    private string _oldID, _MaCauLuaChon, _NoiDungCLC;
    public clsCauLuaChon_DTO()
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

    public string MaCauLuaChon
    {
        get { return this._MaCauLuaChon; }
        set { this._MaCauLuaChon = value; }
    }
    public string NoiDungCLC
    {
        get { return this._NoiDungCLC; }
        set { this._NoiDungCLC = value; }
    }
}

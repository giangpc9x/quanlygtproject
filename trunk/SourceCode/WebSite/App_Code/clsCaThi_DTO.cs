using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsCaThi_DTO
/// </summary>
public class clsCaThi_DTO
{
    private string _oldID, _MaCaThi, _MoTa, _GioBatDau, _MaDotThi;
    public clsCaThi_DTO()
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
    public string MaCaThi
    {
        get { return this._MaCaThi; }
        set { this._MaCaThi = value; }
    }
    public string MoTa
    {
        get { return this._MoTa; }
        set { this._MoTa = value; }
    }
    public string GioBatDau
    {
        get { return this._GioBatDau; }
        set { this._GioBatDau = value; }
    }
    public string MaDotThi
    {
        get { return this._MaDotThi; }
        set { this._MaDotThi = value; }
    }
}

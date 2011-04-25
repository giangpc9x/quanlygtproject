using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsLoaiBanglai_DTO
/// </summary>
public class clsLoaiBanglai_DTO
{
    private string _oldID, _MaLoaiBang, _TenLoai, _MoTa, _TGThi, _SoCauDat;
    public clsLoaiBanglai_DTO()
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
    public string MaLoaiBang
    {
        get { return this._MaLoaiBang; }
        set { this._MaLoaiBang = value; }
    }
    public string TenLoai
    {
        get { return this._TenLoai; }
        set { this._TenLoai = value; }
    }
    public string MoTa
    {
        get { return this._MoTa; }
        set { this._MoTa = value; }
    }
    public string TGThi
    {
        get { return this._TGThi; }
        set { this._TGThi = value; }
    }
    public string SoCauDat
    {
        get { return this._SoCauDat; }
        set { this._SoCauDat = value; }
    }
}

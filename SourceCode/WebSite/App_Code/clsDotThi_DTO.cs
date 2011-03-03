using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDotThi_DTO
/// </summary>
public class clsDotThi_DTO
{
    private string _oldID, _MaDotThi, _MaLoaiBang, _NgayTao, _MoTa;
    public clsDotThi_DTO()
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
    public string MaDotThi
    {
        get { return this._MaDotThi; }
        set { this._MaDotThi = value; }
    }
    public string MaLoaiBang
    {
        get { return this._MaLoaiBang; }
        set { this._MaLoaiBang = value; }
    }
    public string NgayTao
    {
        get { return this._NgayTao; }
        set { this._NgayTao = value; }
    }
    public string MoTa
    {
        get { return this._MoTa; }
        set { this._MoTa = value; }
    }
}

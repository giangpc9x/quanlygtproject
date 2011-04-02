using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsLoaiCauHoi_DTO
{
    private string _oldID, _MaloaiCauHoi, _TenLoaiCH;
    public clsLoaiCauHoi_DTO()
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
   
    public string MaloaiCauHoi
    {
        get { return this._MaloaiCauHoi; }
        set { this._MaloaiCauHoi = value; }
    }
    public string TenLoaiCH
    {
        get { return this._TenLoaiCH; }
        set { this._TenLoaiCH = value; }
    }
}

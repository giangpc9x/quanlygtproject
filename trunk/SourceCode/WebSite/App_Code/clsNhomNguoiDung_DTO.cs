using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsNhomNguoiDung_DTO
{
    private string _oldID, _MaNhom, _TenNhom;
    public clsNhomNguoiDung_DTO()
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
    public string MaNhom
    {
        get { return this._MaNhom; }
        set { this._MaNhom = value; }
    }
    public string TenNhom
    {
        get { return this._TenNhom; }
        set { this._TenNhom = value; }
    }
}

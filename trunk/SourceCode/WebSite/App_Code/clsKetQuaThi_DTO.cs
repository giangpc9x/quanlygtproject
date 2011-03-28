using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsKetQuaThi_DTO
/// </summary>
public class clsKetQuaThi_DTO
{
    private string _oldID, _SoDeThi, _MaTS, _DiemDanh, _KetQuaThi;
    public clsKetQuaThi_DTO()
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
    public string SoDeThi
    {
        get { return this._SoDeThi; }
        set { this._SoDeThi = value; }
    }
    public string MaTS
    {
        get { return this._MaTS; }
        set { this._MaTS = value; }
    }
    public string DiemDanh
    {
        get { return this._DiemDanh; }
        set { this._DiemDanh = value; }
    }
    public string KetQuaThi
    {
        get { return this._KetQuaThi; }
        set { this._KetQuaThi = value; }
    }
}

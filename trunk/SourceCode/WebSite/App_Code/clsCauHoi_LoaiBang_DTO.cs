using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDiaDiemThi_DTO
/// </summary>
public class clsCauHoi_LoaiBang_DTO
{
    private string _oldID,_STT, _MaLoaiBang, _MaCauHoi;
    public clsCauHoi_LoaiBang_DTO()
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
    public string STT
    {
        get { return this._STT; }
        set { this._STT = value; }
    }


    public string MaLoaiBang
    {
        get { return this._MaLoaiBang; }
        set { this._MaLoaiBang = value; }
    }

    public string MaCauHoi
    {
        get { return this._MaCauHoi; }
        set { this._MaCauHoi = value; }
    }
 
  
}

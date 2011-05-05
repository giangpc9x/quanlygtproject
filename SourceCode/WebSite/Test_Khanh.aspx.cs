using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NTT.Web.Core.XSQL;
using System.Collections.Specialized;
using System.Data;

public partial class Test_Khanh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsDeThi_DAL dethi = new clsDeThi_DAL();
        DataTable dt = new DataTable();
        dt = dethi.getDeThi("A2");
        gvtest.DataSource = dt;
        gvtest.DataBind();
    }
   protected void btnInsert_Click(object sender, EventArgs e)
    {
        try
        {
            DataObject obj = new DataObject();
            DataTable dt = new DataTable();
            ListDictionary _parm = new ListDictionary();
            _parm.Add("old_id", ""); // value : để trống cho hành động Insert
            _parm.Add("MaDiemThi", "NTTU");
            _parm.Add("DiaChi", "1298A Nguyễn Tất Thành, P.13, Q4");
            _parm.Add("SoDienThoai", "3232412");
            int iReturn = obj.ExcSql("Insert_Update_Dia_Diem_Thi", _parm, CommandType.StoredProcedure);
            if (iReturn >= 0)
                lblTest.Text = "Insert Thành Công";
            else
                lblTest.Text = "Insert Thất Bại - Mã lỗi trả về là : " + iReturn.ToString();

        }
        catch (Exception ex)
        {
            lblTest.Text = ex.ToString();
        }
    }
}

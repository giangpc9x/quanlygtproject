using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class test_lien : System.Web.UI.Page
{
    clsDiaDiemThi_DAL diemthiDAL;
    clsDiaDiemThi_DTO diemthiDTO;
    protected void Page_Load(object sender, EventArgs e)
    {
        diemthiDAL = new clsDiaDiemThi_DAL();
        diemthiDTO = new clsDiaDiemThi_DTO();
        DataTable dt = new DataTable();
        dt = diemthiDAL.getDiaDiemThi(diemthiDTO);
        gvDienThi.DataSource = dt;
        gvDienThi.DataBind();
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        btnLuu.Text = "xzz  fzf ";
    }
}

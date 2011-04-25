using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class DeThi_qlcauhoi : NTT.Web.UI.BasePage
{
     #region

    clsCauHoi_DAL choiDAL ;
    clsCauHoi_DTO choiDTO ;

    clsCommon cmn;
    string strMess = string.Empty;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    
    {
        //if (Convert.ToString(Session["TenDangNhap"]) == "")
          //  Response.Redirect("~/dangnhap.aspx");
        choiDAL = new clsCauHoi_DAL();
        choiDTO = new clsCauHoi_DTO();
        cmn = new clsCommon();
        gvCauHoi.DataSource = loadDataToUI();
        gvCauHoi.DataBind();
    }
    private DataTable loadDataToUI()
    {

        DataTable dt = new DataTable();
        dt = choiDAL.getCauHoi(choiDTO);
        return dt;
    }

}

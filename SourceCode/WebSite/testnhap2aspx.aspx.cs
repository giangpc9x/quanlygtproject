using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NTT.Web.Core.XSQL;
using System.Collections.Specialized;
using System.Data;
public partial class testnhap2aspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsDeThi_DAL dethi = new clsDeThi_DAL();
        DataTable dt = new DataTable();
        dt = dethi.getDeThi("A2");
        listDataList1.DataSource = dt;
        listDataList1.DataBind();
    }
}

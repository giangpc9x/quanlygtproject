#region Using
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using NTT.Web.UI;
#endregion

public partial class GridEditing_TwoWayBinding : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback) {
            grid.StartEdit(2);
        }
    }
    protected void AccessDataSource1_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
        DemoSettings.AssertNotReadOnly();
    }
}

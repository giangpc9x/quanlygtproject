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
using NTT.Web.UI;
#endregion

public partial class Filtering_FilterRow : BasePage {
    protected void Page_Load(object sender, EventArgs e) {

    }
	protected void chkFilterRowMenu_CheckedChanged(object sender, EventArgs e) {
		grid.Settings.ShowFilterRowMenu = chkFilterRowMenu.Checked;
	}
}
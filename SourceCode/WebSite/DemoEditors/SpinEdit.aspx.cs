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
using DevExpress.Web.ASPxEditors;
using System.Globalization;
using System.Threading;
using NTT.Web.UI;
#endregion

public partial class Editors_SpinEdit : BasePage {
    private string CultureName {
        get { return Request.Params["cult"] == "it-IT" ? "it-IT" : "en-US"; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        cmbCultureSelector.SelectedIndex = CultureName == "it-IT" ? 1 : 0;
    }
    protected override void InitializeCulture() {
        CultureInfo culture = new CultureInfo(CultureName);
        Thread.CurrentThread.CurrentCulture = culture;
        Thread.CurrentThread.CurrentUICulture = culture;
    }
}

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

public partial class PopupControl_Templates : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        CSSLink = "~/DemoPopup/CSS/Templates.css"; // Register css file
        Page.Header.Controls.Add(new LiteralControl("<link id=\"lColorCSS\" rel=\"stylesheet\" type=\"text/css\" href=\"" + Page.ResolveUrl("~/DemoPopup/CSS/Colors/GrayColor.css") + "\" />"));
    }
}

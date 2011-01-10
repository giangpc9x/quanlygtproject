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

public partial class PopupControl_ClientSide : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        CSSLink = "~/DemoPopup/CSS/ClientSide.css"; // Register css file
    }
}

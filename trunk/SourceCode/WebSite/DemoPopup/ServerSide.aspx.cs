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
using DevExpress.Web.ASPxPopupControl;
using NTT.Web.UI;
#endregion

public partial class PopupControl_ServerSide : BasePage {
    private int StartLeft {
        set { ViewState["StartLeft"] = value; }
        get { return ViewState["StartLeft"] != null ? (int)ViewState["StartLeft"] : 316; }
    }
    private int StartTop {
        set { ViewState["StartTop"] = value; }
        get { return ViewState["StartTop"] != null ? (int)ViewState["StartTop"] : 233; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ClientScript.RegisterClientScriptBlock(GetType(), "PageScript",
            string.Format("var hlShowAllNotesID = \"{0}\"; var blClearAllNotesID = \"{1}\"; var tbWindowContentID = \"{2}\";",
            hlShowAllNotes.ClientID,
            lbClearAllNotes.ClientID, ASPxWindowContent.ClientID), true);
    }
    protected void Button1_Click(object sender, EventArgs e) {
        PopupWindow pcWindow = new PopupWindow(ASPxWindowContent.Text);
        pcWindow.FooterText = DateTime.Now.ToString("MM/dd/yyyy HH:mm");
        pcWindow.ShowOnPageLoad = true;
        pcWindow.Left = StartLeft;
        pcWindow.Top = StartTop;
        StartLeft += 20;
        StartTop += 20;
        ASPxPopupControl1.Windows.Add(pcWindow);
        ASPxWindowContent.Text = "[Enter some text here and then press the Create Note button]";
        ASPxWindowContent.Attributes["class"] = "InactiveColor";
    }
    protected void hlClearAllNotes_Click(object sender, EventArgs e) {
        ASPxPopupControl1.Windows.Clear();
        StartLeft = 316;
        StartTop = 233;
    }
}

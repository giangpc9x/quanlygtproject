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
using DevExpress.Web.ASPxTabControl;
using NTT.Web.UI;
#endregion

public partial class GridEditing_EditFormTemplate : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback) {
            grid.StartEdit(2);
        }
    }
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        e.NewValues["Notes"] = GetMemoText();
    }
    protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e) {
        e.NewValues["Notes"] = GetMemoText();
    }
    protected string GetMemoText() {
        ASPxPageControl pageControl = grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;
        ASPxMemo memo = pageControl.FindControl("notesEditor") as ASPxMemo;
        return memo.Text;
    }
    protected void AccessDataSource1_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
        DemoSettings.AssertNotReadOnly();
    }
}

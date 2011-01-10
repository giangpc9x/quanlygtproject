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
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;
#endregion

public partial class GridEditing_EditForm : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback) {
            grid.StartEdit(2);
        }
    }
    protected void cbMemoLocation_CheckedChanged(object sender, EventArgs e) {
        GridViewDataColumn column = grid.Columns["Notes"] as GridViewDataColumn;
        if(column == null) return;
        if(cbMemoLocation.Checked) {
            column.EditFormSettings.VisibleIndex = 100;
            column.EditFormSettings.ColumnSpan = 3;
            column.EditFormSettings.RowSpan = 1;
        } else {
            column.EditFormSettings.VisibleIndex = 2;
            column.EditFormSettings.RowSpan = 4;
            column.EditFormSettings.ColumnSpan = 1;
        }
    }
    protected void cbNewRowLocation_CheckedChanged(object sender, EventArgs e) {
        grid.SettingsEditing.NewItemRowPosition = cbNewRowLocation.Checked ? GridViewNewItemRowPosition.Bottom : GridViewNewItemRowPosition.Top;
    }
    protected void AccessDataSource1_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
        DemoSettings.AssertNotReadOnly();
    }
}

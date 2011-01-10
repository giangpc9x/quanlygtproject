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

public partial class GridEditing_SimpleEditing : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback) {
            string[] names = Enum.GetNames(typeof(GridViewEditingMode));
            foreach(string name in names) {
                ddlEditMode.Items.Add(new ListItem(name));
            }
            ddlEditMode.SelectedValue = grid.SettingsEditing.Mode.ToString();
            grid.StartEdit(1);
        } 
    }
    protected void ddlEditMode_SelectedIndexChanged(object sender, EventArgs e) {
        GridViewEditingMode mode = (GridViewEditingMode)Enum.Parse(typeof(GridViewEditingMode), 
                ddlEditMode.SelectedValue);
        grid.SettingsEditing.Mode = mode;
    }
    protected void grid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
        int index = -1;
        if(int.TryParse(e.Parameters, out index))
            grid.SettingsEditing.Mode = (GridViewEditingMode)index;
    }
    protected void AccessDataSource1_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
        DemoSettings.AssertNotReadOnly();
    }
}

#region Using
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxClasses;
using NTT.Web.UI;
#endregion

public partial class GridEditing_FillComboOnFly : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback) {
            grid.StartEdit(3);
        }
    }

    protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
        if(!grid.IsEditing || e.Column.FieldName != "City") return;
        if(e.KeyValue == DBNull.Value || e.KeyValue == null) return;
        object val = grid.GetRowValuesByKeyValue(e.KeyValue, "Country");
        if(val == DBNull.Value) return;
        string country = (string)val;

        ASPxComboBox combo = e.Editor as ASPxComboBox;
        FillCityCombo(combo, country);

        combo.Callback += new CallbackEventHandlerBase(cmbCity_OnCallback);
    }

    protected void FillCityCombo(ASPxComboBox cmb, string country) {
        if (string.IsNullOrEmpty(country)) return;

        List<string> cities = GetCities(country);
        cmb.Items.Clear();
        foreach (string city in cities)
            cmb.Items.Add(city);
    }
    List<string> GetCities(string country) {
        List<string> list = new List<string>();
        AccessDataSourceCities.SelectParameters[0].DefaultValue = country;
        DataView view = (DataView)AccessDataSourceCities.Select(DataSourceSelectArguments.Empty);
        for(int i = 0; i < view.Count; i++) {
            list.Add((string)view[i][0]);
        }
        return list;
    }
    protected void AccessDataSource1_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
        DemoSettings.AssertNotReadOnly();
    }

    private void cmbCity_OnCallback(object source, CallbackEventArgsBase e) {
        FillCityCombo(source as ASPxComboBox, e.Parameter);
    }
}

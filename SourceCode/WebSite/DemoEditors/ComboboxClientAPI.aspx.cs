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
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxClasses;
using NTT.Web.UI;

public partial class Editors_ComboboxClientAPI : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsCallback) {
            CmbCountry.Value = "Mexico";
            FillCityCombo("Mexico");
            CmbCity.SelectedIndex = 0;
        }
    }
    protected void CmbCity_Callback(object source, CallbackEventArgsBase e) {
        FillCityCombo(e.Parameter);
    }
    // internal
    protected void FillCityCombo(string country) {
        if (string.IsNullOrEmpty(country)) return;
        AccessDataSourceCities.SelectParameters[0].DefaultValue = country;
        CmbCity.DataBind();
    }
}

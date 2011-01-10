#region Using
using System;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxClasses;
using NTT.Web.UI;
#endregion

public partial class Editors_EnableOnClient : BasePage
{
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsCallback) {
            cbProduct.SelectedIndex = 0;
            cbProduct.ClientEnabled = false;
            cbVersion.SelectedIndex = 0;
            cbVersion.ClientEnabled = false;
        }
    }
    protected void SetNullItem(object control) {
        ASPxComboBox cb = (ASPxComboBox)control;
        if(cb != null) {
            ListEditItem item = new ListEditItem("(none)", "");
            cb.Items.Insert(0, item);
            cb.SelectedItem = item;
        }
    }
    protected void cbTechnology_DataBound(object sender, EventArgs e) {
        SetNullItem(sender);
    }
    protected void cbProduct_DataBound(object sender, EventArgs e) {
        SetNullItem(sender);
    }
    protected void cbProduct_Callback(object source, CallbackEventArgsBase e) {
        xmlProduct.XPath = string.Format("//Technology[@Name='{0}']/Product", e.Parameter);
        DataBind();
    }
}

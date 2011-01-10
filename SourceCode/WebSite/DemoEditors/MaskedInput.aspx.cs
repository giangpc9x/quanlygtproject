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
public partial class Editors_MaskedInput : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        txtZip.MaskSettings.PromptChar = cmbPromtChar.SelectedItem.Value.ToString()[0];
        dateEdit.EditFormatString = cmbDateType.SelectedItem.Value.ToString();
        dateEdit.Value = DateTime.Now;
    }
}

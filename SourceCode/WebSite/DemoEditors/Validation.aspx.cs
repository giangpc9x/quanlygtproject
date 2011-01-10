using System;
using System.Data;
using System.Text;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxClasses.Internal;
using DevExpress.Web.ASPxEditors;
using NTT.Web.UI;

public partial class Editors_Validation : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        ApplySettings();
    }

    #region Settings

    private ErrorDisplayMode ErrorDisplayMode {
        get { return (ErrorDisplayMode)Enum.Parse(typeof(ErrorDisplayMode), rblErrorDisplayMode.Value.ToString()); }
    }
    private Display Display {
        get { return (Display)Enum.Parse(typeof(Display), rblDisplay.Value.ToString()); }
    }
    private bool ValidateOnLeave {
        get { return chbValidateOnLeave.Checked; }
    }
    private bool SetFocusOnError {
        get { return chbSetFocusOnError.Checked; }
    }

    protected void OnSettingsChanged(object sender, EventArgs e) {
        ApplySettings();
    }
    private void ApplySettings() {
        ApplySettingsInContainer(rpnlValidationGroupBox);
    }
    private void ApplySettingsInContainer(Control container) {
        foreach(Control child in container.Controls) {
            ASPxEdit edit = child as ASPxEdit;
            if(edit != null) {
                edit.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode;
                edit.ValidationSettings.Display = Display;
                edit.ValidationSettings.ValidateOnLeave = ValidateOnLeave;
                edit.ValidationSettings.SetFocusOnError = SetFocusOnError;
            } else
                ApplySettingsInContainer(child);
        }
    }

    #endregion

    #region Validation

    protected void NameTextBox_Validation(object sender, DevExpress.Web.ASPxEditors.ValidationEventArgs e) {
        if((e.Value as string).Length < 2)
            e.IsValid = false;
    }
    protected void AgeTextBox_Validation(object sender, DevExpress.Web.ASPxEditors.ValidationEventArgs e) {
        if(CommonUtils.IsNullValue(e.Value) || ((string)e.Value == ""))
            return;
        string strAge = ((string)e.Value).TrimStart('0');
        if(strAge.Length == 0)
            return;
        UInt32 age = 0;
        if(!UInt32.TryParse(strAge, out age) || age < 18)
            e.IsValid = false;
    }
    protected void ArrivalDateEdit_Validation(object sender, DevExpress.Web.ASPxEditors.ValidationEventArgs e) {
        if(!(e.Value is DateTime))
            return;
        DateTime selectedDate = (DateTime)e.Value;
        DateTime currentDate = DateTime.Now;
        if(selectedDate.Year != currentDate.Year || selectedDate.Month != currentDate.Month)
            e.IsValid = false;
    }

    #endregion
}

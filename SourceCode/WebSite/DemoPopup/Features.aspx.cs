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
using DevExpress.Web.ASPxClasses;
using DevExpress.Web.ASPxPopupControl;
using DevExpress.Web.ASPxEditors;
using NTT.Web.UI;
#endregion

public partial class PopupControl_Features : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void cbAllowDragging_CheckedChanged(object sender, EventArgs e) {
        pcMain.AllowDragging = ((ASPxCheckBox)sender).Checked;
    }
    protected void cbEnableAnimation_CheckedChanged(object sender, EventArgs e) {
        pcMain.EnableAnimation = ((ASPxCheckBox)sender).Checked;
    }
    protected void cbShowCloseButton_CheckedChanged(object sender, EventArgs e) {
        pcMain.ShowCloseButton = ((ASPxCheckBox)sender).Checked;
    }
    protected void cbShowFooter_CheckedChanged(object sender, EventArgs e) {
        pcMain.ShowFooter = ((ASPxCheckBox)sender).Checked;
    }
    protected void cbShowHeader_CheckedChanged(object sender, EventArgs e) {
        pcMain.ShowHeader = ((ASPxCheckBox)sender).Checked;
    }
    protected void cbShowShadow_CheckedChanged(object sender, EventArgs e) {
        pcMain.ShowShadow = ((ASPxCheckBox)sender).Checked;
    }
    protected void ddlCloseAction_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.CloseAction = (CloseAction)Enum.Parse(typeof(CloseAction),
            ddlCloseAction.SelectedItem.Value.ToString());
        if (ddlCloseAction.SelectedItem.Value.ToString() == "None")
            hlHide.Visible = true;
        else
            hlHide.Visible = false;
    }
    protected void ddlPopupAction_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.PopupAction = (PopupAction)Enum.Parse(typeof(PopupAction),
            ddlPopupAction.SelectedItem.Value.ToString());
        if (ddlPopupAction.SelectedItem.Value.ToString() == "None") {
            hlShow.Visible = true;
            lblCursor.Attributes["class"] = "";
        }
        else {
            hlShow.Visible = false;
            lblCursor.Attributes["class"] = "Cursor";
        }
    }
    protected void ddlPopupHorizontalAlign_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.PopupHorizontalAlign = (PopupHorizontalAlign)Enum.Parse(typeof(PopupHorizontalAlign),
            ddlPopupHorizontalAlign.SelectedItem.Value.ToString());
    }
    protected void ddlPopupVerticalAlign_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.PopupVerticalAlign = (PopupVerticalAlign)Enum.Parse(typeof(PopupVerticalAlign),
            ddlPopupVerticalAlign.SelectedItem.Value.ToString());
    }
    protected void Button1_Click(object sender, EventArgs e) {
        int result = 0;
        if (int.TryParse(tbPopupHorizontalOffset.Text, out result)) {
            pcMain.PopupHorizontalOffset = result;
            lblPopupHorizontalOffsetError.Visible = false;
        }
        else
            lblPopupHorizontalOffsetError.Visible = true;

        if (int.TryParse(tbPopupVerticalOffset.Text, out result)) {
            pcMain.PopupVerticalOffset = result;
            lblPopupVerticalOffsetError.Visible = false;
        }
        else
            lblPopupVerticalOffsetError.Visible = true;

        result = 0;
        if (int.TryParse(tbAppearAfter.Text, out result) && result >= 0) {
            pcMain.AppearAfter = result;
            lblAppearAfterError.Visible = false;
        }
        else
            lblAppearAfterError.Visible = true;

        if (int.TryParse(tbDisappearAfter.Text, out result) && result >= 0) {
            pcMain.DisappearAfter = result;
            lblDisappearAfterError.Visible = false;
        }
        else
            lblDisappearAfterError.Visible = true;

        if (int.TryParse(tbOpacity.Text, out result) && result >= 0 && result <= 100) {
            pcMain.Opacity = result;
            lblOpacityError.Visible = false;
        }
        else
            lblOpacityError.Visible = true;
    }
    protected void ddlDragElement_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.DragElement = (DragElement)Enum.Parse(typeof(DragElement),
            ddlDragElement.SelectedItem.Value.ToString());
    }
    protected void cbAllowResize_CheckedChanged(object sender, EventArgs e) {
        pcMain.AllowResize = ((ASPxCheckBox)sender).Checked;
    }
    protected void ddlResizeMode_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.ResizingMode = (ResizingMode)Enum.Parse(typeof(ResizingMode),
            ddlResizeMode.SelectedItem.Value.ToString());
    }
    protected void ddlShowSizeGrip_SelectedIndexChanged(object sender, EventArgs e) {
        pcMain.ShowSizeGrip = (ShowSizeGrip)Enum.Parse(typeof(ShowSizeGrip),
            ddlShowSizeGrip.SelectedItem.Value.ToString());
    }
}

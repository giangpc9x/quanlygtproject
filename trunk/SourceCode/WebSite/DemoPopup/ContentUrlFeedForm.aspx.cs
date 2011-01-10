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

public partial class PopupControl_ContentUrldata2 : BasePage {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void BtnSend_Click(object sender, EventArgs e) {
        HtmlForm form = Page.FindControl("MailForm") as HtmlForm;
        if (form != null) {
            form.Controls.Clear();

            WebControl textControl = CreateCentredText("Your message has been successfully sent.");
            if(textControl != null)
                form.Controls.Add(textControl);
        }
    }
    protected virtual WebControl CreateCentredText(string TextAlign) {
        Table table = new Table();
        TableRow row = new TableRow();
        TableCell cell = new TableCell();
        Label lbl = new Label();

        lbl.Text = TextAlign;

        table.Rows.Add(row);
        row.Cells.Add(cell);
        cell.Controls.Add(lbl);

        table.Height = Unit.Percentage(100);
        table.Width = Unit.Percentage(100);
        table.BorderWidth = Unit.Pixel(0);

        cell.VerticalAlign = VerticalAlign.Middle;
        cell.HorizontalAlign = HorizontalAlign.Center;

        lbl.Font.Name = "Tahoma";
        lbl.Font.Size = FontUnit.Point(8);

        return table;
    }
}

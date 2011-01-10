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
using System.Xml;
using System.Text;
using System.Globalization;
using NTT.Web.UI;

public partial class Editors_CalendarNotes : BasePage {
    private const string DataFilePath = "~/App_Data/Notes.xml";

    protected void Page_Load(object sender, EventArgs e) {
        // Only october notes in demo
        ASPxCalendar1.VisibleDate = new DateTime(2007, 10, 1);
    }
    protected void OnDayRender(object sender, DevExpress.Web.ASPxEditors.DayRenderEventArgs e) {
        if(e.Day.DateTime.Month == 10) {
            XmlNodeList currentDayNotes = GetNoteNodes(e.Day.DateTime.ToString("M/d/yyyy", CultureInfo.InvariantCulture));
            if(currentDayNotes.Count > 0)
                e.Controls.Add(CreateHyperLink(e.Day.DateTime));
        }
        e.Day.IsWeekend = false;
    }
    protected void OnCallback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        e.Result = GetNote(e.Parameter);
    }

    private Control CreateHyperLink(DateTime date) {
        HyperLink link = new HyperLink();
        link.Text = date.Day.ToString();
        link.NavigateUrl = string.Format("javascript:ShowNotes('{0}');", date.ToString("M/d/yyyy", CultureInfo.InvariantCulture));
        link.Style[HtmlTextWriterStyle.Display] = "block";
        link.Style[HtmlTextWriterStyle.Padding] = "4px";
        return link;
    }
    private string GetNote(string dateString) {
        XmlNodeList nodes = GetNoteNodes(dateString);
        if(nodes.Count == 0)
            return null;
        StringBuilder note = new StringBuilder(string.Format("{0};",
            DateTime.Parse(dateString, CultureInfo.InvariantCulture).ToString("dd MMMM yyyy", CultureInfo.InvariantCulture)));
        for (int i = 0; i < nodes.Count; i++) {
            note.AppendFormat("<p>{0}</p>", nodes[i].Attributes["Text"].Value);
            if(i < nodes.Count - 1)
                note.Append("<hr />");
        }
        return note.ToString();
    }
    private XmlNodeList GetNoteNodes(string dateString) {
        XmlDocument document = new XmlDocument();
        document.Load(MapPath(DataFilePath));
        return document.SelectNodes(string.Format("//Notes/Note[@Date='{0}']", dateString));
    }
}

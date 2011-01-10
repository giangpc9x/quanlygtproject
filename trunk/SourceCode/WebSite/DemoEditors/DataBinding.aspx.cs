using System;
using System.Data;
using System.Text;
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
using NTT.Web.UI;

public partial class Editors_DataBinding : BasePage
{
    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack && !IsCallback)
            ClubMemberCard.ChangeMode(DetailsViewMode.Edit);
        rpReadOnlyError.Visible = false;
    }

    protected void OnClubMemberDataSourceModifying(object sender, SqlDataSourceCommandEventArgs e) {
        if(DemoSettings.IsSiteMode) {
            rpReadOnlyError.Controls.Add(new LiteralControl(DemoSettings.ReadOnlyErrorMessage));
            rpReadOnlyError.Visible = true;
            e.Cancel = true;
        }
    }
    protected void OnDataBound(object sender, EventArgs e) {
        DetailsView detailsView = (DetailsView)sender;
        if(detailsView.Rows.Count == 0)
            detailsView.ChangeMode(DetailsViewMode.Insert);
    }
}

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

public partial class Summary_Total : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void grid_CustomUnboundColumnData(object sender, 
                DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e) {
        if(e.Column.FieldName == "Total") {
            decimal price = (decimal)e.GetListSourceFieldValue("UnitPrice");
            int quantity = Convert.ToInt32(e.GetListSourceFieldValue("Quantity"));
            e.Value = price * quantity;
        }
    }
    protected void grid_HeaderFilterFillItems(object sender, ASPxGridViewHeaderFilterEventArgs e) {
        if(object.Equals(e.Column, grid.Columns["Total"])) {
            PrepareTotalFilterItems(e);
            return;
        }
        if(object.Equals(e.Column, grid.Columns["Quantity"])) {
            PrepareQuantityFilterItems(e);
            return;
        }
    }
    protected virtual void PrepareTotalFilterItems(ASPxGridViewHeaderFilterEventArgs e) {
        e.Values.Clear();
        e.AddShowAll();
        int step = 100;
        for(int i = 0; i < 10; i++) {
            double start = step * i;
            double end = start + step - 0.01;
            e.AddValue(string.Format("from {0:c} to {1:c}", start, end), string.Empty, string.Format("[Total] >= {0} and [Total] <= {1}", start, end));
        }
        e.AddValue(string.Format("> {0:c}", 1000), string.Empty, "[Total] > 1000");
    }
    protected virtual void PrepareQuantityFilterItems(ASPxGridViewHeaderFilterEventArgs e) {
        int max = 0;
        for(int i = 0; i < e.Values.Count; i ++) {
            int value;
            if(!int.TryParse(e.Values[i].Value, out value)) continue;
            if(value > max) max = value;
        }
        e.Values.Clear();
        e.AddShowAll();
        int step = 10;
        for(int i = 0; i < max / step + 1; i++) {
            int start = step * i;
            int end = start + step - 1;
            e.AddValue(string.Format("from {0} to {1}", start, end), string.Empty, string.Format("[Quantity] >= {0} and [Quantity] <= {1}", start, end));
        }
    }
}

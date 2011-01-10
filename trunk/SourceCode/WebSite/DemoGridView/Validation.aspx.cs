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
using DevExpress.Web.ASPxGridView;
using NTT.Web.UI;
#endregion
public partial class GridEditing_Validation : BasePage {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void grid_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e) {
        foreach(GridViewColumn column in grid.Columns) {
            GridViewDataColumn dataColumn = column as GridViewDataColumn;
            if(dataColumn == null) continue;
            if(e.NewValues[dataColumn.FieldName] == null) {
                e.Errors[dataColumn] = "Value can't be null.";
            }
        }
        if(e.Errors.Count > 0) e.RowError = "Please, fill all fields.";
        if(e.NewValues["FirstName"] != null && e.NewValues["FirstName"].ToString().Length < 2) {
            AddError(e.Errors, grid.Columns["FirstName"], "First Name must be at least two characters long.");
        }
        if(e.NewValues["LastName"] != null && e.NewValues["LastName"].ToString().Length < 2) {
            AddError(e.Errors, grid.Columns["LastName"], "Last Name must be at least two characters long.");
        }
        if(e.NewValues["Email"] != null && !e.NewValues["Email"].ToString().Contains("@")) {
            AddError(e.Errors, grid.Columns["Email"], "Invalid e-mail.");
        }

        int age = 0;
        int.TryParse(e.NewValues["Age"] == null ? string.Empty : e.NewValues["Age"].ToString(), out age);
        if(age < 18) {
            AddError(e.Errors, grid.Columns["Age"],  "Age must be greater than or equal 18.");
        }
        DateTime arrival = DateTime.MinValue;
        DateTime.TryParse(e.NewValues["ArrivalDate"] == null ? string.Empty : e.NewValues["ArrivalDate"].ToString(), out arrival);
        if(DateTime.Today.Year != arrival.Year || DateTime.Today.Month != arrival.Month) {
            AddError(e.Errors, grid.Columns["ArrivalDate"], "Arrival date is required and must belong to the current month.");
        }

        if(string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "Please, correct all errors.";
    }
    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText) {
        if(errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }
    protected void grid_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e) {
        bool hasError = e.GetValue("FirstName").ToString().Length <= 1;
        hasError = hasError || e.GetValue("LastName").ToString().Length <= 1;
        hasError = hasError || !e.GetValue("Email").ToString().Contains("@");
        hasError = hasError || (int)e.GetValue("Age") < 18;
        DateTime arrival = (DateTime)e.GetValue("ArrivalDate");
        hasError = hasError || DateTime.Today.Year != arrival.Year || DateTime.Today.Month != arrival.Month;
        if(hasError) {
            e.Row.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void grid_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e) {
        if(!grid.IsNewRowEditing) {
            grid.DoRowValidation();
        }
    }
    protected void grid_ParseValue(object sender, DevExpress.Web.Data.ASPxParseValueEventArgs e) {
		if(e.FieldName.Equals("Age")) {
            int age = 0;
			if(e.Value == null || !int.TryParse(e.Value.ToString(), out age))
                throw new Exception("Age must be an ineteger value.");
        }
    }
}

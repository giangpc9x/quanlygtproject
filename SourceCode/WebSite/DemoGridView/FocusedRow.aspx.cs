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
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using NTT.Web.UI;
#endregion

public partial class Rows_FocusedRow : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
        if(!string.IsNullOrEmpty(Request.Params["Photo"])) {
            PostImage(Request.Params["Photo"]);
        }
    }

    void PostImage(string id) {
        byte[] image = FindImage(id);
        WriteBinaryImage(image);
    }
    void WriteBinaryImage(byte[] image) {
        if(image != null) {
            Response.ContentType = "image/jpeg";
            using(MemoryStream ms = new MemoryStream(image)) {
                using(Bitmap bmp = (Bitmap)Bitmap.FromStream(ms)) {
                    bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
                }
            }
        } else {
            Response.ContentType = "image/gif";
        }
        Response.End();
    }
    byte[] FindImage(string id) {
        AccessDataSource ds = new AccessDataSource();
        ds.DataFile = AccessDataSource1.DataFile;
        ds.SelectCommand = "select Photo from [Employees] where employeeid=" + id;
        DataView view = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        if(view.Count > 0) return view[0][0] as byte[];
        return null;
    }

}

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
using NTT.Web.Core.XML;
using NTT.Web.Core.XSQL;
using System.Text;
public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(NTT.Web.Core.Security.Cryto.MD5("dqkhanh"));
    }
   
    protected void btnTest_Click(object sender, EventArgs e)
    {
        if (ConfigXML.AccessAllow(NTT.Web.Core.Security.Cryto.MD5(this.txt_conf.Text)))
        {
            //ConfigXML.BuildConfigFile("tmpdbconfig.xml", this.Txt_Server.Text, this.txt_db.Text, this.txt_uid.Text, this.txt_pwd.Text);

            StringBuilder sb = new StringBuilder();
            sb.Append("Server=").Append(this.Txt_Server.Text).Append(";");
            sb.Append("Database=").Append(this.txt_db.Text).Append(";");
            //sb.Append("Integrated Security=SSPI;");
            sb.Append("uid=").Append(this.txt_uid.Text).Append(";");
            sb.Append("pwd=").Append(this.txt_pwd.Text).Append(";");
            sb.Append("Connect Timeout=30");

            string connection_string = sb.ToString();
            DataObject con = new DataObject(connection_string, false);
            try
            {
                if (con.TestConnection())
                    this.lb_mess.Text = "Kết nối thành công";
                else
                    this.lb_mess.Text = "Không thể kết nối!!!";
            }
            catch (Exception E)
            {
                this.lb_mess.Text = E.Message;
            }
        }
        else
        {
            this.lb_mess.Text = "Mật khẩu cấu hình không đúng";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ConfigXML.AccessAllow(NTT.Web.Core.Security.Cryto.MD5(this.txt_conf.Text)))
        {
            ConfigXML.BuildXMLFile("config.xml", this.Txt_Server.Text, this.txt_db.Text, this.txt_uid.Text, this.txt_pwd.Text);
            this.lb_mess.Text = "Đã lưu cấu hình";
        }
        else
        {
            this.lb_mess.Text = "Mật khẩu cấu hình không đúng";
        }
    }
}

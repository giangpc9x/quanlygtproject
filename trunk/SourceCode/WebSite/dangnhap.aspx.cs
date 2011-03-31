using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Collections.Specialized;
using NTT.Web.Core.XSQL;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class dangnhap : NTT.Web.UI.BasePage//System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["TenDangNhap"]) == "")
            Response.Redirect("~/dangnhap.aspx");

        else
            Response.Write("Xin chào " + Convert.ToString(Session["TenDangNhap"]));
    }


    protected void ASPxButtonlogin_Click(object sender, EventArgs e)
    {
        string connectionString = "Data Source=192.168.1.2;Initial Catalog=dbGT;Integrated Security=True;";
         SqlConnection ketnoi = new SqlConnection(connectionString);
         ketnoi.Open();

         string sql = "select * from Nguoi_Dung where TenDangNhap = @user and MatKhau = @pass";
         SqlCommand commandForCheckUser = new SqlCommand(sql, ketnoi);
         commandForCheckUser.Parameters.AddWithValue("@user", ASPxTextBoxusrename.Text);
         commandForCheckUser.Parameters.AddWithValue("@pass", ASPxTextBoxpass.Text);
        
         commandForCheckUser.CommandType = CommandType.Text;
         string userIdSuccess = Convert.ToString(commandForCheckUser.ExecuteScalar());
         if (userIdSuccess != "")
         {
             Session["TenDangNhap"] = userIdSuccess;
             Response.Redirect("~/Default.aspx");
             
         }
         else
         {
             Response.Write("Sai");
         }

    }
}

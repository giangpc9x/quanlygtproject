using System;
using System.Data;
using System.IO;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

/// <summary>
/// Summary description for C_Common
/// </summary>
public class clsCommon
{
    public clsCommon()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void SET_COMBOBOX(DataTable dt, string fieldValue, string fieldText, DropDownList ctl_Name, string strSelected)
    {
        ListItem Item;
        try
        {
            ctl_Name.Items.Clear();
            Item = new ListItem();
            Item.Value = "";
            Item.Text = "[  Chon!  ]";
            ctl_Name.Items.Add(Item);
            DataRow dr = null;
            ArrayList arrDaCo = new ArrayList();
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dr = dt.Rows[i];
                    if (arrDaCo.Contains(dr[fieldValue].ToString()))
                    {
                    }
                    else
                    {
                        Item = new ListItem();
                        Item.Value = dr[fieldValue].ToString();
                        Item.Text = dr[fieldText].ToString();
                        ctl_Name.Items.Add(Item);
                        arrDaCo.Add(dr[fieldValue].ToString());
                    }

                }
            }
            ctl_Name.SelectedValue = strSelected;
        }
        catch(Exception ex)
        {
            string strMessage = "SET_COMBOBOX() ";
            strMessage += ex.Message;
        }
    }
    public void SET_LISTBOX(DataTable dt, string fieldValue, string fieldText, ListBox ctl_Name, string strSelected)
    {
        ListItem Item;
//        string strPerfix = "";
 //       string strLevel = "";
        try
        {
            ctl_Name.Items.Clear();
            DataRow dr = null;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dr = dt.Rows[i];
                Item = new ListItem();
                Item.Value = dr[fieldValue].ToString();
                Item.Text = dr[fieldText].ToString();
                ctl_Name.Items.Add(Item);
            }
            ctl_Name.SelectedValue = strSelected;
        
        }
        catch (Exception ex)
        {
            string strMessage = "SET_LISTBOX() ";
            strMessage += ex.Message;
        }
    }
    public DataTable CreateTable(string[] nameColumns)
    {
        DataTable table = new DataTable();
        DataColumn column;

        for (int i = 0; i < nameColumns.Length; i++)
        {
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = nameColumns[i];
            table.Columns.Add(column);
        }
        return table;
    }
    public string GET_IMAGE_EXTENSION
    {
        get
        {
            return "jpg~gif~png~bmp";
        }
    }
    public bool CHECK_IN_ARRAY(string[] p_Array, string p_Value)
    {
        bool bResult = false;
        if (p_Array != null)
        {
            for (int i = 0; i < p_Array.Length; i++)
            {
                if (p_Array[i] == p_Value)
                {
                    bResult = true;
                    break;
                }
            }
        }
        return bResult;
    }
    public string GET_RANDOM_STRING_DATE(int p_intLength)
    {
        string strHTML = "";

        try
        {
            string strChar = "abcdefghijklmnopqrstuvxyz0123456789";
            Random rand = new Random();

            //get string mm_dd_yyyy_hh_pp_ss_ , length=20
            strHTML = DateTime.Now.ToShortDateString();
            strHTML = strHTML.Replace("/", "_");
            strHTML += "_" + DateTime.Now.Hour.ToString() + "_" + DateTime.Now.Minute.ToString() + "_" + DateTime.Now.Second.ToString() + "_";

            if (p_intLength < 20)
            {
                p_intLength = 20;
            }

            int Mod = p_intLength - 20;
            int intMax = strChar.Length;
            int intRand = 0;
            string strRand = "";

            if (Mod > 0)
            {
                for (int i = 0; i < Mod; i++)
                {
                    intRand = rand.Next(intMax);
                    strRand += strChar.Substring(intRand, 1);
                }
            }
            strHTML += strRand;
        }
        catch (Exception ex)
        {
            strHTML = ex.Message;
            strHTML = strHTML.Replace(" ", "_");
        }

        return strHTML;
    }
    public string Convert_DMY_To_MDY(string ngay)
    {
        
        //ngay = ngay.Substring(0, 10);
        string ngay1 = "";
        try
        {
            DateTime dt = new DateTime();
            dt = Convert.ToDateTime(ngay);
            //dt = DateTime.ParseExact(ngay, "d/M/yyyy", null);
            ngay1 = dt.ToString("MM/dd/yyyy");
        }
        catch
        {
            ngay1 = "01/01/1990";
        }
        return ngay1;
    }
    public string Convert_Date_MDY(DateTime date)
    {
        string ngay1 = "";
        try
        {
            ngay1 = date.ToString("MM/dd/yyyy");
        }
        catch
        {
            ngay1 = "01/01/1990";
        }
        return ngay1;
    }

    public string Convert_Date_DMY(DateTime date)
    {
        string ngay1 = "";
        try
        {
            ngay1 = date.ToString("dd/MM/yyyy");
        }
        catch
        {
            ngay1 = "01/01/1990";
        }
        return ngay1;
    }

    public string Clock()
    {
        StringBuilder s = new StringBuilder();
        s.Append("<script language='javascript'>");
        s.Append("function clock(m,s)");
        s.Append("{ var minutes = parseInt(m);");
        s.Append("var seconds = parseInt(s);");
        s.Append("if (seconds==0){ if (minutes>0){");
        s.Append("seconds=59; minutes=minutes-1;");
        s.Append(" } else if (minutes==0){");
        s.Append("seconds=0; minutes=-1;");
        s.Append("javascript:__doPostBack('ctl00_ContentPlaceHolder1_btnTinhDiem','');");
        s.Append("} } else seconds=seconds-1;");
        s.Append("if (minutes!=-1)");
        s.Append("{	if (minutes <= 9) minutes = '0' + minutes;");
        s.Append("if (seconds <= 9) seconds = '0' + seconds;");
        s.Append("dispTime = minutes + ':' + seconds;");
        s.Append("}	else dispTime = '00:00'; var clocklocation = document.getElementById('showtime');");
        s.Append("clocklocation.innerHTML = dispTime;");
        s.Append("if (minutes!=-1) setTimeout('clock('+ minutes+','+seconds+')', 1000);");
        s.Append("} new start(); </script>");
        return s.ToString();
    }
}

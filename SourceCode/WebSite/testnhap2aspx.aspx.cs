﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NTT.Web.Core.XSQL;
using System.Collections.Specialized;
using System.Data;
using DevExpress.Web.ASPxEditors;
public partial class testnhap2aspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsDeThi_DAL dethi = new clsDeThi_DAL();
        DataTable dt = new DataTable();
        dt = dethi.getDeThi("A2");
        listDataList1.DataSource = dt;
        listDataList1.DataBind();
        DataTable dt_CauLuaChon = new DataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt_CauLuaChon = dethi.getcauluachon_cauhoi(dt.Rows[i]["MaCauHoi"].ToString());
            Image img = listDataList1.Items[i].FindControl("Image1") as Image;
            if (dt.Rows[i]["HinhAnh"] == DBNull.Value || dt.Rows[i]["HinhAnh"].ToString() == "")
            {
                img.Visible = false;
            }
            else
            {
                img.Visible = true;
                img.ImageUrl = "~/hinh/" + dt.Rows[i]["HinhAnh"].ToString() + "";
            }
            ASPxRadioButtonList radCauLuaChon = listDataList1.Items[i].FindControl("radCauLuaChon") as ASPxRadioButtonList;
            radCauLuaChon.DataSource = dt_CauLuaChon;
            radCauLuaChon.TextField = "NoiDungCLC";
            radCauLuaChon.DataBind();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    public static string kode, Codeostan, un, uo, um, ua = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        kode = "98";// Request.QueryString["code"];
        if (kode != null)
        {
            Session["kode"] = kode;
        }
            SqlDataReader drUser;
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@kode", kode);
            drUser = DB.ExecuteReader("SELECT Name,Markaz,Tag51,Tag52,Tag53  FROM [Shoora].[dbo].[TblUser]  where Code=@kode", param);
            if (drUser.Read())
            {
                
                lblUser.Text = drUser["Name"].ToString();
                Codeostan = drUser["Markaz"].ToString();
                lblCodeOstan.Text = drUser["Markaz"].ToString();
                un = drUser["Name"].ToString();                
                uo= drUser["Tag51"].ToString();                
                um= drUser["Tag52"].ToString();                
                ua= drUser["Tag53"].ToString();
                   
            }
            
            if ((ua != "1") && (um != "1") && (uo != "1"))
            {
                imgBtnInsert.Enabled = false;
                imgBtnReport.Enabled = false;
                imgBtnAdmin.Enabled = false;
                imgBtnCenter.Enabled = false;
            }
            else
            {
                if (uo == "1")
                {
                    imgBtnInsert.Enabled = true;
                    imgBtnReport.Enabled = true;
                    imgBtnAdmin.Enabled = false;
                    imgBtnCenter.Enabled = false;
                }
                if (um == "1")
                {
                    imgBtnInsert.Enabled = true;
                    imgBtnReport.Enabled = true;
                    imgBtnAdmin.Enabled = true;
                    imgBtnCenter.Enabled = false;
                }
                if (ua == "1")
                {
                    imgBtnInsert.Enabled = true;
                    imgBtnReport.Enabled = true;
                    imgBtnAdmin.Enabled = true;
                    imgBtnCenter.Enabled = true;
                }
            }

        
    }

    protected void imgBtnReport_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Reports.aspx?uo="+uo+"&um="+um+"&Kode="+kode+ "&Codeostan="+ Codeostan.Substring(0, 2));
    }

    protected void imgBtnInsert_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("positions.aspx?Codeostan=" + Codeostan.Substring(0, 2) + "&USRName=" +lblUser.Text+ "&kode=" + kode);
    }

    protected void imgBtnCenter_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Center.aspx");
    }

    protected void imgBtnAdmin_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin.aspx?uo=" + uo + "&um=" + um + "&code=" + kode );
    }

    protected void imgBtnExit_Click(object sender, ImageClickEventArgs e)
    {
        
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected void imgBtnHelp_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Help.aspx");
    }
}
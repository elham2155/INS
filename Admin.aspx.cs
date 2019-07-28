using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    public static string kode, uo, um, ua;
    protected void Page_Load(object sender, EventArgs e)
    {
        kode = Request.QueryString["code"];
        uo= Request.QueryString["uo"];
        um= Request.QueryString["um"];
        if (uo == "1")
        {
            imgBtnFactors.Enabled = false;
            imgBtnLog.Enabled = false;
            imgBtnDelete.Enabled = false;
            imgBtnCenter.Enabled = false;
            imgBtnUsers.Enabled = false;
        }
        if(um=="1")
        {
            imgBtnLog.Enabled = false;
            imgBtnDelete.Enabled = false;
            imgBtnUsers.Enabled = false;
        }
    }

    protected void imgBtnFactors_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("EditFactors.aspx");
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void imgBtnForm_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("EditINSFormReport.aspx");
    }

    protected void imgBtnLog_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("SystemLogInfo.aspx");
    }

    protected void imgBtnDelete_Click(object sender, ImageClickEventArgs e)
    {
       // Response.Redirect("DeleteINSForms.aspx"); 
    }

    protected void imgBtnUsers_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Users.aspx?code=" + kode);
    }
}
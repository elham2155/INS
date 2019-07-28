using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    public static string uo, um, kode, Codeostan;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        uo = Request.QueryString["uo"];
        um = Request.QueryString["um"];
        kode= Request.QueryString["kode"];
        Codeostan= Request.QueryString["Codeostan"];
        if (uo=="1")
        {
            imgBtnShoab.Enabled = false;
            imgBtnCenter.Enabled = false;
            imgBtnManager.Enabled = false;
        }
        if (um== "1")
            imgBtnManager.Enabled = false;
    }

    protected void imgBtnForms_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("INSFormReport.aspx?Kode=" + kode + "&Codeostan=" + Codeostan);
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void imgBtnCenter_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void imgBtnShoab_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("IntegrityReport.aspx?code=" + kode + "&Codeostan=" + Codeostan);
    }

    protected void imgBtnDLForm_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("DLINSForm.aspx?Kode="+kode+ "&Codeostan="+ Codeostan);
    }
}
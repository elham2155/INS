using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Help : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReturn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + Session["kode"]);
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code="+ Session["kode"]);
    }
}
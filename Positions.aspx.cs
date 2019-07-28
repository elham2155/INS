using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Positions : System.Web.UI.Page
{
    public static string Codeostan, CodeShahr, ostan, Shahr, Shobeh, kode;

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {
           
            //string Codeostan = "23"; //بر اساس سطح دسترسی این دکد از برنامه به این صفحه ارسال می گردد
            Codeostan = Request.QueryString["Codeostan"];
            kode= Request.QueryString["kode"];
            if (Codeostan=="  ")
            {
                SqlDataReader drOstan;
                drOstan = DB.ExecuteReader("SELECT [Code1],[Sharh] FROM [Shoora].[dbo].[TblTaghsimatKeshvari] where Tag='1'");
                ddlOstan.DataSource = drOstan;
                ddlOstan.DataValueField = "code1";
                ddlOstan.DataTextField = "Sharh";
                ddlOstan.DataBind();
            }
            else
            {
                ddlOstan.Enabled = false;
                btnOstan.Enabled = false;
                string str = "";
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Code1", Codeostan);
                str = DB.ExecuteScalar("select sharh from TblTaghsimatKeshvari where code1=@code1 and tag='1'", param).ToString();
                lblOstan.Text = str;
                //Session["CodeOstan"] = Codeostan;//---------کد استان------
                //------------------------------------------------
                ddlShobeh.Visible = false;
                btnShobeh.Visible = false;
                lbl1.Visible = false;
                lbl2.Visible = false;
                lbl3.Visible = false;
                lbl4.Visible = false;
                lbl5.Visible = false;
                SqlDataReader dr1;
                Dictionary<string, object> param2 = new Dictionary<string, object>();
                param2.Add("@code1", Codeostan);
                dr1 = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param2);
                ddlShahr.DataSource = dr1;
                ddlShahr.DataValueField = "code";
                ddlShahr.DataTextField = "Sharh";
                ddlShahr.DataBind();
                //if (Session["CodeShahr"] != null) ddlShahr.SelectedValue = Session["CodeShahr"].ToString();
            }
            
        }       
    }

    protected void btnShahr_Click(object sender, EventArgs e)
    {
        lblShahr.Text = ddlShahr.SelectedItem.ToString();
        SqlDataReader dr2;
        Dictionary<string, object> param_Positions = new Dictionary<string, object>();
        param_Positions.Add("@code1", Codeostan);
        param_Positions.Add("@code2", ddlShahr.SelectedValue.ToString());
        dr2 = DB.ExecuteReader("select code,sharh,adrress from TblShoab where code1=@code1 and code2=@code2", param_Positions);
        ddlShobeh.DataSource = dr2;
        ddlShobeh.DataValueField = "code";
        ddlShobeh.DataTextField = "sharh";
        ddlShobeh.DataBind();       

        ddlShobeh.Visible = true;
        btnShobeh.Visible = true; 
    }

    protected void btnShobeh_Click(object sender, EventArgs e)
    {
        //Session["Shobeh"] = ddlShobeh.SelectedItem.ToString();
        
        lblShobeh.Text = ddlShobeh.SelectedItem.ToString();
        lblCodeShobeh.Text= ddlShobeh.SelectedValue.ToString();

        SqlDataReader dr3;
        Dictionary<string, object> param = new Dictionary<string, object>();        
        param.Add("@code", lblCodeShobeh.Text);
        dr3 = DB.ExecuteReader("select adrress from TblShoab where code=@code", param);
        dr3.Read();
        lblAddress.Text = dr3["adrress"].ToString();

        lbl1.Visible = true;
        lbl2.Visible = true;
        lbl3.Visible = true;
        lbl4.Visible = true;
        lbl5.Visible = true;

    }

    protected void btnForm_Click(object sender, EventArgs e)
    {
        //Session["codeShobeh"] = ddlShobeh.SelectedValue.ToString();
        string USRName = Request.QueryString["USRName"];
        if ((lblShahr.Text == ddlShahr.SelectedItem.ToString()) && (lblShobeh.Text == ddlShobeh.SelectedItem.ToString()))
        {
            string shahr= ddlShahr.SelectedItem.ToString();             
            string CodeShahr= ddlShahr.SelectedValue.ToString();             
            string Shobeh= ddlShobeh.SelectedItem.ToString();             
            string codeShobeh= ddlShobeh.SelectedValue.ToString();           

            Response.Redirect("INSInsert.aspx?Codeostan="+ Codeostan.Substring(0,2) + "&USRName="+ USRName+ "&ostan="+ lblOstan.Text + "&Shahr="+ shahr + "&CodeShahr="+ CodeShahr.Substring(0, 4) + "&Shobeh="+ Shobeh + "&codeShobeh="+ codeShobeh.Substring(0, 7) + "&kode="+ kode);
        }
        else
            lblMsg.Text = "لطفا نام شهر و یا شعبه نمایش داده شده را با موارد انتخابی در لیست چک کنید و دکمه تایید را کلیک کنید";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void btnOstan_Click(object sender, EventArgs e)
    {
        //Session["Ostan"] = ddlOstan.SelectedItem.ToString();
        Codeostan = ddlOstan.SelectedValue.ToString();
        lblOstan.Text = ddlOstan.SelectedItem.ToString();
        lblShahr.Text = "";
        //lblHouzeh.Text = "";
        lblShobeh.Text = "";
        SqlDataReader drShahr;
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("@code1", Codeostan);
        drShahr = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param);
        ddlShahr.DataSource = drShahr;
        ddlShahr.DataValueField = "code";
        ddlShahr.DataTextField = "Sharh";
        ddlShahr.DataBind();       
    }
}
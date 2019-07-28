using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

public partial class DLINSFormReport : System.Web.UI.Page
{
    public static string Codeostan, kode;
    protected void Page_Load(object sender, EventArgs e)
    {
        Codeostan = Request.QueryString["Codeostan"];
        kode= Request.QueryString["kode"];
        
        if (!IsPostBack)
        {
            btnPrint.Visible = false;
            string str = "";
            //string ostan = "13"; //بر اساس سطح دسترسی این دکد از برنامه به این صفحه ارسال می گردد
            
            
            if (Codeostan == "")
            {
                SqlDataReader drOstan;
                drOstan = DB.ExecuteReader("SELECT [Code1],[Sharh] FROM [Shoora].[dbo].[TblTaghsimatKeshvari] where Tag='1'");
                ddlOstan.DataSource = drOstan;
                ddlOstan.DataValueField = "code1";
                ddlOstan.DataTextField = "Sharh";
                ddlOstan.DataBind();
                lblCodeostan.Text = ddlOstan.SelectedValue.ToString();
            }
            else
            {
                ddlOstan.Enabled = false;
                btnOstan.Enabled = false;
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Code1", Codeostan);
                str = DB.ExecuteScalar("select sharh from TblTaghsimatKeshvari where code1=@code1 and tag='1'", param).ToString();
                lblOstan.Text = str;
                //Session["CodeOstan"] = Codeostan;
                lblCodeostan.Text = Codeostan;
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
                param2.Add("@code1", lblCodeostan.Text);
                dr1 = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param2);
                ddlShahr.DataSource = dr1;
                ddlShahr.DataValueField = "code";
                ddlShahr.DataTextField = "Sharh";
                ddlShahr.DataBind();
                //---------------------------------------------------
                //Session["Shahr"] = ddlShahr.SelectedItem.ToString();
                //Session["CodeShahr"] = ddlShahr.SelectedValue.ToString();
            }           
            
            int day, month, year;
            PersianCalendar pc = new PersianCalendar();
            DateTime dt = DateTime.Today;
            year = pc.GetYear(dt) - 1300;
            month = pc.GetMonth(dt);
            day = pc.GetDayOfMonth(dt);
            string t = "13" + year;
            if (month < 10)
                t = t + "/0" + month;
            else
                t = t + "/" + month;
            if (day < 10)
                t = t + "/0" + day;
            else
                t = t + "/" + day;
            msg.Text = DeduceShamsi(t, "1395/03/31").ToString();

        }
        
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void btnShahr_Click(object sender, EventArgs e)
    {
        lblCodeShahr.Text = ddlShahr.SelectedValue.ToString();
        lblShahr.Text = ddlShahr.SelectedItem.ToString();
        SqlDataReader dr2;
        Dictionary<string, object> param_Positions = new Dictionary<string, object>();
        param_Positions.Add("@code1", lblCodeostan.Text);
        param_Positions.Add("@code2", lblCodeShahr.Text);
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
        lblCodeShobeh.Text = ddlShobeh.SelectedValue.ToString();

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

    protected void btnViewForm_Click(object sender, EventArgs e)
    {
        if ((lblShahr.Text == ddlShahr.SelectedItem.ToString()) && (lblShobeh.Text == ddlShobeh.SelectedItem.ToString()))
        {
            btnPrint.Visible = true;
            //Session["ostan"] = lblOstan.Text;
            //Session["Shahr"] = ddlShahr.SelectedItem.ToString();
            //Session["CodeShahr"] = ddlShahr.SelectedValue.ToString();
            //Session["Shobeh"] = ddlShobeh.SelectedItem.ToString();
            //Session["codeShobeh"] = ddlShobeh.SelectedValue.ToString();
            //---------------نام استان، نام شهر و نام شعبه--------------------
            //Page.SetFocus(txtMojoodi);
            lblOstan0.Text = lblOstan.Text;
            lblShahr0.Text = ddlShahr.SelectedItem.ToString();
            lblShobeh0.Text = ddlShobeh.SelectedItem.ToString();
            string codeshobeh = ddlShobeh.SelectedValue.ToString();
            //-----------------نوع شعبه--------------------
            SqlDataReader drNoeShobeh;
            Dictionary<string, object> paramdrNoeShobeh = new Dictionary<string, object>();
            paramdrNoeShobeh.Add("@codeSHobeh", codeshobeh);
            drNoeShobeh = DB.ExecuteReader("select NoeParvandehErjaei from TblShoab where code=@codeSHobeh", paramdrNoeShobeh);
            if (drNoeShobeh.Read())
            {
                switch (drNoeShobeh["NoeParvandehErjaei"].ToString())
                {
                    case "0":
                        {
                            lblNoeShobeh.Text = "رائی";
                            break;
                        }
                    case "1":
                        {
                            lblNoeShobeh.Text = "صلحی";
                            break;
                        }
                    case "2":
                        {
                            lblNoeShobeh.Text = "صلحی ویژه";
                            break;
                        }
                    default: break;
                }
            }
            //-----------------حوزه قضائی------------------
            SqlDataReader drHouzeh;
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@codeSHobeh", codeshobeh);
            drHouzeh = DB.ExecuteReader("SELECT TblHouzehGhazaei.Sharh as S FROM  TblShoab INNER JOIN  TblHouzehGhazaei ON TblShoab.Houzeh = TblHouzehGhazaei.Code  where TblShoab.Code = @codeSHobeh", param);
            if (drHouzeh.Read())
                lblHozeh.Text = drHouzeh["S"].ToString();
            //-------------------کد مجتمع----------------
            SqlDataReader drMojtama;
            Dictionary<string, object> param2 = new Dictionary<string, object>();
            param2.Add("@codeSHobeh", codeshobeh);
            drMojtama = DB.ExecuteReader("SELECT CodeMojtamaa FROM  TblSodorEblagh  WHERE CodeShobeh =@codeSHobeh", param2);
            if (drMojtama.Read())
                lblMojtama.Text = drMojtama["CodeMojtamaa"].ToString();
            //------------------نام مجتمع-----------------
            SqlDataReader drMojtamaName;
            Dictionary<string, object> param3 = new Dictionary<string, object>();
            param3.Add("@codeMojtama", lblMojtama.Text);
            drMojtamaName = DB.ExecuteReader("SELECT  Sharh FROM TblMojtamaa where Code= @codeMojtama", param3);
            if (drMojtamaName.Read())
                lblMojtamaName.Text = drMojtamaName["Sharh"].ToString();
            //------------------اطلاعات پرسنل--------------
            btnViewForm.Visible = false;
        }
        else

            lblMsg.Text = "لطفا نام شهر و یا شعبه نمایش داده شده را با موارد انتخابی در لیست چک کنید و دکمه تایید را کلیک کنید";

    }
    int DeduceShamsi(String source, String des)
    {
        System.Globalization.PersianCalendar p = new System.Globalization.PersianCalendar();
        DateTime dt1 = p.ToDateTime(
            int.Parse(source.Substring(0, 4)),
            int.Parse(source.Substring(5, 2)),
            int.Parse(source.Substring(8, 2)),
            0, 0, 0, 0);
        DateTime dt2 = p.ToDateTime(
            int.Parse(des.Substring(0, 4)),
            int.Parse(des.Substring(5, 2)),
            int.Parse(des.Substring(8, 2)),
            0, 0, 0, 0);
        return (dt1 - dt2).Days / 30;
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {

        Session["ctrl"] = Panel1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe');</script>");

    }


    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("DLINSForm.aspx?Codeostan="+Codeostan+ "&Kode=" + kode);
        btnViewForm.Visible = true;
    }

    protected void btnOstan_Click(object sender, EventArgs e)
    {
        //Session["Ostan"] = ddlOstan.SelectedItem.ToString();
        //Session["CodeOstan"] = ddlOstan.SelectedValue.ToString();
        lblCodeostan.Text = ddlOstan.SelectedValue.ToString();
        lblOstan.Text = ddlOstan.SelectedItem.ToString();
        lblShahr.Text = "";
        //lblHouzeh.Text = "";
        lblShobeh.Text = "";
        SqlDataReader drShahr;
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("@code1", ddlOstan.SelectedValue.ToString());
        drShahr = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param);
        ddlShahr.DataSource = drShahr;
        ddlShahr.DataValueField = "code";
        ddlShahr.DataTextField = "Sharh";
        ddlShahr.DataBind();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Forms : System.Web.UI.Page
{
    public static string Codeostan, kode;
    protected void Page_Load(object sender, EventArgs e)
    {
        Codeostan = Request.QueryString["Codeostan"];
        kode = Request.QueryString["kode"];
        if (!IsPostBack)
        {
            if (Codeostan == "")
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
                //btnOstan.Enabled = false;
                string str = "";
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Code1", Codeostan);
                str = DB.ExecuteScalar("select sharh from TblTaghsimatKeshvari where code1=@code1 and tag='1'", param).ToString();
                lblOstan.Text = str;
                //---------کد استان------
                //------------------------------------------------
                //ddlShobeh.Visible = false;
                //btnShobeh.Visible = false;                
                SqlDataReader dr1;
                Dictionary<string, object> param2 = new Dictionary<string, object>();
                param2.Add("@code1", Codeostan);
                dr1 = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param2);
                ddlShahr.DataSource = dr1;
                ddlShahr.DataValueField = "code";
                ddlShahr.DataTextField = "Sharh";
                ddlShahr.DataBind();
                //if (Session["CodeShahr"] != null) ddlShahr.SelectedValue = Session["CodeShahr"].ToString();

                SqlDataReader drHouzeh;
                Dictionary<string, object> param3 = new Dictionary<string, object>();
                param3.Add("@ostan", Codeostan);
                drHouzeh = DB.ExecuteReader("SELECT code,Sharh  FROM  TblHouzehGhazaei where SUBSTRING(codeMain,1,2)=@ostan", param3);
                ddlHouzeh.DataSource = drHouzeh;
                ddlHouzeh.DataValueField = "code";
                ddlHouzeh.DataTextField = "Sharh";
                ddlHouzeh.DataBind();
            }

        }

    }   

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void btnOstan_Click(object sender, EventArgs e)
    {
        //string Codeostan = Session["USROstanCode"].ToString();
        if (Codeostan != "")
        {
            lblShahr.Text = "";
            lblHouzeh.Text = "";
            lblShobeh.Text = "";
        }
        else
        {
            //Session["Ostan"] = ddlOstan.SelectedItem.ToString();
            //Session["CodeOstan"] = ddlOstan.SelectedValue.ToString();
            lblOstan.Text = ddlOstan.SelectedItem.ToString();
            lblShahr.Text = "";
            lblHouzeh.Text = "";
            lblShobeh.Text = "";
            SqlDataReader drShahr;
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@code1", Codeostan);
            drShahr = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param);
            ddlShahr.DataSource = drShahr;
            ddlShahr.DataValueField = "code";
            ddlShahr.DataTextField = "Sharh";
            ddlShahr.DataBind();

            SqlDataReader drHouzeh;
            Dictionary<string, object> param3 = new Dictionary<string, object>();
            param3.Add("@ostan", Codeostan);
            drHouzeh = DB.ExecuteReader("SELECT code,Sharh  FROM  TblHouzehGhazaei where SUBSTRING(codeMain,1,2)=@ostan", param3);
            ddlHouzeh.DataSource = drHouzeh;
            ddlHouzeh.DataValueField = "code";
            ddlHouzeh.DataTextField = "Sharh";
            ddlHouzeh.DataBind();
        }
       
    }
    protected void btnShahr_Click(object sender, EventArgs e)
    {
        //Session["Shahr"] = ddlShahr.SelectedItem.ToString();
        //Session["CodeShahr"] = ddlShahr.SelectedValue.ToString();
        lblShahr.Text = ddlShahr.SelectedItem.ToString();
        lblHouzeh.Text = "";
        lblShobeh.Text = "";
        SqlDataReader drShahr;
        Dictionary<string, object> param_Positions = new Dictionary<string, object>();
        param_Positions.Add("@code1", Codeostan);
        param_Positions.Add("@code2", ddlShahr.SelectedValue.ToString());
        drShahr = DB.ExecuteReader("select code,sharh from TblShoab where code1=@code1 and code2=@code2", param_Positions);
        ddlShobeh.DataSource = drShahr;
        ddlShobeh.DataValueField = "code";
        ddlShobeh.DataTextField = "sharh";
        ddlShobeh.DataBind();
        
    }

    protected void btnHouzeh_Click(object sender, EventArgs e)
    {
        //Session["Houzeh"] = ddlHouzeh.SelectedItem.ToString();
        //Session["CodeHouzeh"] = ddlHouzeh.SelectedValue.ToString();
        lblShahr.Text = "";
        lblShobeh.Text = "";
        lblHouzeh.Text = ddlHouzeh.SelectedItem.ToString();
        SqlDataReader drHouzeh;
        Dictionary<string, object> param_Positions = new Dictionary<string, object>();
        param_Positions.Add("@code1", Codeostan);
        param_Positions.Add("@Houzeh", ddlHouzeh.SelectedValue.ToString());
        drHouzeh = DB.ExecuteReader("select code,sharh from TblShoab where code1=@code1 and Houzeh=@Houzeh", param_Positions);
        ddlShobeh.DataSource = drHouzeh;
        ddlShobeh.DataValueField = "code";
        ddlShobeh.DataTextField = "sharh";
        ddlShobeh.DataBind();
    }

    protected void btnShobeh_Click(object sender, EventArgs e)
    {
        lblShobeh.Text=ddlShobeh.SelectedItem.ToString();
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        //---------------------------استان---------------------------
        if((lblOstan.Text!="") && (lblHouzeh.Text=="") && (lblShahr.Text=="") && (lblShobeh.Text==""))
        {
            if((ddlYear1.SelectedValue!="00") && (ddlYear2.SelectedValue!="00"))
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Year1", ddlYear1.Text);
                param.Add("@Year2", ddlYear2.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
            else
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
        }
        //-----------------------------استان + حوزه قضائی--------------
        if ((lblOstan.Text != "") && (lblHouzeh.Text != "") && (lblShahr.Text == "") && (lblShobeh.Text == ""))
        {
            if ((ddlYear1.SelectedValue != "00") && (ddlYear2.SelectedValue != "00"))
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text); 
                param.Add("@Year1", ddlYear1.Text);
                param.Add("@Year2", ddlYear2.Text);
                param.Add("@Houzeh", lblHouzeh.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And Houzeh=@Houzeh", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And Houzeh=@Houzeh", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
            else
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);                
                param.Add("@Houzeh", lblHouzeh.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And Houzeh=@Houzeh", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And Houzeh=@Houzeh", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
        }
        //--------------------------استان + شهر-------------------------
        if ((lblOstan.Text != "") && (lblHouzeh.Text == "") && (lblShahr.Text != "") && (lblShobeh.Text == ""))
        {
            if ((ddlYear1.SelectedValue != "00") && (ddlYear2.SelectedValue != "00"))
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Year1", ddlYear1.Text);
                param.Add("@Year2", ddlYear2.Text);
                param.Add("@Shahr", lblShahr.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And shahr=@Shahr", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And shahr=@Shahr", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
            else
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Shahr", lblShahr.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And shahr=@Shahr", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And shahr=@Shahr", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
        }
        //--------------------------استان + حوزه قضائی + شعبه------------------------
        if ((lblOstan.Text != "") && (lblHouzeh.Text != "") && (lblShahr.Text == "") && (lblShobeh.Text != ""))
        {
            if ((ddlYear1.SelectedValue != "00") && (ddlYear2.SelectedValue != "00"))
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Year1", ddlYear1.Text);
                param.Add("@Year2", ddlYear2.Text);
                param.Add("@Houzeh", lblHouzeh.Text);
                param.Add("@Shobeh", lblShobeh.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And Houzeh=@Houzeh And shobeh=@Shobeh", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And Houzeh=@Houzeh And shobeh=@Shobeh", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
            else
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Houzeh", lblHouzeh.Text);
                param.Add("@Shobeh", lblShobeh.Text);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And Houzeh=@Houzeh And shobeh=@Shobeh", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And Houzeh=@Houzeh And shobeh=@Shobeh", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
        }
        //-------------------------استان + شهر + شعبه---------------------------------
        if ((lblOstan.Text != "") && (lblHouzeh.Text == "") && (lblShahr.Text != "") && (lblShobeh.Text != ""))
        {
            if ((ddlYear1.SelectedValue != "00") && (ddlYear2.SelectedValue != "00"))
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Year1", ddlYear1.Text);
                param.Add("@Year2", ddlYear2.Text);
                param.Add("@Shahr", lblShahr.Text);
                param.Add("@Shobeh", lblShobeh.Text);
                //param.Add("@kode", kode);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And shahr=@Shahr And shobeh=@Shobeh", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And SalINS between @Year1 and @Year2 And shahr=@Shahr And shobeh=@Shobeh", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
            }
            else
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Ostan", lblOstan.Text);
                param.Add("@Shahr", lblShahr.Text);
                param.Add("@Shobeh", lblShobeh.Text);
                //param.Add("@kode", kode);
                GridView2.DataSource = DB.ExecuteReader("SELECT ROW_NUMBER() over (order by CodeB) AS 'ردیف',CodeB AS 'کد بازرسی', CodeShobeh AS 'کد شعبه', (SalINS +'/'+ MahINS+'/' +RoozINS ) AS 'تاریخ بازرسی', ostan AS 'نام استان', shahr AS 'نام شهر', shobeh AS 'نام شعبه', mojtama AS 'نام مجتمع', Houzeh AS 'نام حوزه قضائی',NoeShobeh AS 'نوع شعبه' FROM TblBazrasi where ostan=@Ostan And shahr=@Shahr And shobeh=@Shobeh", param);
                string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM TblBazrasi where ostan=@Ostan And shahr=@Shahr And shobeh=@Shobeh", param).ToString();
                lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;

            }
        }
        GridView2.DataBind();
    }

    protected void btnReturn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }
}
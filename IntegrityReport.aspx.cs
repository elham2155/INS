using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class IntegrityReport : System.Web.UI.Page
{
    public static string Codeostan, kode;
    protected void Page_Load(object sender, EventArgs e)
    {
        Codeostan = Request.QueryString["Codeostan"];
        kode= Request.QueryString["kode"];
        if (!IsPostBack)
        {
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
            }
            else
            {
                ddlOstan.Enabled = false;
                btnOstan.Enabled = false;
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("@Code1", Codeostan);
                str = DB.ExecuteScalar("select sharh from TblTaghsimatKeshvari where code1=@code1 and tag='1'", param).ToString();
                lblOstan.Text = str;
                //Session["ostan"] = ostan.ToString();
                //------------------------------------------------

                SqlDataReader dr1;
                Dictionary<string, object> param2 = new Dictionary<string, object>();
                param2.Add("@code1", Codeostan);
                dr1 = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param2);
                ddlShahr.DataSource = dr1;
                ddlShahr.DataValueField = "code";
                ddlShahr.DataTextField = "Sharh";
                ddlShahr.DataBind();
                //------------------------------------------------
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
        //Session["Shahr"] = ddlShahr.SelectedItem.ToString();
        //Session["CodeShahr"] = ddlShahr.SelectedValue.ToString();
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void btnShahr_Click(object sender, EventArgs e)
    {
        //SqlDataReader drTajmiei;
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("@Shahr", ddlShahr.SelectedItem.ToString());
        lblShahrPrint.Text= ddlShahr.SelectedItem.ToString();
        lblSalPrint.Text = ddlSalINS.SelectedItem.ToString();

        if (ddlSalINS.SelectedValue.ToString() != "00")
        {
            param.Add("@SalINS", ddlSalINS.SelectedItem.ToString());
            GridView1.DataSource = DB.ExecuteReader("SELECT  ROW_NUMBER() over (order by TblBazrasi.CodeB) AS 'ردیف', TblBazrasi.shobeh+'-'+TblBazrasi.NoeShobeh AS 'نام شعبه', Aza.Item AS 'اعضاء حاضر', Eblagh.Item AS 'وضعیت ابلاغ اوراق قضائی', SooratJalaseh.Item AS 'نحوه تنظیم صورتجلسه', Iradat.Item AS 'ایرادات مطروحه',Mashverat.Item AS 'نظریه مشورتی', Madeh.Item AS 'رعایت ماده 107 و 95', Takhliyeh.Item AS 'اجرای دستور تخلیه', Ejraei.Item AS 'صحت عملیات اجرائی', Eslahi.Item AS 'گزارش اصلاحی', Residegi.Item AS 'رسیدگی به پرونده کیفری', TblBazrasi.Parvandeh AS 'ملاحظات' FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.shahr=@Shahr and SalINS=@SalINS ORDER BY TblBazrasi.CodeB ", param);
            string C=DB.ExecuteScalar("SELECT  COUNT(*) FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.shahr=@Shahr and SalINS=@SalINS ", param).ToString();
            lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
        }
        else
        {
            GridView1.DataSource = DB.ExecuteReader("SELECT  ROW_NUMBER() over (order by TblBazrasi.CodeB) AS 'ردیف', TblBazrasi.shobeh+'-'+TblBazrasi.NoeShobeh AS 'نام شعبه', Aza.Item AS 'اعضاء حاضر', Eblagh.Item AS 'وضعیت ابلاغ اوراق قضائی', SooratJalaseh.Item AS 'نحوه تنظیم صورتجلسه', Iradat.Item AS 'ایرادات مطروحه',Mashverat.Item AS 'نظریه مشورتی', Madeh.Item AS 'رعایت ماده 107 و 95', Takhliyeh.Item AS 'اجرای دستور تخلیه', Ejraei.Item AS 'صحت عملیات اجرائی', Eslahi.Item AS 'گزارش اصلاحی', Residegi.Item AS 'رسیدگی به پرونده کیفری', TblBazrasi.Parvandeh AS 'ملاحظات' FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.shahr=@Shahr ORDER BY TblBazrasi.CodeB ", param);
            string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.shahr=@Shahr ", param).ToString();
            lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
        }
        GridView1.DataBind();
        
    }

    protected void btnHouzeh_Click(object sender, EventArgs e)
    {
        lblShahrPrint.Text = ddlHouzeh.SelectedItem.ToString();
        lblSalPrint.Text = ddlSalINS0.SelectedItem.ToString();
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("@Houzeh", ddlHouzeh.SelectedItem.ToString());

        if (ddlSalINS0.SelectedValue.ToString() != "00")
        {
            param.Add("@SalINS0", ddlSalINS0.SelectedItem.ToString());
            GridView1.DataSource = DB.ExecuteReader("SELECT  ROW_NUMBER() over (order by TblBazrasi.CodeB) AS 'ردیف', TblBazrasi.shobeh+'-'+TblBazrasi.NoeShobeh AS 'نام شعبه', Aza.Item AS 'اعضاء حاضر', Eblagh.Item AS 'وضعیت ابلاغ اوراق قضائی', SooratJalaseh.Item AS 'نحوه تنظیم صورتجلسه', Iradat.Item AS 'ایرادات مطروحه',Mashverat.Item AS 'نظریه مشورتی', Madeh.Item AS 'رعایت ماده 107 و 95', Takhliyeh.Item AS 'اجرای دستور تخلیه', Ejraei.Item AS 'صحت عملیات اجرائی', Eslahi.Item AS 'گزارش اصلاحی', Residegi.Item AS 'رسیدگی به پرونده کیفری', TblBazrasi.Parvandeh AS 'ملاحظات' FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.Houzeh=@Houzeh and SalINS=@SalINS0 ORDER BY TblBazrasi.CodeB ", param);
            string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.Houzeh=@Houzeh and SalINS=@SalINS0 ", param).ToString();
            lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
        }
        else
        {
            GridView1.DataSource = DB.ExecuteReader("SELECT  ROW_NUMBER() over (order by TblBazrasi.CodeB) AS 'ردیف', TblBazrasi.shobeh+'-'+TblBazrasi.NoeShobeh AS 'نام شعبه', Aza.Item AS 'اعضاء حاضر', Eblagh.Item AS 'وضعیت ابلاغ اوراق قضائی', SooratJalaseh.Item AS 'نحوه تنظیم صورتجلسه', Iradat.Item AS 'ایرادات مطروحه',Mashverat.Item AS 'نظریه مشورتی', Madeh.Item AS 'رعایت ماده 107 و 95', Takhliyeh.Item AS 'اجرای دستور تخلیه', Ejraei.Item AS 'صحت عملیات اجرائی', Eslahi.Item AS 'گزارش اصلاحی', Residegi.Item AS 'رسیدگی به پرونده کیفری', TblBazrasi.Parvandeh AS 'ملاحظات' FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.Houzeh=@Houzeh ORDER BY TblBazrasi.CodeB ", param);
            string C = DB.ExecuteScalar("SELECT  COUNT(*) FROM  TblBazrasi INNER JOIN TblBazrasi_Items AS Aza ON TblBazrasi.AzaINS = Aza.Value AND TblBazrasi.AzaINS_I = Aza.ID INNER JOIN TblBazrasi_Items AS Eblagh ON TblBazrasi.Eblagh = Eblagh.Value AND TblBazrasi.Eblagh_I = Eblagh.ID INNER JOIN TblBazrasi_Items AS SooratJalaseh ON TblBazrasi.SooratJalaseh = SooratJalaseh.Value AND TblBazrasi.SooratJalaseh_I = SooratJalaseh.ID INNER JOIN TblBazrasi_Items AS Iradat ON TblBazrasi.Iradat = Iradat.Value AND TblBazrasi.Iradat_I = Iradat.ID INNER JOIN  TblBazrasi_Items AS Mashverat ON TblBazrasi.Mashverat = Mashverat.Value AND TblBazrasi.Mashverat_I = Mashverat.ID INNER JOIN  TblBazrasi_Items AS Madeh ON TblBazrasi.Madeh = Madeh.Value AND TblBazrasi.Madeh_I = Madeh.ID INNER JOIN TblBazrasi_Items AS Residegi ON TblBazrasi.Residegi = Residegi.Value AND TblBazrasi.Residegi_I = Residegi.ID INNER JOIN TblBazrasi_Items AS Takhliyeh ON TblBazrasi.Takhliyeh = Takhliyeh.Value AND TblBazrasi.Takhliyeh_I = Takhliyeh.ID INNER JOIN TblBazrasi_Items AS Ejraei ON TblBazrasi.Ejraei = Ejraei.Value AND TblBazrasi.Ejraei_I = Ejraei.ID INNER JOIN TblBazrasi_Items AS Eslahi ON TblBazrasi.Eslahi = Eslahi.Value AND TblBazrasi.Eslahi_I = Eslahi.ID where TblBazrasi.Houzeh=@Houzeh ", param).ToString();
            lblRecordCount.Text = "تعداد رکورد یافت شده : " + C;
        }
        GridView1.DataBind();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = Panel1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe');</script>");

    }


    protected void btnOstan_Click(object sender, EventArgs e)
    {

        //Session["Ostan"] = ddlOstan.SelectedItem.ToString();
        //Session["CodeOstan"] = ddlOstan.SelectedValue.ToString();
        lblCodeostan.Text = ddlOstan.SelectedValue.ToString();
        lblOstan.Text = ddlOstan.SelectedItem.ToString();
        //lblShahr.Text = "";
        //lblHouzeh.Text = "";
        //lblShobeh.Text = "";
        SqlDataReader drShahr;
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("@code1", ddlOstan.SelectedValue.ToString());
        drShahr = DB.ExecuteReader("select code,sharh from TblTaghsimatKeshvari where code1=@code1 and tag='2'", param);
        ddlShahr.DataSource = drShahr;
        ddlShahr.DataValueField = "code";
        ddlShahr.DataTextField = "Sharh";
        ddlShahr.DataBind();

        SqlDataReader drHouzeh;
        Dictionary<string, object> param3 = new Dictionary<string, object>();
        param3.Add("@ostan", ddlOstan.SelectedValue.ToString());
        drHouzeh = DB.ExecuteReader("SELECT code,Sharh  FROM  TblHouzehGhazaei where SUBSTRING(codeMain,1,2)=@ostan", param3);
        ddlHouzeh.DataSource = drHouzeh;
        ddlHouzeh.DataValueField = "code";
        ddlHouzeh.DataTextField = "Sharh";
        ddlHouzeh.DataBind();
    }
}

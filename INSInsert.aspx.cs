using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

public partial class INSInsert : System.Web.UI.Page
{
    //private SqlDataReader drSooratJalaseh;
    public static string codeshobeh, Codeostan, kode;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            msg.Visible = false;
            lblCount.Text = "0";

            lblselected1.Text = "";
            lblselected2.Text = "";
            lblselected3.Text = "";
            lblselected4.Text = "";
            lblselected5.Text = "";
            lblselected6.Text = "";

            Panel1.Visible = false;
            txtBedooneEblagh1.Visible = false;
            txtBedooneEblagh2.Visible = false;
            txtBedooneEblagh3.Visible = false;
            txtBedooneEblagh4.Visible = false;
            txtBedooneEblagh5.Visible = false;
            txtBedooneEblagh6.Visible = false;

            btnBedooneEblagh1.Visible = false;
            btnBedooneEblagh2.Visible = false;
            btnBedooneEblagh3.Visible = false;
            btnBedooneEblagh4.Visible = false;
            btnBedooneEblagh5.Visible = false;
            btnBedooneEblagh6.Visible = false;

            lblBedooneEblagh1.Text = "";
            lblBedooneEblagh2.Text = "";
            lblBedooneEblagh3.Text = "";
            lblBedooneEblagh4.Text = "";
            lblBedooneEblagh5.Text = "";
            lblBedooneEblagh6.Text = "";
            //---------------نام استان، نام شهر و نام شعبه--------------------
            Page.SetFocus(txtMojoodi);
            lblOstan.Text = Request.QueryString["ostan"]; 
            lblShahr.Text = Request.QueryString["shahr"]; 
            lblShobeh.Text = Request.QueryString["Shobeh"];             
            codeshobeh = Request.QueryString["codeShobeh"]; 
            lblCodeShobeh.Text= codeshobeh;
            //-----------------نوع شعبه--------------------
            SqlDataReader drNoeShobeh;
            Dictionary<string, object> paramdrNoeShobeh = new Dictionary<string, object>();
            paramdrNoeShobeh.Add("@codeSHobeh", lblCodeShobeh.Text);
            drNoeShobeh = DB.ExecuteReader("select NoeParvandehErjaei from TblShoab where code=@codeSHobeh", paramdrNoeShobeh);
            if (drNoeShobeh.Read())
            {
                switch (drNoeShobeh["NoeParvandehErjaei"].ToString())
                {
                    case "0":
                        {
                            lblNoeShobeh.Text ="رائی" ;
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
            if(drMojtama.Read())
            lblMojtama.Text = drMojtama["CodeMojtamaa"].ToString();
            //------------------نام مجتمع-----------------
            SqlDataReader drMojtamaName;
            Dictionary<string, object> param3 = new Dictionary<string, object>();
            param3.Add("@codeMojtama", lblMojtama.Text);
            drMojtamaName = DB.ExecuteReader("SELECT  Sharh FROM TblMojtamaa where Code= @codeMojtama", param3);
            if (drMojtamaName.Read())
                lblMojtamaName.Text = drMojtamaName["Sharh"].ToString();
            //-------------------آیتم های لیست باکس ها----------------
            SqlDataReader drAzaINS;
            drAzaINS = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlAzaINS' ORDER BY value");
            ddlAzaINS.DataSource = drAzaINS;
            ddlAzaINS.DataValueField = "Value";
            ddlAzaINS.DataTextField = "Item";
            ddlAzaINS.DataBind();
            //-----------------------------------
            SqlDataReader drSaatHozoor;
            drSaatHozoor = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlSaatHozoor' ORDER BY value");
            ddlSaatHozoor.DataSource = drSaatHozoor;
            ddlSaatHozoor.DataValueField = "Value";
            ddlSaatHozoor.DataTextField = "Item";
            ddlSaatHozoor.DataBind();
            //-----------------------------------
            SqlDataReader drPardakht;
            drPardakht = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlPardakht' ORDER BY value");
            ddlPardakht.DataSource = drPardakht;
            ddlPardakht.DataValueField = "Value";
            ddlPardakht.DataTextField = "Item";
            ddlPardakht.DataBind();
            //-----------------------------------
            SqlDataReader drDastoor;
            drDastoor = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlDastoor' ORDER BY value");
            ddlDastoor.DataSource = drDastoor;
            ddlDastoor.DataValueField = "Value";
            ddlDastoor.DataTextField = "Item";
            ddlDastoor.DataBind();
            //-----------------------------------
            SqlDataReader drSolh;
            drSolh = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlSolh' ORDER BY value");
            ddlSolh.DataSource = drSolh;
            ddlSolh.DataValueField = "Value";
            ddlSolh.DataTextField = "Item";
            ddlSolh.DataBind();
            //-----------------------------------
            SqlDataReader drEstelamat;
            drEstelamat = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlEstelamat' ORDER BY value");
            ddlEstelamat.DataSource = drEstelamat;
            ddlEstelamat.DataValueField = "Value";
            ddlEstelamat.DataTextField = "Item";
            ddlEstelamat.DataBind();
            //-----------------------------------
            SqlDataReader drTasmim;
            drTasmim = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlTasmim' ORDER BY value");
            ddlTasmim.DataSource = drTasmim;
            ddlTasmim.DataValueField = "Value";
            ddlTasmim.DataTextField = "Item";
            ddlTasmim.DataBind();
            //-----------------------------------
            SqlDataReader drEblagh;
            drEblagh = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlEblagh' ORDER BY value");
            ddlEblagh.DataSource = drEblagh;
            ddlEblagh.DataValueField = "Value";
            ddlEblagh.DataTextField = "Item";
            ddlEblagh.DataBind();
            //-----------------------------------
            SqlDataReader drSooratJalaseh;
            drSooratJalaseh = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlSooratJalaseh' ORDER BY value");
            ddlSooratJalaseh.DataSource = drSooratJalaseh;
            ddlSooratJalaseh.DataValueField = "Value";
            ddlSooratJalaseh.DataTextField = "Item";
            ddlSooratJalaseh.DataBind();
            //-----------------------------------
            SqlDataReader drIradat;
            drIradat = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlIradat' ORDER BY value");
            ddlIradat.DataSource = drIradat;
            ddlIradat.DataValueField = "Value";
            ddlIradat.DataTextField = "Item";
            ddlIradat.DataBind();
            //-----------------------------------
            SqlDataReader drTari;
            drTari = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlTari' ORDER BY value");
            ddlTari.DataSource = drTari;
            ddlTari.DataValueField = "Value";
            ddlTari.DataTextField = "Item";
            ddlTari.DataBind();
            //-----------------------------------
            SqlDataReader drMashverat;
            drMashverat = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlMashverat' ORDER BY value");
            ddlMashverat.DataSource = drMashverat;
            ddlMashverat.DataValueField = "Value";
            ddlMashverat.DataTextField = "Item";
            ddlMashverat.DataBind();            
            //-----------------------------------
            SqlDataReader drMadeh;
            drMadeh = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlMadeh' ORDER BY value");
            ddlMadeh.DataSource = drMadeh;
            ddlMadeh.DataValueField = "Value";
            ddlMadeh.DataTextField = "Item";
            ddlMadeh.DataBind();
            //-----------------------------------
            SqlDataReader drNazm;
            drNazm = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlNazm' ORDER BY value");
            ddlNazm.DataSource = drNazm;
            ddlNazm.DataValueField = "Value";
            ddlNazm.DataTextField = "Item";
            ddlNazm.DataBind();
            //-----------------------------------
            SqlDataReader drTakhliyeh;
            drTakhliyeh = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlTakhliyeh' ORDER BY value");
            ddlTakhliyeh.DataSource = drTakhliyeh;
            ddlTakhliyeh.DataValueField = "Value";
            ddlTakhliyeh.DataTextField = "Item";
            ddlTakhliyeh.DataBind();
            //-----------------------------------
            SqlDataReader drEjraei;
            drEjraei = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlEjraei' ORDER BY value");
            ddlEjraei.DataSource = drEjraei;
            ddlEjraei.DataValueField = "Value";
            ddlEjraei.DataTextField = "Item";
            ddlEjraei.DataBind();
            //-----------------------------------
            SqlDataReader drPErjaei;
            drPErjaei = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlPErjaei' ORDER BY value");
            ddlPErjaei.DataSource = drPErjaei;
            ddlPErjaei.DataValueField = "Value";
            ddlPErjaei.DataTextField = "Item";
            ddlPErjaei.DataBind();
            //-----------------------------------
            SqlDataReader drEslahi;
            drEslahi = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlEslahi' ORDER BY value");
            ddlEslahi.DataSource = drEslahi;
            ddlEslahi.DataValueField = "Value";
            ddlEslahi.DataTextField = "Item";
            ddlEslahi.DataBind();
            //-----------------------------------
            SqlDataReader drResidegi;
            drResidegi = DB.ExecuteReader("select * from TblBazrasi_Items where ID='ddlResidegi' ORDER BY value");
            ddlResidegi.DataSource = drResidegi;
            ddlResidegi.DataValueField = "Value";
            ddlResidegi.DataTextField = "Item";
            ddlResidegi.DataBind();


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
            msg4.Text = DeduceShamsi(t, "1395/03/31").ToString();
        }
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
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Codeostan = Request.QueryString["Codeostan"];
        kode = Request.QueryString["kode"];
        Response.Redirect("home.aspx?code=" + kode);
    }

    protected void btnHome2_Click(object sender, EventArgs e)
    {
        Codeostan= Request.QueryString["Codeostan"];
        kode= Request.QueryString["kode"];
        Response.Redirect("home.aspx?code=" + kode);
    }

    protected void btnBazras1_Click(object sender, EventArgs e)
    {
        lblBazrasName1.Text = "";
        lblBazrasPost1.Text = "";
        lblBazras1.Text = "";
        SqlDataReader drBazras;
        Dictionary<string, object> paramB = new Dictionary<string, object>();
        paramB.Add("@codeMelli", txtBazras1.Text);
        drBazras = DB.ExecuteReader("(SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli)) union (SELECT TblPersGhozat.CodeMelli as CM, TblPersGhozat.Name as N, TblPersGhozat.Famil as F, TblPersGhozat.PostShoglTxt as S FROM  TblPersGhozat where CodeMelli = @codeMelli)", paramB);
        if(drBazras.Read())
        {
            lblBazrasName1.Text = drBazras["N"].ToString() + " " + drBazras["F"].ToString();
            lblBazrasPost1.Text = drBazras["S"].ToString();
            lblBazras1.Text= drBazras["CM"].ToString();
            msg1.Text = "";
        }
        else
            msg1.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";

    }

    protected void btnBazras2_Click(object sender, EventArgs e)
    {
        lblBazrasName2.Text = "";
        lblBazrasPost2.Text = "";
        lblBazras2.Text = "";
        SqlDataReader drBazras;
        Dictionary<string, object> paramB = new Dictionary<string, object>();
        paramB.Add("@codeMelli", txtBazras2.Text);
        drBazras = DB.ExecuteReader("(SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli)) union (SELECT TblPersGhozat.CodeMelli as CM, TblPersGhozat.Name as N, TblPersGhozat.Famil as F, TblPersGhozat.PostShoglTxt as S FROM  TblPersGhozat where CodeMelli = @codeMelli)", paramB);
        if (drBazras.Read())
        {
            lblBazrasName2.Text = drBazras["N"].ToString() + " " + drBazras["F"].ToString();
            lblBazrasPost2.Text = drBazras["S"].ToString();
            lblBazras2.Text = drBazras["CM"].ToString();
            msg2.Text = "";
        }
        else
            msg2.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnBazras3_Click(object sender, EventArgs e)
    {
        lblBazrasName3.Text = "";
        lblBazrasPost3.Text = "";
        lblBazras3.Text = "";
        SqlDataReader drBazras;
        Dictionary<string, object> paramB = new Dictionary<string, object>();
        paramB.Add("@codeMelli", txtBazras3.Text);
        drBazras = DB.ExecuteReader("(SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli)) union (SELECT TblPersGhozat.CodeMelli as CM, TblPersGhozat.Name as N, TblPersGhozat.Famil as F, TblPersGhozat.PostShoglTxt as S FROM  TblPersGhozat where CodeMelli = @codeMelli)", paramB);
        if (drBazras.Read())
        {
            lblBazrasName3.Text = drBazras["N"].ToString() + " " + drBazras["F"].ToString();
            lblBazrasPost3.Text = drBazras["S"].ToString();
            lblBazras3.Text = drBazras["CM"].ToString();
            msg3.Text = "";
        }
        else
            msg3.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }
    
    protected void btnAcceptPerson_Click(object sender, EventArgs e)
    {
        lbl.Text = "";
        int count=0;
        string codes = "";
        foreach (GridViewRow gvr in GridView1.Rows)
        {
            if (gvr.RowType == DataControlRowType.DataRow)
            {
                CheckBox cb = (CheckBox)(gvr.FindControl("chech1"));
                if (cb.Checked == true)
                {
                    codes = codes + "-" + gvr.Cells[1].Text;
                    count++;
                }
            }
        }
        lblCount.Text = count.ToString();
        
        switch (count)
        {
            case 1:
                {
                    lblselected1.Text = codes.Substring(1, 10);
                    lblselected2.Text = "";
                    lblselected3.Text = "";
                    lblselected4.Text = "";
                    lblselected5.Text = "";
                    lblselected6.Text = "";
                    break;
                }
            case 2:
                {
                    lblselected1.Text = codes.Substring(1, 10);
                    lblselected2.Text = codes.Substring(12, 10);
                    lblselected3.Text = "";
                    lblselected4.Text = "";
                    lblselected5.Text = "";
                    lblselected6.Text = "";
                    break;
                }
            case 3:
                {
                    lblselected1.Text = codes.Substring(1, 10);
                    lblselected2.Text = codes.Substring(12, 10);
                    lblselected3.Text = codes.Substring(23, 10);                    
                    lblselected4.Text = "";
                    lblselected5.Text = "";
                    lblselected6.Text = "";
                    break;
                }
            case 4:
                {
                    lblselected1.Text = codes.Substring(1, 10);
                    lblselected2.Text = codes.Substring(12, 10);
                    lblselected3.Text = codes.Substring(23, 10);
                    lblselected4.Text = codes.Substring(34, 10);
                    lblselected5.Text = "";
                    lblselected6.Text = "";
                    break;
                }
            case 5:
                {
                    lblselected1.Text = codes.Substring(1, 10);
                    lblselected2.Text = codes.Substring(12, 10);
                    lblselected3.Text = codes.Substring(23, 10);
                    lblselected4.Text = codes.Substring(34, 10);
                    lblselected5.Text = codes.Substring(45, 10);
                    lblselected6.Text = "";
                    break;
                }
            case 6:
                {
                    lblselected1.Text = codes.Substring(1, 10);
                    lblselected2.Text = codes.Substring(12, 10);
                    lblselected3.Text = codes.Substring(23, 10);
                    lblselected4.Text = codes.Substring(34, 10);
                    lblselected5.Text = codes.Substring(45, 10);
                    lblselected6.Text = codes.Substring(56, 10);
                    break;
                }
            case 0:
                {
                    lblselected1.Text = "";
                    lblselected2.Text = "";
                    lblselected3.Text = "";
                    lblselected4.Text = "";
                    lblselected5.Text = "";
                    lblselected6.Text = "";
                    break;
                }

            default: break;

        }
    }

    protected void btnBedooneEblagh_Click(object sender, EventArgs e)
    {
        int c = 0;
        c =int.Parse(lblCount.Text);
        switch (c)
        {
            case 0:
                {
                    txtBedooneEblagh1.Visible = true;
                    txtBedooneEblagh2.Visible = true;
                    txtBedooneEblagh3.Visible = true;
                    txtBedooneEblagh4.Visible = true;
                    txtBedooneEblagh5.Visible = true;
                    txtBedooneEblagh6.Visible = true;
                    btnBedooneEblagh1.Visible = true;
                    btnBedooneEblagh2.Visible = true;
                    btnBedooneEblagh3.Visible = true;
                    btnBedooneEblagh4.Visible = true;
                    btnBedooneEblagh5.Visible = true;
                    btnBedooneEblagh6.Visible = true;
                    break;
                }
            case 1:
                {
                    txtBedooneEblagh1.Visible = true;
                    txtBedooneEblagh2.Visible = true;
                    txtBedooneEblagh3.Visible = true;
                    txtBedooneEblagh4.Visible = true;
                    txtBedooneEblagh5.Visible = true;
                    txtBedooneEblagh6.Visible = false;
                    btnBedooneEblagh1.Visible = true;
                    btnBedooneEblagh2.Visible = true;
                    btnBedooneEblagh3.Visible = true;
                    btnBedooneEblagh4.Visible = true;
                    btnBedooneEblagh5.Visible = true;
                    btnBedooneEblagh6.Visible = false;
                    break;
                }
            case 2:
                {
                    txtBedooneEblagh1.Visible = true;
                    txtBedooneEblagh2.Visible = true;
                    txtBedooneEblagh3.Visible = true;
                    txtBedooneEblagh4.Visible = true;
                    txtBedooneEblagh5.Visible = false;
                    txtBedooneEblagh6.Visible = false;
                    btnBedooneEblagh1.Visible = true;
                    btnBedooneEblagh2.Visible = true;
                    btnBedooneEblagh3.Visible = true;
                    btnBedooneEblagh4.Visible = true;
                    btnBedooneEblagh5.Visible = false;
                    btnBedooneEblagh6.Visible = false;
                    break;
                }
            case 3:
                {
                    txtBedooneEblagh1.Visible = true;
                    txtBedooneEblagh2.Visible = true;
                    txtBedooneEblagh3.Visible = true;
                    txtBedooneEblagh4.Visible = false;
                    txtBedooneEblagh5.Visible = false;
                    txtBedooneEblagh6.Visible = false;
                    btnBedooneEblagh1.Visible = true;
                    btnBedooneEblagh2.Visible = true;
                    btnBedooneEblagh3.Visible = true;
                    btnBedooneEblagh4.Visible = false;
                    btnBedooneEblagh5.Visible = false;
                    btnBedooneEblagh6.Visible = false;
                    break;
                }
            case 4:
                {
                    txtBedooneEblagh1.Visible = true;
                    txtBedooneEblagh2.Visible = true;
                    txtBedooneEblagh3.Visible = false;
                    txtBedooneEblagh4.Visible = false;
                    txtBedooneEblagh5.Visible = false;
                    txtBedooneEblagh6.Visible = false;
                    btnBedooneEblagh1.Visible = true;
                    btnBedooneEblagh2.Visible = true;
                    btnBedooneEblagh3.Visible = false;
                    btnBedooneEblagh4.Visible = false;
                    btnBedooneEblagh5.Visible = false;
                    btnBedooneEblagh6.Visible = false;
                    break;
                }
            case 5:
                {
                    txtBedooneEblagh1.Visible = true;
                    txtBedooneEblagh2.Visible = false;
                    txtBedooneEblagh3.Visible = false;
                    txtBedooneEblagh4.Visible = false;
                    txtBedooneEblagh5.Visible = false;
                    txtBedooneEblagh6.Visible = false;
                    btnBedooneEblagh1.Visible = true;
                    btnBedooneEblagh2.Visible = false;
                    btnBedooneEblagh3.Visible = false;
                    btnBedooneEblagh4.Visible = false;
                    btnBedooneEblagh5.Visible = false;
                    btnBedooneEblagh6.Visible = false;
                    break;
                }
            case 6:
                {
                    Panel1.Visible = false;
                    txtBedooneEblagh1.Visible = false;
                    txtBedooneEblagh2.Visible = false;
                    txtBedooneEblagh3.Visible = false;
                    txtBedooneEblagh4.Visible = false;
                    txtBedooneEblagh5.Visible = false;
                    txtBedooneEblagh6.Visible = false;
                    btnBedooneEblagh1.Visible = false;
                    btnBedooneEblagh2.Visible = false;
                    btnBedooneEblagh3.Visible = false;
                    btnBedooneEblagh4.Visible = false;
                    btnBedooneEblagh5.Visible = false;
                    btnBedooneEblagh6.Visible = false;
                    break;
                }
            
            default: break;
                
        }

        cbBedooneEblagh.Checked = true;
        Panel1.Visible = true;
    }

    protected void btnBedooneEblaghCancel_Click(object sender, EventArgs e)
    {
        cbBedooneEblagh.Checked = false;
        Panel1.Visible = false;
        txtBedooneEblagh1.Visible = false;
        txtBedooneEblagh2.Visible = false;
        txtBedooneEblagh3.Visible = false;
        txtBedooneEblagh4.Visible = false;
        txtBedooneEblagh5.Visible = false;
        txtBedooneEblagh6.Visible = false;

        btnBedooneEblagh1.Visible = false;
        btnBedooneEblagh2.Visible = false;
        btnBedooneEblagh3.Visible = false;
        btnBedooneEblagh4.Visible = false;
        btnBedooneEblagh5.Visible = false;
        btnBedooneEblagh6.Visible = false;

        txtBedooneEblagh1.Text = "";
        txtBedooneEblagh2.Text = "";
        txtBedooneEblagh3.Text = "";
        txtBedooneEblagh4.Text = "";
        txtBedooneEblagh5.Text = "";
        txtBedooneEblagh6.Text = "";

        lblBedooneEblaghName1.Text = "";
        lblBedooneEblaghName2.Text = "";
        lblBedooneEblaghName3.Text = "";
        lblBedooneEblaghName4.Text = "";
        lblBedooneEblaghName5.Text = "";
        lblBedooneEblaghName6.Text = "";

        lblBedooneEblaghPost1.Text = "";
        lblBedooneEblaghPost2.Text = "";
        lblBedooneEblaghPost3.Text = "";
        lblBedooneEblaghPost4.Text = "";
        lblBedooneEblaghPost5.Text = "";
        lblBedooneEblaghPost6.Text = "";

        lblBedooneEblagh1.Text = "";
        lblBedooneEblagh2.Text = "";
        lblBedooneEblagh3.Text = "";
        lblBedooneEblagh4.Text = "";
        lblBedooneEblagh5.Text = "";
        lblBedooneEblagh6.Text = "";
    }

    protected void btnBedooneEblagh1_Click(object sender, EventArgs e)
    {
        lblBedooneEblaghName1.Text = "";
        lblBedooneEblaghPost1.Text = "";
        lblBedooneEblagh1.Text = "";
        SqlDataReader BedooneEblagh;
        Dictionary<string, object> paramBE = new Dictionary<string, object>();
        paramBE.Add("@codeMelli", txtBedooneEblagh1.Text);
        BedooneEblagh = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli )", paramBE);
        if (BedooneEblagh.Read())
        {
            lblBedooneEblaghName1.Text = BedooneEblagh["N"].ToString() + " " + BedooneEblagh["F"].ToString();
            lblBedooneEblaghPost1.Text = BedooneEblagh["S"].ToString();
            lblBedooneEblagh1.Text = BedooneEblagh["CM"].ToString();
            msgB1.Text = "";
        }
        else
            msgB1.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnBedooneEblagh2_Click(object sender, EventArgs e)
    {
        lblBedooneEblaghName2.Text = "";
        lblBedooneEblaghPost2.Text = "";
        lblBedooneEblagh2.Text = "";
        SqlDataReader BedooneEblagh;
        Dictionary<string, object> paramBE = new Dictionary<string, object>();
        paramBE.Add("@codeMelli", txtBedooneEblagh2.Text);
        BedooneEblagh = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli )", paramBE);
        if (BedooneEblagh.Read())
        {
            lblBedooneEblaghName2.Text = BedooneEblagh["N"].ToString() + " " + BedooneEblagh["F"].ToString();
            lblBedooneEblaghPost2.Text = BedooneEblagh["S"].ToString();
            lblBedooneEblagh2.Text = BedooneEblagh["CM"].ToString();
            msgB2.Text = "";
        }
        else
            msgB2.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnBedooneEblagh3_Click(object sender, EventArgs e)
    {
        lblBedooneEblaghName3.Text = "";
        lblBedooneEblaghPost3.Text = "";
        lblBedooneEblagh3.Text = "";
        SqlDataReader BedooneEblagh;
        Dictionary<string, object> paramBE = new Dictionary<string, object>();
        paramBE.Add("@codeMelli", txtBedooneEblagh3.Text);
        BedooneEblagh = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli )", paramBE);
        if (BedooneEblagh.Read())
        {
            lblBedooneEblaghName3.Text = BedooneEblagh["N"].ToString() + " " + BedooneEblagh["F"].ToString();
            lblBedooneEblaghPost3.Text = BedooneEblagh["S"].ToString();
            lblBedooneEblagh3.Text = BedooneEblagh["CM"].ToString();
            msgB3.Text = "";
        }
        else
            msgB3.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnBedooneEblagh4_Click(object sender, EventArgs e)
    {
        lblBedooneEblaghName4.Text = "";
        lblBedooneEblaghPost4.Text = "";
        lblBedooneEblagh4.Text = "";
        SqlDataReader BedooneEblagh;
        Dictionary<string, object> paramBE = new Dictionary<string, object>();
        paramBE.Add("@codeMelli", txtBedooneEblagh4.Text);
        BedooneEblagh = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli )", paramBE);
        if (BedooneEblagh.Read())
        {
            lblBedooneEblaghName4.Text = BedooneEblagh["N"].ToString() + " " + BedooneEblagh["F"].ToString();
            lblBedooneEblaghPost4.Text = BedooneEblagh["S"].ToString();
            lblBedooneEblagh4.Text = BedooneEblagh["CM"].ToString();
            msgB4.Text = "";
        }
        else
            msgB4.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnBedooneEblagh5_Click(object sender, EventArgs e)
    {
        lblBedooneEblaghName5.Text = "";
        lblBedooneEblaghPost5.Text = "";
        lblBedooneEblagh5.Text = "";
        SqlDataReader BedooneEblagh;
        Dictionary<string, object> paramBE = new Dictionary<string, object>();
        paramBE.Add("@codeMelli", txtBedooneEblagh5.Text);
        BedooneEblagh = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli )", paramBE);
        if (BedooneEblagh.Read())
        {
            lblBedooneEblaghName5.Text = BedooneEblagh["N"].ToString() + " " + BedooneEblagh["F"].ToString();
            lblBedooneEblaghPost5.Text = BedooneEblagh["S"].ToString();
            lblBedooneEblagh5.Text = BedooneEblagh["CM"].ToString();
            msgB5.Text = "";
        }
        else
            msgB5.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnBedooneEblagh6_Click(object sender, EventArgs e)
    {
        lblBedooneEblaghName6.Text = "";
        lblBedooneEblaghPost6.Text = "";
        lblBedooneEblagh6.Text = "";
        SqlDataReader BedooneEblagh;
        Dictionary<string, object> paramBE = new Dictionary<string, object>();
        paramBE.Add("@codeMelli", txtBedooneEblagh6.Text);
        BedooneEblagh = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli )", paramBE);
        if (BedooneEblagh.Read())
        {
            lblBedooneEblaghName6.Text = BedooneEblagh["N"].ToString() + " " + BedooneEblagh["F"].ToString();
            lblBedooneEblaghPost6.Text = BedooneEblagh["S"].ToString();
            lblBedooneEblagh6.Text = BedooneEblagh["CM"].ToString();
            msgB6.Text = "";
        }
        else
            msgB6.Text = "شخصی با این کد ملی در سیستم تعریف نشده است";
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //string codeshobeh = Session["codeShobeh"].ToString();
            Dictionary<string, object> param = new Dictionary<string, object>();

            param.Add("@CodeShobeh", codeshobeh);
            param.Add("@Houzeh", lblHozeh.Text);
            param.Add("@mojtamaName", lblMojtamaName.Text);
            if(int.Parse(txtRoozINS.Text)<10)
                param.Add("@RoozINS", "0"+txtRoozINS.Text);
            else
                param.Add("@RoozINS", txtRoozINS.Text);
            param.Add("@MahINS", ddlMahINS.SelectedValue);
            param.Add("@SalINS", ddlSalINS.SelectedValue);
            param.Add("@Mojoodi1", txtMojoodi.Text);
            param.Add("@Varedeh", txtVaredeh.Text);
            param.Add("@Makhtoomeh", txtMakhtoomeh.Text);
            param.Add("@Mandeh", txtMandeh.Text);
            param.Add("@SolhSazesh", txtSazesh.Text);
            if(txtRoozResidegi.Text=="")
                param.Add("@RoozResidegi", "00");
            else
            {
                if (int.Parse(txtRoozResidegi.Text) < 10)
                    param.Add("@RoozResidegi", "0" + txtRoozResidegi.Text);
                else
                    param.Add("@RoozResidegi", txtRoozResidegi.Text);
            }
            
            param.Add("@MahResidegi", ddlMahResidegi.SelectedValue);
            param.Add("@SalResidegi", ddlSalResidegi.SelectedValue);
            if (txtRoozNezarat.Text == "")
                param.Add("@RoozNezarat", "00");
            else
            {
                if (int.Parse(txtRoozNezarat.Text) < 10)
                    param.Add("@RoozNezarat", "0" + txtRoozNezarat.Text);
                else
                    param.Add("@RoozNezarat", txtRoozNezarat.Text);
            }             
            param.Add("@MahNezarat", ddlMahNezarat.SelectedValue);
            param.Add("@SalNezarat", ddlSalNezarat.SelectedValue);
            //-----------------------------------------------------
            param.Add("@AzaINS", ddlAzaINS.SelectedValue);
            param.Add("@SaatHozoor", ddlSaatHozoor.SelectedValue);
            param.Add("@Pardakht", ddlPardakht.SelectedValue);
            param.Add("@Dastoor", ddlDastoor.SelectedValue);
            param.Add("@Solh", ddlSolh.SelectedValue);
            param.Add("@Estelamat", ddlEstelamat.SelectedValue);
            param.Add("@Tasmim", ddlTasmim.SelectedValue);
            param.Add("@Eblagh", ddlEblagh.SelectedValue);
            param.Add("@SooratJalaseh", ddlSooratJalaseh.SelectedValue);
            param.Add("@Iradat", ddlIradat.SelectedValue);
            param.Add("@Tari", ddlTari.SelectedValue);
            param.Add("@Mashverat", ddlMashverat.SelectedValue);
            param.Add("@Madeh", ddlMadeh.SelectedValue);
            param.Add("@Nazm", ddlNazm.SelectedValue);
            param.Add("@Takhliyeh", ddlTakhliyeh.SelectedValue);
            param.Add("@Ejraei", ddlEjraei.SelectedValue);
            param.Add("@PErjaei", ddlPErjaei.SelectedValue);
            param.Add("@Eslahi", ddlEslahi.SelectedValue);
            param.Add("@Residegi", ddlResidegi.SelectedValue);
            param.Add("@Parvandeh", txt4Parvandeh.Text);
            //--------------------------------------------
            param.Add("@Bazras1", lblBazras1.Text);
            param.Add("@Bazras2", lblBazras2.Text);
            param.Add("@Bazras3", lblBazras3.Text);
            //--------------------------------------------
            int day, month, year;
            PersianCalendar pc = new PersianCalendar();
            DateTime dt = DateTime.Today;
            year = pc.GetYear(dt) - 1300;
            month = pc.GetMonth(dt);
            day = pc.GetDayOfMonth(dt);

            //lbl.Text = day + "/" + month + "/" + year;
            if (day < 10)
                param.Add("@RoozSabt", "0"+ day);
            else
                param.Add("@RoozSabt", day);
            param.Add("@MahSabt", month);
            param.Add("@SalSabt",year);
            //------------------------------------------
            string count = lblCount.Text;
            switch (count)
            {
                case "1":
                    {
                        param.Add("@ozv1", lblselected1.Text);
                        param.Add("@ozv1stat", "Y");
                        param.Add("@ozv2", lblBedooneEblagh1.Text);
                        param.Add("@ozv2stat", "N");
                        param.Add("@ozv3", lblBedooneEblagh2.Text);
                        param.Add("@ozv3stat", "N");
                        param.Add("@ozv4", lblBedooneEblagh3.Text);
                        param.Add("@ozv4stat", "N");
                        param.Add("@ozv5", lblBedooneEblagh4.Text);
                        param.Add("@ozv5stat", "N");
                        param.Add("@ozv6", lblBedooneEblagh5.Text);
                        param.Add("@ozv6stat", "N");
                        break;
                    }
                case "2":
                    {
                        param.Add("@ozv1", lblselected1.Text);
                        param.Add("@ozv1stat", "Y");
                        param.Add("@ozv2", lblselected2.Text);
                        param.Add("@ozv2stat", "Y");
                        param.Add("@ozv3", lblBedooneEblagh1.Text);
                        param.Add("@ozv3stat", "N");
                        param.Add("@ozv4", lblBedooneEblagh2.Text);
                        param.Add("@ozv4stat", "N");
                        param.Add("@ozv5", lblBedooneEblagh3.Text);
                        param.Add("@ozv5stat", "N");
                        param.Add("@ozv6", lblBedooneEblagh4.Text);
                        param.Add("@ozv6stat", "N");
                        break;
                    }
                case "3":
                    {
                        param.Add("@ozv1", lblselected1.Text);
                        param.Add("@ozv1stat", "Y");
                        param.Add("@ozv2", lblselected2.Text);
                        param.Add("@ozv2stat", "Y");
                        param.Add("@ozv3", lblselected3.Text);
                        param.Add("@ozv3stat", "Y");
                        param.Add("@ozv4", lblBedooneEblagh1.Text);
                        param.Add("@ozv4stat", "N");
                        param.Add("@ozv5", lblBedooneEblagh2.Text);
                        param.Add("@ozv5stat", "N");
                        param.Add("@ozv6", lblBedooneEblagh3.Text);
                        param.Add("@ozv6stat", "N");

                        break;
                    }
                case "4":
                    {
                        param.Add("@ozv1", lblselected1.Text);
                        param.Add("@ozv1stat", "Y");
                        param.Add("@ozv2", lblselected2.Text);
                        param.Add("@ozv2stat", "Y");
                        param.Add("@ozv3", lblselected3.Text);
                        param.Add("@ozv3stat", "Y");
                        param.Add("@ozv4", lblselected4.Text);
                        param.Add("@ozv4stat", "Y");
                        param.Add("@ozv5", lblBedooneEblagh1.Text);
                        param.Add("@ozv5stat", "N");
                        param.Add("@ozv6", lblBedooneEblagh2.Text);
                        param.Add("@ozv6stat", "N");
                        break;
                    }
                case "5":
                    {
                        param.Add("@ozv1", lblselected1.Text);
                        param.Add("@ozv1stat", "Y");
                        param.Add("@ozv2", lblselected2.Text);
                        param.Add("@ozv2stat", "Y");
                        param.Add("@ozv3", lblselected3.Text);
                        param.Add("@ozv3stat", "Y");
                        param.Add("@ozv4", lblselected4.Text);
                        param.Add("@ozv4stat", "Y");
                        param.Add("@ozv5", lblselected5.Text);
                        param.Add("@ozv5stat", "Y");
                        param.Add("@ozv6", lblBedooneEblagh1.Text);
                        param.Add("@ozv6stat", "N");
                        break;
                    }
                case "6":
                    {
                        param.Add("@ozv1", lblselected1.Text);
                        param.Add("@ozv1stat", "Y");
                        param.Add("@ozv2", lblselected2.Text);
                        param.Add("@ozv2stat", "Y");
                        param.Add("@ozv3", lblselected3.Text);
                        param.Add("@ozv3stat", "Y");
                        param.Add("@ozv4", lblselected4.Text);
                        param.Add("@ozv4stat", "Y");
                        param.Add("@ozv5", lblselected5.Text);
                        param.Add("@ozv5stat", "Y");
                        param.Add("@ozv6", lblselected6.Text);
                        param.Add("@ozv6stat", "Y");
                        break;
                    }
                case "0":
                    {
                        param.Add("@ozv1", lblBedooneEblagh1.Text);
                        param.Add("@ozv1stat", "N");
                        param.Add("@ozv2", lblBedooneEblagh2.Text);
                        param.Add("@ozv2stat", "N");
                        param.Add("@ozv3", lblBedooneEblagh3.Text);
                        param.Add("@ozv3stat", "N");
                        param.Add("@ozv4", lblBedooneEblagh4.Text);
                        param.Add("@ozv4stat", "N");
                        param.Add("@ozv5", lblBedooneEblagh5.Text);
                        param.Add("@ozv5stat", "N");
                        param.Add("@ozv6", lblBedooneEblagh6.Text);
                        param.Add("@ozv6stat", "N");
                        break;
                    }

                default: break;
            }            
            //------------------------------------------
            param.Add("@ostan", lblOstan.Text);
            param.Add("@shahr", lblShahr.Text);
            param.Add("@shobeh", lblShobeh.Text);
            param.Add("@mojtama", lblMojtama.Text); 
            param.Add("@NoeShobeh", lblNoeShobeh.Text);
            string LOG = Request.QueryString["USRName"];
            param.Add("@LogB", LOG);

            SqlDataReader drRepeat;
            drRepeat = DB.ExecuteReader("SELECT * FROM [TblBazrasi] where CodeShobeh=@CodeShobeh and SalINS=@SalINS and MahINS=@MahINS and RoozINS=@RoozINS", param);
            if (drRepeat.Read())
            {
                msg.Visible = true;
                msg.Text = "اطلاعات بازرسی این شعبه قبلا ثبت شده است";
            }                
            else
            {
                DB.ExecuteNonQuery("INSERT INTO [dbo].[TblBazrasi] ([CodeShobeh],[RoozINS],[MahINS],[SalINS],[Mojoodi1],[Varedeh],[Makhtoomeh],[Mandeh],[SolhSazesh],[RoozResidegi],[MahResidegi],[SalResidegi],[RoozNezarat],[MahNezarat],[SalNezarat],[AzaINS],[SaatHozoor],[Pardakht],[Dastoor],[Solh],[Estelamat],[Tasmim],[Eblagh],[SooratJalaseh],[Iradat],[Tari],[Mashverat],[Madeh],[Nazm],[Takhliyeh],[Ejraei],[PErjaei],[Eslahi],[Residegi],[Parvandeh],[Bazras1],[Bazras2],[Bazras3],[RoozSabt],[MahSabt],[SalSabt],[ozv1],[ozv2],[ozv3],[ozv4],[ozv5],[ozv6],[ostan],[shahr],[shobeh],[mojtama],[Houzeh],[mojtamaName],[NoeShobeh],[ozv1stat],[ozv2stat],[ozv3stat],[ozv4stat],[ozv5stat],[ozv6stat],[LogB],  [AzaINS_I], [SaatHozoor_I], [Pardakht_I], [Dastoor_I], [Solh_I],  [Estelamat_I],  [Tasmim_I], [Eblagh_I], [SooratJalaseh_I], [Iradat_I], [Tari_I], [Mashverat_I], [Madeh_I], [Nazm_I], [Takhliyeh_I], [Ejraei_I], [PErjaei_I], [Eslahi_I], [Residegi_I])" +
                                                           "VALUES (@CodeShobeh, @RoozINS ,@MahINS, @SalINS, @Mojoodi1, @Varedeh ,@Makhtoomeh, @Mandeh, @SolhSazesh, @RoozResidegi, @MahResidegi, @SalResidegi, @RoozNezarat, @MahNezarat, @SalNezarat, @AzaINS, @SaatHozoor, @Pardakht, @Dastoor, @Solh, @Estelamat, @Tasmim, @Eblagh, @SooratJalaseh, @Iradat, @Tari, @Mashverat, @Madeh, @Nazm, @Takhliyeh, @Ejraei, @PErjaei, @Eslahi, @Residegi, @Parvandeh, @Bazras1, @Bazras2, @Bazras3, @RoozSabt, @MahSabt, @SalSabt, @ozv1, @ozv2, @ozv3, @ozv4, @ozv5, @ozv6, @ostan, @shahr, @shobeh, @mojtama, @Houzeh, @mojtamaName, @NoeShobeh, @ozv1stat, @ozv2stat, @ozv3stat, @ozv4stat, @ozv5stat, @ozv6stat, @LogB,'ddlAzaINS','ddlSaatHozoor','ddlPardakht','ddlDastoor','ddlSolh', 'ddlEstelamat', 'ddlTasmim','ddlEblagh','ddlSooratJalaseh','ddlIradat','ddlTari','ddlMashverat','ddlMadeh','ddlNazm','ddlTakhliyeh','ddlEjraei','ddlPErjaei','ddlEslahi','ddlResidegi')", param);
                msg.Visible = true;
                msg.Text = "اطلاعات با موفقیت ثبت شد";
            }
            drRepeat.Close();

            
        }
    }

    
}
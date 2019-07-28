using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;


public partial class EditINSInsert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string CodeB = Request.QueryString["کد بازرسی"];

            //int day, month, year;
            //PersianCalendar pc = new PersianCalendar();
            //DateTime dt = DateTime.Today;
            //year = pc.GetYear(dt) - 1300;
            //month = pc.GetMonth(dt);
            //day = pc.GetDayOfMonth(dt);
            //string t;
            //if (day < 10)
            //    t = "13" + year + "/" + month + "/0" + day;
            //else
            //    t = "13" + year + "/" + month + "/" + day;
            //msg.Text = DeduceShamsi(t, "1395/03/31").ToString();

            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@CodeB", CodeB);
            SqlDataReader dr = DB.ExecuteReader("select * From TblBazrasi where CodeB=@CodeB", param);
            dr.Read();
            //lblBazrastDate.Text = dr["SalINS"].ToString() + "/" + dr["MahINS"].ToString() + "/" + dr["RoozINS"].ToString();
            //lblSabtDate.Text = "13" + dr["SalSabt"].ToString() + "/" + dr["MahSabt"].ToString() + "/" + dr["RoozSabt"].ToString();
            lblOstan.Text = dr["ostan"].ToString();
            lblShahr.Text = dr["shahr"].ToString();
            lblShobeh.Text = dr["shobeh"].ToString();
            lblNoeShobeh.Text = dr["NoeShobeh"].ToString();
            lblHozeh.Text = dr["Houzeh"].ToString();
            lblMojtama.Text = dr["mojtama"].ToString();
            lblMojtamaName.Text = dr["mojtamaName"].ToString();
            lblCodeShobeh.Text = dr["codeShobeh"].ToString();
            Session["codeSHobeh"] = dr["codeShobeh"].ToString();
            //------------------------اعضاء عضو-----------------------------
            foreach (GridViewRow gvr in GridView1.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    CheckBox cb = (CheckBox)(gvr.FindControl("chech1"));
                    if (gvr.Cells[1].Text == dr["ozv1"].ToString())
                    {
                        cb.Checked = true;
                    }
                    if (gvr.Cells[1].Text == dr["ozv2"].ToString())
                    {
                        cb.Checked = true;
                    }
                    if (gvr.Cells[1].Text == dr["ozv3"].ToString())
                    {
                        cb.Checked = true;
                    }
                    if (gvr.Cells[1].Text == dr["ozv4"].ToString())
                    {
                        cb.Checked = true;
                    }
                    if (gvr.Cells[1].Text == dr["ozv5"].ToString())
                    {
                        cb.Checked = true;
                    }
                    if (gvr.Cells[1].Text == dr["ozv6"].ToString())
                    {
                        cb.Checked = true;
                    }
                }
            }
            //-----------------------------------------------------
            lbl.Text = "";
            int count = 0;
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
            //-------------------------اعضاء بدون ابلاغ----------------------------
            Dictionary<string, object> paramAza = new Dictionary<string, object>();
            paramAza.Add("@CodeB", CodeB);
            SqlDataReader drAza = DB.ExecuteReader("select ozv1,ozv1stat,ozv2,ozv2stat,ozv3,ozv3stat,ozv4,ozv4stat,ozv5,ozv5stat,ozv6,ozv6stat From TblBazrasi where CodeB=@CodeB", paramAza);
            if (drAza.Read())
            {
                //ozv1.Text = drAza["ozv1"].ToString();
                //ozv2.Text = drAza["ozv2"].ToString();
                //ozv3.Text = drAza["ozv3"].ToString();
                //ozv4.Text = drAza["ozv4"].ToString();
                //ozv5.Text = drAza["ozv5"].ToString();
                //ozv6.Text = drAza["ozv6"].ToString();
                //-------------------------------------
                if ((drAza["ozv1stat"].ToString() == "N") && (drAza["ozv1"].ToString() != ""))
                    lblBedooneEblagh1.Text = drAza["ozv1"].ToString();
                if ((drAza["ozv2stat"].ToString() == "N") && (drAza["ozv2"].ToString() != ""))
                    lblBedooneEblagh2.Text = drAza["ozv2"].ToString();
                if ((drAza["ozv3stat"].ToString() == "N") && (drAza["ozv3"].ToString() != ""))
                    lblBedooneEblagh3.Text = drAza["ozv3"].ToString();
                if ((drAza["ozv4stat"].ToString() == "N") && (drAza["ozv4"].ToString() != ""))
                    lblBedooneEblagh4.Text = drAza["ozv4"].ToString();
                if ((drAza["ozv5stat"].ToString() == "N") && (drAza["ozv5"].ToString() != ""))
                    lblBedooneEblagh5.Text = drAza["ozv5"].ToString();
                if ((drAza["ozv6stat"].ToString() == "N") && (drAza["ozv6"].ToString() != ""))
                    lblBedooneEblagh6.Text = drAza["ozv6"].ToString();
            }
            //-----------------------------------------------------
            txtMojoodi.Text = dr["Mojoodi1"].ToString();
            txtVaredeh.Text = dr["Varedeh"].ToString();
            txtMakhtoomeh.Text = dr["Makhtoomeh"].ToString();
            txtMandeh.Text = dr["Mandeh"].ToString();
            txtSazesh.Text = dr["SolhSazesh"].ToString();
            //-----------------------------------------------------
            txtRoozResidegi.Text = dr["RoozResidegi"].ToString();
            ddlMahResidegi.SelectedValue = dr["MahResidegi"].ToString();
            ddlSalResidegi.SelectedValue = dr["SalResidegi"].ToString();
            txtRoozNezarat.Text = dr["RoozNezarat"].ToString();
            ddlMahNezarat.SelectedValue = dr["MahNezarat"].ToString();
            ddlSalNezarat.SelectedValue = dr["SalNezarat"].ToString();
            //-------------------نمایش آیتم های لیست باکس ها----------------
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

            ddlAzaINS.SelectedIndex = int.Parse(dr["AzaINS"].ToString());
            ddlSaatHozoor.SelectedIndex = int.Parse(dr["SaatHozoor"].ToString());
            ddlPardakht.SelectedIndex = int.Parse(dr["Pardakht"].ToString());
            ddlDastoor.SelectedIndex = int.Parse(dr["Dastoor"].ToString());
            ddlSolh.SelectedIndex = int.Parse(dr["Solh"].ToString());
            ddlEstelamat.SelectedIndex = int.Parse(dr["Estelamat"].ToString());
            ddlTasmim.SelectedIndex = int.Parse(dr["Tasmim"].ToString());
            ddlEblagh.SelectedIndex = int.Parse(dr["Eblagh"].ToString());
            ddlSooratJalaseh.SelectedIndex = int.Parse(dr["SooratJalaseh"].ToString());
            ddlIradat.SelectedIndex = int.Parse(dr["Iradat"].ToString());
            ddlTari.SelectedIndex = int.Parse(dr["Tari"].ToString());
            ddlMashverat.SelectedIndex = int.Parse(dr["Mashverat"].ToString());
            ddlMadeh.SelectedIndex = int.Parse(dr["Madeh"].ToString());
            ddlNazm.SelectedIndex = int.Parse(dr["Nazm"].ToString());
            ddlTakhliyeh.SelectedIndex = int.Parse(dr["Takhliyeh"].ToString());
            ddlEjraei.SelectedIndex = int.Parse(dr["Ejraei"].ToString());
            ddlPErjaei.SelectedIndex = int.Parse(dr["PErjaei"].ToString());
            ddlEslahi.SelectedIndex = int.Parse(dr["Eslahi"].ToString());
            ddlResidegi.SelectedIndex = int.Parse(dr["Residegi"].ToString());
            txt4Parvandeh.Text = dr["Parvandeh"].ToString();
            //-----------------------------------------------------
            //-----------------------------------------------------
            txtRoozINS.Text = dr["RoozINS"].ToString();
            ddlMahINS.SelectedValue = dr["MahINS"].ToString();
            ddlSalINS.SelectedValue = dr["SalINS"].ToString();
        }
    }

    protected void btnHome2_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditINSFormReport.aspx");
    }

    protected void btnAcceptPerson_Click(object sender, EventArgs e)
    {
        lbl.Text = "";
        int count = 0;
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
}
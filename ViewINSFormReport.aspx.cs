using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

public partial class ViewINSFormReport : System.Web.UI.Page
{
    public static string kode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string CodeB = Request.QueryString["کد بازرسی"];
        kode= Request.QueryString["kode"];
        int day, month, year;
        PersianCalendar pc = new PersianCalendar();
        DateTime dt = DateTime.Today;
        year = pc.GetYear(dt) - 1300;
        month = pc.GetMonth(dt);
        //if(month<10)
        //    month
        day = pc.GetDayOfMonth(dt);
        string t= "13" + year ;
        if (month < 10)
            t = t + "/0" + month ;
        else
            t = t + "/" + month;
        if (day < 10)
            t =t + "/0" + day;
        else
            t =t + "/" + day;
        msg.Text = DeduceShamsi(t, "1395/03/31").ToString();
        //-----------------------------------------------------
        //img1.ImageUrl = "~/PersonelImage/tmp.jpg";
        //img2.ImageUrl = "~/PersonelImage/tmp.jpg";
        //img3.ImageUrl = "~/PersonelImage/tmp.jpg";
        //img4.ImageUrl = "~/PersonelImage/tmp.jpg";
        //img5.ImageUrl = "~/PersonelImage/tmp.jpg";
        //img6.ImageUrl = "~/PersonelImage/tmp.jpg";
        //-----------------------------------------------------

        Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@CodeB", CodeB);
            SqlDataReader dr = DB.ExecuteReader("select * From TblBazrasi where CodeB=@CodeB", param);
            dr.Read();
            lblBazrastDate.Text = dr["SalINS"].ToString() + "/" + dr["MahINS"].ToString() + "/" + dr["RoozINS"].ToString();
            lblSabtDate.Text = "13" + dr["SalSabt"].ToString() + "/" + dr["MahSabt"].ToString() + "/" + dr["RoozSabt"].ToString();
            lblOstan.Text = dr["ostan"].ToString();
            lblShahr.Text = dr["shahr"].ToString();
            lblShobeh.Text = dr["shobeh"].ToString();
            lblNoeShobeh.Text = dr["NoeShobeh"].ToString();
            lblHozeh.Text = dr["Houzeh"].ToString();
            lblMojtama.Text = dr["mojtama"].ToString();
            lblMojtamaName.Text = dr["mojtamaName"].ToString();
            //-----------------------------------------------------
            Dictionary<string, object> paramAza = new Dictionary<string, object>();
            paramAza.Add("@CodeB", CodeB);
            SqlDataReader drAza = DB.ExecuteReader("select ozv1,ozv1stat,ozv2,ozv2stat,ozv3,ozv3stat,ozv4,ozv4stat,ozv5,ozv5stat,ozv6,ozv6stat From TblBazrasi where CodeB=@CodeB", paramAza);
            if (drAza.Read())
            {
                ozv1.Text = drAza["ozv1"].ToString();
                ozv2.Text = drAza["ozv2"].ToString();
                ozv3.Text = drAza["ozv3"].ToString();
                ozv4.Text = drAza["ozv4"].ToString();
                ozv5.Text = drAza["ozv5"].ToString();
                ozv6.Text = drAza["ozv6"].ToString();
                //-------------------------------------
                if ((drAza["ozv1stat"].ToString() == "N") &&( drAza["ozv1"].ToString()!=""))
                    stat1.Text = "بدون ابلاغ رسمی";
                if ((drAza["ozv2stat"].ToString() == "N") && (drAza["ozv2"].ToString() != ""))
                    stat2.Text = "بدون ابلاغ رسمی";
                if ((drAza["ozv3stat"].ToString() == "N")&& (drAza["ozv3"].ToString() != ""))
                    stat3.Text = "بدون ابلاغ رسمی";
                if ((drAza["ozv4stat"].ToString() == "N")&& (drAza["ozv4"].ToString() != ""))
                    stat4.Text = "بدون ابلاغ رسمی";
                if ((drAza["ozv5stat"].ToString() == "N")&& (drAza["ozv5"].ToString() != ""))
                    stat5.Text = "بدون ابلاغ رسمی";
                if ((drAza["ozv6stat"].ToString() == "N")&& (drAza["ozv6"].ToString() != ""))
                    stat6.Text = "بدون ابلاغ رسمی";
            }
        //------------------------------------------------------
        Dictionary<string, object> paramAza1 = new Dictionary<string, object>();
        paramAza1.Add("@m", msg.Text);
        paramAza1.Add("@CM", ozv1.Text);        
        SqlDataReader drAza1 = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh + @m AS 'مدت عضویت به ماه'" +
                                                "FROM TblPersoneli INNER JOIN TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN  TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code " +
                                                "WHERE TblPersoneli.CodeMelli = @CM", paramAza1);
        if (drAza1.Read())
        {
            img1.ImageUrl = "\\178.252.189.110\\Image\\" + ozv1.Text + ".jpeg";
            name1.Text = drAza1["نام"].ToString();
            family1.Text = drAza1["نام خانوادگی"].ToString();
            tavalod1.Text = drAza1["تاریخ تولد"].ToString();
            semat1.Text = drAza1["سمت در شورا"].ToString();
            madrak1.Text = drAza1["مدرک تحصیلی"].ToString();
            reshteh1.Text = drAza1["رشته تحصیلی"].ToString();
            sabegheh1.Text = drAza1["مدت عضویت به ماه"].ToString();
        }
        else
            img1.Visible = false;
        Dictionary<string, object> paramAza2 = new Dictionary<string, object>();
        paramAza2.Add("@m", msg.Text);
        paramAza2.Add("@CM", ozv2.Text);
        SqlDataReader drAza2 = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh + @m AS 'مدت عضویت به ماه'" +
                                                "FROM TblPersoneli INNER JOIN TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN  TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code " +
                                                "WHERE TblPersoneli.CodeMelli = @CM", paramAza2);
        if (drAza2.Read())
        {
            img2.ImageUrl = "\\178.252.189.110\\Image\\" + ozv2.Text + ".jpeg";
            name2.Text = drAza2["نام"].ToString();
            family2.Text = drAza2["نام خانوادگی"].ToString();
            tavalod2.Text = drAza2["تاریخ تولد"].ToString();
            semat2.Text = drAza2["سمت در شورا"].ToString();
            madrak2.Text = drAza2["مدرک تحصیلی"].ToString();
            reshteh2.Text = drAza2["رشته تحصیلی"].ToString();
            sabegheh2.Text = drAza2["مدت عضویت به ماه"].ToString();
        }
        else
            img2.Visible = false;
        Dictionary<string, object> paramAza3 = new Dictionary<string, object>();
        paramAza3.Add("@m", msg.Text);
        paramAza3.Add("@CM", ozv3.Text);
        SqlDataReader drAza3 = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh + @m AS 'مدت عضویت به ماه'" +
                                                "FROM TblPersoneli INNER JOIN TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN  TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code " +
                                                "WHERE TblPersoneli.CodeMelli = @CM", paramAza3);
        if (drAza3.Read())
        {
            img3.ImageUrl = "\\178.252.189.110\\Image\\" + ozv3.Text + ".jpeg";
            name3.Text = drAza3["نام"].ToString();
            family3.Text = drAza3["نام خانوادگی"].ToString();
            tavalod3.Text = drAza3["تاریخ تولد"].ToString();
            semat3.Text = drAza3["سمت در شورا"].ToString();
            madrak3.Text = drAza3["مدرک تحصیلی"].ToString();
            reshteh3.Text = drAza3["رشته تحصیلی"].ToString();
            sabegheh3.Text = drAza3["مدت عضویت به ماه"].ToString();
        }
        else
            img3.Visible = false;
        Dictionary<string, object> paramAza4 = new Dictionary<string, object>();
        paramAza4.Add("@m", msg.Text);
        paramAza4.Add("@CM", ozv4.Text);
        SqlDataReader drAza4 = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh + @m AS 'مدت عضویت به ماه'" +
                                                "FROM TblPersoneli INNER JOIN TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN  TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code " +
                                                "WHERE TblPersoneli.CodeMelli = @CM", paramAza4);
        if (drAza4.Read())
        {
            img4.ImageUrl = "\\178.252.189.110\\Image\\" + ozv4.Text + ".jpeg";
            name4.Text = drAza4["نام"].ToString();
            family4.Text = drAza4["نام خانوادگی"].ToString();
            tavalod4.Text = drAza4["تاریخ تولد"].ToString();
            semat4.Text = drAza4["سمت در شورا"].ToString();
            madrak4.Text = drAza4["مدرک تحصیلی"].ToString();
            reshteh4.Text = drAza4["رشته تحصیلی"].ToString();
            sabegheh4.Text = drAza4["مدت عضویت به ماه"].ToString();
        }
        else
            img4.Visible = false;
        Dictionary<string, object> paramAza5 = new Dictionary<string, object>();
        paramAza5.Add("@m", msg.Text);
        paramAza5.Add("@CM", ozv5.Text);
        SqlDataReader drAza5 = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh + @m AS 'مدت عضویت به ماه'" +
                                                "FROM TblPersoneli INNER JOIN TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN  TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code " +
                                                "WHERE TblPersoneli.CodeMelli = @CM", paramAza5);
        if (drAza5.Read())
        {
            img5.ImageUrl = "\\178.252.189.110\\Image\\" + ozv5.Text + ".jpeg";
            name5.Text = drAza5["نام"].ToString();
            family5.Text = drAza5["نام خانوادگی"].ToString();
            tavalod5.Text = drAza5["تاریخ تولد"].ToString();
            semat5.Text = drAza5["سمت در شورا"].ToString();
            madrak5.Text = drAza5["مدرک تحصیلی"].ToString();
            reshteh5.Text = drAza5["رشته تحصیلی"].ToString();
            sabegheh5.Text = drAza5["مدت عضویت به ماه"].ToString();
        }
        else
            img5.Visible = false;
        Dictionary<string, object> paramAza6 = new Dictionary<string, object>();
        paramAza6.Add("@m", msg.Text);
        paramAza6.Add("@CM", ozv6.Text);
        SqlDataReader drAza6 = DB.ExecuteReader("SELECT TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh + @m AS 'مدت عضویت به ماه'" +
                                                "FROM TblPersoneli INNER JOIN TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN  TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code " +
                                                "WHERE TblPersoneli.CodeMelli = @CM", paramAza6);
        if (drAza6.Read())
        {
            img6.ImageUrl = "\\178.252.189.110\\Image\\" + ozv6.Text + ".jpeg";
            name6.Text = drAza6["نام"].ToString();
            family6.Text = drAza6["نام خانوادگی"].ToString();
            tavalod6.Text = drAza6["تاریخ تولد"].ToString();
            semat6.Text = drAza6["سمت در شورا"].ToString();
            madrak6.Text = drAza6["مدرک تحصیلی"].ToString();
            reshteh6.Text = drAza6["رشته تحصیلی"].ToString();
            sabegheh6.Text = drAza6["مدت عضویت به ماه"].ToString();
        }
        else
        {
            img6.Visible = false;   
            
        }
           
        //-----------------------------------------------------
            txtMojoodi.Text = dr["Mojoodi1"].ToString();
            txtVaredeh.Text = dr["Varedeh"].ToString();
            txtMakhtoomeh.Text = dr["Makhtoomeh"].ToString();
            txtMandeh.Text = dr["Mandeh"].ToString();
            txtSazesh.Text = dr["SolhSazesh"].ToString();
            txtRoozResidegi.Text = dr["SalResidegi"].ToString() + "/" + dr["MahResidegi"].ToString() + "/" + dr["RoozResidegi"].ToString();
            txtRoozNezarat.Text = dr["SalNezarat"].ToString() + "/" + dr["MahNezarat"].ToString() + "/" + dr["RoozNezarat"].ToString();
            if((dr["MahResidegi"].ToString()!= "00")&&(dr["MahNezarat"].ToString()!="00"))
                lblAvgVaght.Text = DeduceShamsi(txtRoozResidegi.Text, txtRoozNezarat.Text).ToString();
        //------------------------------------------------------
            CheckBoxList1.SelectedIndex = int.Parse(dr["AzaINS"].ToString()) - 1;
            CheckBoxList2.SelectedIndex = int.Parse(dr["SaatHozoor"].ToString()) - 1;
            CheckBoxList3.SelectedIndex = int.Parse(dr["Pardakht"].ToString()) - 1;
            CheckBoxList4.SelectedIndex = int.Parse(dr["Dastoor"].ToString()) - 1;
            CheckBoxList5.SelectedIndex = int.Parse(dr["Solh"].ToString()) - 1;
            CheckBoxList6.SelectedIndex = int.Parse(dr["Estelamat"].ToString()) - 1;
            CheckBoxList7.SelectedIndex = int.Parse(dr["Tasmim"].ToString()) - 1;
            CheckBoxList8.SelectedIndex = int.Parse(dr["Eblagh"].ToString()) - 1;
            CheckBoxList9.SelectedIndex = int.Parse(dr["SooratJalaseh"].ToString()) - 1;
            CheckBoxList10.SelectedIndex = int.Parse(dr["Iradat"].ToString()) - 1;
            CheckBoxList11.SelectedIndex = int.Parse(dr["Tari"].ToString()) - 1;
            CheckBoxList12.SelectedIndex = int.Parse(dr["Mashverat"].ToString()) - 1;
            CheckBoxList13.SelectedIndex = int.Parse(dr["Madeh"].ToString()) - 1;
            CheckBoxList14.SelectedIndex = int.Parse(dr["Nazm"].ToString()) - 1;
            CheckBoxList15.SelectedIndex = int.Parse(dr["Takhliyeh"].ToString()) - 1;
            CheckBoxList16.SelectedIndex = int.Parse(dr["Ejraei"].ToString()) - 1;
            CheckBoxList17.SelectedIndex = int.Parse(dr["PErjaei"].ToString()) - 1;
            CheckBoxList18.SelectedIndex = int.Parse(dr["Eslahi"].ToString()) - 1;
            CheckBoxList19.SelectedIndex = int.Parse(dr["Residegi"].ToString()) - 1;
            TextBox1.Text = dr["Parvandeh"].ToString();
            //-------------------------------------------------------
            SqlDataReader drBazras1;
            Dictionary<string, object> paramB1 = new Dictionary<string, object>();
            paramB1.Add("@codeMelli", dr["Bazras1"].ToString());
            drBazras1 = DB.ExecuteReader("(SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli)) union (SELECT TblPersGhozat.CodeMelli as CM, TblPersGhozat.Name as N, TblPersGhozat.Famil as F, TblPersGhozat.PostShoglTxt as S FROM  TblPersGhozat where CodeMelli = @codeMelli)", paramB1);
            if (drBazras1.Read())
                lblBazras1.Text = drBazras1["N"].ToString() + " " + drBazras1["F"].ToString() + "   -   " + drBazras1["S"].ToString();

            SqlDataReader drBazras2;
            Dictionary<string, object> paramB2 = new Dictionary<string, object>();
            paramB2.Add("@codeMelli", dr["Bazras2"].ToString());
            drBazras2 = DB.ExecuteReader("(SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli)) union (SELECT TblPersGhozat.CodeMelli as CM, TblPersGhozat.Name as N, TblPersGhozat.Famil as F, TblPersGhozat.PostShoglTxt as S FROM  TblPersGhozat where CodeMelli = @codeMelli)", paramB2);
            if (drBazras2.Read())
                lblBazras2.Text = drBazras2["N"].ToString() + " " + drBazras2["F"].ToString() + "   -   " + drBazras2["S"].ToString();

            SqlDataReader drBazras3;
            Dictionary<string, object> paramB3 = new Dictionary<string, object>();
            paramB3.Add("@codeMelli", dr["Bazras3"].ToString());
            drBazras3 = DB.ExecuteReader("(SELECT TblPersoneli.CodeMelli as CM ,TblPersoneli.Name as N , TblPersoneli.Famil as F , TblCodeing.Sharh as S FROM  TblSodorEblagh INNER JOIN  TblPersoneli ON TblSodorEblagh.CodeMelli = TblPersoneli.CodeMelli INNER JOIN  TblCodeing ON TblSodorEblagh.PPost = TblCodeing.Code WHERE(TblSodorEblagh.CodeMelli =@codeMelli)) union (SELECT TblPersGhozat.CodeMelli as CM, TblPersGhozat.Name as N, TblPersGhozat.Famil as F, TblPersGhozat.PostShoglTxt as S FROM  TblPersGhozat where CodeMelli = @codeMelli)", paramB3);
            if (drBazras3.Read())
                lblBazras3.Text = drBazras3["N"].ToString() + " " + drBazras3["F"].ToString() + "   -   " + drBazras3["S"].ToString();

            //-------------------------------------------------------
            lblINSDate2.Text = dr["SalINS"].ToString() + "/" + dr["MahINS"].ToString() + "/" + dr["RoozINS"].ToString();
        

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
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx?code="+kode);
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = Panel1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe');</script>");

    }



    protected void btnReturn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx?code=" + kode);
    }
}
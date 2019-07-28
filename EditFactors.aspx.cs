using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class EditFactors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            if(Value.TopValue("ddlAzaINS")<10)
                lblAzaINSValue.Text =0 + (Value.TopValue("ddlAzaINS")+1).ToString();
            else
                lblAzaINSValue.Text =(Value.TopValue("ddlAzaINS") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlSaatHozoor") < 10)
                lblSaatHozoorValue.Text = 0 + (Value.TopValue("ddlSaatHozoor") + 1).ToString();
            else
                lblSaatHozoorValue.Text = (Value.TopValue("ddlSaatHozoor") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlPardakht") < 10)
                lblPardakhtValue.Text = 0 + (Value.TopValue("ddlPardakht") + 1).ToString();
            else
                lblPardakhtValue.Text = (Value.TopValue("ddlPardakht") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlDastoor") < 10)
                lblDastoorValue.Text = 0 + (Value.TopValue("ddlDastoor") + 1).ToString();
            else
                lblDastoorValue.Text = (Value.TopValue("ddlDastoor") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlSolh") < 10)
                lblSolhValue.Text = 0 + (Value.TopValue("ddlSolh") + 1).ToString();
            else
                lblSolhValue.Text = (Value.TopValue("ddlSolh") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlEstelamat") < 10)
                lblEstelamatValue.Text = 0 + (Value.TopValue("ddlEstelamat") + 1).ToString();
            else
                lblEstelamatValue.Text = (Value.TopValue("ddlEstelamat") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlTasmim") < 10)
                lblTasmimValue.Text = 0 + (Value.TopValue("ddlTasmim") + 1).ToString();
            else
                lblTasmimValue.Text = (Value.TopValue("ddlTasmim") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlEblagh") < 10)
                lblEblaghValue.Text = 0 + (Value.TopValue("ddlEblagh") + 1).ToString();
            else
                lblEblaghValue.Text = (Value.TopValue("ddlEblagh") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlSooratJalaseh") < 10)
                lblSooratJalasehValue.Text = 0 + (Value.TopValue("ddlSooratJalaseh") + 1).ToString();
            else
                lblSooratJalasehValue.Text = (Value.TopValue("ddlSooratJalaseh") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlIradat") < 10)
                lblIradatValue.Text = 0 + (Value.TopValue("ddlIradat") + 1).ToString();
            else
                lblIradatValue.Text = (Value.TopValue("ddlIradat") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlTari") < 10)
                lblTariValue.Text = 0 + (Value.TopValue("ddlTari") + 1).ToString();
            else
                lblTariValue.Text = (Value.TopValue("ddlTari") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlMashverat") < 10)
                lblMashveratValue.Text = 0 + (Value.TopValue("ddlMashverat") + 1).ToString();
            else
                lblMashveratValue.Text = (Value.TopValue("ddlMashverat") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlMadeh") < 10)
                lblMadehValue.Text = 0 + (Value.TopValue("ddlMadeh") + 1).ToString();
            else
                lblMadehValue.Text = (Value.TopValue("ddlMadeh") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlNazm") < 10)
                lblNazmValue.Text = 0 + (Value.TopValue("ddlNazm") + 1).ToString();
            else
                lblNazmValue.Text = (Value.TopValue("ddlNazm") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlTakhliyeh") < 10)
                lblTakhliyehValue.Text = 0 + (Value.TopValue("ddlTakhliyeh") + 1).ToString();
            else
                lblTakhliyehValue.Text = (Value.TopValue("ddlTakhliyeh") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlEjraei") < 10)
                lblEjraeiValue.Text = 0 + (Value.TopValue("ddlEjraei") + 1).ToString();
            else
                lblEjraeiValue.Text = (Value.TopValue("ddlEjraei") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlPErjaei") < 10)
                lblPErjaeiValue.Text = 0 + (Value.TopValue("ddlPErjaei") + 1).ToString();
            else
                lblPErjaeiValue.Text = (Value.TopValue("ddlPErjaei") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlEslahi") < 10)
                lblEslahiValue.Text = 0 + (Value.TopValue("ddlEslahi") + 1).ToString();
            else
                lblEslahiValue.Text = (Value.TopValue("ddlEslahi") + 1).ToString();
            //-------------------------------
            if (Value.TopValue("ddlResidegi") < 10)
                lblResidegiValue.Text = 0 + (Value.TopValue("ddlResidegi") + 1).ToString();
            else
                lblResidegiValue.Text = (Value.TopValue("ddlResidegi") + 1).ToString();
        }

    }

    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }

    protected void btnAzaINSInsert_Click(object sender, EventArgs e)
    {
        if(txtAzaINSTitle.Text!= "")
        Value.InsertValues(lblAzaINSID.Text, lblAzaINSValue.Text, txtAzaINSTitle.Text);
        txtAzaINSTitle.Text = "";
        GridView2.DataBind();
        //Response.Redirect("Editfactors.aspx");
    }

    protected void btnAzaINSCancel_Click(object sender, EventArgs e)
    {
        txtAzaINSTitle.Text = "";
    }

    protected void btnSaatHozoorInsert_Click(object sender, EventArgs e)
    {
        if (txtSaatHozoorTitle.Text != "")
            Value.InsertValues(lblSaatHozoorID.Text, lblSaatHozoorValue.Text, txtSaatHozoorTitle.Text);
        txtSaatHozoorTitle.Text = "";
        GridView4.DataBind();
        //Response.Redirect("Editfactors.aspx");
    }

    protected void btnSaatHozoorCancel_Click(object sender, EventArgs e)
    {
        txtSaatHozoorTitle.Text = "";
    }

    protected void btnPardakhtInsert_Click(object sender, EventArgs e)
    {
        if (txtPardakhtTitle.Text != "")
            Value.InsertValues(lblPardakhtID.Text, lblPardakhtValue.Text, txtPardakhtTitle.Text);
        txtPardakhtTitle.Text = "";
        GridView5.DataBind();
        //Response.Redirect("Editfactors.aspx");
    }

    protected void btnPardakhtCancel_Click(object sender, EventArgs e)
    {
        txtPardakhtTitle.Text = "";
    }

    protected void btnDastoorInsert_Click(object sender, EventArgs e)
    {
        if (txtDastoorTitle.Text != "")
            Value.InsertValues(lblDastoorID.Text, lblDastoorValue.Text, txtDastoorTitle.Text);
        txtDastoorTitle.Text = "";
        GridView6.DataBind();
    }

    protected void btnDastoorCancel_Click(object sender, EventArgs e)
    {
        txtDastoorTitle.Text = "";
    }

    protected void btnSolhInsert_Click(object sender, EventArgs e)
    {
        if (txtSolhTitle.Text != "")
            Value.InsertValues(lblSolhID.Text, lblSolhValue.Text, txtSolhTitle.Text);
        txtSolhTitle.Text = "";
        GridView1.DataBind();
    }

    protected void btnSolhCancel_Click(object sender, EventArgs e)
    {
        txtSolhTitle.Text = "";
    }

    protected void btnEstelamatInsert_Click(object sender, EventArgs e)
    {
        if (txtEstelamatTitle.Text != "")
            Value.InsertValues(lblEstelamatID.Text, lblEstelamatValue.Text, txtEstelamatTitle.Text);
        txtEstelamatTitle.Text = "";
        GridView3.DataBind();
    }

    protected void btnEstelamatCancel_Click(object sender, EventArgs e)
    {
        txtEstelamatTitle.Text = "";
    }

    protected void btnTasmimInsert_Click(object sender, EventArgs e)
    {
        if (txtTasmimTitle.Text != "")
            Value.InsertValues(lblTasmimID.Text, lblTasmimValue.Text, txtTasmimTitle.Text);
        txtTasmimTitle.Text = "";
        GridView7.DataBind();
    }

    protected void btnTasmimCancel_Click(object sender, EventArgs e)
    {
        txtTasmimTitle.Text = "";
    }

    protected void btnEblaghInsert_Click(object sender, EventArgs e)
    {
        if (txtEblaghTitle.Text != "")
            Value.InsertValues(lblEblaghID.Text, lblEblaghValue.Text, txtEblaghTitle.Text);
        txtEblaghTitle.Text = "";
        GridView8.DataBind();
    }

    protected void btnEblaghCancel_Click(object sender, EventArgs e)
    {
        txtEblaghTitle.Text = "";
    }

    protected void btnSooratJalasehInsert_Click(object sender, EventArgs e)
    {
        if (txtSooratJalasehTitle.Text != "")
            Value.InsertValues(lblSooratJalasehID.Text, lblSooratJalasehValue.Text, txtSooratJalasehTitle.Text);
        txtSooratJalasehTitle.Text = "";
        GridView9.DataBind();
    }

    protected void btnSooratJalasehCancel_Click(object sender, EventArgs e)
    {
        txtSooratJalasehTitle.Text = "";
    }

    protected void btnIradatInsert_Click(object sender, EventArgs e)
    {
        if (txtIradatTitle.Text != "")
            Value.InsertValues(lblIradatID.Text, lblIradatValue.Text, txtIradatTitle.Text);
        txtIradatTitle.Text = "";
        GridView10.DataBind();
    }

    protected void btnIradatCancel_Click(object sender, EventArgs e)
    {
        txtIradatTitle.Text = "";
    }

    protected void btnTariInsert_Click(object sender, EventArgs e)
    {
        if (txtTariTitle.Text != "")
            Value.InsertValues(lblTariID.Text, lblTariValue.Text, txtTariTitle.Text);
        txtTariTitle.Text = "";
        GridView11.DataBind();
    }

    protected void btnTariCancel_Click(object sender, EventArgs e)
    {
        txtTariTitle.Text = "";
    }

    protected void btnMashveratInsert_Click(object sender, EventArgs e)
    {
        if (txtMashveratTitle.Text != "")
            Value.InsertValues(lblMashveratID.Text, lblMashveratValue.Text, txtMashveratTitle.Text);
        txtMashveratTitle.Text = "";
        GridView12.DataBind();
    }

    protected void btnMashveratCancel_Click(object sender, EventArgs e)
    {
        txtMashveratTitle.Text = "";
    }

    protected void btnMadehInsert_Click(object sender, EventArgs e)
    {
        if (txtMadehTitle.Text != "")
            Value.InsertValues(lblMadehID.Text, lblMadehValue.Text, txtMadehTitle.Text);
        txtMadehTitle.Text = "";
        GridView13.DataBind();
    }

    protected void btnMadehCancel_Click(object sender, EventArgs e)
    {
        txtMadehTitle.Text = "";
    }

    protected void btnNazmInsert_Click(object sender, EventArgs e)
    {
        if (txtNazmTitle.Text != "")
            Value.InsertValues(lblNazmID.Text, lblNazmValue.Text, txtNazmTitle.Text);
        txtNazmTitle.Text = "";
        GridView14.DataBind();
    }

    protected void btnNazmCancel_Click(object sender, EventArgs e)
    {
        txtNazmTitle.Text = "";
    }

    protected void btnTakhliyehInsert_Click(object sender, EventArgs e)
    {
        if (txtTakhliyehTitle.Text != "")
            Value.InsertValues(lblTakhliyehID.Text, lblTakhliyehValue.Text, txtTakhliyehTitle.Text);
        txtTakhliyehTitle.Text = "";
        GridView15.DataBind();
    }

    protected void btnTakhliyehCancel_Click(object sender, EventArgs e)
    {
        txtTakhliyehTitle.Text = "";
    }

    protected void btnEjraeiInsert_Click(object sender, EventArgs e)
    {
        if (txtEjraeiTitle.Text != "")
            Value.InsertValues(lblEjraeiID.Text, lblEjraeiValue.Text, txtEjraeiTitle.Text);
        txtEjraeiTitle.Text = "";
        GridView16.DataBind();
    }

    protected void btnEjraeiCancel_Click(object sender, EventArgs e)
    {
        txtEjraeiTitle.Text = "";
    }

    protected void btnPErjaeiInsert_Click(object sender, EventArgs e)
    {
        if (txtPErjaeiTitle.Text != "")
            Value.InsertValues(lblPErjaeiID.Text, lblPErjaeiValue.Text, txtPErjaeiTitle.Text);
        txtPErjaeiTitle.Text = "";
        GridView17.DataBind();
    }

    protected void btnPErjaeiCancel_Click(object sender, EventArgs e)
    {
        txtPErjaeiTitle.Text = "";
    }

    protected void btnddlEslahiInsert_Click(object sender, EventArgs e)
    {
        if (txtEslahiTitle.Text != "")
            Value.InsertValues(lblEslahiID.Text, lblEslahiValue.Text, txtEslahiTitle.Text);
        txtEslahiTitle.Text = "";
        GridView18.DataBind();
    }

    protected void btnEslahiCancel_Click(object sender, EventArgs e)
    {
        txtEslahiTitle.Text = "";
    }

    protected void btnResidegiInsert_Click(object sender, EventArgs e)
    {
        if (txtResidegiTitle.Text != "")
            Value.InsertValues(lblResidegiID.Text, lblResidegiValue.Text, txtResidegiTitle.Text);
        txtResidegiTitle.Text = "";
        GridView19.DataBind();
    }

    protected void btnResidegiCancel_Click(object sender, EventArgs e)
    {
        txtResidegiTitle.Text = "";
    }

    protected void btnReturn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
}
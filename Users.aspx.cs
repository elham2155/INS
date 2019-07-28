using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users : System.Web.UI.Page
{
    public static string kode;
    protected void Page_Load(object sender, EventArgs e)
    {
        kode = Request.QueryString["code"];
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void btnReturn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx?code=" + kode);
    }

    protected void btnUsrInsert_Click(object sender, EventArgs e)
    {
        string t1, t2, t3, c;
        t1 = t2 = t3 = c = " ";
        //---------------------------------
        SqlDataReader drUser;
        drUser = DB.ExecuteReader("SELECT max(Code) as id FROM [Shoora].[dbo].[TblUser]");
        if (drUser.Read())
            c = drUser["id"].ToString();
        //---------------------------------
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("@Code", int.Parse(c) + 1);
        param.Add("@Name", txtName.Text);
        param.Add("@Password", txtPassword.Text);
        param.Add("@Markaz", ddlMarkaz.SelectedValue);
        switch (rblAccess.SelectedValue)
        {
            case "1":
                {
                    t1 = "1";
                    t2 = t3 = "0"; break;
                }
            case "2":
                {
                    t2 = "1";
                    t1 = t3 = "0"; break;
                }
            case "3":
                {
                    t3 = "1";
                    t1 = t2 = "0"; break;
                }
            default: break;
        }
        param.Add("@tag51", t1);
        param.Add("@tag52", t2);
        param.Add("@tag53", t3);

        DB.ExecuteNonQuery("INSERT INTO TblUser (Code,name,password,markaz,tag51,tag52,tag53) values (@Code,@Name,@Password,@Markaz,@tag51,@tag52,@tag53)", param);
        Response.Redirect("Users.aspx");
    }

    protected void btnUsrCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Users.aspx");        
    }
}
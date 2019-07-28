<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style3 {
            width: 60%;
        }
        .auto-style5 {
            text-align: right;
        }
        .auto-style4 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="Label2" runat="server" Text="کاربران سیستم" CssClass="labelTitle"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="btnReturn" runat="server" CssClass="label" OnClick="btnReturn_Click" Text="بازگشت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Code], [Name],[password], [Markaz], [Tag51], [Tag52], [Tag53] FROM [TblUser] WHERE (([Tag51]=1) OR ([Tag52]=1) OR ([Tag53]=1)) ORDER BY [Markaz]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="labelItems" PageSize="20" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="کد کاربر" SortExpression="Code" />
                        <asp:BoundField DataField="Name" HeaderText="نام کاربري" SortExpression="Name" />
                        <asp:BoundField DataField="password" HeaderText="رمز عبور" SortExpression="password" />
                        <asp:BoundField DataField="Markaz" HeaderText="کد استان" SortExpression="Markaz" />
                        <asp:BoundField DataField="Tag51" HeaderText="کارشناس استان" SortExpression="Tag51" />
                        <asp:BoundField DataField="Tag52" HeaderText="کارشناس بازرسي" SortExpression="Tag52" />
                        <asp:BoundField DataField="Tag53" HeaderText="ادمين مرکز" SortExpression="Tag53" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; ">
                            <table align="right" class="auto-style3" dir="rtl" __designer:mapid="110">
                                <tr __designer:mapid="111">
                                    <td class="auto-style5" __designer:mapid="112" colspan="2">
                                        <asp:Label ID="Label6" runat="server" CssClass="labelTitle" Text="تعریف کاربر جدید"></asp:Label>
                                    </td>
                                </tr>
                                <tr __designer:mapid="127">
                                    <td class="auto-style5" __designer:mapid="128">
                                        <asp:Label ID="Label3" runat="server" CssClass="labelItemsRTL" Text="نام کاربری: "></asp:Label>
                                    </td>
                                    <td class="auto-style4" __designer:mapid="129">
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr __designer:mapid="116">
                                    <td class="auto-style5" __designer:mapid="117">
                                        <asp:Label ID="Label4" runat="server" CssClass="labelItemsRTL" Text="رمز عبور: "></asp:Label>
                                    </td>
                                    <td class="auto-style4" __designer:mapid="119">
                                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr __designer:mapid="11b">
                                    <td class="auto-style5" __designer:mapid="11c">
                                        <asp:Label ID="Label5" runat="server" CssClass="labelItemsRTL" Text="مرکز: "></asp:Label>
                                    </td>
                                    <td class="auto-style4" __designer:mapid="11e">
                                        <asp:DropDownList ID="ddlMarkaz" runat="server" CssClass="labelItemsRTL">
                                            <asp:ListItem>---</asp:ListItem>
                                            <asp:ListItem Value=" "> مرکز شورا</asp:ListItem>
                                            <asp:ListItem Value="11">آذربایجان شرقی</asp:ListItem>
                                            <asp:ListItem Value="12">آذربايجان غربي</asp:ListItem>
                                            <asp:ListItem Value="13">اردبيل</asp:ListItem>
                                            <asp:ListItem Value="14">اصفهان</asp:ListItem>
                                            <asp:ListItem Value="15">البرز</asp:ListItem>
                                            <asp:ListItem Value="16">ايلام</asp:ListItem>
                                            <asp:ListItem Value="17">بوشهر</asp:ListItem>
                                            <asp:ListItem Value="18">تهران</asp:ListItem>
                                            <asp:ListItem Value="19">چهارمحال و بختياري</asp:ListItem>
                                            <asp:ListItem Value="20">خراسان جنوبي</asp:ListItem>
                                            <asp:ListItem Value="21">خراسان رضوي</asp:ListItem>
                                            <asp:ListItem Value="22">خراسان شمالي</asp:ListItem>
                                            <asp:ListItem Value="23">خوزستان</asp:ListItem>
                                            <asp:ListItem Value="24">زنجان</asp:ListItem>
                                            <asp:ListItem Value="25">سمنان</asp:ListItem>
                                            <asp:ListItem Value="26">سيستان و بلوچستان</asp:ListItem>
                                            <asp:ListItem Value="27">فارس</asp:ListItem>
                                            <asp:ListItem Value="28">قزوين</asp:ListItem>
                                            <asp:ListItem Value="29">قم</asp:ListItem>
                                            <asp:ListItem Value="30">كردستان</asp:ListItem>
                                            <asp:ListItem Value="31">كرمان</asp:ListItem>
                                            <asp:ListItem Value="32">كرمانشاه</asp:ListItem>
                                            <asp:ListItem Value="33">كهگيلويه و بوير احمد</asp:ListItem>
                                            <asp:ListItem Value="34">گلستان</asp:ListItem>
                                            <asp:ListItem Value="35">گيلان</asp:ListItem>
                                            <asp:ListItem Value="36">لرستان</asp:ListItem>
                                            <asp:ListItem Value="37">مازندران</asp:ListItem>
                                            <asp:ListItem Value="38">مركزي</asp:ListItem>
                                            <asp:ListItem Value="39">هرمزگان</asp:ListItem>
                                            <asp:ListItem Value="40">همدان</asp:ListItem>
                                            <asp:ListItem Value="41">يزد</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr __designer:mapid="120">
                                    <td class="auto-style5" __designer:mapid="121" colspan="2">
                                        <asp:RadioButtonList ID="rblAccess" runat="server" CssClass="labelItemsRTL">
                                            <asp:ListItem Value="1">ورود اطلاعات، ویرایش، گزارش (کارشناس استان)</asp:ListItem>
                                            <asp:ListItem Value="2">گزارش های ویژه (کارشناس اداره بازرسی)</asp:ListItem>
                                            <asp:ListItem Value="3">مدیریت سامانه ( ادمین مرکز)</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr __designer:mapid="123">
                                    <td class="auto-style5" __designer:mapid="124" colspan="2">
                                        <asp:Button ID="btnUsrInsert" runat="server" CssClass="label" OnClick="btnUsrInsert_Click" Text="ثبت" />
&nbsp;<asp:Button ID="btnUsrCancel" runat="server" CssClass="label" OnClick="btnUsrCancel_Click" Text="انصراف" />
&nbsp;<asp:Label ID="msg" runat="server" CssClass="labelItems" ForeColor="Maroon"></asp:Label>
                                    </td>
                                </tr>
                                </table>
                            <br />
                        </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                            <asp:Button ID="btnReturn2" runat="server" CssClass="label" OnClick="btnReturn2_Click" Text="بازگشت" />
                        </td>
        </tr>
    </table>
</asp:Content>


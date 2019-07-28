<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditINSFormReport.aspx.cs" Inherits="EditINSFormReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td>
                <asp:Label ID="Label2" runat="server" Text="ویرایش اطلاعات بازرسی استان ها" CssClass="labelTitle"></asp:Label>
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
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                <asp:Label ID="Label4" runat="server" CssClass="label" Text="نام استان: "></asp:Label>
                        &nbsp;&nbsp;&nbsp;</td>
                        <td style="text-align: right" colspan="3">
                <asp:DropDownList ID="ddlOstan" runat="server" CssClass="label2">
                </asp:DropDownList>
                            <asp:Button ID="btnOstan" runat="server" CssClass="label" OnClick="btnOstan_Click" Text="تایید" />
&nbsp;<asp:Label ID="lblOstan" runat="server" CssClass="label2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                <asp:Label ID="Label5" runat="server" CssClass="label" Text="نام شهر: "></asp:Label>
                        </td>
                        <td style="text-align: right">
                <asp:DropDownList ID="ddlShahr" runat="server" CssClass="label2">
                </asp:DropDownList>
                            <asp:Button ID="btnShahr" runat="server" CssClass="label" OnClick="btnShahr_Click" Text="تایید" />
                        &nbsp;<asp:Label ID="lblShahr" runat="server" CssClass="label2"></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:Label ID="Label8" runat="server" CssClass="label" Text="حوزه قضائی: "></asp:Label>
                            &nbsp;&nbsp;</td>
                        <td style="text-align: right">
                <asp:DropDownList ID="ddlHouzeh" runat="server" CssClass="label2">
                </asp:DropDownList>
                            <asp:Button ID="btnHouzeh" runat="server" CssClass="label" OnClick="btnHouzeh_Click" Text="تایید" />
                            &nbsp;<asp:Label ID="lblHouzeh" runat="server" CssClass="label2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                <asp:Label ID="Label6" runat="server" CssClass="label" Text="نام شعبه: "></asp:Label>
                        &nbsp;&nbsp;</td>
                        <td style="text-align: right">
                <asp:DropDownList ID="ddlShobeh" runat="server" CssClass="label2">
                </asp:DropDownList>
                            <asp:Button ID="btnShobeh" runat="server" CssClass="label" OnClick="btnShobeh_Click" Text="تایید" />
&nbsp;<asp:Label ID="lblShobeh" runat="server" CssClass="label2"></asp:Label>
                        </td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                <asp:Label ID="Label7" runat="server" CssClass="label" Text="از تاریخ: "></asp:Label>
                        </td>
                        <td style="text-align: right">
                <asp:DropDownList ID="ddlMonth1" runat="server" CssClass="label2" Visible="False">
                    <asp:ListItem Value="00">-----</asp:ListItem>
                    <asp:ListItem Value="01">فروردین</asp:ListItem>
                    <asp:ListItem Value="02">اردیبهشت</asp:ListItem>
                    <asp:ListItem Value="03">خرداد</asp:ListItem>
                    <asp:ListItem Value="04">تیر</asp:ListItem>
                    <asp:ListItem Value="05">مرداد</asp:ListItem>
                    <asp:ListItem Value="06">شهریور</asp:ListItem>
                    <asp:ListItem Value="07">مهر</asp:ListItem>
                    <asp:ListItem Value="08">آبان</asp:ListItem>
                    <asp:ListItem Value="09">آذر</asp:ListItem>
                    <asp:ListItem Value="10">دی</asp:ListItem>
                    <asp:ListItem Value="11">بهمن</asp:ListItem>
                    <asp:ListItem Value="12">اسفند</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlYear1" runat="server" CssClass="label2">
                    <asp:ListItem Selected="True" Value="00">-----</asp:ListItem>
                    <asp:ListItem>1395</asp:ListItem>
                    <asp:ListItem>1396</asp:ListItem>
                    <asp:ListItem>1397</asp:ListItem>
                    <asp:ListItem>1398</asp:ListItem>
                    <asp:ListItem>1399</asp:ListItem>
                    <asp:ListItem>1400</asp:ListItem>
                </asp:DropDownList>
                        </td>
                        <td style="text-align: right"> <asp:Label ID="Label3" runat="server" CssClass="label" Text="تا تاریخ: "></asp:Label>
                        </td>
                        <td style="text-align: right"> 
                <asp:DropDownList ID="ddlMonth2" runat="server" CssClass="label2" Visible="False">
                     <asp:ListItem Value="00">-----</asp:ListItem>
                    <asp:ListItem Value="01">فروردین</asp:ListItem>
                    <asp:ListItem Value="02">اردیبهشت</asp:ListItem>
                    <asp:ListItem Value="03">خرداد</asp:ListItem>
                    <asp:ListItem Value="04">تیر</asp:ListItem>
                    <asp:ListItem Value="05">مرداد</asp:ListItem>
                    <asp:ListItem Value="06">شهریور</asp:ListItem>
                    <asp:ListItem Value="07">مهر</asp:ListItem>
                    <asp:ListItem Value="08">آبان</asp:ListItem>
                    <asp:ListItem Value="09">آذر</asp:ListItem>
                    <asp:ListItem Value="10">دی</asp:ListItem>
                    <asp:ListItem Value="11">بهمن</asp:ListItem>
                    <asp:ListItem Value="12">اسفند</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlYear2" runat="server" CssClass="label2">
                    <asp:ListItem Selected="True" Value="00">-----</asp:ListItem>
                    <asp:ListItem>1395</asp:ListItem>
                    <asp:ListItem>1396</asp:ListItem>
                    <asp:ListItem>1397</asp:ListItem>
                    <asp:ListItem>1398</asp:ListItem>
                    <asp:ListItem>1399</asp:ListItem>
                    <asp:ListItem>1400</asp:ListItem>
                </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;"><asp:Button ID="btnShow" runat="server" CssClass="label" Text="نمایش اطلاعات" OnClick="btnShow_Click" />
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Bold="True" Font-Names="B Nazanin" Width="100%">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="کد بازرسی" DataNavigateUrlFormatString="ViewEditINSForm.aspx?کد بازرسی={0}" Text="اطلاعات بیشتر" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#000066" HorizontalAlign="Left" BackColor="White" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnReturn2" runat="server" CssClass="label" Text="بازگشت" OnClick="btnReturn2_Click" />
            </td>
        </tr>
    </table>
</asp:Content>


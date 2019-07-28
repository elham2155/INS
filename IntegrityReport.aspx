<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IntegrityReport.aspx.cs" Inherits="IntegrityReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />

    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="Label2" runat="server" CssClass="labelTitle" Text="گزارش تجمیعی فرم های بازرسی"></asp:Label>
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
                        <td style="text-align: right" colspan="3">&nbsp;<asp:Label ID="Label5" runat="server" Text="نام استان: " CssClass="label"></asp:Label>
                            <asp:DropDownList ID="ddlOstan" runat="server" CssClass="label2">
                </asp:DropDownList>
                            &nbsp;<asp:Button ID="btnOstan" runat="server" CssClass="label" OnClick="btnOstan_Click" Text="تایید" />
&nbsp;<asp:Label ID="lblOstan" runat="server" CssClass="label" ForeColor="#3A4D52"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblCodeostan" runat="server"></asp:Label>
                            </td>
                        <td style="text-align: left" colspan="3">
                            <asp:Label ID="lblRecordCount" runat="server" CssClass="label" ForeColor="Maroon"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                <asp:Label ID="Label4" runat="server" CssClass="label" Text="نام شهر: "></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="ddlShahr" runat="server" CssClass="label" TabIndex="1">
                </asp:DropDownList>
                        </td>
                        <td style="text-align: left" colspan="2">
                            <asp:Label ID="Label7" runat="server" CssClass="label" Text="سال بازرسی: "></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="ddlSalINS" runat="server" CssClass="label2" TabIndex="33">
                    <asp:ListItem Value="00">-----</asp:ListItem>
                    <asp:ListItem>1395</asp:ListItem>
                    <asp:ListItem>1396</asp:ListItem>
                    <asp:ListItem>1397</asp:ListItem>
                    <asp:ListItem>1398</asp:ListItem>
                    <asp:ListItem>1399</asp:ListItem>
                    <asp:ListItem>1400</asp:ListItem>
                </asp:DropDownList>
&nbsp; <asp:Button ID="btnShahr" runat="server" CssClass="label" TabIndex="2" Text="مشاهده اطلاعات" OnClick="btnShahr_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                <asp:Label ID="Label6" runat="server" CssClass="label" Text="نام حوزه قضائی: "></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="ddlHouzeh" runat="server" CssClass="label" TabIndex="1">
                </asp:DropDownList>
                        </td>
                        <td style="text-align: left" colspan="2">
                            <asp:Label ID="Label8" runat="server" CssClass="label" Text="سال بازرسی: "></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="ddlSalINS0" runat="server" CssClass="label2" TabIndex="33">
                    <asp:ListItem Value="00">-----</asp:ListItem>
                    <asp:ListItem>1395</asp:ListItem>
                    <asp:ListItem>1396</asp:ListItem>
                    <asp:ListItem>1397</asp:ListItem>
                    <asp:ListItem>1398</asp:ListItem>
                    <asp:ListItem>1399</asp:ListItem>
                    <asp:ListItem>1400</asp:ListItem>
                </asp:DropDownList>
&nbsp; <asp:Button ID="btnHouzeh" runat="server" CssClass="label" TabIndex="2" Text="مشاهده اطلاعات" OnClick="btnHouzeh_Click"  />
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="btnPrint" runat="server" CssClass="label" Text="پرینت فرم" OnClick="btnPrint_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Panel ID="Panel1" runat="server">
                     <style type="text/css">
                         .auto-style2 {
                             align-items:center;
                             font-family:'B Nazanin';
                             font-size:small;    
                             align-content:center;                         
                         }
                     </style>
                    <table align="center" class="auto-style2" dir="rtl">
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Medium" Text="نام شهر / حوزه قضائی : "></asp:Label>
                                <asp:Label ID="lblShahrPrint" runat="server" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Medium" ForeColor="#3A4D52"></asp:Label>
                            </td>
                            <td style="text-align: right">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Medium" Text="سال بازرسی : "></asp:Label>
                                &nbsp;<asp:Label ID="lblSalPrint" runat="server" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Medium" ForeColor="#3A4D52"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center" class="auto-style2">
                                <asp:GridView ID="GridView1" runat="server" class="auto-style2" Font-Names="B Nazanin" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Justify" BorderColor="#666666">
                                    <HeaderStyle BackColor="#A6C4C4" BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        </table>
</asp:Content>


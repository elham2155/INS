<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">

        .auto-style3 {
            width: 925px;
        }
        .auto-style4 {
            height: 147px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: right;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td>
                <asp:Label ID="Label2" runat="server" Text="گزارش های بازرسی" CssClass="labelTitle"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="btnReturn" runat="server" CssClass="label" OnClick="btnReturn_Click" Text="بازگشت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">    <table align="center" class="auto-style3" dir="rtl">
        <tr>
            <td style="text-align: center" class="auto-style4">
                <asp:ImageButton ID="imgBtnDLForm" runat="server" Height="120px" ImageUrl="~/Images/r4-1.png" OnClick="imgBtnDLForm_Click" />
            </td>
            <td style="text-align: center" class="auto-style4">
                <asp:ImageButton ID="imgBtnForms" runat="server" ImageUrl="~/Images/r1-1.png" OnClick="imgBtnForms_Click" Height="120px" />
            </td>
            <td style="text-align: center" class="auto-style4">
                </td>
        </tr>
        <tr>
            <td style="text-align: center">
&nbsp;&nbsp;
&nbsp;&nbsp;<asp:ImageButton ID="imgBtnShoab" runat="server" ImageUrl="~/Images/r2-1.png" Height="120px" OnClick="imgBtnShoab_Click" />
                &nbsp;
                &nbsp;&nbsp;</td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnCenter" runat="server" ImageUrl="~/Images/r3-1.png" Height="120px" OnClick="imgBtnCenter_Click" />
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnManager" runat="server" Height="120px" ImageUrl="~/Images/r5-1.png" style="text-align: center" />
            </td>
        </tr>
    </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">&nbsp;</td>
        </tr>
    </table>
</asp:Content>


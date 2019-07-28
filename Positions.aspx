<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Positions.aspx.cs" Inherits="Positions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">

        .auto-style3 {
            width: 925px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style2" dir="rtl" >
        <tr>
            <td style="border: thin double #808080; text-align: right;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" CssClass="labelTitle" Text="فرم تایید شهر و شعبه بازرسی شده"></asp:Label>
                        </td>
                        <td>
                <asp:Label ID="lblMsg" runat="server" CssClass="label" ForeColor="#993333"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
    <table align="center" class="auto-style3" dir="rtl">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="نام استان: " CssClass="label"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlOstan" runat="server" CssClass="label2">
                </asp:DropDownList>
                            &nbsp;<asp:Button ID="btnOstan" runat="server" CssClass="label" OnClick="btnOstan_Click" Text="تایید" />
&nbsp;<asp:Label ID="lblOstan" runat="server" CssClass="label" ForeColor="#3A4D52"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" CssClass="label" Text="نام شهر: "></asp:Label>
            &nbsp;&nbsp;
                <asp:DropDownList ID="ddlShahr" runat="server" CssClass="label" TabIndex="1">
                </asp:DropDownList>
&nbsp;<asp:Button ID="btnShahr" runat="server" CssClass="label" TabIndex="2" Text="تایید شهر" OnClick="btnShahr_Click" />
&nbsp;<asp:Label ID="lblShahr" runat="server" CssClass="label" ForeColor="#3A4D52"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" CssClass="label" Text="نام شعبه: "></asp:Label>
            &nbsp;
                <asp:DropDownList ID="ddlShobeh" runat="server" CssClass="label" TabIndex="3">
                </asp:DropDownList>
&nbsp;<asp:Button ID="btnShobeh" runat="server" CssClass="label" TabIndex="4" Text="تایید شعبه" OnClick="btnShobeh_Click" />
&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl1" runat="server" CssClass="label" Text="شعبه: "></asp:Label>
&nbsp;<asp:Label ID="lblShobeh" runat="server" CssClass="label" ForeColor="#3A4D52"></asp:Label>
            &nbsp;<asp:Label ID="lbl2" runat="server" Text="-"></asp:Label>
&nbsp;<asp:Label ID="lbl3" runat="server" CssClass="label" Text="کد شعبه: "></asp:Label>
&nbsp;<asp:Label ID="lblCodeShobeh" runat="server" CssClass="label2"></asp:Label>
&nbsp;<asp:Label ID="lbl4" runat="server" Text="-"></asp:Label>
&nbsp;<asp:Label ID="lbl5" runat="server" CssClass="label" Text="مکان: "></asp:Label>
&nbsp;<asp:Label ID="lblAddress" runat="server" CssClass="label2"></asp:Label>
            </td>
        </tr>
        </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnForm" runat="server" CssClass="label" TabIndex="5" Text="ورود به فرم بازرسی" OnClick="btnForm_Click" />
&nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="label" TabIndex="6" Text="بازگشت" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
</asp:Content>


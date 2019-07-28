<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style3 {
            width: 925px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                <asp:Label ID="Label2" runat="server" Text="مدیریت اطلاعات سیستم بازرسی" CssClass="labelTitle"></asp:Label>
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
    <table align="center" class="auto-style3" dir="rtl">
        <tr >
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnFactors" runat="server" ImageUrl="~/Images/EditFactors.png" OnClick="imgBtnFactors_Click" Width="250px" />
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnForm" runat="server" ImageUrl="~/Images/EditForm.png" style="text-align: center" OnClick="imgBtnForm_Click" Width="250px" />
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnLog" runat="server" ImageUrl="~/Images/SystemLog.png" OnClick="imgBtnLog_Click" Width="250px" />
            </td>
        </tr>
        <tr >
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnDelete" runat="server" ImageUrl="~/Images/DeleteInfo.png" Width="250px" OnClick="imgBtnDelete_Click" />
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnCenter" runat="server" ImageUrl="~/Images/EditCenter.png" Width="250px" />
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgBtnUsers" runat="server" ImageUrl="~/Images/Users.png" Width="250px" OnClick="imgBtnUsers_Click" />
            </td>
        </tr>
        </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                &nbsp;</td>
        </tr>
    </table>
    <link href="StyleSheet.css" rel="stylesheet" />
    </asp:Content>


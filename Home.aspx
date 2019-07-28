<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 925px;
        }
        .auto-style3 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style2" dir="rtl">
    <tr>
        <td style="text-align: center">
            <asp:ImageButton ID="imgBtnInsert" runat="server" Height="110px" ImageUrl="~/Images/Forms.png" OnClick="imgBtnInsert_Click" Width="250px" style="text-align: right" />
        </td>
        <td style="text-align: center">
            <asp:ImageButton ID="imgBtnAdmin" runat="server" Height="110px" ImageUrl="~/Images/Admin.png" Width="250px" OnClick="imgBtnAdmin_Click" />
        </td>
        <td rowspan="3" style="text-align: center">
            <table align="center" class="auto-style3" dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="lblUser" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#666633"></asp:Label>
                    &nbsp;<asp:Label ID="lblCodeOstan" runat="server" Font-Names="Gabriola" ForeColor="#666633"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Body1.png" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:ImageButton ID="imgBtnReport" runat="server" Height="110px" ImageUrl="~/Images/Report.png" Width="250px" OnClick="imgBtnReport_Click" style="text-align: right" />
        </td>
        <td style="text-align: center">
            <asp:ImageButton ID="imgBtnHelp" runat="server" Height="110px" ImageUrl="~/Images/Help.png" Width="250px" style="text-align: right" OnClick="imgBtnHelp_Click" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:ImageButton ID="imgBtnCenter" runat="server" Height="110px" ImageUrl="~/Images/Center.png" Width="250px" OnClick="imgBtnCenter_Click" />
        </td>
        <td style="text-align: center">
            <asp:ImageButton ID="imgBtnExit" runat="server" Height="110px" ImageUrl="~/Images/Exit.png" Width="250px" OnClick="imgBtnExit_Click" />
        </td>
    </tr>
</table>
</asp:Content>


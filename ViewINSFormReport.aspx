<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewINSFormReport.aspx.cs" Inherits="ViewINSFormReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style6 {
            width: 224px;
        }
            
        .auto-style3 {
            width: 925px;
        }
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            height: 31px;
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
                            <asp:Label ID="Label2" runat="server" Text="مشاهده اطلاعات بازرسی" CssClass="labelTitle"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="btnPrint" runat="server" CssClass="label" OnClick="btnPrint_Click" Text="چاپ فرم بازرسی" />
                        &nbsp;&nbsp;
                            <asp:Button ID="btnReturn" runat="server" CssClass="label" OnClick="btnReturn_Click" Text="بازگشت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Panel ID="Panel1" runat="server">
                     <style type="text/css">
                         .auto-style1 {
                             width:925px;
                             font-family:'B Nazanin';
                             font-size:large;
                         }
                     </style>
                    <table align="center" class="auto-style1" dir="rtl">
                        <tr>
                            <td style="border: thin double #808080; text-align: center;">
                                <table align="center" class="auto-style1" dir="rtl">
                                    <tr>
                                        <td class="auto-style6" style="text-align: right">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="Label75" runat="server" Text="معاونت قضائی" Font-Bold="True"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label76" runat="server"  Text="اداره کل بازرسی، نظارت و ارزشیابی" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image2"  runat="server" Height="100px" ImageUrl="~/Images/ShoraArm.jpg" />
                                            <br />
                                            <asp:Label ID="Label77" runat="server"  Text="مرکز امور شوراهاي حل اختلاف" Font-Bold="True" Font-Size="Small"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label80" runat="server"  Text="فرم بازرسی از شعب شوراهای حل اختلاف" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label79" runat="server"  Text="تاریخ بازرسی : " Font-Bold="True"></asp:Label>
                                            &nbsp;<asp:Label ID="lblBazrastDate" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label95" runat="server" Font-Bold="True" Font-Names="B Nazanin" Text="تاریخ ثبت : "></asp:Label>
                                            &nbsp;<asp:Label ID="lblSabtDate" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: thin double #808080; text-align: center;">
                                <table align="center" class="auto-style1" dir="rtl" >
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label69" runat="server" Text="استان: " Font-Bold="True" ></asp:Label>
                                            <asp:Label ID="lblOstan" runat="server" Font-Bold="True" Font-Names="B Nazanin" Font-Overline="False" ForeColor="#3A4D52" Font-Size="Large"></asp:Label>
                                        </td>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label3" runat="server" Text="شهر: " Font-Bold="True" ></asp:Label>
                                            <asp:Label ID="lblShahr" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52" Font-Size="Large"></asp:Label>
                                        </td>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label38" runat="server"  Text="شعبه: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblShobeh" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label68" runat="server"  Text="نوع شعبه: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblNoeShobeh" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label70" runat="server" Text="حوزه قضائی: " Font-Bold="True" ></asp:Label>
                                            <asp:Label ID="lblHozeh" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                                        </td>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label71" runat="server" Text="کد مجتمع: " Font-Bold="True" ></asp:Label>
                                            <asp:Label ID="lblMojtama" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                                        </td>
                                        <td colspan="2" style="text-align: right">
                                            <asp:Label ID="Label67" runat="server"  Text="نام مجتمع: " Font-Bold="True"></asp:Label>
                                            &nbsp;<asp:Label ID="lblMojtamaName" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52" ></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table align="center" class="auto-style1"  dir="rtl" style="border-style: double; border-width: thin; border-color: #808080">
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label7" runat="server" Text="1- مشخصات اعضاء شعبه: " Font-Bold="True"></asp:Label>
                                            &nbsp;<asp:Label ID="msg" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            
                                                        <table id="tblAza" align="center" class="auto-style3" dir="rtl">
                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <table align="center" border="1" class="auto-style1" dir="rtl" style="border-style: solid; border-width: 1px; border-color: #666666; width: 100%;">
                                                                        <tr>
                                                                            <td style="background-color: #999999">&nbsp;</td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label96" runat="server" Text="کد ملی" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label97" runat="server" Text="نام" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label98" runat="server" Text="نام خانوادگی" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label99" runat="server" Text="تاریخ تولد" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label100" runat="server" Text="سمت در شورا" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label101" runat="server" Text="مدرک تحصیلی" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label102" runat="server" Text="رشته تحصیلی" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label103" runat="server" Text="سابقه به ماه" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="background-color: #999999; text-align: center;">
                                                                                <asp:Label ID="Label104" runat="server" Text="وضعیت ابلاغ" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="img1" runat="server" Height="80px" Width="70px" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ozv1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="name1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="family1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="tavalod1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="semat1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="madrak1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="reshteh1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="sabegheh1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="stat1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="img2" runat="server" Height="80px" Width="70px" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ozv2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="name2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="family2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="tavalod2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="semat2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="madrak2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="reshteh2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="sabegheh2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="stat2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="img3" runat="server" Height="80px" Width="70px" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ozv3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="name3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="family3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="tavalod3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="semat3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="madrak3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="reshteh3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="sabegheh3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="stat3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="img4" runat="server" Height="80px" Width="70px" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ozv4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="name4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="family4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="tavalod4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="semat4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="madrak4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="reshteh4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="sabegheh4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="stat4" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="img5" runat="server" Height="80px" Width="70px" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ozv5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="name5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="family5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="tavalod5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="semat5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="madrak5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="reshteh5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="sabegheh5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="stat5" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="img6" runat="server" Height="80px" Width="70px" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ozv6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="name6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="family6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="tavalod6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="semat6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="madrak6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="reshteh6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                <asp:Label ID="sabegheh6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="stat6" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                   
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080">
                                <table align="center" class="auto-style1" dir="rtl" >
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="2- آمار پرونده های شعبه:" Font-Bold="True" ></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label9" runat="server" Text="موجودی اول سال: " Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMojoodi" runat="server" Width="50px" TabIndex="1" dir="ltr" BorderColor="Black" BorderWidth="1px" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label10" runat="server" Text="وارده تا پایان ماه قبل:" Font-Bold="True" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVaredeh" runat="server" Width="50px" TabIndex="2" dir="ltr" BorderColor="Black" BorderWidth="1px" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label11" runat="server" Text="مختومه تا پایان ماه قبل : " Font-Bold="True" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMakhtoomeh" runat="server" Width="50px" TabIndex="3" dir="ltr" BorderColor="Black" BorderWidth="1px" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label12" runat="server" Text="مانده تا پایان ماه قبل: " Font-Bold="True" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMandeh" runat="server" Width="50px" TabIndex="4" dir="ltr" BorderColor="Black" BorderWidth="1px" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label13" runat="server" Text="تعداد پرونده های صلح و سازش از اول سال تا پایان ماه قبل: " Font-Bold="True" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSazesh" runat="server" Width="50px" TabIndex="5" dir="ltr" BorderColor="Black" BorderWidth="1px" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080">
                                <table align="center" class="auto-style1" dir="rtl" >
                                    <tr>
                                        <td class="auto-style4">
                                            <asp:Label ID="Label14" runat="server" Text="3- آخرین تاریخ: " Font-Bold="True" ></asp:Label>
                                        </td>
                                        <td style="text-align: right">&nbsp;<asp:Label ID="Label15" runat="server" Text="تاریخ وقت رسیدگی: " Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtRoozResidegi" runat="server" BorderWidth="1px" BorderColor="Black" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center" Width="100px" ></asp:TextBox>
                                        </td>
                                        <td class="auto-style4">
                                            <asp:Label ID="Label16" runat="server"  Text="تاریخ نظارت: " Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtRoozNezarat" runat="server"  MaxLength="2" BorderWidth="1px" BorderColor="Black" Height="30px" Font-Bold="True" Font-Names="B Nazanin" Font-Size="Large" style="text-align: center" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style4">
                                            <asp:Label ID="Label105" runat="server" Text="متوسط وقت رسیدگی: " Font-Bold="True"></asp:Label>
                                            &nbsp;<asp:Label ID="lblAvgVaght" runat="server" Font-Bold="True"></asp:Label>
                                            &nbsp;<asp:Label ID="Label106" runat="server" Font-Bold="True" Text="ماه"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label17" runat="server"  Text="4- تعداد  اعضاء حاضر در شعبه شورا حین بازرسی از حیث رعایت حدنصاب  قانونی در جلسه رسیدگی؟ " Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBoxList ID="CheckBoxList1" runat="server"  DataSourceID="SqlDataSource2" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Item FROM TblBazrasi_Items WHERE (ID = 'ddlAzaINS') AND (Value &lt;&gt; '00') ORDER BY Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label18" runat="server" Text="5- نحوه ساعت حضور اعضاء و روزهای تشکیل جلسات شورا: " Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBoxList ID="CheckBoxList2" runat="server"  DataSourceID="SqlDataSource3" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlSaatHozoor' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label19" runat="server" Text="6- نحوه کنترل پرداخت هزینه دادرسی و تمبر مالیاتی وکالت نامه با توجه به میزان خواسته بر مبنای توافق یا تعرفه قانونی در صورت دخالت وکیل: " Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBoxList ID="CheckBoxList3" runat="server"  DataSourceID="SqlDataSource4" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlPardakht' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label20" runat="server"  Text="7- صدور دستور متناسب با درخواست برای تکمیل درخواست توسط خواهان  و تعیین وقت رسیدگی: " Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBoxList ID="CheckBoxList4" runat="server"  DataSourceID="SqlDataSource5" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlDastoor' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label21" runat="server"  Text="8- آیا  اهتمام به صلح و سازش در شعبه توسط اعضای شورا بعمل آمده است یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBoxList ID="CheckBoxList5" runat="server"  DataSourceID="SqlDataSource6" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlSolh' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label22" runat="server" Text="9- انجام استعلامات مورد نیاز یا مطالبه پرونده استنادی احدی از طرفین پرونده یا سوابق استناد و عنداللزوم ارجاع به کارشناس بنا به درخواست طرفین یا رأساً توسط شورا: " Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBoxList ID="CheckBoxList6" runat="server" DataSourceID="SqlDataSource7" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlEstelamat' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label23" runat="server" Text="10- نحوه تصمیم گیری در خصوص درخواست های مطروحه از قبیل تأمین خواسته، توقیف عملیات اجرایی و تأخیر اجرای حکم  و تعیین خسارت  احتمالی با توجه به مستندات تقدیمی: " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList7" runat="server" DataSourceID="SqlDataSource8" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlTasmim' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label24" runat="server" Text="11- وضعیت ابلاغ اوراق قضایی خصوصاً ابلاغ وقت رسیدگی یا حصول اطمینان از اطلاع خوانده از وقت رسیدگی توسط اعضای شورا: " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList8" runat="server" DataSourceID="SqlDataSource9" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlEblagh' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label25" runat="server" Text="12- بررسی نحوه ی تنظیم صورت جلسه  رسیدگی توسط اعضای شورا و ذکر موارد ضروری مانند حضور طرفین دعوی ،ابلاغ اخطاریه به طرفین یا اطلاع آنها از وقت رسیدگی به طریق ممکن و احراز هویت حاضرین از حیث فراهم بودن یا نبودن موجبات رسیدگی: " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList9" runat="server" DataSourceID="SqlDataSource10" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlSooratJalaseh' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label26" runat="server" Text="13- اظهار نظر در خصوص ایرادات مطروحه از ناحیه اصحاب دعوی  و نمایندگان آنها در موعد مقرر قانونی: " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList10" runat="server" DataSourceID="SqlDataSource11" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlIradat' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label27" runat="server" Text="14- رعایت مقررات  مربوط در دعاوی طاری(رسیدگی توام،مواعد قانونی و مرجع ذی صلاح) وفق ماده 21 قانون شورای حل اختلاف: " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList11" runat="server" DataSourceID="SqlDataSource12" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlTari' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label28" runat="server" Text="15- اعلام نظریه مشورتی توسط اعضای شورا طبق ماده 9 قانون شورا به عمل آمده یا خیر؟  و آیا قاضی شورا  به این موضوع توجه نموده یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList12" runat="server" DataSourceID="SqlDataSource13" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlMashverat' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label29" runat="server" Text="16- آیا جایگاه بندهای ماده 107 قانون آیین دادرسی  مدنی و ماده 95 قانون موصوف از حیث صدور قرارهای مندرج در آنها رعایت گردید یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList13" runat="server" DataSourceID="SqlDataSource14" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlMadeh' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label30" runat="server" Text="17- منظم بودن پرونده از حیث برگ شماری و ممهور بودن آنها به مهر شورا :  " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList14" runat="server" DataSourceID="SqlDataSource15" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlNazm' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label31" runat="server" Text="18- آیا صدور دستور تخلیه در اجرای ماده 3 قانون روابط موجر و مستاجر مصوب سال 76 ظرف مهلت مقرر قانونی یک هفته ای از زمان تقدیم دادخواست به مرحله اجرا درآمده است یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList15" runat="server" DataSourceID="SqlDataSource16" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlTakhliyeh' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label32" runat="server" Text="19- احراز صحت جریان عملیات اجرایی به منظور تایید آن توسط قاضی صادر کننده  صورت گرفته است یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList16" runat="server" DataSourceID="SqlDataSource17" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlEjraei' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label33" runat="server" Text="20- آیا نتیجه پرونده های ارجاعی از مراجع قضایی  در اجرای ماده 11 قانون شورا در موعد مقرر حداکثر سه ماهه به مرجع مربوط اعاده می گردد یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList17" runat="server" DataSourceID="SqlDataSource18" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlPErjaei' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label34" runat="server" Text="21- آیا صدور گزارش اصلاحی توسط اعضاء و تایید آن توسط قاضی شورا طبق ماده 24 قانون شورا  به عمل آمده است یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList18" runat="server" DataSourceID="SqlDataSource19" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlEslahi' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label35" runat="server" Text="22- آیا رسیدگی قاضی شورا به پرونده های کیفری از حیث رعایت صلاحیت، نوع تفهیم اتهام، أخذ آخرین دفاع و أخذ تأمین مناسب و رعایت مستندات قانونی در موارد اعمال کیفیات مخففه قانونی به نحو  قانونی  و  صحیح انجام پذیرفته یا خیر؟ " Font-Bold="True"></asp:Label>
                                &nbsp;<asp:CheckBoxList ID="CheckBoxList19" runat="server" DataSourceID="SqlDataSource20" DataTextField="Item" DataValueField="Item" RepeatDirection="Horizontal" Font-Bold="True">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Item]
  FROM [Shoora].[dbo].[TblBazrasi_Items]
  where ID='ddlResidegi' and Value&lt;&gt;'00'
  order by Value"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-style: double; border-width: thin; border-color: #808080" class="auto-style4">
                                <asp:Label ID="Label36" runat="server" Text="23- حداقل چهارپرونده (کیفری، حقوقی، سازش، تجدید نظر) مورد بازرسی قرارگرفته و نکات قوت و ضعف و راهکار اصلاحی ارائه گردد: " Font-Bold="True"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Names="B Nazanin" Height="145px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="border-style: double; border-width: thin; border-color: #808080">
                                <table align="center" class="auto-style1" dir="rtl">
                                    <tr>
                                        <td class="auto-style5" colspan="2" style="text-align: right">
                                            <asp:Label ID="Label37" runat="server" Text="نام و نام خانوادگی و امضاء بازرسین: " Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label43" runat="server" Text="بازرس ا : " Font-Bold="True"></asp:Label>
                                            &nbsp;&nbsp;<asp:Label ID="lblBazras1" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                            <br />
                                        </td>
                                        <td rowspan="3" style="text-align: center">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<asp:Label ID="Label39" runat="server" Text="تاریخ بازرسی: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblINSDate2" runat="server" ForeColor="#3A4D52" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                            &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label44" runat="server" Text="بازرس 2: " Font-Bold="True"></asp:Label>
                                            &nbsp;&nbsp;<asp:Label ID="lblBazras2" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Label ID="Label45" runat="server" Text="بازرس 3: " Font-Bold="True"></asp:Label>
                                            &nbsp;&nbsp;<asp:Label ID="lblBazras3" runat="server" Font-Bold="True" Font-Names="B Nazanin"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnReturn2" runat="server" CssClass="label2" OnClick="btnReturn2_Click" Text="بازگشت" />
            </td>
        </tr>
    </table>
</asp:Content>


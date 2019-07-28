﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="INSInsert.aspx.cs" Inherits="INSInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 925px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style6 {
            height: 53px;
        }
        .auto-style5 {
            height: 31px;
        }
        .auto-style4 {
            width: 147px;
            text-align: right;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <table align="center" class="auto-style3" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="Label66" runat="server" CssClass="labelTitle" Text="فرم ثبت اطلاعات بازرسی شعبه"></asp:Label>
                        </td>
                        <td style="text-align: center">
                            &nbsp;<asp:Label ID="msg" runat="server" CssClass="labelItems" ForeColor="Maroon"></asp:Label>
                        </td>
                        <td align="left">
                <asp:Button ID="btnHome2" runat="server" CssClass="label" OnClick="btnHome2_Click" Text="بازگشت" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoozINS" CssClass="labelItems" ErrorMessage="توجه! اطلاعات ثبت نشد، ثبت تاریخ بازرسی اجباریست." ForeColor="Maroon" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMahINS" CssClass="labelItems" ErrorMessage="توجه! اطلاعات ثبت نشد، ثبت تاریخ بازرسی اجباریست." ForeColor="Maroon" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlSalINS" CssClass="labelItems" ErrorMessage="توجه! اطلاعات ثبت نشد، ثبت تاریخ بازرسی اجباریست." ForeColor="Maroon" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" class="auto-style2" dir="rtl" style="border-style: double; border-width: thin; border-color: #808080">
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="استان: " CssClass="label"></asp:Label>
                            <asp:Label ID="lblOstan" runat="server" Font-Bold="True" Font-Names="B Nazanin" Font-Overline="False" ForeColor="#3A4D52"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="شهر: " CssClass="label"></asp:Label>
                            <asp:Label ID="lblShahr" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="کد مجتمع: " CssClass="label"></asp:Label>
                            <asp:Label ID="lblMojtama" runat="server" CssClass="label2" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label67" runat="server" CssClass="label" Text="نام مجتمع: "></asp:Label>
                            <asp:Label ID="lblMojtamaName" runat="server" CssClass="label2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="حوزه قضائی: " CssClass="label"></asp:Label>
                            <asp:Label ID="lblHozeh" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                        </td>
                        <td>
                            &nbsp;<asp:Label ID="Label38" runat="server" CssClass="label" Text="شعبه: "></asp:Label>
                            <asp:Label ID="lblShobeh" runat="server" Font-Bold="True" Font-Names="B Nazanin" ForeColor="#3A4D52"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label69" runat="server" CssClass="label" Text="کد شعبه: "></asp:Label>
                            <asp:Label ID="lblCodeShobeh" runat="server" CssClass="label2"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label68" runat="server" CssClass="label" Text="نوع شعبه: "></asp:Label>
                            <asp:Label ID="lblNoeShobeh" runat="server" CssClass="label2"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" class="auto-style2" dir="rtl" style="border-style: double; border-width: thin; border-color: #808080">
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="1- مشخصات اعضاء شعبه: " CssClass="label"></asp:Label>
&nbsp;<asp:Label ID="msg4" runat="server" Visible="False"></asp:Label>
                                            </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" />
                            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <fieldset>
                            <table align="center" class="auto-style3" dir="rtl">
                                <tr>
                                    <td colspan="2">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT        TblPersoneli.CodeMelli AS 'کد ملی', TblPersoneli.Name AS 'نام', TblPersoneli.Famil AS 'نام خانوادگی', TblPersoneli.Tarikhetavalod AS 'تاریخ تولد', TblCodeing.Sharh AS 'مدرک تحصیلی',  TblCodeing_1.Sharh AS 'رشته تحصیلی',  Post.Sharh AS 'سمت در شورا', TblSodorEblagh.Sabegheh+@m AS 'مدت عضویت به ماه'
FROM            TblPersoneli INNER JOIN
                         TblSodorEblagh ON TblPersoneli.CodeP = TblSodorEblagh.CodeP INNER JOIN
                         TblCodeing ON TblPersoneli.Madrak = TblCodeing.Code INNER JOIN
                         TblCodeing AS Post ON TblSodorEblagh.PPost = Post.Code LEFT OUTER JOIN
                         TblCodeing AS TblCodeing_1 ON TblPersoneli.ReshtehTahsili = TblCodeing_1.Code

WHERE        (TblSodorEblagh.Vaz = '1') AND (TblSodorEblagh.CodeShobeh = @codeSHobeh)
ORDER BY TblSodorEblagh.PPost ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="msg4" Name="m" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="lblCodeShobeh" Name="codeSHobeh" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="labelItems" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:ImageField DataImageUrlField="کد ملی" DataImageUrlFormatString="\\178.252.189.110\Image\{0}.Jpeg">
                                        <ControlStyle Height="50px" Width="50px" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="کد ملی" HeaderText="کد ملی" SortExpression="کد ملی" />
                                    <asp:BoundField DataField="نام" HeaderText="نام" SortExpression="نام" />
                                    <asp:BoundField DataField="نام خانوادگی" HeaderText="نام خانوادگی" SortExpression="نام خانوادگی" />
                                    <asp:BoundField DataField="تاریخ تولد" HeaderText="تاریخ تولد" SortExpression="تاریخ تولد" />
                                    <asp:BoundField DataField="سمت در شورا" HeaderText="سمت در شورا" SortExpression="سمت در شورا" />
                                    <asp:BoundField DataField="مدرک تحصیلی" HeaderText="مدرک تحصیلی" SortExpression="مدرک تحصیلی" />
                                    <asp:BoundField DataField="رشته تحصیلی" HeaderText="رشته تحصیلی" SortExpression="رشته تحصیلی" />
                                    <asp:BoundField DataField="مدت عضویت به ماه" HeaderText="سابقه به ماه" SortExpression="مدت عضویت به ماه" />
                                    <asp:TemplateField HeaderText="افراد حاضر" >
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chech1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Button ID="btnAcceptPerson" runat="server" CssClass="labelItems" OnClick="btnAcceptPerson_Click" Text="تایید افرار انتخاب شده" />
                                        &nbsp;&nbsp;<asp:Label ID="Label64" runat="server" CssClass="labelItems" Text="تعداد افراد انتخاب شده : "></asp:Label>
                                        &nbsp;<asp:Label ID="lblCount" runat="server" CssClass="labelItems" Font-Overline="False" Font-Underline="True" ForeColor="Maroon"></asp:Label>
&nbsp;<asp:Label ID="Label65" runat="server" CssClass="labelItems" Text="نفر"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lbl" runat="server" CssClass="labelItems"></asp:Label>
                                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblselected1" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblselected2" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblselected3" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblselected4" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblselected5" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblselected6" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                                    </fieldset>
                                 </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <fieldset>
                            <table align="center" class="auto-style3" dir="rtl">
                                <tr>
                                    <td class="auto-style6">
                            <asp:CheckBox ID="cbBedooneEblagh" runat="server" CssClass="label" Text="حضور افراد بدون ابلاغ رسمی" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnBedooneEblagh" runat="server" CssClass="labelItems" OnClick="btnBedooneEblagh_Click" Text="تایید" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnBedooneEblaghCancel" runat="server" CssClass="labelItems" OnClick="btnBedooneEblaghCancel_Click" Text="انصراف" />
                                        &nbsp;&nbsp;
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBedooneEblagh1" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="1"></asp:RangeValidator>
                                        &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtBedooneEblagh2" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="2"></asp:RangeValidator>
                                        &nbsp;<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtBedooneEblagh3" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="3"></asp:RangeValidator>
                                        &nbsp;<asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtBedooneEblagh4" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="4"></asp:RangeValidator>
                                        &nbsp;<asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="txtBedooneEblagh5" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="5"></asp:RangeValidator>
                                        &nbsp;<asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="txtBedooneEblagh6" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="6"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server">
                                            <table align="center" class="auto-style3" dir="rtl">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtBedooneEblagh1" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="1"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btnBedooneEblagh1" runat="server" CssClass="labelItems" Text="تایید" OnClick="btnBedooneEblagh1_Click" ValidationGroup="1" />
                                                        &nbsp;<asp:Label ID="msgB1" runat="server" CssClass="label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblagh1" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghName1" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghPost1" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtBedooneEblagh2" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="2"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btnBedooneEblagh2" runat="server" CssClass="labelItems" Text="تایید" OnClick="btnBedooneEblagh2_Click" ValidationGroup="2" />
                                                        &nbsp;<asp:Label ID="msgB2" runat="server" CssClass="label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblagh2" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghName2" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghPost2" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtBedooneEblagh3" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="3"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btnBedooneEblagh3" runat="server" CssClass="labelItems" Text="تایید" OnClick="btnBedooneEblagh3_Click" ValidationGroup="3" />
                                                        &nbsp;<asp:Label ID="msgB3" runat="server" CssClass="label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblagh3" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghName3" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghPost3" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtBedooneEblagh4" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="4"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btnBedooneEblagh4" runat="server" CssClass="labelItems" Text="تایید" OnClick="btnBedooneEblagh4_Click" ValidationGroup="4" />
                                                        &nbsp;<asp:Label ID="msgB4" runat="server" CssClass="label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblagh4" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghName4" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghPost4" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtBedooneEblagh5" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="5"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btnBedooneEblagh5" runat="server" CssClass="labelItems" Text="تایید" OnClick="btnBedooneEblagh5_Click" ValidationGroup="5" />
                                                        &nbsp;<asp:Label ID="msgB5" runat="server" CssClass="label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblagh5" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghName5" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghPost5" runat="server" CssClass="label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtBedooneEblagh6" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="6"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="btnBedooneEblagh6" runat="server" CssClass="labelItems" Text="تایید" OnClick="btnBedooneEblagh6_Click" ValidationGroup="6" />
                                                        &nbsp;<asp:Label ID="msgB6" runat="server" CssClass="label2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblagh6" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghName6" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblBedooneEblaghPost6" runat="server" CssClass="labelSormeie"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                                    </fieldset>
                                 </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" class="auto-style2" dir="rtl" style="border-style: double; border-width: thin; border-color: #808080">
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="2- آمار پرونده های شعبه:" CssClass="label"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="موجودی اول سال: " CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMojoodi" runat="server" Width="50px" TabIndex="1" dir="ltr"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="وارده تا پایان ماه قبل:" CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtVaredeh" runat="server" Width="50px" TabIndex="2" dir="ltr"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="مختومه تا پایان ماه قبل : " CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMakhtoomeh" runat="server" Width="50px" TabIndex="3" dir="ltr"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="مانده تا پایان ماه قبل: " CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMandeh" runat="server" Width="50px" TabIndex="4" dir="ltr"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="تعداد پرونده های صلح و سازش از اول سال تا پایان ماه قبل: " CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSazesh" runat="server" Width="50px" TabIndex="5" dir="ltr"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" class="auto-style2" dir="rtl" style="border-style: double; border-width: thin; border-color: #808080">
                    <tr>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="3- آخرین تاریخ: " CssClass="label"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="وقت رسیدگی: " CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label46" runat="server" CssClass="label" Text="روز: "></asp:Label>
                            <asp:TextBox ID="txtRoozResidegi" runat="server" CssClass="label2" Width="20px" MaxLength="2" TabIndex="6"></asp:TextBox>
&nbsp;<asp:Label ID="Label47" runat="server" CssClass="label" Text="ماه: "></asp:Label>
                            <asp:DropDownList ID="ddlMahResidegi" runat="server" CssClass="label2" TabIndex="7">
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
&nbsp;<asp:Label ID="Label48" runat="server" CssClass="label" Text="سال: "></asp:Label>
                            <asp:DropDownList ID="ddlSalResidegi" runat="server" CssClass="label2" TabIndex="8">
                                <asp:ListItem Value="00">-----</asp:ListItem>
                                <asp:ListItem>1395</asp:ListItem>
                    <asp:ListItem>1396</asp:ListItem>
                    <asp:ListItem >1397</asp:ListItem>
                    <asp:ListItem>1398</asp:ListItem>
                    <asp:ListItem>1399</asp:ListItem>
                    <asp:ListItem>1400</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label16" runat="server" CssClass="label" Text="نظارت: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label49" runat="server" CssClass="label" Text="روز: "></asp:Label>
                            <asp:TextBox ID="txtRoozNezarat" runat="server" CssClass="label2" Width="20px" MaxLength="2" TabIndex="9"></asp:TextBox>
&nbsp;<asp:Label ID="Label50" runat="server" CssClass="label" Text="ماه: "></asp:Label>
                            <asp:DropDownList ID="ddlMahNezarat" runat="server" CssClass="label2" TabIndex="10">
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
&nbsp;<asp:Label ID="Label51" runat="server" CssClass="label" Text="سال: "></asp:Label>
                            <asp:DropDownList ID="ddlSalNezarat" runat="server" CssClass="label2" TabIndex="11">
                                <asp:ListItem Value="00">-----</asp:ListItem>
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
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label17" runat="server" CssClass="label" Text="4- تعداد  اعضاء حاضر در شعبه شورا حین بازرسی از حیث رعایت حدنصاب  قانونی در جلسه رسیدگی؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlAzaINS" runat="server" CssClass="label2" TabIndex="12">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label18" runat="server" CssClass="label" Text="5- نحوه ساعت حضور اعضاء و روزهای تشکیل جلسات شورا: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlSaatHozoor" runat="server" CssClass="label2" TabIndex="13">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label19" runat="server" CssClass="label" Text="6- نحوه کنترل پرداخت هزینه دادرسی و تمبر مالیاتی وکالت نامه با توجه به میزان خواسته بر مبنای توافق یا تعرفه قانونی در صورت دخالت وکیل: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlPardakht" runat="server" CssClass="label2" TabIndex="14">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label20" runat="server" CssClass="label" Text="7- صدور دستور متناسب با درخواست برای تکمیل درخواست توسط خواهان  و تعیین وقت رسیدگی: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlDastoor" runat="server" CssClass="label2" TabIndex="15">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label21" runat="server" CssClass="label" Text="8- آیا  اهتمام به صلح و سازش در شعبه توسط اعضای شورا بعمل آمده است یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlSolh" runat="server" CssClass="label2" TabIndex="16">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label22" runat="server" CssClass="label" Text="9- انجام استعلامات مورد نیاز یا مطالبه پرونده استنادی احدی از طرفین پرونده یا سوابق استناد و عنداللزوم ارجاع به کارشناس بنا به درخواست طرفین یا رأساً توسط شورا: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlEstelamat" runat="server" CssClass="label2" TabIndex="17">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label23" runat="server" CssClass="label" Text="10- نحوه ی تصمیم گیری در خصوص درخواست های مطروحه از قبیل تأمین خواسته، توقیف عملیات اجرایی و تأخیر اجرای حکم  و تعیین خسارت  احتمالی با توجه به مستندات تقدیمی: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlTasmim" runat="server" CssClass="label2" TabIndex="18">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label24" runat="server" CssClass="label" Text="11- وضعیت ابلاغ اوراق قضایی خصوصاً ابلاغ وقت رسیدگی یا حصول اطمینان از اطلاع خوانده از وقت رسیدگی توسط اعضای شورا: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlEblagh" runat="server" CssClass="label2" TabIndex="19">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label25" runat="server" CssClass="label" Text="12- بررسی نحوه ی تنظیم صورت جلسه  رسیدگی توسط اعضای شورا و ذکر موارد ضروری مانند حضور طرفین دعوی ،ابلاغ اخطاریه به طرفین یا اطلاع آنها از وقت رسیدگی به طریق ممکن و احراز هویت حاضرین از حیث فراهم بودن یا نبودن موجبات رسیدگی: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlSooratJalaseh" runat="server" CssClass="label2" TabIndex="20">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label26" runat="server" CssClass="label" Text="13- اظهار نظر در خصوص ایرادات مطروحه از ناحیه اصحاب دعوی  و نمایندگان آنها در موعد مقرر قانونی: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlIradat" runat="server" CssClass="label2" TabIndex="21">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label27" runat="server" CssClass="label" Text="14- رعایت مقررات  مربوط در دعاوی طاری(رسیدگی توام،مواعد قانونی و مرجع ذی صلاح) وفق ماده 21 قانون شورای حل اختلاف: "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlTari" runat="server" CssClass="label2" TabIndex="22">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label28" runat="server" CssClass="label" Text="15- اعلام نظریه مشورتی توسط اعضای شورا طبق ماده 9 قانون شورا به عمل آمده یا خیر؟  و آیا قاضی شورا  به این موضوع توجه نموده یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlMashverat" runat="server" CssClass="label2" TabIndex="23">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label29" runat="server" CssClass="label" Text="16- آیا جایگاه بندهای ماده 107 قانون آیین دادرسی  مدنی و ماده 95 قانون موصوف از حیث صدور قرارهای مندرج در آنها رعایت گردید یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlMadeh" runat="server" CssClass="label2" TabIndex="24">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label30" runat="server" CssClass="label" Text="17- منظم بودن پرونده از حیث برگ شماری و ممهور بودن آنها به مهر شورا :  "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlNazm" runat="server" CssClass="label2" TabIndex="25">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label31" runat="server" CssClass="label" Text="18- آیا صدور دستور تخلیه در اجرای ماده 3 قانون روابط موجر و مستاجر مصوب سال 76 ظرف مهلت مقرر قانونی یک هفته ای از زمان تقدیم دادخواست به مرحله اجرا درآمده است یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlTakhliyeh" runat="server" CssClass="label2" TabIndex="26">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label32" runat="server" CssClass="label" Text="19- احراز صحت جریان عملیات اجرایی به منظور تایید آن توسط قاضی صادر کننده  صورت گرفته است یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlEjraei" runat="server" CssClass="label2" TabIndex="27">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label33" runat="server" CssClass="label" Text="20- آیا نتیجه پرونده های ارجاعی از مراجع قضایی  در اجرای ماده 11 قانون شورا در موعد مقرر حداکثر سه ماهه به مرجع مربوط اعاده می گردد یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlPErjaei" runat="server" CssClass="label2" TabIndex="28">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label34" runat="server" CssClass="label" Text="21- آیا صدور گزارش اصلاحی توسط اعضاء و تایید آن توسط قاضی شورا طبق ماده 24 قانون شورا  به عمل آمده است یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlEslahi" runat="server" CssClass="label2" TabIndex="29">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label35" runat="server" CssClass="label" Text="22- آیا رسیدگی قاضی شورا به پرونده های کیفری از حیث رعایت صلاحیت، نوع تفهیم اتهام، أخذ آخرین دفاع و أخذ تأمین مناسب و رعایت مستندات قانونی در موارد اعمال کیفیات مخففه قانونی به نحو  قانونی  و  صحیح انجام پذیرفته یا خیر؟ "></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlResidegi" runat="server" CssClass="label2" TabIndex="30">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:Label ID="Label36" runat="server" CssClass="label" Text="23- حداقل چهارپرونده (کیفری، حقوقی، سازش، تجدید نظر) مورد بازرسی قرارگرفته و نکات قوت و ضعف و راهکار اصلاحی ارائه گردد: "></asp:Label>
                <asp:TextBox ID="txt4Parvandeh" runat="server" Height="120px" TabIndex="31" TextMode="MultiLine" Width="700px" CssClass="label2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <table align="center" class="auto-style3" dir="rtl">
                    <tr>
                        <td>
                                        <asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="txtBazras1" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="7"></asp:RangeValidator>
                                    &nbsp;
                                        <asp:RangeValidator ID="RangeValidator8" runat="server" ControlToValidate="txtBazras2" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="8"></asp:RangeValidator>
                                    &nbsp;
                                        <asp:RangeValidator ID="RangeValidator9" runat="server" ControlToValidate="txtBazras3" CssClass="labelItems" ErrorMessage="لطفا اطلاعات عددی وارد کنید" ForeColor="#CC3300" MaximumValue="999999999999" MinimumValue="000000000000" Type="Double" ValidationGroup="9"></asp:RangeValidator>
                                    </td>
                    </tr>
                    <tr>
                        <td>
                <asp:UpdatePanel ID="UP1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style3" dir="rtl">
                    <tr>
                        <td colspan="4" class="auto-style5">
                <asp:Label ID="Label37" runat="server" CssClass="label" Text="نام و نام خانوادگی و امضاء بازرسین: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="Label43" runat="server" CssClass="label" Text="بازرس ا : "></asp:Label>
                            &nbsp;<asp:TextBox ID="txtBazras1" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="7" TabIndex="32"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnBazras1" runat="server" CssClass="labelItems" OnClick="btnBazras1_Click" Text="تایید" ValidationGroup="7" />
                            &nbsp;<asp:Label ID="msg1" runat="server" CssClass="label2"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBazras1" runat="server" CssClass="label"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td class="auto-style4">
                            <asp:Label ID="lblBazrasName1" runat="server" CssClass="label"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblBazrasPost1" runat="server" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="Label44" runat="server" CssClass="label" Text="بازرس 2: "></asp:Label>
                            &nbsp;<asp:TextBox ID="txtBazras2" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="8" TabIndex="33"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnBazras2" runat="server" CssClass="labelItems" OnClick="btnBazras2_Click" Text="تایید" ValidationGroup="8" />
                            &nbsp;<asp:Label ID="msg2" runat="server" CssClass="label2"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBazras2" runat="server" CssClass="labelSormeie"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td class="auto-style4">
                            <asp:Label ID="lblBazrasName2" runat="server" CssClass="labelSormeie"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblBazrasPost2" runat="server" CssClass="labelSormeie"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="Label45" runat="server" CssClass="label" Text="بازرس 3: "></asp:Label>
                            &nbsp;<asp:TextBox ID="txtBazras3" runat="server" CssClass="labelItems" Width="100px" ValidationGroup="9" TabIndex="34"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnBazras3" runat="server" CssClass="labelItems" OnClick="btnBazras3_Click" Text="تایید" ValidationGroup="9" />
                            &nbsp;<asp:Label ID="msg3" runat="server" CssClass="label2"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBazras3" runat="server" CssClass="label"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td class="auto-style4">
                            <asp:Label ID="lblBazrasName3" runat="server" CssClass="label"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblBazrasPost3" runat="server" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                </table>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: right;">
                <asp:Label ID="Label39" runat="server" CssClass="label" Text="تاریخ بازرسی: "></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="Label40" runat="server" CssClass="label" Text="روز: "></asp:Label>
                <asp:TextBox ID="txtRoozINS" runat="server" CssClass="label2" TabIndex="35" Width="20px" MaxLength="2" ValidationGroup="A"></asp:TextBox>
&nbsp;<asp:Label ID="Label41" runat="server" CssClass="label" Text="ماه: "></asp:Label>
                <asp:DropDownList ID="ddlMahINS" runat="server" CssClass="label2" TabIndex="36" ValidationGroup="B">
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
&nbsp;<asp:Label ID="Label42" runat="server" CssClass="label" Text="سال: "></asp:Label>
                <asp:DropDownList ID="ddlSalINS" runat="server" CssClass="label2" TabIndex="37" ValidationGroup="C">
                    <asp:ListItem Value="00">-----</asp:ListItem>
                    <asp:ListItem>1395</asp:ListItem>
                    <asp:ListItem>1396</asp:ListItem>
                    <asp:ListItem>1397</asp:ListItem>
                    <asp:ListItem>1398</asp:ListItem>
                    <asp:ListItem>1399</asp:ListItem>
                    <asp:ListItem>1400</asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnInsert" runat="server" CssClass="label" Text="ثبت اطلاعات" OnClick="btnInsert_Click" ValidationGroup="A" TabIndex="38" />
&nbsp;<asp:Button ID="btnHome" runat="server" CssClass="label" OnClick="btnHome_Click" Text="بازگشت" TabIndex="39" />
            </td>
        </tr>
    </table>
</asp:Content>

